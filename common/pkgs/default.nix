{ user, pkgs, ... }: {
  imports = [
    ./firefox.nix
    ./thunar.nix
  ];

  # Common user-specific packages to always include
  users.users.${user}.packages = with pkgs; [
    # Browsers
    chromium

    # Audio
    easyeffects
    pavucontrol

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
    filelight
    qalculate-gtk
    stow
    tldr
    transmission_4-qt
  ];

  # Common system packages to always include
  environment.systemPackages = with pkgs; [
    btop
    curl
    dig
    eza
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
    nfs-utils
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
