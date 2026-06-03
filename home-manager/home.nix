{
  inputs,
  lib,
  config,
  pkgs,
  outputs,
  ...
}: {
  imports = [
    outputs.homeModules.git
    outputs.homeModules.helix
    outputs.homeModules.zed
    outputs.homeModules.zsh
    outputs.homeModules.dconf
    outputs.homeModules.nixpkgs
    outputs.homeModules.vscode
    outputs.homeModules.obs-studio
  ];

  home = {
    username = "ulugbek";
    homeDirectory = "/home/ulugbek";

    sessionVariables = {
      # Let home-manager handle XDG_DATA_DIRS automatically
      # If you need to add custom paths, append them instead of replacing
    };

    # List of user's gui apps
    packages = with pkgs; [
      telegram-desktop
      discord
      google-chrome
      onlyoffice-desktopeditors
      fastfetch
      peazip
      copyq
      foliate
      rustdesk
      protonup-qt
      mission-center
      qbittorrent
      unstable.insomnia
      obsidian
    ];
  };

  nixpkgs.config = {allowUnfree = true;};

  # This is important for GNOME to find applications
  targets.genericLinux.enable = false;

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "25.11";
}
