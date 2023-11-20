{ config, lib, pkgs, envir, ... }:
let
    inherit (import ./../../../lib/h2rgb.nix { inherit lib; }) hexToRgb;
in
{
  programs.obs-studio = {
      enable = true;
      package = pkgs.obs-studio;
      plugins = [
        pkgs.obs-studio-plugins.wlrobs
      ];
    };
  home.file.".config/obs-studio/themes/dynamic-theme.qss".text = ''
OBSThemeMeta {
    dark: 'true';
    author: 'id3v1669';
}

OBSTheme {
    window: ${hexToRgb "${config.colorScheme.colors.base00}"};
    windowText: ${hexToRgb "${config.colorScheme.colors.base07}"};
    base: ${hexToRgb "${config.colorScheme.colors.base01}"};
    alternateBase: ${hexToRgb "${config.colorScheme.colors.base01}"};
    text: ${hexToRgb "${config.colorScheme.colors.base05}"};
    button: ${hexToRgb "${config.colorScheme.colors.base02}"};
    buttonText: ${hexToRgb "${config.colorScheme.colors.base07}"};
    brightText: ${hexToRgb "${config.colorScheme.colors.base07}"};

    light: ${hexToRgb "${config.colorScheme.colors.base02}"};
    mid: ${hexToRgb "${config.colorScheme.colors.base00}"};
    dark: ${hexToRgb "${config.colorScheme.colors.base01}"};
    shadow: ${hexToRgb "${config.colorScheme.colors.base01}"};

    highlight: ${hexToRgb "${config.colorScheme.colors.base0D}"};
    highlightedText: ${hexToRgb "${config.colorScheme.colors.base07}"};

    link: ${hexToRgb "${config.colorScheme.colors.base06}"};
    linkVisited: ${hexToRgb "${config.colorScheme.colors.base0F}"};
}

OBSTheme::disabled {
    text: ${hexToRgb "${config.colorScheme.colors.base04}"};
    buttonText: ${hexToRgb "${config.colorScheme.colors.base04}"};
    brightText: ${hexToRgb "${config.colorScheme.colors.base01}"};
}

OBSTheme::inactive {
    highlight: ${hexToRgb "${config.colorScheme.colors.base01}"};
    highlightedText: ${hexToRgb "${config.colorScheme.colors.base05}"};
}

QWidget {
    background-color: palette(window);
    alternate-background-color: palette(base);
    color: palette(text);
    selection-background-color: ${hexToRgb "${config.colorScheme.colors.base03}"};
    selection-color: palette(text);
}

* [frameShape="1"], * [frameShape="2"], * [frameShape="3"], * [frameShape="4"], * [frameShape="5"], * [frameShape="6"] {
    border: 1px solid palette(base);
}

QWidget::disabled {
    color: 2px solid palette(bright-text);
}

QAbstractItemView, QStackedWidget#stackedMixerArea QWidget {
    background-color: palette(base);
}

QToolTip {
    background-color: palette(base);
    color: palette(text);
    border: none;
}

QMenuBar::item {
    background-color: palette(window);
}

QListView::item:selected:!active,
SourceTree::item:selected:!active {
    color: palette(text);
    background-color: ${hexToRgb "${config.colorScheme.colors.base03}"};
}

QListView QLineEdit,
SourceTree QLineEdit {
    padding-top: 0px;
    padding-bottom: 0px;
    padding-right: 0;
    padding-left: 2px;
    border: none;
    border-radius: none;
}

QMainWindow::separator {
    background: transparent;
    width: 4px;
    height: 4px;
}

QDockWidget {
	titlebar-close-icon: url('./dynamic/Dark/close.svg');
	titlebar-normal-icon: url('./dynamic/Dark/popout.svg');
}

QDockWidget::title {
    text-align: center;
    background-color: palette(base);
}

QDockWidget::close-button, QDockWidget::float-button {
    border: 1px solid transparent;
    background: transparent;
    padding: 0px;
}

QDockWidget::close-button:hover, QDockWidget::float-button:hover {
    background: transparent;
}

QDockWidget::close-button:pressed, QDockWidget::float-button:pressed {
    padding: 1px -1px -1px 1px;
}

QGroupBox {
    border: 1px solid palette(base);
    border-radius: 5px;
    padding-top: 24px;
    font-weight: bold;
}

QGroupBox::title {
    subcontrol-origin: margin;
    left: 4px;
    top: 4px;
}

::corner {
    background-color: palette(window);
    border: none;
}

QScrollBar:vertical {
    background-color: palette(window);
    width: 14px;
    margin: 0px;
}

QScrollBar::handle:vertical {
    background-color: palette(light);
    min-height: 20px;
    margin: 2px;
    border-radius: 5px;
    border-width: 1px;
    border: 1px solid palette(light);
}

QScrollBar::add-line:vertical, QScrollBar::sub-line:vertical {
    border: none;
    background: none;
    height: 0px;
}

QScrollBar::up-arrow:vertical, QScrollBar::down-arrow:vertical, QScrollBar::add-page:vertical, QScrollBar::sub-page:vertical {
    border: none;
    background: none;
    color: none;
}

QScrollBar:horizontal {
    background-color: palette(window);
    height: 14px;
    margin: 0px;
}

QScrollBar::handle:horizontal {
    background-color: palette(light);
    min-width: 20px;
    margin: 2px;
    border-radius: 5px;
    border-width: 1px;
    border: 1px solid palette(light);
}

QScrollBar::add-line:horizontal, QScrollBar::sub-line:horizontal {
    border: none;
    background: none;
    width: 0px;
}

QScrollBar::left-arrow:horizontal, QScrollBar::right-arrow:horizontal, QScrollBar::add-page:horizontal, QScrollBar::sub-page:horizontal {
    border: none;
    background: none;
    color: none;
}

#contextContainer QPushButton {
    padding: 4px 10px;
}

#contextContainer QPushButton[themeID2=contextBarButton] {
    padding: 4px 6px;
}

#contextContainer QPushButton#sourcePropertiesButton {
    qproperty-icon: url(./dynamic/Dark/settings/general.svg);
}

#contextContainer QPushButton#sourceFiltersButton {
    qproperty-icon: url(./dynamic/Dark/filter.svg);
}

#contextContainer QPushButton#sourceInteractButton {
    qproperty-icon: url(./dynamic/Dark/interact.svg);
}

QToolBar {
    background-color: palette(window);
    border: none;
}

QPushButton[toolButton="true"],
QToolButton {
	background: transparent;
	border: none;
    padding: 1px;
    margin: 1px;
}

QPushButton[toolButton="true"]:last-child,
QToolButton:last-child {
    margin-right: 0px;
}

QPushButton[toolButton="true"]:hover,
QToolButton:hover {
    background-color: ${hexToRgb "${config.colorScheme.colors.base03}"}; 
    border-radius: none;
}

QPushButton[toolButton="true"]:pressed,
QToolButton:pressed {
    background-color: palette(shadow);
    border-radius: none;
}

* [themeID="addIconSmall"] {
    qproperty-icon: url(./dynamic/Dark/plus.svg);
}

* [themeID="removeIconSmall"] {
    qproperty-icon: url(./dynamic/Dark/minus.svg);
}

* [themeID="clearIconSmall"] {
    qproperty-icon: url(./dynamic/Dark/entry-clear.svg);
}

* [themeID="propertiesIconSmall"] {
    qproperty-icon: url(./dynamic/Dark/settings/general.svg);
}

* [themeID="configIconSmall"] {
    qproperty-icon: url(./dynamic/Dark/settings/general.svg);
}

* [themeID="refreshIconSmall"] {
    qproperty-icon: url(./dynamic/Dark/refresh.svg);
}

* [themeID="upArrowIconSmall"] {
    qproperty-icon: url(./dynamic/Dark/up.svg);
}

* [themeID="downArrowIconSmall"] {
    qproperty-icon: url(./dynamic/Dark/down.svg);
}

* [themeID="pauseIconSmall"] {
    qproperty-icon: url(./dynamic/Dark/media-pause.svg);
}

* [themeID="menuIconSmall"] {
    qproperty-icon: url(./dynamic/Dark/dots-vert.svg);
}

* [themeID="cogsIcon"] {
    qproperty-icon: url(./dynamic/Dark/cogs.svg);
}

QTabWidget::pane {
    border-top: 1px solid palette(base);
}

QTabWidget::tab-bar {
    alignment: left;
}

QTabBar::tab {
    background-color: palette(light);
    border: none;
    padding: 5px;
    min-width: 50px;
    margin: 1px;
}

QTabBar::tab:top {
    border-bottom: 1px transparent;
    border-top-left-radius: 3px;
    border-top-right-radius: 3px;

}

QTabBar::tab:bottom {
    padding-top: 1px;
    margin-bottom: 4px;
    border-bottom-left-radius: 3px;
    border-bottom-right-radius: 3px;
    height: 14px;
}

QTabBar::tab:selected {
    background-color: palette(base);
}

QTabBar::tab:hover {
    background-color: ${hexToRgb "${config.colorScheme.colors.base03}"};
}

QTabBar::tab:pressed {
    background-color: palette(base);
}

QDateTimeEdit,
QComboBox {
    background-color: palette(light);
    border-style: solid;
    border: 1px;
    border-radius: 3px;
    border-color: ${hexToRgb "${config.colorScheme.colors.base01}"};
    padding: 2px;
    padding-left: 10px;
}

QDateTimeEdit:hover,
QComboBox:hover {
    background-color: palette(button);
}

QDateTimeEdit::drop-down,
QComboBox::drop-down {
    border:none;
    border-left: 1px solid rgba(24, 24, 37,155);
    width: 20px;
}

QDateTimeEdit::down-arrow,
QComboBox::down-arrow {
    qproperty-alignment: AlignTop;
    image: url(./dynamic/Dark/updown.svg);
    width: 100%;
}

QDateTimeEdit:on,
QComboBox:on {
    background-color: palette(base);
}

QDateTimeEdit:editable,
QComboBox:editable {
    border-top-left-radius: 0px;
    border-bottom-left-radius: 0px;
}

QDateTimeEdit::drop-down:editable,
QComboBox::drop-down:editable {
    border-top-right-radius: 3px;
    border-bottom-right-radius: 3px;
}

QDateTimeEdit::down-arrow:editable,
QComboBox::down-arrow:editable {
    qproperty-alignment: AlignTop;
    image: url(./dynamic/Dark/down.svg);
    width: 8%;
}

QLineEdit, QTextEdit, QPlainTextEdit {
    background-color: palette(base);
    border: none;
    border-radius: 3px;
    padding: 2px 2px 3px 7px;
}

QSpinBox, QDoubleSpinBox {
    background-color: palette(base);
    border: none;
    border-radius: 3px;
    margin: 0px 3px 0px 0px;
    padding: 2px 2px 3px 7px;
}

QSpinBox::up-button, QDoubleSpinBox::up-button {
    subcontrol-origin: margin;
    subcontrol-position: top right;

    background-color: palette(light);
    border: 1px solid palette(base);
    border-radius: 3px;
    border-width: 0;
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0;
    border-bottom-width: 0;
}

QSpinBox::down-button, QDoubleSpinBox::down-button {
    subcontrol-origin: margin;
    subcontrol-position: bottom right;
    background-color: palette(light);
    border: 1px solid palette(base);
    border-radius: 3px;
    border-width: 0;
    border-top-left-radius: 0;
    border-top-right-radius: 0;
    border-top-width: 0;
}

QSpinBox::up-button:hover, QSpinBox::down-button:hover, QDoubleSpinBox::up-button:hover, QDoubleSpinBox::down-button:hover {
    background-color: ${hexToRgb "${config.colorScheme.colors.base03}"};
}

QSpinBox::up-button:pressed, QSpinBox::down-button:pressed, QDoubleSpinBox::up-button:pressed, QDoubleSpinBox::down-button:pressed {
    background-color: palette(window);
}

QSpinBox::up-button:disabled, QSpinBox::up-button:off, QSpinBox::down-button:disabled, QSpinBox::down-button:off {
    background-color: palette(window);
}

QDoubleSpinBox::up-button:disabled, QDoubleSpinBox::up-button:off, QDoubleSpinBox::down-button:disabled, QDoubleSpinBox::down-button:off {
    background-color: palette(window);
}

QSpinBox::up-arrow, QDoubleSpinBox::up-arrow {
    image: url(./dynamic/Dark/up.svg);
    width: 100%;
}

QSpinBox::down-arrow, QDoubleSpinBox::down-arrow {
    image: url(./dynamic/Dark/down.svg);
    width: 100%;
}

QPushButton {
    color: palette(text);
    background-color: palette(light);
    border: none;
    border-radius: 3px;
    padding: 4px;
    padding-left: 20px;
    padding-right: 20px;
}

QPushButton::flat {
    background-color: palette(window);
}

QPushButton:checked {
    background-color: palette(base);
}

QPushButton:hover {
    background-color: ${hexToRgb "${config.colorScheme.colors.base03}"};
}

QPushButton:pressed {
    background-color: palette(base);
}

QPushButton:disabled {
    background-color: ${hexToRgb "${config.colorScheme.colors.base01}"};
    
}

QPushButton::menu-indicator {
    image: url(./dynamic/Dark/down.svg);
    subcontrol-position: right;
    subcontrol-origin: padding;
    width: 25px;
}

QSlider::groove:horizontal {
    background-color: palette(light);
    height: 4px;
    border: none;
    border-radius: 2px;
}

QSlider::handle:horizontal {
    background-color: palette(text);
    border: 1px solid palette(window);
    border-radius: 3px;
    height: 10px;
    width: 18px;
    margin: -3px 0;
}

QSlider::handle:horizontal:pressed {
    background-color: palette(text);
}

QSlider::sub-page:horizontal {
    background-color: palette(highlight);
    border-radius: 2px;
}

QSlider::sub-page:horizontal:disabled {
    background-color: palette(window);
    border-radius: 2px;
}

QSlider::groove:vertical {
    background-color: palette(light);
    width: 4px;
    border: none;
    border-radius: 2px;
}

QSlider::handle:vertical {
    background-color: palette(text);
    border: 1px solid palette(window);
    border-radius: 3px;
    width: 10px;
    height: 18px;
    margin: 0 -3px;
}

QSlider::handle:vertical:pressed {
    background-color: palette(text);
}

QSlider::add-page:vertical {
    background-color: palette(highlight);
    border-radius: 2px;
}

QSlider::add-page:vertical:disabled {
    background-color: palette(window);
    border-radius: 2px;
}

QSlider::handle:hover {
    background-color: palette(bright-text);
}

QSlider::handle:disabled {
    background-color: ${hexToRgb "${config.colorScheme.colors.base03}"};
}

VolumeMeter {
    qproperty-backgroundNominalColor: ${hexToRgb "${config.colorScheme.colors.base0B}"};
    qproperty-backgroundWarningColor: ${hexToRgb "${config.colorScheme.colors.base09}"};
    qproperty-backgroundErrorColor: ${hexToRgb "${config.colorScheme.colors.base08}"};
    qproperty-foregroundNominalColor: ${hexToRgb "${config.colorScheme.colors.base01}"};
    qproperty-foregroundWarningColor: ${hexToRgb "${config.colorScheme.colors.base01}"};
    qproperty-foregroundErrorColor: ${hexToRgb "${config.colorScheme.colors.base01}"};
    qproperty-magnitudeColor: ${hexToRgb "${config.colorScheme.colors.base0C}"};
    qproperty-majorTickColor: ${hexToRgb "${config.colorScheme.colors.base05}"};
    qproperty-minorTickColor: ${hexToRgb "${config.colorScheme.colors.base04}"};
    qproperty-meterThickness: 3;
    qproperty-meterFontScaling: 0.7;
}

QStatusBar::item {
    border: none;
}

QTableView {
    gridline-color: palette(light);
}

QHeaderView::section {
    background-color: palette(window);
    color: palette(text);
    border: 1px solid palette(base);
    border-radius: 5px;
}

MuteCheckBox {
    outline: none;
}

MuteCheckBox::indicator:checked {
    image: url(./dynamic/Dark/mute.svg);
}

MuteCheckBox::indicator:unchecked {
    image: url(./dynamic/Dark/settings/audio.svg);
}

OBSHotkeyLabel[hotkeyPairHover=true] {
    color: ${hexToRgb "${config.colorScheme.colors.base0D}"};
}

SourceTreeSubItemCheckBox {
    background: transparent;
    outline: none;
}

SourceTreeSubItemCheckBox::indicator {
    width: 10px;
    height: 10px;
}

SourceTreeSubItemCheckBox::indicator:checked {
    image: url(./dynamic/Dark/expand.svg);
}

SourceTreeSubItemCheckBox::indicator:unchecked {
    image: url(./dynamic/Dark/collapse.svg);
}

QLabel#warningLabel {
    color: ${hexToRgb "${config.colorScheme.colors.base09}"};
    font-weight: bold;
}

QLabel#errorLabel {
    color: ${hexToRgb "${config.colorScheme.colors.base08}"};
    font-weight: bold;
}

* [themeID="warning"] {
    color: ${hexToRgb "${config.colorScheme.colors.base09}"};
    font-weight: bold;
}

* [themeID="error"] {
    color: ${hexToRgb "${config.colorScheme.colors.base08}"};
    font-weight: bold;
}

* [themeID="good"] {
    color: ${hexToRgb "${config.colorScheme.colors.base0B}"};
    font-weight: bold;
}

* [themeID="aboutName"] {
    font-size: 36px;
    font-weight: bold;
}

* [themeID="aboutVersion"] {
    font-size: 16px;
    margin-bottom: 20px;
}

* [themeID="aboutInfo"] {
    margin-bottom: 20px;
}

* [themeID="aboutHLayout"] {
    background-color: palette(base);
}

OBSQTDisplay {
	qproperty-displayBackgroundColor: palette(shadow);
}

* [themeID="previewProgramLabels"] {
    font-size: 18px;
    font-weight: bold;
    color: ${hexToRgb "${config.colorScheme.colors.base07}"};
}

OBSBasicSettings {
    qproperty-generalIcon: url(./dynamic/Dark/settings/general.svg);
    qproperty-streamIcon: url(./dynamic/Dark/settings/stream.svg);
    qproperty-outputIcon: url(./dynamic/Dark/settings/output.svg);
    qproperty-audioIcon: url(./dynamic/Dark/settings/audio.svg);
    qproperty-videoIcon: url(./dynamic/Dark/settings/video.svg);
    qproperty-hotkeysIcon: url(./dynamic/Dark/settings/hotkeys.svg);
    qproperty-accessibilityIcon: url(./dynamic/Dark/settings/accessibility.svg);
    qproperty-advancedIcon: url(./dynamic/Dark/settings/advanced.svg);
}

OBSBasicSettings QListView::item {
    padding-top: 5px;
    padding-bottom: 5px;
}

LockedCheckBox {
    outline: none;
    background: transparent;
}

LockedCheckBox::indicator:checked {
    image: url(./dynamic/Dark/locked.svg);
}

LockedCheckBox::indicator:unchecked {
    image: url(:res/images/unlocked.svg);
}

VisibilityCheckBox {
    outline: none;
    background: transparent;
}

VisibilityCheckBox::indicator:checked {
    image: url(./dynamic/Dark/visible.svg);
}

VisibilityCheckBox::indicator:unchecked {
    image: url(:res/images/invisible.svg);
}

* [themeID="revertIcon"] {
    qproperty-icon: url(./dynamic/Dark/revert.svg);
}

QPushButton#extraPanelDelete {
    background-color: palette(base);
}

QPushButton#extraPanelDelete:hover {
    background-color: ${hexToRgb "${config.colorScheme.colors.base03}"};
}

QPushButton#extraPanelDelete:pressed {
    background-color: palette(base);
}

OBSMissingFiles {
	qproperty-warningIcon: url(./dynamic/Dark/alert.svg);
}

OBSBasic {
    qproperty-imageIcon: url(./dynamic/Dark/sources/image.svg);
    qproperty-colorIcon: url(./dynamic/Dark/sources/brush.svg);
    qproperty-slideshowIcon: url(./dynamic/Dark/sources/slideshow.svg);
    qproperty-audioInputIcon: url(./dynamic/Dark/sources/microphone.svg);
    qproperty-audioOutputIcon: url(./dynamic/Dark/settings/audio.svg);
    qproperty-desktopCapIcon: url(./dynamic/Dark/settings/video.svg);
    qproperty-windowCapIcon: url(./dynamic/Dark/sources/window.svg);
    qproperty-gameCapIcon: url(./dynamic/Dark/sources/gamepad.svg);
    qproperty-cameraIcon: url(./dynamic/Dark/sources/camera.svg);
    qproperty-textIcon: url(./dynamic/Dark/sources/text.svg);
    qproperty-mediaIcon: url(./dynamic/Dark/sources/media.svg);
    qproperty-browserIcon: url(./dynamic/Dark/sources/globe.svg);
    qproperty-groupIcon: url(./dynamic/Dark/sources/group.svg);
    qproperty-sceneIcon: url(./dynamic/Dark/sources/scene.svg);
    qproperty-defaultIcon: url(./dynamic/Dark/sources/default.svg);
    qproperty-audioProcessOutputIcon: url(./dynamic/Dark/sources/windowaudio.svg);
}

SceneTree {
    qproperty-gridItemWidth: 150;
	qproperty-gridItemHeight: 27;
}

*[gridMode="true"] SceneTree::item {
    color: palette(text);
    background-color: palette(light);
    border: none;
    border-radius: 3px;
    padding: 4px;
	padding-left: 10px;
	padding-right: 10px;
	margin: 1px;
}

*[gridMode="true"] SceneTree::item:selected {
    background-color: ${hexToRgb "${config.colorScheme.colors.base03}"};
}

*[gridMode="true"] SceneTree::item:hover {
    background-color: ${hexToRgb "${config.colorScheme.colors.base03}"};
}

*[gridMode="true"] SceneTree::item:pressed {
    background-color: palette(base);
}

*[gridMode="true"] SceneTree::item:checked {
    background-color: ${hexToRgb "${config.colorScheme.colors.base03}"};
}

* [themeID="replayIconSmall"] {
    qproperty-icon: url(./dynamic/Dark/save.svg);
}

QSlider[themeID="tBarSlider"] {
	height: 24px;
}

QSlider::groove:horizontal[themeID="tBarSlider"] {
	border: 1px solid palette(light);
	height: 5px;
	background: palette(base);
}

QSlider::sub-page:horizontal[themeID="tBarSlider"] {
	background: palette(base);;
	border: 1px solid palette(light);
}

QSlider::handle:horizontal[themeID="tBarSlider"] {
	background-color: palette(text);
	width: 12px;
	height: 24px;
	margin: -24px 0px;
}

* [themeID="playIcon"] {
    qproperty-icon: url(./dynamic/Dark/media/media_play.svg);
}

* [themeID="pauseIcon"] {
    qproperty-icon: url(./dynamic/Dark/media/media_pause.svg);
}

* [themeID="restartIcon"] {
    qproperty-icon: url(./dynamic/Dark/media/media_restart.svg);
}

* [themeID="stopIcon"] {
    qproperty-icon: url(./dynamic/Dark/media/media_stop.svg);
}

* [themeID="nextIcon"] {
    qproperty-icon: url(./dynamic/Dark/media/media_next.svg);
}

* [themeID="previousIcon"] {
    qproperty-icon: url(./dynamic/Dark/media/media_previous.svg);
}
OBSYoutubeActions {
    qproperty-thumbPlaceholder: url(./dynamic/Dark/sources/image.svg);
}

#ytEventList QLabel {
    color: ${hexToRgb "${config.colorScheme.colors.base07}"}; 
    background-color: palette(light);
    border: none;
    border-radius: 3px;
    padding: 4px 20px;
}

#ytEventList QLabel:hover {
    background: ${hexToRgb "${config.colorScheme.colors.base02}"};
}

#ytEventList QLabel[isSelectedEvent=true] {
    background: ${hexToRgb "${config.colorScheme.colors.base03}"};
    border: none;
}

QDateTimeEdit::down-arrow {
    qproperty-alignment: AlignTop;
    image: url(./dynamic/Dark/down.svg);
    width: 100%;
}

QDateTimeEdit:on {
    background-color: palette(base);
}
QCalendarWidget QWidget#qt_calendar_navigationbar {
    background-color: palette(base);
    padding: 4px 8px;
}
QCalendarWidget QToolButton {
    background-color: palette(light);
    padding: 2px 16px;
    border-radius: 3px;
    margin: 2px;
}

#qt_calendar_monthbutton::menu-indicator {
    image: url(./dynamic/Dark/down.svg);
    subcontrol-position: right;
    padding-top: 2px;
    padding-right: 6px;
    height: 10px;
    width: 10px;
}

QCalendarWidget #qt_calendar_prevmonth {
    padding: 2px;
    qproperty-icon: url(./dynamic/Dark/left.svg);
    icon-size: 16px, 16px;
}

QCalendarWidget #qt_calendar_nextmonth {
    padding: 2px;
    qproperty-icon: url(./dynamic/Dark/right.svg);
    icon-size: 16px, 16px;
}

QCalendarWidget QToolButton:hover {
    background-color: ${hexToRgb "${config.colorScheme.colors.base03}"};
    border-radius: 3px;
}

QCalendarWidget QToolButton:pressed {
    background-color: ${hexToRgb "${config.colorScheme.colors.base01}"};
}

QCalendarWidget QMenu {

}
QCalendarWidget QSpinBox {
    background-color: ${hexToRgb "${config.colorScheme.colors.base01}"};
    border: none;
    border-radius: 3px;
    margin: 0px 3px 0px 0px;
    padding: 4px 16px;
}

QCalendarWidget QSpinBox::up-button { subcontrol-origin: border; subcontrol-position: top right; width: 16px; }
QCalendarWidget QSpinBox::down-button {subcontrol-origin: border; subcontrol-position: bottom right; width: 16px;}
QCalendarWidget QSpinBox::up-arrow { width: 10px; height: 10px; }
QCalendarWidget QSpinBox::down-arrow { width: 10px; height: 10px; }
QCalendarWidget QWidget { alternate-background-color: palette(base); }

QCalendarWidget QAbstractItemView:enabled {
    background-color: palette(base);
    color: palette(text);
    selection-background-color: ${hexToRgb "${config.colorScheme.colors.base01}"};
    selection-color: palette(text);
}

QCalendarWidget QAbstractItemView:disabled {
    color: ${hexToRgb "${config.colorScheme.colors.base03}"};
}
QDialogButtonBox {
    dialogbuttonbox-buttons-have-icons: 0;
}
  '';
}