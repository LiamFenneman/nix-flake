{
  description = "Liam's NixOS Flake 2.0";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs } @ inputs:
    let
      system = "x86_64-linux";
      user = "liam";

      customModules = import ./modules/module-list.nix;

      # Create a NixOS system configuration from the given hostname.
      mkSystem = host: (nixpkgs.lib.nixosSystem
        {
          inherit system;
          modules = [ ./hosts/${host} ] ++ customModules;
          specialArgs = let hostName = host; in {
            inherit inputs system user hostName;
          };
        });

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
        "vm"
      ];
    };

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
  };
}
