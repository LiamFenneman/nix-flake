{ ... }:

{
  imports = [ ./hardware.nix ];

  # Disable xserver while testing in VM
  services.xserver.enable = false;

  # Configure my custom modules.
  custom = {
    # docker.enable = true;
    input.enable = true;
    mounts.enable = true;
    user.isAdmin = true;
  };

  system.stateVersion = "23.05";
}
