{ user, mod, lib, ... }: {
  imports = [
    (mod "base.nix")
    (mod "pkgs.nix")
    (mod "security")
    # (mod "boot.nix")
    (mod "display")
    (mod "develop")
    (mod "network.nix")
    (mod "virtualisation.nix")
    (mod "thunar.nix")
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
