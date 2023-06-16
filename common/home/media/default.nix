{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Utilities
    libva-utils
    playerctl

    # Audio/Music
    easyeffects
    spotify

    # Video
    ffmpeg_6-full
    mpv
    vlc

    # Images
    aseprite
    feh
    gimp
    xfce.ristretto

    # PDF Viewer
    evince

    # Other
    chatterino2
  ];
}
