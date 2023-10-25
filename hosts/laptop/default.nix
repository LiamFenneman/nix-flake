{ ... }:

{
  imports = [ ./hardware.nix ];

  # Disable xserver while testing in VM
  services.xserver.enable = false;

  hardware.bluetooth.enable = true;

  # Configure my custom modules.
  custom = {
    browser.librewolf = true;

    docker.enable = true;
    input.enable = true;
    mounts.enable = true;

    user.isAdmin = true;
  };

  system.stateVersion = "23.05";
}