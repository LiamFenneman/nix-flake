{ mod, pkgs, ... }: {
  imports = [
    (mod "lxc")
  ];

  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_16;
    extraPlugins = with pkgs.postgresql_16.pkgs; [ postgis ];
    enableTCPIP = true;
    port = 5432;
    identMap = ''
      superuser_map      root      postgres
      superuser_map      postgres  postgres
      superuser_map      /^(.*)$   \1
    '';
    authentication = ''
      #type database  DBuser  auth-method
      local sameuser  all     peer

      #type database  DBuser  origin-address    auth-method
      host  samsuser  all     127.0.0.1/32      trust
      host  sameuser  all     ::1/128           trust
      host  sameuser  all     192.168.254.0/24  trust
    '';
    initialScript = pkgs.writeText "backend-initScript" ''
      CREATE ROLE liam WITH LOGIN PASSWORD 'changeme' CREATEDB;
      CREATE DATABASE liam;
      GRANT ALL PRIVILEGES ON DATABASE liam TO liam;
    '';
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 5432 ];
  };

  services.postgresqlBackup = {
    enable = true;
    startAt = "*-*-* 01:00:00";
  };
}
