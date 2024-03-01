{ mod, ... }: {
  imports = [
    ./hardware.nix

    (mod "base.nix")
    (mod "boot/grub.nix")
    (mod "display/nvidia.nix")

    (mod "pkgs")
    (mod "gaming")
    (mod "develop")
    (mod "display")
    (mod "network")
    (mod "security")
    (mod "virtualisation")
  ];

  services.xserver.libinput.mouse.accelSpeed = "-0.3";

  system.stateVersion = "23.11";
}
