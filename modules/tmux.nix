{ config, lib, ... }:

with lib;

let
  cfg = config.custom.tmux;
in
{
  options.custom.tmux = {
    enable = mkEnableOption "tmux" // { default = true; };
  };

  config = mkIf cfg.enable {
    programs.tmux = {
      enable = true;
      baseIndex = 1;
      clock24 = true;
      escapeTime = 100;
      keyMode = "vi";
      # mouse = true;
      # prefix = "C-a";
      terminal = "tmux-256color";
      extraConfig = ''
        setw -g xterm-keys on

        set -g mouse on

        unbind C-b
        set -g prefix C-a
        bind -N "Send the prefix key through to the application" \
          C-a send-prefix

        bind-key h select-pane -L
        bind-key j select-pane -D
        bind-key k select-pane -U
        bind-key l select-pane -R

        bind '"' split-window -c "#{pane_current_path}"
        bind % split-window -hc "#{pane_current_path}"

        set-option -sa terminal-features ',xterm-kitty:RGB'
      '';
    };
  };
}
