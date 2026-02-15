{pkgs, ...}: {
  # Enable GNOME with Wayland
  services = {
    xserver.enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
      autoSuspend = false;
    };
    desktopManager.gnome = {
      enable = true;
    };

    xserver.xkb = {
      layout = "us,ru";
      options = "grp:alt_shift_toggle,grp:win_space_toggle,caps:escape,eurosign:e";
    };
  };

  services.libinput.enable = true;

  # Critical: Enable dbus for proper desktop integration
  services.dbus.enable = true;

  # Ensure XDG portals are properly configured for GNOME
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gnome];
    config.common.default = "*";
  };

  # GNOME-specific packages
  environment.systemPackages = with pkgs; [
    gnome-tweaks
    gnome-extension-manager
    dconf-editor
  ];

  programs.dconf.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    epiphany
    geary
    gnome-music
    gnome-photos
    totem
  ];

  # Ensure proper environment for desktop files
  environment.sessionVariables = {
    # These help GNOME find applications
    XDG_DATA_DIRS = [
      "/run/current-system/sw/share"
      "$HOME/.nix-profile/share"
    ];
  };
}
