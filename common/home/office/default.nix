{ pkgs, ... }:

{
  imports = [
    ./tex.nix
  ];

  home.packages = with pkgs; [
    onlyoffice-bin
  ];
}