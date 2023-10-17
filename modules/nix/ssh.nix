{ config, lib, ... }:

with lib;

let
  cfg = config.custom.ssh;
in
{
  options.custom.ssh = {
    enable = mkEnableOption "ssh" // { default = true; };
  };

  config = mkIf cfg.enable {
    programs.ssh = {
      extraConfig = ''
        AddKeysToAgent yes
      '';
    };

    services.openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "no";
        X11Forwarding = true;
      };
    };

    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryFlavor = "gnome3";
    };
  };
}