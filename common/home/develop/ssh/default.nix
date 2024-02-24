{ ... }:

{
  programs.ssh = {
    enable = true;
    extraConfig = ''
      AddKeysToAgent yes
      StrictHostKeyChecking no
    '';
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        identityFile = "~/.ssh/github";
      };
    };
  };
}