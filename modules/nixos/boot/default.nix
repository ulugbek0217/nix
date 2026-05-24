{pkgs, lib, ...}: let
  resolution = "1920x1080";
  theme-package = pkgs.callPackage ./theme.nix {};
in {
  config = {
    # Bootloader.
    boot = {
      consoleLogLevel = 0;
      initrd.verbose = false;
      kernelParams = [
        "quiet"
        "splash"
        # "rd.systemd.show_status=false"
        # "rd.udev.log_level=3"
        # "udev.log_priority=3"
      ];
      kernelPackages = pkgs.linuxPackages_latest;

      lanzaboote = {
        enable = true;
        pkiBundle = "/var/lib/sbctl";
      };

      loader = {
        efi.canTouchEfiVariables = true;
        # systemd-boot.enable = true;

        # grub = {
        #   enable = true;
        #   devices = ["nodev"];
        #   efiSupport = true;
        #   useOSProber = true;
        #   gfxmodeEfi = "${resolution},auto";
        #   gfxmodeBios = "${resolution},auto";
        #   # theme = theme-package;
        #   # splashImage = "${theme-package}/background.png";
        # };
      };
      plymouth = {
        enable = true;
        theme = "breeze";
      };
    };
  };
}
