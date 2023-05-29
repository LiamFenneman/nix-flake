{ config, pkgs, ... }:

{
    programs.chromium = {
        enable = true;
        extensions = [
            {
                id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";
            }
            {
                id = "eimadpbcbfnmbkopoojfekhnkhdbieeh";
            }
        ];
    };
}
