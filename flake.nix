{
  description = "Liam's NixOS Flake 2.0";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs } @ inputs:
    let
      system = "x86_64-linux";
      user = "liam";

      # This function creates a list of NixOS system configurations.
      # Each system configuration is imported from the `./hosts/{hostname} file.
      createSystems = hosts: (nixpkgs.lib.lists.forEach hosts (host: {
        inherit system;
        modules = [ ./hosts/${host} ];
        specialArgs = { inherit inputs user system; };
      }));
    in
    {
      nixosConfigurations = createSystems [
        "desktop"
      ];
    };

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
  };
}
