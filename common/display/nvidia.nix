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
      Option "metamodes" "DP-2: 1920x1080_144 +1920+0 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}, DP-0: 1920x1080_60 +0+0 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}"
    '';
    exportConfiguration = true;
    videoDrivers = [ "nvidia" ];
  };
}
