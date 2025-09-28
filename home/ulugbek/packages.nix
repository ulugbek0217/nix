{ unstable, stable, ...}:

let
  stablePackages = with stable; [
    nerd-fonts.jetbrains-mono
  ];

  unstablePackages = with unstable; [
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