{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Utilities
    libva-utils
    playerctl

    # Documents
    nnn
    cinnamon.nemo-with-extensions

    # Music
    spotify

    # Video
    mpv
    vlc

    # Images
    feh
    xfce.ristretto

    # Other
    chatterino2
  ];

  home.sessionVariables = {
    NNN_BMS = "p:~/Documents/Projects;u:~/Documents/University;";
  };
}