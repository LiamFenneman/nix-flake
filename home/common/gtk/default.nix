{ pkgs,...}:

{
  home.packages = with pkgs; [
    gnome.gnome-themes-extra
    gnome.adwaita-icon-theme
  ];

  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita Dark";
      size = 16;
    };
    iconTheme = {
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita Dark";
    };
    theme = {
      package = pkgs.gnome.gnome-themes-extra;
      name = "Adwaita Dark";
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.gnome.adwaita-icon-theme;
    name = "Adwaita Dark";
    size = 16;
  };
  xresources.extraConfig = "Xcursor.theme: Adwaita Dark";
}