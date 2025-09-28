{ pkgs, ... }:

{
  users.users.ulugbek = {
    isNormalUser = true;
    description = "Ulugbek";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      telegram-desktop
    ];
  };
}
