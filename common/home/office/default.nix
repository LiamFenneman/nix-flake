{ pkgs, ... }:

{
  home.packages = with pkgs; [
    onlyoffice-bin
    featherpad
  ];
}