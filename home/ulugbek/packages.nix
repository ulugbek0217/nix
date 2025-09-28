{ pkgs, ...}:

let
  stablePackages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  unstablePackages = with pkgs.unstable; [
    telegram-desktop
    google-chrome
    vscode
    go
    python313
  ];

in
{
  # Use list concatenation (++) here to merge the two lists
  home.packages = stablePackages ++ unstablePackages;
}