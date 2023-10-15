{ ... }:

{
  # Disable xserver while testing in VM
  services.xserver.enable = false;

  # Configure my custom modules.
  custom = {
    mounts.enable = true;
    user.isAdmin = true;
  };

  system.stateVersion = "23.05";
}
