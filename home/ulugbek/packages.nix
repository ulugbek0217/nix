{ unstable, stable, ...}:

{
  home.packages = with stable; [
    nerd-fonts.jetbrains-mono
  ];

  home.packages = with unstable; [
    telegram-desktop
    google-chrome
    vscode
    go
  ];
}