{ config, lib, ... }:

with lib;

let
  cfg = config.custom.display.nvidia;
in
{
  options.custom.display.nvidia = {
    enable = mkEnableOption "NVIDIA driver settings" // { default = false; };
  };

  config = mkIf cfg.enable {
    hardware.nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      modesetting.enable = true;
    };

    hardware.opengl.enable = true;

    services.xserver = {
      deviceSection = ''
        VendorName "NVIDIA Corporation"
      '';
      screenSection = ''
        Option "metamodes" "DP-2: 1920x1080_144 +0+0 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}, DP-0: 1920x1080_60 +1920+0 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}"
      '';
      exportConfiguration = true;
      videoDrivers = [ "nvidia" ];
    };
  };
}
