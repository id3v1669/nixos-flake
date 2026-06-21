{
  config,
  pkgs,
  ...
}: {
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    bash-language-server
    nerd-fonts.terminess-ttf
    nerd-fonts.symbols-only
    nerd-fonts.cousine
    nerd-fonts.iosevka
    nerd-fonts.jetbrains-mono
    nerd-fonts.im-writing
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    nerd-fonts.profont
    nerd-fonts.departure-mono
    nerd-fonts.daddy-time-mono
    nerd-fonts.proggy-clean-tt
    liberation_ttf
    fira-code
    #_0xproto
    nerd-fonts._0xproto
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    proggyfonts
  ];
  programs.vscodium = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = true;

    profiles.default = {
      extensions = with pkgs.vscode-extensions;
        [
          mads-hartmann.bash-ide-vscode
          skyapps.fish-vscode
          dotjoshjohnson.xml
          davidanson.vscode-markdownlint
          ms-vscode.makefile-tools
          rust-lang.rust-analyzer
          fill-labs.dependi
        ]
        ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "nix-ide";
            publisher = "jnoortheen";
            version = "0.5.9";
            hash = "sha256-hPOcp6Yksgfu1+In21/gJ3MthV8JUV5WaRpYHvo5GGk=";
          }
          {
            name = "rust-syntax";
            publisher = "dustypomerleau";
            version = "0.6.1";
            hash = "sha256-o9iXPhwkimxoJc1dLdaJ8nByLIaJSpGX/nKELC26jGU=";
          }
        ];
    };
  };
}
