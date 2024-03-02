{
  description = "Liam's NixOS Flake";

  nixConfig = { experimental-features = [ "nix-command" "flakes" ]; };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nixos-generators, ... }:
    let
      user = "liam";
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      mkSystem = hostname:
        (nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/${hostname} ];
          specialArgs = { inherit inputs user system hostname; };
          specialArgs.mod = name: ./. + "/common/${name}";
        });

      mkEachSystem = hosts: builtins.listToAttrs (builtins.map
        (hostname: {
          name = hostname;
          value = mkSystem hostname;
        })
        hosts);

      mkLxc = kind: (nixos-generators.nixosGenerate {
        inherit system;
        modules = [ ./hosts/lxc/${kind} ];
        format = "proxmox-lxc";
        specialArgs = { inherit inputs user system kind; };
        specialArgs.mod = name: ./. + "/common/${name}";
      });

      mkEachLxc = kinds: builtins.listToAttrs (builtins.map
        (kind: {
          name = "lxc-${kind}";
          value = mkLxc kind;
        })
        kinds);
    in
    {
      nixosConfigurations = mkEachSystem [
        "vm"
        "desktop"
      ];

      packages.${system} = mkEachLxc [
        "generic"
        "postgres"
      ];

      devShells.${system} = with pkgs;
        let
          build-lxc = pkgs.writeShellScriptBin "build-lxc" ''
            nix build .#lxc-$1
            mkdir -p ./out/
            cp -f ./result/tarball/nixos-system-x86_64-linux.tar.xz ./out/nixos-$1-x86_64-linux.tar.xz
          '';

          copy-lxc-to = pkgs.writeShellScriptBin "copy-lxc-to" ''
            find ./out/ -type f -name '*.tar.xz' -exec scp {} root@$1:/var/lib/vz/template/cache/ \;
          '';

          build-vm = pkgs.writeShellScriptBin "build-vm" ''
            nixos-rebuild build-vm --flake $1 .#vm
          '';

          run-vm = pkgs.writeShellScriptBin "run-vm" ''
            find ./result/bin -name 'run-*-vm' -exec {} \;
          '';
        in
        {
          default = mkShell {
            nativeBuildInputs = with pkgs; [
              build-lxc
              copy-lxc-to
              build-vm
              run-vm

              nixpkgs-fmt
              nil
            ];
            buildInputs = [ ];
          };
        };
    };
}
