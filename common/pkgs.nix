{ user, pkgs, ... }: {
  # Common user-specific packages to always include
  users.users.${user}.packages = with pkgs; [
    vim
    stow
  ];

  # Common system packages to always include
  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    zip
    unzip
    gnutar
    p7zip
  ];
}
