{ config, lib, modulesPath, ... }:

{
  imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];

  boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = { device = "/dev/disk/by-uuid/97e84504-fef9-4047-9759-03f8e8d013ea"; fsType = "ext4"; };

  boot.initrd.luks.devices."luks-03c69251-a2c9-4718-95e3-7e394d97d0f6".device = "/dev/disk/by-uuid/03c69251-a2c9-4718-95e3-7e394d97d0f6";

  fileSystems."/boot/efi" =
    {
      device = "/dev/disk/by-uuid/78B8-DC7C";
      fsType = "vfat";
    };

  swapDevices = [ ];
  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}