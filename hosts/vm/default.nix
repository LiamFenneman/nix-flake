{ ... }:

{
  # Disable xserver while testing in VM
  services.xserver.enable = false;

  # Configure my custom modules.
  custom = {
    # docker.enable = true;
    # display = {
    #   i3.enable = true;
    #   kde.enable = true;
    #   manager.enable = true;
    # };
    input.enable = true;
    mounts.enable = true;
    user.isAdmin = true;
  };

  virtualisation.vmVariant = {
    virtualisation = {
      memorySize = 4096;
      cores = 4;
    };
  };

  system.stateVersion = "23.05";
}