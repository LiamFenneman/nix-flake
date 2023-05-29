{ config, pkgs, ... }:

{
    programs.zsh = {
        enable = true;

        enableAutosuggestions = true;
        enableCompletion = true;
        enableSyntaxHighlighting = true;

        initExtra = ''
            bindkey '^ ' autosuggest-accept
        '';

        shellAliases = {
            tmux = "tmux -f $HOME/.config/tmux/tmux.conf";
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
