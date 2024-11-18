{ config
, pkgs
, ...
}:
{
  xdg.desktopEntries = {
    code8 = {
      name = "code8";
      genericName = "code8 IDE";
      exec = "nix-shell ${config.home.homeDirectory}/.scripts/dotnet8.nix --run code";
      terminal = false;
      categories = [ "Development" "IDE" ];
    };
  };
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = true;
    extensions = with pkgs.vscode-extensions; [
      github.copilot
      mads-hartmann.bash-ide-vscode
      bbenoist.nix
      jnoortheen.nix-ide
      skyapps.fish-vscode
      dotjoshjohnson.xml
      davidanson.vscode-markdownlint
      ms-vscode.makefile-tools
      rust-lang.rust-analyzer
    ];
    userSettings = {
      "window.titleBarStyle" = "custom";
      "telemetry.telemetryLevel" = "off";
      "window.autoDetectColorScheme" = false;
      "editor.fontFamily" = "JetBrainsMono Nerd Font";
      "terminal.integrated.fontFamily" = "JetBrainsMono Nerd Font";
      "explorer.confirmDelete" = false;
      "editor.tokenColorCustomizations" = {
        "comments" = "${config.palette.base02.hexT}";
      };
      "workbench.colorCustomizations" = with config.palette; {
        "activityBar.background" = "${base07.hexT}"; /* left bar */
        "activityBar.foreground" = "${base00.hexT}"; /* left bar */
        "activityBar.inactiveForeground" = "${base03.hexT}"; /* left bar */
        "activityBarBadge.background" = "${base02.hexT}";
        "activityBarBadge.foreground" = "${base06.hexT}";
        "badge.background" = "${base05.hexT}"; /* source control badge */
        "badge.foreground" = "${base00.hexT}"; /* source control badge */
        "button.background" = "${base04.hexT}"; /* button example popus git */
        "button.foreground" = "${base00.hexT}"; /* button example popus git */
        "button.hoverBackground" = "${base05.hexT}"; /* button example popus git */
        "button.secondaryBackground" = "${base06.hexT}"; /* button example popus git */
        "button.secondaryForeground" = "${base00.hexT}"; /* button example popus git */
        "button.secondaryHoverBackground" = "${base05.hexT}"; /* button example popus git */

    "breadcrumb.activeSelectionForeground" = "${base00.hexT}";
    "breadcrumb.background" = "${base06.hexT}";
    "breadcrumb.focusForeground" = "${base00.hexT}";
    "breadcrumb.foreground" = "${base00.hexT}cd";
    "checkbox.background" = "${base05.hexT}";
    "checkbox.border" = "${base07.hexT}00";
    "checkbox.foreground" = "${base00.hexT}";
    "debugExceptionWidget.background" = "${base05.hexT}";
    "debugExceptionWidget.border" = "${base03.hexT}";
    "debugToolBar.background" = "${base05.hexT}";
    "debugToolBar.border" = "${base03.hexT}";
    "diffEditor.border" = "${base03.hexT}";
    "diffEditor.insertedTextBackground" = "${base10.hexT}18";
    "diffEditor.removedTextBackground" = "${base09.hexT}1c";
    "disabledForeground" = "${base01.hexT}";

        "dropdown.background" = "${base04.hexT}"; /* dropdown placeholder bottom output */
        "dropdown.border" = "${base03.hexT}"; /* dropdown placeholder bottom output */
        "dropdown.foreground" = "${base00.hexT}"; /* dropdown options in settings */
        "dropdown.listBackground" = "${base04.hexT}"; /* dropdown options in settings */
        "editor.background" = "${base07.hexT}"; /* editor area */
        "editor.foreground" = "${base00.hexT}"; /* editor area */

    "editor.findMatchBackground" = "${base03.hexT}";
    "editor.findMatchBorder" = "${base19.hexT}6a";

        "editor.findMatchHighlightBackground" = "${base04.hexT}c1"; /* editor area find match */

    "editor.findMatchHighlightBorder" = "${base01.hexT}00";
    "editor.findRangeHighlightBackground" = "${base03.hexT}48";
    "editor.findRangeHighlightBorder" = "${base01.hexT}00";
    "editor.foldBackground" = "${base18.hexT}42";

        "editorHoverWidget.background" = "${base04.hexT}"; /* editor area popup on hover */
        "editorHoverWidget.border" = "${base03.hexT}"; /* editor area popup on hover */
        "editorIndentGuide.activeBackground1" = "${base03.hexT}cf"; /* editor area current scope */
        "editorIndentGuide.background1" = "${base03.hexT}8f"; /* editor area scopes */
        "editor.inactiveSelectionBackground" = "${base04.hexT}b8"; /* editor area selected text */
        "editor.lineHighlightBackground" = "${base04.hexT}af";
        "editorLineNumber.activeForeground" = "${base01.hexT}"; /* editor area numbers */
        "editorLineNumber.foreground" = "${base03.hexT}8f"; /* editor area numbers */

    "editor.lineHighlightBorder" = "${base06.hexT}";

        "editor.rangeHighlightBackground" = "${base04.hexT}c2";

    "editor.rangeHighlightBorder" = "${base01.hexT}00";

        "editor.selectionBackground" = "${base04.hexT}dd"; /* editor area selected text */
        "editor.selectionHighlightBackground" = "${base04.hexT}cf";
        "editorWhitespace.foreground" = "${base00.hexT}5f";

    "editor.selectionHighlightBorder" = "${base01.hexT}30";
    "editor.wordHighlightBackground" = "${base05.hexT}b8";
    "editor.wordHighlightStrongBackground" = "${base03.hexT}bb";

        "editorBracketHighlight.foreground1" = "${base19.hexT}"; /* incode brackets */
        "editorBracketHighlight.foreground2" = "${base15.hexT}"; /* incode brackets */
        "editorBracketHighlight.foreground3" = "${base1B.hexT}"; /* incode brackets */
        "editorBracketHighlight.foreground4" = "${base1F.hexT}"; /* incode brackets */
        "editorBracketHighlight.foreground5" = "${base0F.hexT}"; /* incode brackets */
        "editorBracketHighlight.foreground6" = "${base17.hexT}"; /* incode brackets */

    "editorBracketHighlight.unexpectedBracket.foreground" = "${base0B.hexT}";
    "editorBracketMatch.background" = "${base00.hexT}14";
    "editorBracketMatch.border" = "${base00.hexT}";
    "editorCodeLens.foreground" = "${base00.hexT}";
    "editorCursor.background" = "${base06.hexT}";

        "editorCursor.foreground" = "${base00.hexT}";
    
    "editorError.background" = "${base08.hexT}00";
    "editorError.border" = "${base01.hexT}00";
    "editorError.foreground" = "${base09.hexT}";
    "editorGroup.border" = "${base03.hexT}";
    "editorGroup.emptyBackground" = "${base06.hexT}";
    "editorGroupHeader.tabsBackground" = "${base06.hexT}";
    "editorGutter.addedBackground" = "${base10.hexT}";
    "editorGutter.background" = "${base06.hexT}";
    "editorGutter.commentRangeForeground" = "${base00.hexT}";
    "editorGutter.deletedBackground" = "${base09.hexT}";
    "editorGutter.foldingControlForeground" = "${base00.hexT}";
    "editorGutter.modifiedBackground" = "${base01.hexT}";
    "editorHoverWidget.foreground" = "${base00.hexT}";
    "editorInfo.background" = "${base17.hexT}00";
    "editorInfo.border" = "${base17.hexT}00";
    "editorInfo.foreground" = "${base18.hexT}";
    "editorLink.activeForeground" = "${base18.hexT}";
    "editorMarkerNavigation.background" = "${base05.hexT}";
    "editorMarkerNavigationError.background" = "${base09.hexT}";
    "editorMarkerNavigationInfo.background" = "${base18.hexT}";
    "editorMarkerNavigationWarning.background" = "${base10.hexT}";
    "editorOverviewRuler.background" = "${base04.hexT}";
    "editorOverviewRuler.border" = "${base01.hexT}0F";
    "editorRuler.foreground" = "${base03.hexT}";
    "editorSuggestWidget.background" = "${base05.hexT}";
    "editorSuggestWidget.border" = "${base03.hexT}";
    "editorSuggestWidget.foreground" = "${base00.hexT}";
    "editorSuggestWidget.highlightForeground" = "${base18.hexT}";
    "editorSuggestWidget.selectedBackground" = "${base03.hexT}";
    "editorWarning.background" = "${base10.hexT}00";
    "editorWarning.border" = "${base01.hexT}00";
    "editorWarning.foreground" = "${base10.hexT}";
    "editorWidget.background" = "${base06.hexT}";
    "editorWidget.foreground" = "${base00.hexT}";
    "editorWidget.resizeBorder" = "${base03.hexT}";

        "extensionButton.prominentBackground" = "${base0E.hexT}"; /* extension stared flag */
        "extensionButton.prominentForeground" = "${base00.hexT}"; /* extension stared flag */
        "focusBorder" = "${base03.hexT}"; /* focused input field(settings) */
        "foreground" = "${base00.hexT}"; /* some text color */

    "gitDecoration.addedResourceForeground" = "${base10.hexT}";
    "gitDecoration.conflictingResourceForeground" = "${base1D.hexT}";
    "gitDecoration.deletedResourceForeground" = "${base09.hexT}";
    "gitDecoration.ignoredResourceForeground" = "${base01.hexT}";
    "gitDecoration.modifiedResourceForeground" = "${base0C.hexT}";
    "gitDecoration.stageDeletedResourceForeground" = "${base09.hexT}";
    "gitDecoration.stageModifiedResourceForeground" = "${base0D.hexT}";
    "gitDecoration.submoduleResourceForeground" = "${base18.hexT}";
    "gitDecoration.untrackedResourceForeground" = "${base10.hexT}";
    
        "icon.foreground" = "${base00.hexT}"; /* arrows in explorer */
        "input.background" = "${base07.hexT}"; /* search input field */
        "input.border" = "${base03.hexT}"; /* search input field */
        "input.foreground" = "${base03.hexT}"; /* search input field */
        "input.placeholderForeground" = "${base03.hexT}"; /* search input field */

    "inputOption.activeBackground" = "${base18.hexT}26";
    "inputOption.activeBorder" = "${base18.hexT}00";
    "inputOption.activeForeground" = "${base00.hexT}";
    
        "list.activeSelectionBackground" = "${base05.hexT}"; /* dropdown options in settings */
        "list.activeSelectionForeground" = "${base00.hexT}"; /* dropdown options in settings */

    "list.dropBackground" = "${base06.hexT}";
    
        "list.focusBackground" = "${base05.hexT}"; /* tree area */
        "list.focusForeground" = "${base00.hexT}"; /* tree area */
        "list.highlightForeground" = "${base0D.hexT}"; /* autosuggestions first letter */
        "list.hoverBackground" = "${base05.hexT}"; /* settings elements bg */
        "list.hoverForeground" = "${base01.hexT}"; /* fg notification popup hover */
        "list.inactiveSelectionBackground" = "${base05.hexT}cc"; /* tree area */
        "list.inactiveSelectionForeground" = "${base02.hexT}"; /* tree area */

    "list.warningForeground" = "${base10.hexT}";
    "listFilterWidget.background" = "${base05.hexT}";
    "listFilterWidget.noMatchesOutline" = "${base09.hexT}";
    "listFilterWidget.outline" = "${base07.hexT}00";
    "menu.background" = "${base06.hexT}";
    "menu.border" = "${base07.hexT}85";
    "menu.foreground" = "${base00.hexT}";
    "menu.selectionBackground" = "${base03.hexT}";
    "menu.selectionBorder" = "${base07.hexT}00";
    "menu.selectionForeground" = "${base00.hexT}";
    "menu.separatorBackground" = "${base03.hexT}";
    "menubar.selectionBackground" = "${base05.hexT}";
    "menubar.selectionForeground" = "${base00.hexT}";
    "merge.commonContentBackground" = "${base05.hexT}aa";
    "merge.commonHeaderBackground" = "${base03.hexT}aa";
    "merge.currentContentBackground" = "${base16.hexT}aa";
    "merge.currentHeaderBackground" = "${base15.hexT}aa";
    "merge.incomingContentBackground" = "${base19.hexT}aa";
    "merge.incomingHeaderBackground" = "${base17.hexT}aa";
    "minimap.background" = "${base06.hexT}";
    "minimap.errorHighlight" = "${base09.hexT}";
    "minimap.findMatchHighlight" = "${base03.hexT}aa";
    "minimap.selectionHighlight" = "${base03.hexT}aa";
    "minimap.warningHighlight" = "${base10.hexT}";
    "minimapGutter.addedBackground" = "${base10.hexT}";
    "minimapGutter.deletedBackground" = "${base09.hexT}";
    "minimapGutter.modifiedBackground" = "${base01.hexT}";
    "notificationCenter.border" = "${base03.hexT}";
    "notificationCenterHeader.background" = "${base06.hexT}";
    "notificationCenterHeader.foreground" = "${base00.hexT}";
    "notificationToast.border" = "${base03.hexT}";
    "notifications.background" = "${base05.hexT}";
    "notifications.border" = "${base05.hexT}";
    "notifications.foreground" = "${base00.hexT}";
    "notificationsErrorIcon.foreground" = "${base09.hexT}";
    "notificationsInfoIcon.foreground" = "${base18.hexT}";
    "notificationsWarningIcon.foreground" = "${base10.hexT}";
    "panel.background" = "${base06.hexT}";
    "panel.border" = "${base03.hexT}";
    "panelSection.border" = "${base03.hexT}";
    "panelTitle.activeBorder" = "${base00.hexT}";
    "panelTitle.activeForeground" = "${base00.hexT}";
    "panelTitle.inactiveForeground" = "${base00.hexT}ad";
    "peekView.border" = "${base18.hexT}";
    "peekViewEditor.background" = "${base05.hexT}";
    "peekViewEditor.matchHighlightBackground" = "${base0B.hexT}40";
    "peekViewEditor.matchHighlightBorder" = "${base0B.hexT}";
    "peekViewEditorGutter.background" = "${base05.hexT}";
    "peekViewResult.background" = "${base05.hexT}";
    "peekViewResult.fileForeground" = "${base00.hexT}";
    "peekViewResult.lineForeground" = "${base00.hexT}";
    "peekViewResult.matchHighlightBackground" = "${base0B.hexT}40";
    "peekViewResult.selectionBackground" = "${base03.hexT}";
    "peekViewResult.selectionForeground" = "${base00.hexT}";
    "peekViewTitle.background" = "${base06.hexT}";
    "peekViewTitleDescription.foreground" = "${base00.hexT}b3";
    "peekViewTitleLabel.foreground" = "${base00.hexT}";
    "pickerGroup.border" = "${base18.hexT}";
    "pickerGroup.foreground" = "${base18.hexT}";
    
        "progressBar.background" = "${base14.hexT}"; /* progress bar source control */
        "scrollbar.shadow" = "${base0B.hexT}"; /* scrollbar & separator of first line of block */
        "scrollbarSlider.activeBackground" = "${base0C.hexT}"; /* scrollbar */
        "scrollbarSlider.background" = "${base0B.hexT}"; /* scrollbar */
        "scrollbarSlider.hoverBackground" = "${base0D.hexT}"; /* scrollbar */
        "selection.background" = "${base04.hexT}"; /* settings selected text */
        "settings.headerForeground" = "${base01.hexT}"; /* fg of settings headers */

    "settings.focusedRowBackground" = "${base01.hexT}07";
    
        "sideBar.background" = "${base04.hexT}"; /* tree area */
        "sideBar.border" = "${base05.hexT}"; /* tree area */
        "sideBar.foreground" = "${base00.hexT}"; /* tree area */
        "sideBarSectionHeader.background" = "${base07.hexT}"; /* tree area */
        "sideBarSectionHeader.border" = "${base03.hexT}"; /* tree area */
        "sideBarSectionHeader.foreground" = "${base00.hexT}"; /* tree area */
        "sideBarTitle.foreground" = "${base00.hexT}"; /* tree area */

    "sideBar.dropBackground" = "${base04.hexT}";
    "statusBar.background" = "${base05.hexT}";
    "statusBar.debuggingBackground" = "${base09.hexT}";
    "statusBar.debuggingForeground" = "${base05.hexT}";
    "statusBar.foreground" = "${base00.hexT}";
    "statusBar.noFolderBackground" = "${base1D.hexT}";
    "statusBar.noFolderForeground" = "${base05.hexT}";
    "statusBarItem.activeBackground" = "${base01.hexT}25";
    "statusBarItem.hoverBackground" = "${base01.hexT}1f";
    "statusBarItem.remoteBackground" = "${base10.hexT}";
    "statusBarItem.remoteForeground" = "${base05.hexT}";
    "tab.activeBackground" = "${base06.hexT}";
    "tab.activeBorder" = "${base07.hexT}00";
    "tab.activeBorderTop" = "${base07.hexT}00";
    "tab.activeForeground" = "${base00.hexT}";
    "tab.border" = "${base04.hexT}";
    "tab.inactiveBackground" = "${base04.hexT}";
    "tab.inactiveForeground" = "${base01.hexT}";
    "terminal.ansiBlack" = "${base01.hexT}";
    "terminal.ansiBlue" = "${base18.hexT}";
    "terminal.ansiBrightBlack" = "${base00.hexT}";
    "terminal.ansiBrightBlue" = "${base18.hexT}";
    "terminal.ansiBrightCyan" = "${base01.hexT}";
    "terminal.ansiBrightGreen" = "${base10.hexT}";
    "terminal.ansiBrightMagenta" = "${base0B.hexT}";
    "terminal.ansiBrightRed" = "${base09.hexT}";
    "terminal.ansiBrightWhite" = "${base00.hexT}";
    "terminal.ansiBrightYellow" = "${base10.hexT}";
    "terminal.ansiCyan" = "${base01.hexT}";
    "terminal.ansiGreen" = "${base10.hexT}";
    "terminal.ansiMagenta" = "${base0B.hexT}";
    "terminal.ansiRed" = "${base09.hexT}";
    "terminal.ansiWhite" = "${base00.hexT}";
    "terminal.ansiYellow" = "${base10.hexT}";
    "terminal.border" = "${base03.hexT}";
    "terminal.foreground" = "${base00.hexT}";
    "terminal.selectionBackground" = "${base03.hexT}34";
    "terminalCursor.background" = "${base06.hexT}";
    "terminalCursor.foreground" = "${base00.hexT}";
    "textLink.foreground" = "${base18.hexT}";
    "titleBar.activeBackground" = "${base06.hexT}";
    "titleBar.activeForeground" = "${base00.hexT}";
    "titleBar.border" = "${base07.hexT}00";
    "titleBar.inactiveBackground" = "${base06.hexT}91";
    "titleBar.inactiveForeground" = "${base00.hexT}80";
        "toolbar.activeBackground" = "${base05.hexT}"; /* toolbar mini buttons */
        "toolbar.hoverBackground" = "${base04.hexT}"; /* toolbar mini buttons */
        "tree.indentGuidesStroke" = "${base05.hexT}"; /* tree area */
        "widget.shadow" = "${base03.hexT}80"; /* shadow of settings dropdown */
    "walkThrough.embeddedEditorBackground" = "${base07.hexT}50";
      };
    };
  };
}
