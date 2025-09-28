{
  # Configure Nvidia GPU drivers
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;

    # Power management
    powerManagement.enable = false;
    powerManagement.finegrained = false;

    # Use the open-source NVidia kernel module (if necessary)
    open = false;

    # Enable Nvidia settings menu
    nvidiaSettings = true;

    # Optionally, specify the Nvidia driver version
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}