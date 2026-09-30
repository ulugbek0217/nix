{ pkgs, ... }: {
  # Font configuration
  fonts = {
    packages = with pkgs; [
      wqy_zenhei
      ubuntu-classic
      corefonts
      carlito
      vista-fonts
      vista-fonts-chs
      font-bh-ttf
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      nerd-fonts.jetbrains-mono
      mplus-outline-fonts.osdnRelease
      fira-code
      fira-code-symbols
      hermit
      source-code-pro
      terminus_font
      font-awesome
      font-awesome_4
      hack-font
      powerline-fonts
      roboto
      roboto-slab
      montserrat
      inter
      lato
      eb-garamond
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
      oswald
      rubik
      freefont_ttf
      mononoki
      iosevka
      noto-fonts-color-emoji
      liberation_ttf
      jetbrains-mono
      nerd-fonts.fira-code
      nerd-fonts.symbols-only
    ];

    fontconfig = {
      defaultFonts = {
        serif = [ "Noto Serif" ];
        sansSerif = [ "Noto Sans" ];
        monospace = [ "JetBrains Mono" ];
      };
    };
  };
}
