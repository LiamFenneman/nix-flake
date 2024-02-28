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
      PasswordAuthentication = false;
      X11Forwarding = true;
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
