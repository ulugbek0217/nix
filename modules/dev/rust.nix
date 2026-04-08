{pkgs, ...}: {
  environment.systemPackages = with pkgs.unstable; [
    rustc
    cargo
    rust-analyzer # LSP (IDE uchun)
    clippy # Linter
    bacon # Background code checker
    pkg-config
    openssl
    rustfmt
  ];
}
