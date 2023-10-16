{ config, lib, pkgs, ... }:

{
  hardware.enableRedistributableFirmware = lib.mkDefault true;

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "ahci"
    "ehci_pci"
    "nvme"
    "usb_storage"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [
    "kvm-amd"
  ];
  boot.extraModulePackages = [ ];
  boot.kernelPackages = pkgs.linuxPackages_latest;

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/5cf14457-9291-4f87-aa0b-e7d00bb31410";
    fsType = "ext4";
  };

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/AAC5-2631";
    fsType = "vfat";
  };

  boot.initrd.secrets."/crypto_keyfile.bin" = null;

  boot.initrd.luks.devices."luks-3fee0382-90e6-4823-ab0b-8c2f2d8f1f0f" = {
    device = "/dev/disk/by-uuid/3fee0382-90e6-4823-ab0b-8c2f2d8f1f0f";
  };

  boot.initrd.luks.devices."luks-70530399-fd4b-4551-b76c-40856fe5a0b5" = {
    device = "/dev/disk/by-uuid/70530399-fd4b-4551-b76c-40856fe5a0b5";
    keyFile = "/crypto_keyfile.bin";
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/3e8b82cb-40a1-4170-bb21-8b6897740a42"; }
  ];

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
