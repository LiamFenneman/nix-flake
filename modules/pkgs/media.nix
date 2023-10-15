{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.custom.media;
in
{
  options.custom.media = {
    utils = mkEnableOption "media util packages" // { default = true; };
    video = mkEnableOption "video packages" // { default = true; };
    audio = mkEnableOption "audio packages" // { default = true; };
    image = mkEnableOption "image packages" // { default = true; };
    office = mkEnableOption "office packages" // { default = true; };
  };

  config = {
    environment.systemPackages = with pkgs; mkMerge [
      (mkIf cfg.utils [
        libva-utils
        playerctl
      ])
      (mkIf cfg.video [
        ffmpeg_6-full
        vlc
      ])
      (mkIf cfg.audio [
        easyeffects
        pavucontrol
        spotify
      ])
      (mkIf cfg.image [
        aseprite
        feh
        flameshot
        gimp
        xfce.ristretto
      ])
      (mkIf cfg.office [
        evince
        featherpad
        onlyoffice-bin
      ])
    ];
  };
}