{ config, ... }:
{
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
  };

  services.xserver = {
    deviceSection = ''
      VendorName "NVIDIA Corporation"
    '';
    screenSection = ''
      Option "metamodes" "DP-0: 1920x1080_60 +0+360 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}, DP-2: 2560x1440_180 +1920+0 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}"
    '';
    exportConfiguration = true;
    videoDrivers = [ "nvidia" ];
  };
}
