{pkgs, ...}: {
  environment.systemPackages = with pkgs.unstable; [
    rustc
    cargo
    rust-analyzer
    clippy
    bacon
    pkg-config
    openssl
    rustfmt
  ];
}
