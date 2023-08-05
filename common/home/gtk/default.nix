{ pkgs,...}:

{
  home.packages = with pkgs; [
    gnome.gnome-themes-extra
    gtk-engine-murrine
  ];

  gtk = {
    enable = true;
    font = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
      size = 10;
    };
    theme = {
      package = pkgs.arc-theme;
      name = "Arc-Dark";
    };
    iconTheme = {
      package = pkgs.arc-icon-theme;
      name = "Arc";
    };
    cursorTheme = {
      package = pkgs.capitaine-cursors;
      name = "Capitaine Cursors";
      size = 16;
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.capitaine-cursors;
    name = "Capitaine Cursors";
    size = 16;
  };
  xresources.extraConfig = "Xcursor.theme: Capitaine Cursors";
}