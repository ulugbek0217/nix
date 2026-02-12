{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nodejs_24 # LTS versiya
    corepack # yarn va pnpm uchun
  ];
}
