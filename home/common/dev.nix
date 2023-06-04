{ pkgs, ... }:

{
  imports = [
    ./git
    ./kitty
    ./neovim
    ./shell
    ./ssh.nix
    ./tmux
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