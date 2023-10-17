{ config, lib, pkgs, user, ... }:

with lib;

let
  cfg = config.custom.virt;
in
{
  options.custom.virt = {
    enable = mkEnableOption "virt-manager" // { default = false; };
  };

  config = mkIf cfg.enable {
    programs.dconf.enable = true;

    virtualisation.libvirtd.enable = true;

    environment.systemPackages = with pkgs; [
      virt-manager
    ];

    users.users.${user}.extraGroups = [ "libvirtd" ];
  };
}
