{ user, pkgs, pkgs-unstable, ... }: {
  imports = [
    ./scripts.nix
    ./ssh.nix
    ./zsh.nix
  ];

  users.users.${user}.packages = with pkgs; [
    pkgs-unstable.neovim-unwrapped
    wezterm

    # K8s
    kubectl
    # talosctl

    # Rust
    cargo-audit
    cargo-outdated
    bacon

    # Nix
    nixpkgs-fmt
    nil

    # Lua
    lua-language-server
    pkgs-unstable.stylua

    # Web
    typescript-language-server
    biome

    # Gleam/Erlang
    pkgs-unstable.gleam
    erlang
    rebar3

    # YAML
    yamlfmt

    # WGSL
    # inputs.wgsl-analyzer.packages.${system}.default

    # Other Tools
    ansible
    clang
    cloc
    gdb
    gf
    gnumake
    jq
    nodejs
    postgresql_16
    tokei
    valgrind
    wasmtime
    wrk
    zoxide

    # IDEs
    jetbrains.datagrip
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.git = {
    enable = true;
    config = {
      commit = {
        gpgSign = true;
        verbose = true;
      };
      core = {
        excludesfile = "~/.gitignore";
      };
      diff = {
        algorithm = "histogram";
        colorMoved = "plain";
        mnemonicPrefix = true;
        renames = true;
      };
      fetch = {
        all = true;
        prune = true;
        pruneTags = true;
      };
      help = {
        autocorrect = "prompt";
      };
      init = {
        defaultBranch = "main";
      };
      push = {
        autoSetupRemote = true;
        default = "simple";
        followTags = true;
      };
      tag = {
        gpgSign = true;
        sort = "version:refname";
      };
      user = {
        email = "liamfennemanbusiness@gmail.com";
        name = "LiamFenneman";
      };
    };
    lfs = {
      enable = true;
    };
  };

  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    escapeTime = 100;
    keyMode = "vi";
    shortcut = "a";
    terminal = "screen-256color";
    extraConfig = ''
      set -g mouse on
      setw -g xterm-keys on

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      bind '"' split-window -c "#{pane_current_path}"
      bind % split-window -hc "#{pane_current_path}"

      set-option -sa terminal-features ',xterm-256color:RGB'
    '';
  };
}
