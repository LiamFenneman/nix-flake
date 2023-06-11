{ pkgs, ... }:

{
  imports = [
    ./chromium
    ./gtk
    ./media
  ];

  home.packages = with pkgs; [
    exa
    file
    fzf
    htop
    neofetch
    p7zip
    pciutils
    ripgrep
    tree
    unzip
    which
    xclip
    qalculate-gtk
  ];
}