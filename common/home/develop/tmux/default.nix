{ ... }:

{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    escapeTime = 100;
    keyMode = "vi";
    mouse = true;
    prefix = "C-a";
    terminal = "screen-256color";
    extraConfig = ''
      setw -g xterm-keys on

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      bind '"' split-window -c "#{pane_current_path}"
      bind % split-window -hc "#{pane_current_path}"
    '';
  };
}