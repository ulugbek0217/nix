{ pkgs, ... }: {
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
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
    freetype
    fontconfig
    wayland
    gtk3
    libxext
    libx11
    dbus
  ];
}
