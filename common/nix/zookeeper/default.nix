{ pkgs, ... }:

{
  services.zookeeper = {
    enable = true;
    preferIPv4 = true;
  };
}