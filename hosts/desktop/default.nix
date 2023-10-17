{ ... }:

{
  imports = [ ./hardware.nix ];

  # Disable xserver while testing in VM
  services.xserver.enable = false;

  # Configure my custom modules.
  custom = {
    display = {
      i3.enable = true;
      manager.enable = true;
      nvidia.enable = true;
    };

    docker.enable = true;
    input.enable = true;
    mounts.enable = true;
    virt.enable = true;

    user.isAdmin = true;
  };

  system.stateVersion = "23.05";
}