{ config, lib, pkgs, ... }: { 
  nixpkgs.config.vscode.commandLineArgs = "--enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland";
  programs.vscode = {
    enable = true;
    package = pkgs.vscode-fhs;
    # enableUpdateCheck = true;
    # enableExtensionUpdateCheck = true;
    # userSettings = {
    #   "window.titleBarStyle" = "custom";
    #   "window.autoDetectColorScheme" = false;
    #   "workbench.colorCustomizations" = {
    #     "editorLineNumber.background" = "#${config.colorScheme.colors.base00}";
    #     "editorLineNumber.foreground" = "#${config.colorScheme.colors.base06}";
    #     "titleBar.activeBackground" = "#${config.colorScheme.colors.base01}";
    #     "titleBar.activeForeground" = "#${config.colorScheme.colors.base06}";
    #     "titleBar.inactiveBackground" = "#${config.colorScheme.colors.base01}";
    #     "titleBar.inactiveForeground" = "#${config.colorScheme.colors.base06}";
    #     "editor.background" = "#${config.colorScheme.colors.base01}";
    #     "editor.foreground" = "#${config.colorScheme.colors.base05}";
    #     "editor.lineHighlightBackground" = "#${config.colorScheme.colors.base01}";
    #     "editor.selectionBackground" = "#${config.colorScheme.colors.base00}";
    #     "editor.selectionHighlightBackground" = "#${config.colorScheme.colors.base00}";
    #     "editor.wordHighlightBackground" = "#${config.colorScheme.colors.base01}";
    #     "editor.wordHighlightStrongBackground" = "#${config.colorScheme.colors.base01}";
    #     "editor.findMatchBackground" = "#${config.colorScheme.colors.base01}";
    #     "editor.findMatchHighlightBackground" = "#${config.colorScheme.colors.base00}";
    #     "editor.findRangeHighlightBackground" = "#${config.colorScheme.colors.base00}";
    #     "editor.hoverHighlightBackground" = "#${config.colorScheme.colors.base00}";
    #     "editor.inactiveSelectionBackground" = "#${config.colorScheme.colors.base00}";
    #     "editor.lineHighlightBorder" = "#${config.colorScheme.colors.base00}";
    #     "editor.rangeHighlightBackground" = "#${config.colorScheme.colors.base00}";
    #     "editorCursor.foreground" = "#${config.colorScheme.colors.base05}";
    #     "editorWhitespace.foreground" = "#${config.colorScheme.colors.base01}";
    #     "editorIndentGuide.background" = "#${config.colorScheme.colors.base01}";
    #     "editorIndentGuide.activeBackground" = "#${config.colorScheme.colors.base01}";
    #     "editorRuler.foreground" = "#${config.colorScheme.colors.base01}";
    #     "editorCodeLens.foreground" = "#${config.colorScheme.colors.base01}";
    #     "editorBracketMatch.background" = "#${config.colorScheme.colors.base01}";
    #     "editorBracketMatch.border" = "#${config.colorScheme.colors.base01}";
    #     "editorOverviewRuler.border" = "#${config.colorScheme.colors.base01}";
    #     "editorOverviewRuler.findMatchForeground" = "#${config.colorScheme.colors.base01}";
    #     "editorOverviewRuler.rangeHighlightForeground" = "#${config.colorScheme.colors.base01}";
    #     "editorOverviewRuler.selectionHighlightForeground" = "#${config.colorScheme.colors.base01}";
    #     "editorOverviewRuler.wordHighlightForeground" = "#${config.colorScheme.colors.base01}";
    #     "editorOverviewRuler.wordHighlightStrongForeground" = "#${config.colorScheme.colors.base01}";
    #     "editorOverviewRuler.modifiedForeground" = "#${config.colorScheme.colors.base01}";
    #     "editorOverviewRuler.addedForeground" = "#${config.colorScheme.colors.base01}";
    #     "editorOverviewRuler.deletedForeground" = "#${config.colorScheme.colors.base01}";
    #     "editorOverviewRuler.errorForeground" = "#${config.colorScheme.colors.base01}";
    #     "editorOverviewRuler.warningForeground" = "#${config.colorScheme.colors.base01}";
    #     "editorOverviewRuler.infoForeground" = "#${config.colorScheme.colors.base01}";
    #     "editorError.foreground" = "#${config.colorScheme.colors.base01}";
    #     "editorError.border" = "#${config.colorScheme.colors.base01}";
    #     "editorWarning.foreground" = "#${config.colorScheme.colors.base01}";
    #     "editorWarning.border" = "#${config.colorScheme.colors.base01}";
    #     "editorGutter.background" = "#${config.colorScheme.colors.base01}";
    #     "editorGutter.modifiedBackground" = "#${config.colorScheme.colors.base01}";
    #     "editorGutter.addedBackground" = "#${config.colorScheme.colors.base01}";
    #     "editorGutter.deletedBackground" = "#${config.colorScheme.colors.base01}";
    #     "editorSuggestWidget.background" = "#${config.colorScheme.colors.base01}";
    #     "editorSuggestWidget.border" = "#${config.colorScheme.colors.base01}";
    #     "editorSuggestWidget.foreground" = "#${config.colorScheme.colors.base01}";
    #     "editorSuggestWidget.highlightForeground" = "#${config.colorScheme.colors.base01}";
    #     "editorSuggestWidget.selectedBackground" = "#${config.colorScheme.colors.base00}";
    #     "editorWidget.background" = "#${config.colorScheme.colors.base01}";
    #     "editorWidget.border" = "#${config.colorScheme.colors.base01}";
    #     "editorWidget.foreground" = "#${config.colorScheme.colors.base01}";
    #     "editorWidget.resizeBorder" = "#${config.colorScheme.colors.base01}";
    #     "editorWidget.selectionBackground" = "#${config.colorScheme.colors.base00}";
    #     "editorWidget.wordHighlightBackground" = "#${config.colorScheme.colors.base01}";
    #     "editorWidget.wordHighlightStrongBackground" = "#${config.colorScheme.colors.base01}";
    #     "editorMarkerNavigation.background" = "#${config.colorScheme.colors.base01}";
    #     "editorMarkerNavigationError.background" = "#${config.colorScheme.colors.base01}";
    #     "editorMarkerNavigationWarning.background" = "#${config.colorScheme.colors.base01}";
    #     "editorMarkerNavigationInfo.background" = "#${config.colorScheme.colors.base01}";
    #     "editorMarkerNavigationHint.background" = "#${config.colorScheme.colors.base01}";
    #     "editorLightBulb.foreground" = "#${config.colorScheme.colors.base01}";
    #     "editorLightBulbAutoFix.foreground" = "#${config.colorScheme.colors.base01}";
    #     "editorLink.activeForeground" = "#${config.colorScheme.colors.base01}";
    #     "editorGroupHeader.tabsBackground" = "#${config.colorScheme.colors.base00}";
    #     "editorGroupHeader.tabsBorder" = "#${config.colorScheme.colors.base01}";
    #     "editorGroup.border" = "#${config.colorScheme.colors.base01}";
    #     "editorGroup.dropBackground" = "#${config.colorScheme.colors.base01}";
    #     "editorGroup.emptyBackground" = "#${config.colorScheme.colors.base01}";
    #     "editorGroup.focusedEmptyBorder" = "#${config.colorScheme.colors.base01}";
    #     "editorGroupHeader.noTabsBackground" = "#${config.colorScheme.colors.base01}";
    #     "editorGroupHeader.noTabsBorder" = "#${config.colorScheme.colors.base01}";
    #     "editorPane.background" = "#${config.colorScheme.colors.base01}";
    #     "editorPane.border" = "#${config.colorScheme.colors.base01}";
    #   };
    #   "editor.tokenColorCustomizations" = {
    #     #"comments" = "#${config.colorScheme.colors.base0B}";
    #   };
    # };
    extensions = with pkgs.vscode-extensions; [
      github.copilot
      mads-hartmann.bash-ide-vscode
      jnoortheen.nix-ide
      skyapps.fish-vscode
      ms-dotnettools.csharp
      ms-python.python
    ];
  };
  #home.file.".config/code-flags.conf".text = ''
  #--enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland
  #'';
}
# primary = {
        #   background = "#${config.colorScheme.colors.base01}";
        #   foreground = "#${config.colorScheme.colors.base06}";
        # };
        # cursor = {
        #   text = "#${config.colorScheme.colors.base05}";
        #   cursor = "#${config.colorScheme.colors.base06}";
        # };
        # normal = {
        #   black = "#${config.colorScheme.colors.base00}";
        #   red = "#${config.colorScheme.colors.base08}";
        #   green = "#${config.colorScheme.colors.base0B}";
        #   yellow = "#${config.colorScheme.colors.base0F}";
        #   blue = "#${config.colorScheme.colors.base0D}";
        #   magenta = "#${config.colorScheme.colors.base0E}";
        #   cyan = "#${config.colorScheme.colors.base0C}";
        #   white = "#${config.colorScheme.colors.base06}";
        # };
        # bright = {
        #   black = "#${config.colorScheme.colors.base01}";
        #   red = "#${config.colorScheme.colors.base09}";
        #   green = "#${config.colorScheme.colors.base0B}";
        #   yellow = "#${config.colorScheme.colors.base0F}";
        #   blue = "#${config.colorScheme.colors.base0D}";
        #   magenta = "#${config.colorScheme.colors.base0E}";
        #   cyan = "#${config.colorScheme.colors.base0C}";
        #   white = "#${config.colorScheme.colors.base07}";
        # };
        #apply other colors as to vscode as on top