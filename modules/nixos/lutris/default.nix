{
  config,
  pkgs,
  ...
}: {
  # Add Lutris to your system packages
  environment.systemPackages = with pkgs; [
    lutris

    # Highly recommended additions for gaming on NixOS:
    wineWowPackages.stable # A full Wine installation with 32/64-bit support
    winetricks # Utility to install Windows dependencies
  ];
}
