{ stable, unstable, ... }:

{
  environment.systemPackages = with stable; [
    vim
    wget
    git
    gcc15
    ntfs3g
  ];

  programs.firefox.enable = true;
}