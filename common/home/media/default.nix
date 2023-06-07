{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Utilities
    libva-utils
    playerctl

    # Music
    spotify

    # Video
    ffmpeg_6-full
    mpv
    vlc

    # Images
    feh
    xfce.ristretto

    # Other
    chatterino2
  ];
}