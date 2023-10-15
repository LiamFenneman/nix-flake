{ ... }:

{
  services.xserver.enable = true;

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure my custom modules.
  custom = {
    mounts.enable = true;
    user.isAdmin = true;
  };

  system.stateVersion = "23.05";
}
