{ pkgs, ... }:

{
  imports = [
    ./git
    ./kitty
    ./neovim
    ./ssh
    ./tmux
    ./zsh
  ];

  home.packages = with pkgs; [
    gcc
    gnumake
    nodejs
    cargo
    rustc
    zig
  ];
}