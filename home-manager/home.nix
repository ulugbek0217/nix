# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  outputs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # inputs.self.homeManagerModules.example
    # outputs.homeModules.nixpkgs
    outputs.homeModules.git
    outputs.homeModules.helix
    outputs.homeModules.zed
    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  # TODO: Set your username
  home = {
    username = "ulugbek";
    homeDirectory = "/home/ulugbek";
    sessionVariables = lib.mkForce {
      XDG_DATA_DIRS = "$HOME/.nix-profile/share:$HOME/.local/share:/run/current-system/sw/share:/usr/share:/usr/local/share";
    };
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [home-manager];

  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # Do not touch
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "25.05";
}
