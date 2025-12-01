{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  users.users = {
    ulugbek = {
      initialPassword = "111";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [];
      extraGroups = ["wheel" "docker" "networkmanager"];

      # Remove GUI packages from here - they should be in home-manager
      # Keep only system-level utilities if needed
      packages = with pkgs; [
        # System utilities only
        home-manager
      ];
    };
  };

  # Configure home-manager
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = {inherit inputs outputs;};
    users.ulugbek = import ../../../home-manager/home.nix;
  };
}
