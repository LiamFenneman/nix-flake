{ ... }:

{
  programs.git = {
    enable = true;
    userName = "LiamFenneman";
    userEmail = "liamfennemanbusiness@gmail.com";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };
}