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
  ];

  home = {
    username = "ulugbek";
    homeDirectory = "/home/ulugbek";

    # Remove the mkForce override or adjust it to include home-manager paths
    sessionVariables = {
      # Let home-manager handle XDG_DATA_DIRS automatically
      # If you need to add custom paths, append them instead of replacing
    };

    # Move GUI applications here from ulugbek.nix
    packages = with pkgs; [
      telegram-desktop
      discord
      google-chrome
      # firefox
      onlyoffice-desktopeditors
      fastfetch
      peazip
    ];
  };

  nixpkgs.config = {allowUnfree = true;};

  # This is important for GNOME to find applications
  targets.genericLinux.enable = false;

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "25.05";
}
