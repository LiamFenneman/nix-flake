{
  description = "Liam's NixOS Flake 2.0";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager } @ inputs:
    let
      system = "x86_64-linux";
      user = "liam";

      nixModules = import ./modules/nix/module-list.nix;
      homeModules = import ./modules/home/module-list.nix;

      # Create a NixOS system configuration from the given hostname.
      mkSystem = host: (
        let hostName = host; in nixpkgs.lib.nixosSystem
          {
            inherit system;
            modules = [
              ./hosts/${host}
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.${user} = { ... }: {
                  programs.home-manager.enable = true;
                  home.stateVersion = "23.05";
                };
                home-manager.sharedModules = homeModules;
                home-manager.extraSpecialArgs = { inherit user hostName; };
              }
            ] ++ nixModules;
            specialArgs = {
              inherit inputs system user hostName;
            };
          }
      );

      # Create a list of NixOS system configurations from a list of hostnames.
      # Each system configuration is imported from the `./hosts/{hostname}
      # module.
      eachSystem = list: builtins.listToAttrs (map
        (host: {
          name = host;
          value = mkSystem host;
        })
        list);
    in
    {
      nixosConfigurations = eachSystem [
        "desktop"
        "laptop"
        "vm"
      ];
    };

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
  };
}
