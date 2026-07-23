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
      extraGroups = ["wheel" "docker" "podman" "networkmanager" "libvirtd"];

      packages = with pkgs; [
        home-manager
      ];
    };
  };

  # Configure home-manager
  home-manager = {
    useGlobalPkgs = false;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = {inherit inputs outputs;};
    users.ulugbek = import ../../../home-manager/home.nix;
  };
}
