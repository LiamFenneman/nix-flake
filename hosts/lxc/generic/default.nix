{ mod, pkgs, ... }: {
  imports = [
    (mod "lxc")
  ];

  environment.systemPackages = with pkgs; [
    neofetch
    vim
    git
    curl
    wget
  ];
}
