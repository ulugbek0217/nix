{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  users.users = {
    # FIXME: Replace with your username
    ulugbek = {
      # TODO: You can set an initial password for your user.
      # If you do, you can skip setting a root password by passing '--no-root-passwd' to nixos-install.
      # Be sure to change it (using passwd) after rebooting!
      initialPassword = "111";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      ];
      # TODO: Be sure to add any other groups you need (such as networkmanager, audio, docker, etc)
      extraGroups = ["wheel" "docker" "networkmanager"];

      packages = with pkgs; [
        telegram-desktop
        discord
        google-chrome
        firefox
        zed-editor
        onlyoffice-desktopeditors
        fastfetch
      ];
    };
  };
  home-manager = {
    backupFileExtension = "hbak";
    extraSpecialArgs = {
      inherit inputs outputs;
    };
    users = {
      # Import your home-manager configuration
      ulugbek = import ../../../home-manager/home.nix;
    };
  };
}
