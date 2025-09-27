{
  description = "Liam's NixOS Flake";

  nixConfig = { experimental-features = [ "nix-command" "flakes" ]; };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # wgsl-analyzer.url = "github:wgsl-analyzer/wgsl-analyzer";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
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
          modules = [
            ./hosts/${hostname}
            {
              nixpkgs.overlays = [
                inputs.neovim-nightly-overlay.overlays.default
              ];
            }
          ];
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
        "desktop"
	"persephone"
      ];

      devShells.${system} = {
        default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            nixpkgs-fmt
            nil
          ];
          buildInputs = [ ];
        };
      };
    };
}
