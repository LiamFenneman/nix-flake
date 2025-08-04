{ config, ... }:
{
  hardware.nvidia = {
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
  };

  services.xserver = {
    deviceSection = ''
      VendorName "NVIDIA Corporation"
    '';
    screenSection = ''
      Option "metamodes" "DP-2: 1920x1080_60 +0+360 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}, HDMI-0: 2560x1440_144 +1920+0 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}"
    '';
    exportConfiguration = true;
    videoDrivers = [ "nvidia" ];
  };
}
