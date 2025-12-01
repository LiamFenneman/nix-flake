{ pkgs, ... }:
let
  browser = "librewolf.desktop";
in
{
  # NOTE: see https://github.com/NixOS/nixpkgs/issues/248192
  nixpkgs.overlays = [
    (self: super: {
      xarchiver = super.xarchiver.overrideAttrs (old: {
        postInstall = ''
          rm -rf $out/libexec
        '';
      });

      xfce = super.xfce.overrideScope (xself: xsuper: {
        thunar-archive-plugin = xsuper.thunar-archive-plugin.overrideAttrs (old: {
          postInstall = ''
            cp ${super.xarchiver}/libexec/thunar-archive-plugin/* $out/libexec/thunar-archive-plugin/
          '';
        });
      });
    })
  ];

  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images

  environment.systemPackages = with pkgs; [
    xarchiver
  ];

  xdg.mime.defaultApplications = {
    "inode/directory" = "Thunar.desktop";
    "default-web-browser" = "${browser}";
    "text/html" = "${browser}";
    "application/pdf" = "${browser}";
    "x-scheme-handler/http" = "${browser}";
    "x-scheme-handler/https " = "${browser}";
    "x-scheme-handler/mailto" = "${browser}";
  };
}

