{
  inputs,
  outputs,
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
    outputs.nixosModules.cli
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

  services.power-profiles-daemon.enable = false;
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      # CPU_MIN_PERF_ON_AC = 0;
      # CPU_MAX_PERF_ON_AC = 100;
      # CPU_MIN_PERF_ON_BAT = 0;
      # CPU_MAX_PERF_ON_BAT = 20;

      #Optional helps save long term battery health
      START_CHARGE_THRESH_BAT0 = 80; # 80 and below it starts to charge
      STOP_CHARGE_THRESH_BAT0 = 90; # 90 and above it stops charging
    };
  };

  zramSwap = {
    enable = true;
    memoryPercent = 200;
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
