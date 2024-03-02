{ kind, ... }: {
  system.nixos.tags = [ kind ];
  system.stateVersion = "23.11";
}
