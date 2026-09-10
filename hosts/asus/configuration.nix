{
  inputs,
  outputs,
  lib,
  ...
}: {
  imports = [
    outputs.nixosModules.boot
    outputs.nixosModules.users.ulugbek
    outputs.nixosModules.audio
    outputs.nixosModules.nixpkgs
    outputs.nixosModules.desktop
    outputs.nixosModules.zsh
    outputs.nixosModules.fonts
    outputs.nixosModules.steam
    outputs.nixosModules.packages
    outputs.nixosModules.lutris
    outputs.devModules
    outputs.nixosModules.nixld
    outputs.nixosModules.virtualization

    inputs.home-manager.nixosModules.home-manager

    ./hardware-configuration.nix
  ];

  networking = {
    hostName = "asus";
    networkmanager.enable = true;
  };

  time = {
    timeZone = "Asia/Tashkent";
    hardwareClockInLocalTime = true;
  };

  i18n.defaultLocale = "en_US.UTF-8";

  # Enable bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.flatpak.enable = true;
  services.xserver.videoDrivers = ["modesetting"];
  services.thermald.enable = true;
  services.upower.enable = lib.mkForce true;

  services.tailscale.enable = true;

  # powerManagement.enable = false;
  services.power-profiles-daemon.enable = false;

  # Enable auto-cpu-freq
  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    charger = {
      governor = "performance";
      energy_performance_preference = "performance";
      platform_profile = "performance";
      turbo = "auto";
      platform_profile_strict = true;
      enable_thresholds = true;
      start_threshold = 75;
      stop_threshold = 80;
    };
    battery = {
      governor = "powersave";
      energy_performance_preference = "balance_performance";
      platform_profile = "balanced";
      turbo = "auto";
      platform_profile_strict = true;
    };
  };

  # zramSwap = {
  #   enable = true;
  #   memoryPercent = 100;
  # };

  services.earlyoom = {
    enable = true;
    enableNotifications = true;
    freeMemThreshold = 5;
    freeSwapThreshold = 5;
  };

  services.printing.enable = true;
  programs.firefox.enable = true;
  programs.direnv.enable = true;

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
