{ config, lib, modulesPath, ... }: {
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "ahci"
    "usb_storage"
    "usbhid"
    "sd_mod"
    "nfs"
    "nfsv4"
  ];
  boot.initrd.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
  boot.kernelModules = [ "kvm" "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/5e2d9966-f8dd-4abd-9c8b-93f6a680bdb1";
    fsType = "ext4";
  };

  boot.initrd.luks.devices."luks-02aa16b7-4cdb-4152-9db3-ed1889a36b8c".device = "/dev/disk/by-uuid/02aa16b7-4cdb-4152-9db3-ed1889a36b8c";

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/28BE-CA48";
    fsType = "vfat";
  };

  # fileSystems."/nfs/general1" = {
  #   device = "nas:/mnt/pool1/general1";
  #   fsType = "nfs";
  # };
  #
  # fileSystems."/nfs/media" = {
  #   device = "nas:/mnt/pool1/general2/media";
  #   fsType = "nfs";
  # };

  swapDevices = [{ device = "/dev/disk/by-uuid/8a959f53-61ae-4ecc-93fc-4ef4e5b4b0df"; }];

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
