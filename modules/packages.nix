{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    go
    python313
    gcc15
    ntfs3g
  ];
}