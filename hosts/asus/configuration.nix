# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    outputs.nixosModules.boot
    outputs.nixosModules.users.ulugbek
    outputs.nixosModules.audio
    outputs.nixosModules.nixpkgs
    outputs.nixosModules.desktop
    outputs.nixosModules.zsh
    outputs.nixosModules.fonts
    outputs.nixosModules.steam
    outputs.nixosModules.cli
    outputs.devModules

    ./hardware-configuration.nix
  ];

  networking.hostName = "asus"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time = {
    timeZone = "Asia/Tashkent";
    hardwareClockInLocalTime = true;
  };

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      vpl-gpu-rt
      intel-vaapi-driver
      intel-media-driver
    ];
  };

  boot.kernelParams = [
    "xe.force_probe=7d55"
    "xe.enable_psr=1"
    "intel_idle.max_cstate=9"
    "i915.force_probe=!7d55"
  ];
  services.thermald.enable = true;

  services.power-profiles-daemon.enable = false;

  # Enable auto-cpu-freq
  services.auto-cpufreq.enable = false;
  services.auto-cpufreq.settings = {
    charger = {
      governor = "performance";
      energy_performance_preference = "performance";
      turbo = "auto";
    };
    battery = {
      governor = "powersave";
      energy_performance_preference = "power"; # Qizishni oldini olish uchun
      turbo = "never";
    };
  };

  # Enable TLP
  services.tlp.enable = true;
  services.tlp.settings = {
    # Optional: Battery charge thresholds
    START_CHARGE_THRESH_BAT0 = 60; # Start charging at 40%
    STOP_CHARGE_THRESH_BAT0 = 80; # Stop charging at 80%
    CPU_SCALING_GOVERNOR_ON_AC = "performance";
    CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

    CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
    CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";

    CPU_BOOST_ON_AC = "1";
    CPU_BOOST_ON_BAT = "0"; # Disable turbo on battery

    CPU_HWP_DYN_BOOST_ON_AC = "1";
    CPU_HWP_DYN_BOOST_ON_BAT = "0";

    PLATFORM_PROFILE_ON_AC = "performance";
    PLATFORM_PROFILE_ON_BAT = "balanced";
  };

  powerManagement.powertop.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

  # programs.dconf.enable = true;
  programs.direnv.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      # Opinionated: forbid root login through SSH.
      PermitRootLogin = "no";
      # Opinionated: use keys only.
      # Remove if you want to SSH using passwords
      PasswordAuthentication = false;
    };
  };

  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
