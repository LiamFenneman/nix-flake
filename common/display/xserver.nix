{ user, ... }:
{
  hardware.opengl.enable = true;

  services.xserver = {
    enable = true;
    displayManager = {
      autoLogin.enable = true;
      autoLogin.user = user;
      lightdm.enable = true;
      lightdm.greeter.enable = true;
    };
  };

  services.getty.autologinUser = "liam";
}
