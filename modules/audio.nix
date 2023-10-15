{ config, lib, ... }:

with lib;

let
  cfg = config.custom.audio;
in
{
  options.custom.audio = {
    backend = mkOption {
      type = types.str;
      example = "pulseaudio";
      default = "pipewire";
      description = "Audio backend to use.";
    };
  };

  config = mkMerge [
    (mkIf (cfg.backend == "pipewire") {
      sound.enable = true;
      hardware.pulseaudio.enable = false;
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };
    })
    (mkIf (cfg.backend == "pulseaudio") {
      hardware.pulseaudio.enable = true;
    })
  ];
}
