{ config, lib, ... }:

with lib;

let
  cfg = config.custom.chromium;
in
{
  options.custom.chromium = {
    enable = mkEnableOption "Chromium" // { default = true; };
  };

  config = mkIf cfg.enable {
    programs.chromium = {
      enable = true;
      extensions = [
        "ammjkodgmmoknidbanneddgankgfejfh" # 7TV
        "dnhpnfgdlenaccegplpojghhmaamnnfp" # Augmented Steam
        "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark Reader
        "ponfpcnoihfmfllpaingbgckeeldkhle" # Enhancer for YouTube
        "fadndhdgpmmaapbmfcknlfgcflmmmieb" # FrankerFaceZ
        "kbmfpngjjgdllneeigpgjifpgocmfgmb" # Reddit Enhancement Suite
        "pnlccmojcmeohlpggmfnbbiapkmbliob" # RoboForm
        "clngdbkpkpeebahjckkjfobafhncgmne" # Stylus
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
      ];
      extraOpts = {
        "BrowserSignin" = 0;
        "SyncDisabled" = true;
        "PasswordManagerEnabled" = false;
        "SpellcheckEnabled" = true;
        "SpellcheckLanguage" = [
          "en-AU"
          "en-GB"
          "en-US"
        ];
      };
    };
  };
}
