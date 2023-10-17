{ config, lib, ... }:

with lib;

let
  cfg = config.custom.home.kitty;
in
{
  options.custom.home.kitty = {
    enable = mkEnableOption "kitty" // { default = true; };
  };

  config = mkIf cfg.enable {
    programs.kitty = {
      enable = true;
      theme = "Tokyo Night";
      font = {
        name = "JetBrains Mono Nerd Font";
        size = 11;
      };
      settings = {
        allow_rwmote_control = "socket-only";
        confirm_os_window_close = 0;
        enable_audio_bell = false;
        listen_on = "unix:/tmp/kitty";
        background_opacity = "1.0";
      };
      shellIntegration.enableZshIntegration = true;
    };
  };
}
