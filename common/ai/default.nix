{ pkgs-unstable, ... }:
{
  services.ollama = {
    enable = true;
    package = pkgs-unstable.ollama-cuda;
    acceleration = "cuda";
  };
  services.open-webui.enable = true;
}
