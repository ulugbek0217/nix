{
  config,
  pkgs,
  ...
}: {
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Dasturlar ko'p so'raydigan standart kutubxonalar
    stdenv.cc.cc
    zlib
    fuse3
    icu
    nss
    openssl
    curl
    expat
    glibc
    util-linux
    glib
    # Agar biror dastur kutubxona topolmasa, shu ro'yxatga qo'shasiz
  ];
}
