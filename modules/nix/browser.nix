{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.custom.browser;
in
{
  options.custom.browser = {
    chromium = mkEnableOption "Chromium" // { default = false; };
    librewolf = mkEnableOption "LibreWolf" // { default = false; };
  };

  config = mkMerge [
    (mkIf cfg.chromium {
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
    })
    (mkIf cfg.librewolf {
      environment.systemPackages = [
        pkgs.librewolf
      ];
    })
  ];
}
