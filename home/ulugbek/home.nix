{ config, pkgs, nixpkgs-unstable, ... }:

{
  imports = [
    ./packages.nix
  ];
  
  # Home Manager needs a bit of information about you and the paths it should manage
  home.username = "ulugbek";
  home.homeDirectory = "/home/ulugbek";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  home.stateVersion = "25.05";

  # Basic packages - add more as needed
  # home.packages = with pkgs; [

  # ];

  fonts.fontconfig.enable = true;

  # Basic git configuration
  programs.git = {
    enable = true;
    userName = "Ulugbek";
    userEmail = "mylogin.ulugbek@gmail.com"; # Change this to your email
  };

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;
}