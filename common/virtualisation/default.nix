{ user, ... }: {
  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
    docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };

  # NOTE: this requires some manual setup, see https://nixos.wiki/wiki/Virt-manager
  programs.virt-manager.enable = true;

  users.users.${user}.extraGroups = [ "libvirtd" "docker" ];
}
