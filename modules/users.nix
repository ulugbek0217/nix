{ pkgs, ... }:

{
  users.users.ulugbek = {
    isNormalUser = true;
    description = "Ulugbek";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
