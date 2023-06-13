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
    inetutils
    neofetch
    neofetch
    p7zip
    pciutils
    qalculate-gtk
    ripgrep
    tree
    unzip
    which
    xclip
  ];
}