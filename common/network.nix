{ hostname, ... }:
{
  networking = {
    hostName = hostname;
    networkmanager.enable = true;
    hosts = {
      "192.168.254.200" = [ "pve1" ];
      "192.168.254.201" = [ "pve2" ];
    };
    nameservers = [
      "192.168.254.101"
    ];
  };

  programs.nm-applet.enable = true;
}
