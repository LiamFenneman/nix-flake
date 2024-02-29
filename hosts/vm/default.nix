{ mod, ... }: {
  imports = [
    (mod "base.nix")
    # (mod "boot/grub.nix")

    (mod "pkgs")
    # (mod "gaming")
    (mod "develop")
    (mod "display")
    (mod "network")
    (mod "security")
    # (mod "virtualisation")
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  virtualisation.vmVariant = {
    virtualisation = {
      memorySize = 2048;
      cores = 4;
    };
  };

  system.stateVersion = "23.11";
}
