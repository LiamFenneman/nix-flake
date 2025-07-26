{ user, pkgs, ... }:
{
  users.users.${user}.packages = with pkgs; [
    kdePackages.kdeconnect-kde
  ];

  programs.kdeconnect.enable = true;
}
