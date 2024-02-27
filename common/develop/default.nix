{ user, pkgs, ... }:
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.git = {
    enable = true;
    config = {
      commit = {
        gpgSign = true;
      };
      tag = {
        gpgSign = true;
      };
      init = {
        defaultBranch = "main";
      };
      user = {
        email = "liamfennemanbusiness@gmail.com";
        name = "LiamFenneman";
      };
    };
    lfs = {
      enable = true;
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  users.users.${user}.packages = with pkgs; [
    # Nix
    nixpkgs-fmt
    nil

    # Lua
    lua-language-server
    stylua

    # YAML
    yamlfmt
  ];
}
