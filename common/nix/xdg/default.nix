{ pkgs, ... }:

{
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-kde ];
  xdg.mime.defaultApplications = {
    "application/pdf" = "org.gnome.Evince.desktop";
  };
}