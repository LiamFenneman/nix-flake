{ config, pkgs, ... }:

{
    programs.ssh = {
        enable = true;
        extraConfig = ''
            AddKeysToAgent yes

            Hostname github.com
                Host github.com
                IdentityFile ~/.ssh/github
        '';
    };
}
