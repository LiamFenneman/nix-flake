{ pkgs,...}:

{
  home.packages = with pkgs; [
    gnome.gnome-themes-extra
    gtk-engine-murrine
  ];

  gtk = {
    enable = true;
    theme = {
      package = pkgs.arc-theme;
      name = "Arc-Dark";
    };
    iconTheme = {
      package = pkgs.arc-icon-theme;
      name = "Arc";
    };
    cursorTheme = {
      package = pkgs.nordzy-cursor-theme;
      name = "Nordzy-cursors";
      size = 16;
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.nordzy-cursor-theme;
    name = "Nordzy-cursors";
    size = 16;
  };
  xresources.extraConfig = "Xcursor.theme: Nordzy-cursors";
}