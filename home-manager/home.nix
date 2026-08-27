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
    # outputs.homeModules.nixpkgs
    outputs.homeModules.vscode
    outputs.homeModules.obs-studio
  ];

  home = {
    username = "ulugbek";
    homeDirectory = "/home/ulugbek";

    sessionVariables = {};

    # List of user's gui apps
    packages = with pkgs; [
      telegram-desktop
      unstable.google-chrome
      onlyoffice-desktopeditors
      fastfetch
      peazip
      copyq
      foliate
      protonup-qt
      mission-center
      qbittorrent
      obsidian
      unstable.element-desktop
      bruno
      tableplus
      easyeffects
      apache-directory-studio
      unstable.ayugram-desktop
    ];
  };

  # This is important for GNOME to find applications
  targets.genericLinux.enable = false;

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "25.11";
}
