{ user, pkgs, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  hardware.opengl.enable = true;
  hardware.opengl.driSupport32Bit = true;

  users.users.${user}.packages = with pkgs; [
    protonup-qt
    minecraft
    prismlauncher
  ];
}
