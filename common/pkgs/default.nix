{ user, pkgs, ... }: {
  imports = [
    ./thunar.nix
  ];

  # Common user-specific packages to always include
  users.users.${user}.packages = with pkgs; [
    stow

    # Browsers
    brave
    chromium

    # Audio
    easyeffects

    # Video
    vlc

    # Images
    aseprite
    flameshot
    gimp
    xfce.ristretto

    # PDF Viewer
    evince

    # Other
    featherpad
    qalculate-gtk
  ];

  # Common system packages to always include
  environment.systemPackages = with pkgs; [
    curl
    fd
    feh
    ffmpeg
    file
    file
    fzf
    git
    gnutar
    htop
    inetutils
    libva-utils
    p7zip
    pciutils
    ripgrep
    tree
    unzip
    vim
    wget
    which
    xclip
    zip
  ];
}
