{ pkgs
, ...
}: 
{
  fonts = {
    fontconfig.enable = true;
    enableDefaultPackages = true;
    fontDir = {
      enable = true;
      decompressFonts = true;
    };
    packages = (with pkgs; [
      terminus-nerdfont
      noto-fonts
      nerdfonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      liberation_ttf
      fira-code
      _0xproto
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
    ]);
  };
}