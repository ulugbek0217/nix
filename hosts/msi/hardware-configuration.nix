# This is just an example, you should generate yours with nixos-generate-config and put it in here.
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    kernelParams = [
      "nvidia-drm.modeset=1"
    ];

    initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod"];
    initrd.kernelModules = ["nvme"];
    kernelModules = [
      "kvm-intel"
      "nvidia"
      "nvidia_modeset"
      "nvidia_uvm"
      "nvidia_drm"
    ];
    extraModulePackages = [];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/7465a4f9-f76d-4947-adf7-f3b9ca0abc92";
    fsType = "btrfs";
    options = [ "subvol=@" ];
  };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/7465a4f9-f76d-4947-adf7-f3b9ca0abc92";
      fsType = "btrfs";
      options = [ "subvol=@home" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/F33F-135E";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/ed9eb138-9734-4f4c-8c4d-88333c38a730"; }
    ];

  fileSystems."/mnt/hdd" = {
    device = "/dev/disk/by-uuid/b60e79e1-b8f3-4d08-872f-2a2bcb83e093";
    fsType = "ntfs"; # or "ntfs", "exfat", etc.
    options = ["nofail" "defaults" "uid=1000" "gid=100" "umask=0022" "locale=en_US.utf8"];
  };

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp3s0.useDHCP = lib.mkDefault true;

  hardware = {
    # CPU (Intel)
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

    # GPU (Nvidia)
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };
  };

  # Set your system kind (needed for flakes)
  nixpkgs.hostPlatform = "x86_64-linux";
}
