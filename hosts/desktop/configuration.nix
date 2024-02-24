{ inputs, config, pkgs, ... }:

let
  user = "liam";
in
{
  imports = [
    ./hardware-configuration.nix

    ../../common/nix/certs
    ../../common/nix/docker
    ../../common/nix/flake-templates
    ../../common/nix/flatpak
    ../../common/nix/gaming
    ../../common/nix/thunar
    ../../common/nix/virt
    ../../common/nix/xdg

    # ../../desktop/hyprland
    ../../desktop/i3
  ];

  nixpkgs.overlays = [ inputs.rust-overlay.overlays.default ];

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      enable = true;
      efiSupport = true;
      devices = [ "nodev" ];
      useOSProber = true;
      configurationLimit = 30;
    };
  };
  time.hardwareClockInLocalTime = true;
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  networking.hostName = "desktop";
  networking.networkmanager.enable = true;
  programs.nm-applet.enable = true;
  networking.hosts = {
    "192.168.254.200" = [ "pve1" ];
    "192.168.254.201" = [ "pve2" ];
  };

  services.rpcbind.enable = true;
  systemd.mounts = [{
    type = "nfs";
    mountConfig = {
      Options = "noauto";
    };
    what = "fileserver:/mnt/nfs";
    where = "/mnt/nfs";
  }];

  systemd.automounts = [{
    wantedBy = [ "multi-user.target" ];
    automountConfig = {
      TimeoutIdleSec = "600";
    };
    where = "/mnt/nfs";
  }];

  time.timeZone = "Pacific/Auckland";
  i18n.defaultLocale = "en_NZ.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_NZ.UTF-8";
    LC_IDENTIFICATION = "en_NZ.UTF-8";
    LC_MEASUREMENT = "en_NZ.UTF-8";
    LC_MONETARY = "en_NZ.UTF-8";
    LC_NAME = "en_NZ.UTF-8";
    LC_NUMERIC = "en_NZ.UTF-8";
    LC_PAPER = "en_NZ.UTF-8";
    LC_TELEPHONE = "en_NZ.UTF-8";
    LC_TIME = "en_NZ.UTF-8";
  };

  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.enable = true;
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
  };

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.${user} = {
    isNormalUser = true;
    description = "Liam";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" ];
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;

  services.xserver.libinput.enable = true;
  services.xserver.libinput.mouse.accelSpeed = "-0.3";
  services.printing.enable = true;

  environment.systemPackages = with pkgs; [
    libsForQt5.kdenlive
    librewolf
    obs-studio
    git
    vim
    wget
    nfs-utils
    ciscoPacketTracer8
    brave
    kubectl
    kubernetes-helm
    k3sup
    ansible
    ansible-lint
    sshpass
    python311Packages.netaddr
    yamlfmt
    openssl
    wezterm
    lua-language-server
    stylua
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    lmodern
  ];

  programs.zsh.enable = true;

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      X11Forwarding = true;
    };
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.deluge = {
    enable = true;
    web.enable = true;
  };

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "monthly";
      options = "--delete-older-than 30d";
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}