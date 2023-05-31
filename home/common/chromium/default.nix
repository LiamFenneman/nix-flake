{ ... }:

{
  programs.chromium = {
    enable = true;
    extensions = [
      {
        # uBlock Origin
        id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";
      }
      {
        # Dark Reader
        id = "eimadpbcbfnmbkopoojfekhnkhdbieeh";
      }
      {
        # RoboForm
        id = "pnlccmojcmeohlpggmfnbbiapkmbliob";
      }
      {
        # Enhancer for YouTube
        id = "ponfpcnoihfmfllpaingbgckeeldkhle";
      }
      {
        # Reddit Enhancement Suite
        id = "kbmfpngjjgdllneeigpgjifpgocmfgmb";
      }
      {
        # FrankerFaceZ
        id = "fadndhdgpmmaapbmfcknlfgcflmmmieb";
      }
    ];
  };
}