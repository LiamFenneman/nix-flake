{ config, lib, pkgs, user, ... }:

with lib;

let
  cfg = config.custom.zsh;

  wallpaperDir = "/home/${user}/Pictures/Wallpapers";
in
{
  options.custom.zsh = {
    enable = mkEnableOption "zsh" // { default = true; };
  };

  config = mkIf cfg.enable {
    users.users.${user}.shell = pkgs.zsh;

    environment.systemPackages = with pkgs; [
      eza
      feh
      fzf
      tmux
    ];

    programs.zsh = {
      enable = true;

      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;

      ohMyZsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [
          "git"
          "fzf"
          "tmux"
        ];
      };

      shellAliases = {
        tmux = "tmux -f $HOME/.config/tmux/tmux.conf";
        nrs = "sudo nixos-rebuild switch";
        nr = "sudo nixos-rebuild";

        ls = "eza -1lag -s Name --group-directories-first --icons --color=always";
        mv = "mv -i";

        gs = "git status";
        gp = "git push ";
        ga = "git add ";
        gc = "git commit ";
        gd = "git diff";
        gdc = "git diff --cached";
        gl = "git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches";

        u = "cd ~/Documents/University";
        p = "cd ~/Documents/Projects";
        n = "cd ~/Documents/Notes";

        wp = "\\ls ${wallpaperDir} | fzf --preview=\"feh --bg-scale ${wallpaperDir}/{}\" | xargs -I {} feh --bg-scale ${wallpaperDir}/{}";
      };

      shellInit = ''
        bindkey '^ ' autosuggest-accept

        export PATH="$HOME/.cargo/bin:$PATH"

        export FZF_ALT_C_OPTS="--height 60% \
                               --border none \
                               --layout reverse \
                               --prompt '∷ ' \
                               --pointer ▶ \
                               --marker ⇒"
      '';
    };
  };
}
