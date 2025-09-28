# /etc/nixos/modules/nix-settings.nix

{
  nix.settings = {
    experimental-features = "nix-command flakes";
  };

  # Allow unfree packages globally
  nixpkgs.config.allowUnfree = true;

  # Networking
  networking.hostName = "msi"; # Define your hostname
  networking.networkmanager.enable = true;

  system.stateVersion = "25.05"; # The NixOS release version
}
