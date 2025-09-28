# /etc/nixos/configuration.nix

{ config, pkgs, ... }:

{
  imports =
    [
      ../../modules/hardware-configuration.nix
      ../../modules/nix-settings.nix
      ../../modules/users.nix
      ../../modules/packages.nix
      ../../modules/audio.nix
      ../../modules/nvidia.nix
      ../../modules/desktop/gnome.nix
    ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Time zone
  time.timeZone = "Asia/Tashkent";

  # Internationalization
  i18n.defaultLocale = "en_US.UTF-8";

  # Set hardware and swap configurations
  swapDevices = [
    { device = "/dev/disk/by-uuid/fa8e363c-0520-411b-8fb8-0ff728ea79e9"; }
  ];

  # Enable CUPS for printing
  services.printing.enable = true;
}
