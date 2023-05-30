{ config, pkgs, ... }:

{
    programs.zsh = {
        enable = true;

        enableAutosuggestions = true;
        enableCompletion = true;
        enableSyntaxHighlighting = true;

        initExtra = ''
            bindkey '^ ' autosuggest-accept

            export EDITOR="nvim";
        '';

        shellAliases = {
            tmux = "tmux -f $HOME/.config/tmux/tmux.conf";
            nrs = "sudo nixos-rebuild switch";
            nr = "sudo nixos-rebuild";

            exa = "exa -1lag -s Name --group-directories-first --icons --color=always";
            mkdir = "mkdir -p";
            mv = "mv -i";

            gs = "git status";
            gp = "git push ";
            ga = "git add ";
            gc = "git commit ";
            gd = "git diff";
            gdc = "git diff --cached";
            gl = "git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches";
        };

        oh-my-zsh = {
            enable = true;
            theme = "robbyrussell";
            plugins = [
                "git"
                "fzf"
                "tmux"
            ];
        };
    };
}
