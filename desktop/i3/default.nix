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
}