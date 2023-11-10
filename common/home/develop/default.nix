{ pkgs, ... }:

let
  rust-nightly = pkgs.rust-bin.selectLatestNightlyWith (toolchain: toolchain.default.override {
      extensions = [ "rust-src" "rust-analyzer" ];
      targets = [ "x86_64-unknown-linux-gnu" "wasm32-unknown-unknown" ];
    });
in
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
    vscode
    clang-tools_16
    clang
    gnumake
    nodejs
    rust-nightly
    zig
  ];
}