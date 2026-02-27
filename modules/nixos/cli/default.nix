{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    tree
    pciutils
    usbutils
    lshw
    dmidecode
    smartmontools
    hwinfo
    inxi
    libva-utils
    eza
    zoxide
    fzf
    glances
  ];
}
