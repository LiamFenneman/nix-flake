{ user, ... }:
{
  hardware.opengl.enable = true;

  services.xserver.enable = true;

  services.displayManager = {
    autoLogin.enable = true;
    autoLogin.user = user;
  };

  services.xserver.displayManager = {
    lightdm.enable = true;
    lightdm.greeter.enable = true;
  };

  services.libinput.enable = true;

  services.getty.autologinUser = "liam";
}
