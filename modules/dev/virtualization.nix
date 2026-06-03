{pkgs, ...}: {
  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
      extraPackages = [pkgs.runc];
    };
    libvirtd = {
      enable = true;
      qemu.vhostUserPackages = with pkgs; [virtiofsd];
    };
  };

  programs.virt-manager.enable = true;
  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;
  networking.firewall.trustedInterfaces = ["virbr0"];

  # virtualisation.podman.extraPackages = [pkgs.runc];

  environment.systemPackages = with pkgs; [
    podman-compose
    podman-tui
    dive
    dnsmasq
  ];
}
