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

      c = "cargo";
      k = "kubectl";
    };
    ohMyZsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
        "fzf"
      ];
    };
  };

  users.users.${user}.shell = pkgs.zsh;
}
