{ pkgs, user, ... }:

{
  services.xserver.enable = true;

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  custom.mounts.enable = true;

  users.users.${user} = {
    isNormalUser = true;
    description = "Liam";
    extraGroups = [ "wheel" ];
    initialPassword = "changeme";
  };

  system.stateVersion = "23.05";
}
