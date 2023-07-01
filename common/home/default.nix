{ pkgs, ... }:

{
  imports = [
    ./chromium
    ./direnv
    ./gtk
    ./media
  ];

  home.packages = with pkgs; [
    exa
    fd
    file
    fzf
    htop
    inetutils
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