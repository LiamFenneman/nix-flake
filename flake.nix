{
  description = "Liam's NixOS Flake";

  nixConfig = { experimental-features = [ "nix-command" "flakes" ]; };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # wgsl-analyzer.url = "github:wgsl-analyzer/wgsl-analyzer";
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, nixos-generators, ... }:
    let
      user = "liam";
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      pkgs-unstable = import nixpkgs-unstable { inherit system; };

      mkSystem = hostname:
        (nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/${hostname} ];
          specialArgs = { inherit inputs pkgs-unstable user system hostname; };
          specialArgs.mod = name: ./. + "/common/${name}";
        });

      mkEachSystem = hosts: builtins.listToAttrs (builtins.map
        (hostname: {
          name = hostname;
          value = mkSystem hostname;
        })
        hosts);
    in
    {
      nixosConfigurations = mkEachSystem [
        # "vm"
        "desktop"
      ];

      devShells.${system} = with pkgs;
        let
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
