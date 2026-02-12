{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    go
    gopls # Language server
    delve # Debugger
  ];
  # Go muhiti uchun pathlarni sozlash
  environment.sessionVariables = {
    GOPATH = "$HOME/go";
    GOBIN = "$HOME/go/bin";
  };
}
