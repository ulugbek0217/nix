{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
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
