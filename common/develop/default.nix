{ user, pkgs, pkgs-unstable, ... }: {
  imports = [
    ./git.nix
    ./tmux.nix
    ./ssh.nix
    ./zsh.nix
  ];

  users.users.${user}.packages = with pkgs; [
    # neovim-unwrapped
    neovim
    wezterm

    # K8s
    kubectl

    # Rust
    cargo-audit
    cargo-outdated
    bacon
    pkgs-unstable.wgsl-analyzer

    # Nix
    nixpkgs-fmt
    nil

    # Lua
    lua-language-server
    stylua

    # Web
    typescript-language-server
    biome

    # YAML
    yamlfmt

    # Other Tools
    clang
    gdb
    gf
    gnumake
    jq
    jujutsu
    postgresql_16
    tokei
    valgrind
    wrk
    zoxide

    # IDEs
    jetbrains.datagrip
    jetbrains.rust-rover
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
