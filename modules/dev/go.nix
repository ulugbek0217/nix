{pkgs, ...}: {
  environment.systemPackages = with pkgs.unstable; [
    go
    gopls # Language server
    delve # Debugger
    golangci-lint
  ];
  # Go muhiti uchun pathlarni sozlash
  environment.sessionVariables = {
    GOPATH = "$HOME/go";
    GOBIN = "$HOME/go/bin";
  };
}
