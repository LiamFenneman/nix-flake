{ user, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch";
      nr = "sudo nixos-rebuild";

      ls = "eza -1lag -s Name --group-directories-first --icons --color=always";
      mkdir = "mkdir -p";
      mv = "mv -i";

      gs = "git status";
      gp = "git push ";
      ga = "git add ";
      gc = "git commit ";
      gd = "git diff";
      gdc = "git diff --cached";
      gl = "git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches";
      wt = "git worktree ";

      k = "kubectl";

      wp = "\\ls $WALLPAPER_DIR | fzf --preview=\"feh --bg-scale $WALLPAPER_DIR/{}\" | xargs -I {} feh --bg-scale $WALLPAPER_DIR/{}";
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

      export WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
    '';
    ohMyZsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
        "fzf"
        "tmux"
      ];
    };
  };

  users.users.${user}.shell = pkgs.zsh;
}
