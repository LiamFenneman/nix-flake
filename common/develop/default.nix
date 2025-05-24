{ user, pkgs, pkgs-unstable, ... }: {
  imports = [
    ./git.nix
    ./tmux.nix
    ./ssh.nix
    ./zsh.nix
  ];

  users.users.${user}.packages = with pkgs; [
    pkgs-unstable.neovim-unwrapped
    wezterm

    # K8s
    kubectl

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

    # YAML
    yamlfmt

    # Other Tools
    ansible
    clang
    gdb
    gf
    gnumake
    jq
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
}
