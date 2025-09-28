{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    vscode
    google-chrome
    go
    python313
    gcc15
    nerd-fonts.jetbrains-mono
  ];
}