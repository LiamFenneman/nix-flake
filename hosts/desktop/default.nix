{ mod, ... }: {
  imports = [
    ./hardware.nix

    (mod "base.nix")
    (mod "boot/grub.nix")

    (mod "pkgs")
    (mod "gaming")
    (mod "develop")
    (mod "display")
    (mod "network")
    (mod "security")
    (mod "virtualisation")
  ];

  system.stateVersion = "23.11";
}
