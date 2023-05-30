{ config, pkgs, ... }:

{
    services.xserver = {
        enable = true;
        displayManager = {
            sddm.enable = true;
            autoLogin.enable = true;
            autoLogin.user = "liam";
        };
        desktopManager.plasma5.enable = true;
    };

    environment.plasma5.excludePackages = with pkgs; [
        ark
        elisa
        gwenview
        khelpcenter
        kinfocenter
        konsole
        okular
    ];
}
