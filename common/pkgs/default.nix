{ user, pkgs, ... }: {
  imports = [
    ./thunar.nix
  ];

  # Common user-specific packages to always include
  users.users.${user}.packages = with pkgs; [
    # Browsers
    chromium
    librewolf

    # Audio
    easyeffects
    pavucontrol

    # Video
    vlc

    # Images
    aseprite
    flameshot
    gimp
    # gimp3
    xfce.ristretto

    # PDF Viewer
    evince

    # Other
    featherpad
    filelight
    qalculate-gtk
    stow
    tlrc
    transmission_4-qt
  ];

  # Common system packages to always include
  environment.systemPackages = with pkgs; [
    bc
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
    nmap
    p7zip
    pciutils
    qdirstat
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
