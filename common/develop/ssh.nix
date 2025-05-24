{ user, pkgs, ... }: {
  programs.ssh = {
    # startAgent = true;
    extraConfig = ''
      AddKeysToAgent yes
    '';
  };

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = true;
      X11Forwarding = false;
    };
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  users.users.${user}.packages = with pkgs; [
    openssl
    sshpass
  ];
}
