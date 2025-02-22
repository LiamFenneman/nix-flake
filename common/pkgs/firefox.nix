{ pkgs, ... }: {
  nixpkgs.overlays =
    let
      moz-rev = "master";
      moz-url = builtins.fetchTarball {
        url = "https://github.com/mozilla/nixpkgs-mozilla/archive/${moz-rev}.tar.gz";
        sha256 = "sha256:087ds5arzchabsds787ainyab6g7sgl82gsgd5qpl661514cc7m2";
      };
      nightlyOverlay = (import "${moz-url}/firefox-overlay.nix");
    in
    [
      nightlyOverlay
    ];

  # IMPURE! (gross)
  programs.firefox = {
    enable = true;
    package = pkgs.latest.firefox-nightly-bin;
  };
}
