{pkgs, ...}: {
  fonts = {
    fontconfig.enable = true;
    enableDefaultPackages = true;
    fontDir = {
      enable = true;
      decompressFonts = true;
    };
    packages = with pkgs; [
      nerd-fonts.terminess-ttf
      nerd-fonts.symbols-only
      nerd-fonts.cousine
      nerd-fonts.iosevka
      nerd-fonts.jetbrains-mono
      nerd-fonts.im-writing
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      liberation_ttf
      fira-code
      _0xproto
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
    ];
  };
}
