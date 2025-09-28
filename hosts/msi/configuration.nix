# /etc/nixos/configuration.nix

{ config, pkgs, lib, home-manager, stable, unstable, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/nix-settings.nix
      ../../modules/users.nix
      ../../modules/packages.nix
      ../../modules/audio.nix
      ../../modules/nvidia.nix
      ../../modules/desktop/gnome.nix
      home-manager.nixosModules.home-manager
    ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Time zone
  time.timeZone = "Asia/Tashkent";

  # Internationalization
  i18n.defaultLocale = "en_US.UTF-8";

  # # Set hardware and swap configurations
  # swapDevices = [
  #   { device = "/dev/disk/by-uuid/fa8e363c-0520-411b-8fb8-0ff728ea79e9"; }
  # ];

  # Enable CUPS for printing
  services.printing.enable = true;

  home-manager.users.ulugbek = {
    imports = [
      # Reference the file you defined in your flake's homeConfigurations
      ../../home/ulugbek/home.nix
    ];
  };
}
