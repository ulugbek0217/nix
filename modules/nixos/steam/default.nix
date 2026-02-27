{pkgs, ...}: {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Steam Remote Play uchun portlarni ochadi
    dedicatedServer.openFirewall = true; # Dedicated serverlar uchun
  };
}
