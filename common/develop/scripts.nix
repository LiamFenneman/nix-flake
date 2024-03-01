{ pkgs, ... }:
let
  dfi = pkgs.writeShellScriptBin "dfi" ''
    nix flake init -t "liam#$1"
    direnv allow
  '';
  dfr = pkgs.writeShellScriptBin "dfi" ''
    echo "use flake \"liam#$1\"" >> .envrc
    direnv allow
  '';
in
{
  environment.systemPackages = [ dfi dfr ];
}
