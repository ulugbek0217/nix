{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nodejs_24
    corepack # yarn va pnpm uchun
  ];
}
