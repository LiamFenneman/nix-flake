{
  description = "Liam's NixOS Flake";

  nixConfig = { experimental-features = [ "nix-command" "flakes" ]; };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = inputs@{ self, nixpkgs, ... }:
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
    in
    {
      nixosConfigurations = {
        # "desktop" = mkSystem "desktop";
        "vm" = mkSystem "vm";
      };

      devShells.${system} = with pkgs; {
        default = mkShell {
          nativeBuildInputs = with pkgs; [ nixpkgs-fmt nil ];
          buildInputs = [ ];
          shellHook = ''
            export PATH="$PATH:`pwd`/bin"
          '';
        };
      };
    };
}
