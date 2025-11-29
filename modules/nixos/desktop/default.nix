{pkgs, ...}: {
  # Enable GNOME with Wayland
  services = {
    displayManager.gdm = {
      enable = true;
      wayland = true; # Explicitly enable Wayland
      autoSuspend = false;
    };
    desktopManager.gnome = {
      enable = true;
    };

    xserver = {
      enable = true; # you probably already have this, but keep it
      xkb = {
        layout = "us,ru";
        options = "grp:alt_shift_toggle,grp:win_space_toggle,caps:escape,eurosign:e";
      };
    };
  };

  # Touchpad support
  services.libinput.enable = true;

  # GNOME-specific packages
  environment.systemPackages = with pkgs; [
    gnome-tweaks
    gnome-extension-manager
    dconf-editor
  ];

  # Remove default GNOME applications not needed
  environment.gnome.excludePackages = with pkgs; [
    epiphany # GNOME web browser (you have Firefox)
    geary # Email client
    gnome-music
    gnome-photos
    totem # Video player (you have VLC/MPV)
  ];
}
