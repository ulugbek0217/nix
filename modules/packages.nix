{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    gcc15
    ntfs3g
    home-manager
  ];

  programs.firefox.enable = true;
}