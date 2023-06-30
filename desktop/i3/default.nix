{ ... }:

{
  imports = [
    ../../common/nix/polkit
  ];

  services.getty.autologinUser = "liam";

  services.xserver.windowManager.i3.enable = true;

  services.xserver.displayManager = {
    autoLogin.enable = true;
    autoLogin.user = "liam";
    defaultSession = "none+i3";
    lightdm.enable = true;
    lightdm.greeter.enable = true;
  };

  services.xserver = {
    deviceSection = ''
      VendorName "NVIDIA Corporation"
    '';
    screenSection = ''
      Option "metamodes" "DP-2: 1920x1080_144 +0+0 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}, DP-0: 1920x1080_60 +1920+0"
    '';
    exportConfiguration = true;
    videoDrivers = [ "nvidia" ];
  };
}
