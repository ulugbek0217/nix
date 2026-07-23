{pkgs, ...}: {
  virtualisation = {
    docker = {
      enable = true;
      storageDriver = "btrfs";
      rootless = {
        enable = true;
        setSocketVariable = true;
        daemon.settings = {
          data-root = "~/.local/docker";
          # dns = [ "1.1.1.1" "8.8.8.8" ];
          registry-mirrors = ["https://mirror.gcr.io"];
        };
      };
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

  environment.systemPackages = with pkgs; [
    docker
    dive
    dnsmasq
  ];
}
