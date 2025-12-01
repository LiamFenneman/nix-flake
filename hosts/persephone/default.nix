{ mod, ... }: {
  imports = [
    ./hardware-configuration.nix

    (mod "base.nix")
    (mod "boot/grub.nix")
    (mod "display/nvidia.nix")

    (mod "ai")
    (mod "pkgs")
    (mod "develop")
    (mod "display")
    (mod "gaming")
    #(mod "media")
    (mod "network")
    (mod "security")
    (mod "virtualisation")

    # (mod "network/kde-connect.nix")
  ];

  services.libinput.mouse.accelSpeed = "-0.3";

  system.stateVersion = "23.11";
}
