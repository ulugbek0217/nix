{pkgs, ...}: {
  virtualisation = {
    podman = {
      enable = true;

      # Docker buyruqlarini podman orqali bajarish uchun alias yaratadi
      # Masalan: 'docker ps' yozsangiz ham podman tushunadi
      dockerCompat = true;

      # Konteynerlar bir-birini nomi bilan topishi uchun DNS-ni yoqadi
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  environment.systemPackages = with pkgs; [
    podman-compose # Docker-compose o'rniga ishlatish uchun
    podman-tui # Terminalda konteynerlarni boshqarish uchun UI
    dive # Konteyner image-larini analiz qilish uchun
  ];
}
