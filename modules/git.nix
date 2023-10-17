{ lib, ... }:

with lib;

{
  programs.git = {
    enable = mkDefault true;
    lfs.enable = mkDefault true;
    config = {
      init = {
        defaultBranch = "main";
      };
    };
  };
}
