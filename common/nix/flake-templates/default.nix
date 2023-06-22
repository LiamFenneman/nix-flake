{ ... }:

{
  nix.registry.liam = {
    from = {
      id = "liam";
      type = "indirect";
    };
    to = {
      owner = "LiamFenneman";
      repo = "nix-flake-templates";
      type = "github";
    };
  };
}
