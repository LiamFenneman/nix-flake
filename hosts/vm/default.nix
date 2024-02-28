{ user, mod, lib, ... }: {
  imports = [
    (mod "base.nix")
    # (mod "boot/grub.nix")

    (mod "pkgs")
    # (mod "gaming")
    (mod "develop")
    (mod "display")
    (mod "network")
    (mod "security")
    (mod "virtualisation")
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.xserver.windowManager.i3.configFile = lib.mkForce null;

  virtualisation.vmVariant = {
    virtualisation = {
      memorySize = 2048;
      cores = 4;
    };
  };

  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    initialPassword = "test";
  };

  system.stateVersion = "23.11";
}
