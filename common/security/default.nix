{ ... }: {
  imports = [
    ./polkit.nix
  ];

  security.pam.loginLimits = [
    { domain = "*"; item = "memlock"; type = "soft"; value = "1048576"; }
    { domain = "*"; item = "memlock"; type = "hard"; value = "1048576"; }
  ];
}
