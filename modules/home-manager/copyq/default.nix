{pkgs, ...}: {
  home.packages = with pkgs; [
    copyq
  ];

  # Orqa fonda ishlashini ta'minlash
  services.copyq.enable = true;

  dconf.settings = {
  };
}
