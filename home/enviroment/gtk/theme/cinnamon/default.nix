{ config, lib, pkgs, uservars, ... }:
{
  imports = [
./file10.nix
./file11.nix
./file12.nix
./file13.nix
./file14.nix
./file15.nix
./file16.nix
./file17.nix
./file18.nix
./file1.nix
./file20.nix
./file2.nix
./file3.nix
./file4.nix
./file5.nix
./file6.nix
./file7.nix
./file8.nix
./file9.nix
	];
  home.file.".themes/dynamic-color-theme/cinnamon/cinnamon.css".text = ''
stage {
  font-size: 9pt;
  color: #${config.colorScheme.palette.base06};
}

.label-shadow {
  color: rgba(0, 0, 0, 0);
}

.sound-button {
  min-height: 24px;
  padding: 5px 32px;
  transition-duration: 100ms;
  border-radius: 6px;
  color: rgba(242, 213, 207, 0.7);
  background-color: rgba(242, 213, 207, 0.04);
}

.sound-button:focus {
  color: #${config.colorScheme.palette.base06};
  background-color: rgba(242, 213, 207, 0.12);
  border-radius: 6px;
}

.sound-button:hover {
  color: #${config.colorScheme.palette.base06};
  background-color: rgba(242, 213, 207, 0.12);
  border-radius: 6px;
}

.sound-button:hover:focus {
  color: #${config.colorScheme.palette.base06};
  background-color: rgba(242, 213, 207, 0.3);
  border-radius: 6px;
}

.sound-button:active {
  color: #${config.colorScheme.palette.base06};
  background-color: rgba(242, 213, 207, 0.3);
  border-radius: 6px;
}

.sound-button:insensitive {
  color: rgba(242, 213, 207, 0.5);
  background-color: rgba(242, 213, 207, 0.04);
  border-radius: 6px;
}

.notification-button,
.notification-icon-button,
.menu #notification .notification-button,
.menu #notification .notification-icon-button,
.popup-menu #notification .notification-button,
.popup-menu #notification .notification-icon-button,
#notification .notification-button,
#notification .notification-icon-button {
  border-radius: 6px;
  color: rgba(242, 213, 207, 0.7);
  background-color: transparent;
}

.notification-button:hover,
.notification-icon-button:hover,
#notification .notification-button:hover,
#notification .notification-icon-button:hover {
  color: #${config.colorScheme.palette.base06};
  background-color: rgba(242, 213, 207, 0.12);
  border-radius: 6px;
}

.notification-button:active,
.notification-icon-button:active,
#notification .notification-button:active,
#notification .notification-icon-button:active {
  color: #${config.colorScheme.palette.base06};
  background-color: rgba(242, 213, 207, 0.3);
  border-radius: 6px;
}

.notification-button:insensitive,
.notification-icon-button:insensitive,
#notification .notification-button:insensitive,
#notification .notification-icon-button:insensitive {
  color: rgba(242, 213, 207, 0.3);
  background-color: transparent;
  border-radius: 6px;
}

.modal-dialog-button-box .modal-dialog-button {
  min-height: 24px;
  padding: 6px 30px;
  transition-duration: 100ms;
  border-radius: 6px;
  color: rgba(242, 213, 207, 0.7);
  background-color: rgba(242, 213, 207, 0.04);
}

.modal-dialog-button-box .modal-dialog-button:hover {
  color: #${config.colorScheme.palette.base06};
  background-color: rgba(242, 213, 207, 0.12);
}

.modal-dialog-button-box .modal-dialog-button:focus {
  color: #949cbb;
}

.modal-dialog-button-box .modal-dialog-button:active {
  color: #${config.colorScheme.palette.base06};
  background-color: rgba(242, 213, 207, 0.3);
}

.modal-dialog-button-box .modal-dialog-button:insensitive {
  color: rgba(242, 213, 207, 0.3);
  background-color: transparent;
}

#menu-search-entry,
.notification StEntry,
.menu #notification StEntry,
.popup-menu #notification StEntry,
#notification StEntry {
  padding: 3px 12px;
  min-height: 24px;
  caret-size: 1px;
  selection-background-color: #949cbb;
  selected-color: rgba(0, 0, 0, 0.87);
  transition-duration: 300ms;
  border-radius: 9999px;
  color: #${config.colorScheme.palette.base06};
  border: 2px solid transparent;
  background-color: rgba(242, 213, 207, 0.04);
}

#menu-search-entry:focus,
.notification StEntry:focus,
.menu #notification StEntry:focus,
.popup-menu #notification StEntry:focus,
#notification StEntry:focus,
#menu-search-entry:hover,
.notification StEntry:hover,
.menu #notification StEntry:hover,
.popup-menu #notification StEntry:hover,
#notification StEntry:hover {
  color: #${config.colorScheme.palette.base06};
  background-color: rgba(242, 213, 207, 0.04);
  border: 2px solid #949cbb;
}

#menu-search-entry:insensitive,
.notification StEntry:insensitive,
.menu #notification StEntry:insensitive,
.popup-menu #notification StEntry:insensitive,
#notification StEntry:insensitive {
  border: 2px solid transparent;
  background-color: rgba(242, 213, 207, 0.04);
  color: rgba(242, 213, 207, 0.5);
}

#menu-search-entry StIcon.capslock-warning,
.notification StEntry StIcon.capslock-warning,
.menu #notification StEntry StIcon.capslock-warning,
.popup-menu #notification StEntry StIcon.capslock-warning,
#notification StEntry StIcon.capslock-warning {
  icon-size: 16px;
  warning-color: #${config.colorScheme.palette.base0A};
  padding: 0 6px;
}

StScrollView.vfade {
  -st-vfade-offset: 0px;
}

StScrollView.hfade {
  -st-hfade-offset: 0px;
}

StScrollBar {
  padding: 8px;
}

StScrollView StScrollBar {
  min-width: 5px;
  min-height: 5px;
}

StScrollBar StBin#trough {
  background-color: rgba(65, 69, 89, 0.1);
  border-radius: 9999px;
}

StScrollBar StButton#vhandle,
StScrollBar StButton#hhandle {
  border-radius: 9999px;
  background-color: #${config.colorScheme.palette.base04};
  border: 0px solid;
  margin: 0px;
}

StScrollBar StButton#vhandle:hover,
StScrollBar StButton#hhandle:hover {
  background-color: #${config.colorScheme.palette.base03};
}

StScrollBar StButton#vhandle:active,
StScrollBar StButton#hhandle:active {
  background-color: #949cbb;
}

.separator {
  -gradient-height: 1px;
  -gradient-start: rgba(0, 0, 0, 0);
  -gradient-end: rgba(0, 0, 0, 0);
  -margin-horizontal: 1.5em;
  height: 1em;
}

.popup-slider-menu-item,
.slider {
  -slider-height: 4px;
  -slider-background-color: rgba(242, 213, 207, 0.12);
  -slider-border-color: transparent;
  -slider-active-background-color: #949cbb;
  -slider-active-border-color: transparent;
  -slider-border-width: 0;
  -slider-handle-radius: 4px;
  height: 18px;
  min-width: 15em;
  border: 0 solid transparent;
  border-right-width: 1px;
  border-left-width: 5px;
  color: transparent;
}

.check-box CinnamonGenericContainer {
  spacing: 0.2em;
  min-height: 30px;
  padding-top: 2px;
}

.check-box StLabel {
  font-weight: normal;
}

.check-box StBin {
  width: 24px;
  height: 24px;
}

.check-box StBin,
.check-box:focus StBin {
  background-image: url('assets/checkbox-off.svg');
}

.check-box:checked StBin,
.check-box:focus:checked StBin {
  background-image: url('assets/checkbox-dark.svg');
}

.radiobutton CinnamonGenericContainer {
  spacing: 0.2em;
  min-height: 30px;
  padding-top: 2px;
}

.radiobutton StLabel {
  padding-top: 4px;
  font-size: 0.9em;
  box-shadow: none;
}

.radiobutton StBin {
  width: 24px;
  height: 24px;
}

.radiobutton StBin,
.radiobutton:focus StBin {
  background-image: url('assets/radiobutton-off.svg');
}

.radiobutton:checked StBin,
.radiobutton:focus:checked StBin {
  background-image: url('assets/radiobutton-dark.svg');
}

.toggle-switch {
  width: 40px;
  height: 20px;
  background-size: contain;
  background-image: url('assets/toggle-off.svg');
}

.toggle-switch:checked {
  background-image: url('assets/toggle-on-dark.svg');
}

.popup-menu-item:active .toggle-switch {
  background-image: url('assets/toggle-off.svg');
}

.popup-menu-item:active .toggle-switch:checked {
  background-image: url('assets/toggle-on-dark.svg');
}

.cinnamon-link {
  color: #85c1cd;
  text-decoration: underline;
}

.cinnamon-link:hover {
  color: #${config.colorScheme.palette.base0D};
}

#Tooltip {
  border-radius: 9999px;
  padding: 6px 12px;
  background-color: rgba(17, 17, 27, 0.9);
  color: #${config.colorScheme.palette.base06};
  margin: 6px;
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2),
    0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12);
  font-size: 1em;
  font-weight: normal;
  text-align: center;
}

.menu,
.popup-menu,
.popup-combo-menu {
  padding: 3px;
  color: #${config.colorScheme.palette.base06};
  background-color: rgba(65, 69, 89, 0.95);
  border-radius: 12px;
  margin: 6px;
  box-shadow: 0 5px 12px rgba(0, 0, 0, 0.35);
  border: 2px solid #${config.colorScheme.palette.base0D};
}

.menu-arrow,
.popup-menu-arrow {
  icon-size: 16px;
}

.menu .popup-sub-menu,
.popup-menu .popup-sub-menu,
.popup-combo-menu .popup-sub-menu {
  border-radius: 6px;
  background-gradient-direction: none;
  box-shadow: none;
  background-color: #949cbb;
  color: rgba(0, 0, 0, 0.6);
}

.menu .popup-sub-menu .popup-menu-item:active,
.popup-menu .popup-sub-menu .popup-menu-item:active,
.popup-combo-menu .popup-sub-menu .popup-menu-item:active {
  background-color: rgba(0, 0, 0, 0.12);
  color: rgba(0, 0, 0, 0.87);
}

.menu .popup-sub-menu StScrollBar,
.popup-menu .popup-sub-menu StScrollBar,
.popup-combo-menu .popup-sub-menu StScrollBar {
  padding: 4px;
}

.menu .popup-sub-menu StScrollBar StBin#trough,
.menu .popup-sub-menu StScrollBar StBin#vhandle,
.popup-menu .popup-sub-menu StScrollBar StBin#trough,
.popup-menu .popup-sub-menu StScrollBar StBin#vhandle,
.popup-combo-menu .popup-sub-menu StScrollBar StBin#trough,
.popup-combo-menu .popup-sub-menu StScrollBar StBin#vhandle {
  border-width: 0;
}

.menu .popup-menu-content,
.popup-menu .popup-menu-content,
.popup-combo-menu .popup-menu-content {
  padding: 3px;
}

.menu .popup-menu-item,
.popup-menu .popup-menu-item,
.popup-combo-menu .popup-menu-item {
  padding: 6px 12px;
  spacing: 12px;
  border-radius: 6px;
}

.menu .popup-menu-item:hover,
.menu .popup-menu-item:active,
.popup-menu .popup-menu-item:hover,
.popup-menu .popup-menu-item:active,
.popup-combo-menu .popup-menu-item:hover,
.popup-combo-menu .popup-menu-item:active {
  color: #${config.colorScheme.palette.base06};
  background-color: rgba(242, 213, 207, 0.12);
}

.menu .popup-menu-item:insensitive,
.popup-menu .popup-menu-item:insensitive,
.popup-combo-menu .popup-menu-item:insensitive {
  color: rgba(242, 213, 207, 0.5);
  background: none;
}

.menu .popup-inactive-menu-item,
.popup-menu .popup-inactive-menu-item,
.popup-combo-menu .popup-inactive-menu-item {
  color: rgba(242, 213, 207, 0.5);
}

.menu .popup-inactive-menu-item:insensitive,
.popup-menu .popup-inactive-menu-item:insensitive,
.popup-combo-menu .popup-inactive-menu-item:insensitive {
  color: rgba(242, 213, 207, 0.12);
}

.menu .popup-menu-item:active .popup-inactive-menu-item,
.popup-menu .popup-menu-item:active .popup-inactive-menu-item,
.popup-combo-menu .popup-menu-item:active .popup-inactive-menu-item {
  color: rgba(242, 213, 207, 0.5);
}

.menu-icon,
.popup-menu-icon {
  icon-size: 16px;
}

.popup-menu-boxpointer {
  -arrow-border-radius: 6px;
  -arrow-background-color: rgba(0, 0, 0, 0);
  -arrow-border-width: 0;
  -arrow-border-color: rgba(0, 0, 0, 0);
  -arrow-base: 0;
  -arrow-rise: 0;
}

.popup-combo-menu {
  padding: 12px;
}

.popup-combobox-item {
  spacing: 1em;
}

.popup-separator-menu-item {
  -gradient-height: 0;
  -gradient-start: transparent;
  -gradient-end: transparent;
  -margin-horizontal: 1.5em;
  height: 0;
  margin: 0;
  padding: 0;
  border-color: rgba(242, 213, 207, 0.12);
  border-bottom-width: 0;
  border-bottom-style: solid;
  background-color: transparent;
}

.popup-alternating-menu-item:alternate {
  font-weight: normal;
}

.popup-device-menu-item {
  spacing: 0.5em;
}

.popup-subtitle-menu-item {
  font-weight: normal;
}

.nm-menu-item-icons {
  spacing: 0.5em;
}

#panel {
  font-weight: bold;
  height: 36px;
  width: 42px;
}

#panel:highlight {
  border-image: none;
  background-color: rgba(242, 139, 130, 0.5);
}

#panelLeft {
  spacing: 4px;
}

#panelLeft:dnd {
  background-gradient-direction: vertical;
  background-gradient-start: rgba(255, 0, 0, 0.05);
  background-gradient-end: rgba(255, 0, 0, 0.2);
}

#panelLeft:ltr {
  padding-right: 4px;
}

#panelLeft:rtl {
  padding-left: 4px;
}

#panelLeft.vertical {
  padding: 0;
}

#panelLeft.vertical:ltr {
  padding-right: 0px;
}

#panelLeft.vertical:rtl {
  padding-left: 0px;
}

#panelRight:dnd {
  background-gradient-direction: vertical;
  background-gradient-start: rgba(0, 0, 255, 0.05);
  background-gradient-end: rgba(0, 0, 255, 0.2);
}

#panelRight:ltr {
  padding-left: 6px;
  spacing: 0px;
}

#panelRight:rtl {
  padding-right: 6px;
  spacing: 0px;
}

#panelRight.vertical {
  padding: 0;
}

#panelRight.vertical:ltr {
  padding-right: 0px;
}

#panelRight.vertical:rtl {
  padding-left: 0px;
}

#panelCenter {
  spacing: 4px;
}

#panelCenter:dnd {
  background-gradient-direction: vertical;
  background-gradient-start: rgba(0, 255, 0, 0.05);
  background-gradient-end: rgba(0, 255, 0, 0.2);
}

.panel-top,
.panel-bottom,
.panel-left,
.panel-right {
  color: rgba(242, 213, 207, 0.7);
  font-size: 1em;
  padding: 0px;
  background-color: rgba(48, 52, 70, 0.95);
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.5), 0 0 16px rgba(0, 0, 0, 0.24);
}

.panel-top .panel-button:hover,
.panel-top .panel-status-button:hover,
.panel-bottom .panel-button:hover,
.panel-bottom .panel-status-button:hover,
.panel-left .panel-button:hover,
.panel-left .panel-status-button:hover,
.panel-right .panel-button:hover,
.panel-right .panel-status-button:hover {
  color: #${config.colorScheme.palette.base06};
  background-color: rgba(242, 213, 207, 0.12);
}

.panel-top .panel-button:active,
.panel-top .panel-status-button:active,
.panel-bottom .panel-button:active,
.panel-bottom .panel-status-button:active,
.panel-left .panel-button:active,
.panel-left .panel-status-button:active,
.panel-right .panel-button:active,
.panel-right .panel-status-button:active {
  color: rgba(0, 0, 0, 0.87);
  background-color: #949cbb;
}

.panel-dummy {
  background-color: rgba(242, 139, 130, 0.5);
}

.panel-dummy:entered {
  background-color: rgba(242, 139, 130, 0.6);
}

.panel-status-button {
  border-width: 0;
  -natural-hpadding: 3px;
  -minimum-hpadding: 3px;
  font-weight: bold;
  height: 22px;
  color: rgba(242, 213, 207, 0.7);
}

.panel-button {
  -natural-hpadding: 6px;
  -minimum-hpadding: 2px;
  font-weight: bold;
  transition-duration: 100ms;
  color: rgba(242, 213, 207, 0.7);
}

.system-status-icon {
  icon-size: 16px;
  padding: 0 1px;
}

#overview {
  spacing: 12px;
}

.window-caption {
  background-color: rgba(17, 17, 27, 0.9);
  border: 1px solid rgba(17, 17, 27, 0.9);
  color: #${config.colorScheme.palette.base06};
  spacing: 25px;
  border-radius: 6px;
  font-size: 9pt;
  padding: 5px 8px;
  -cinnamon-caption-spacing: 4px;
}

#selected.window-caption {
  background-color: #949cbb;
  color: rgba(0, 0, 0, 0.87);
  border: 1px solid #949cbb;
  spacing: 25px;
}

.expo-workspaces-name-entry,
#selected.expo-workspaces-name-entry {
  height: 15px;
  border-radius: 6px;
  font-size: 9pt;
  padding: 5px 8px;
  -cinnamon-caption-spacing: 4px;
  color: #${config.colorScheme.palette.base06};
  background-color: rgba(242, 213, 207, 0.04);
  border: 2px solid transparent;
}

.expo-workspaces-name-entry:focus,
#selected.expo-workspaces-name-entry:focus {
  border: 1px solid #949cbb;
  background-color: #949cbb;
  color: rgba(0, 0, 0, 0.87);
  font-style: italic;
  transition-duration: 300;
  selection-background-color: rgba(0, 0, 0, 0.87);
  selected-color: #949cbb;
}

.expo-workspace-thumbnail-frame {
  border: 4px solid rgba(242, 213, 207, 0);
  background-color: rgba(242, 213, 207, 0);
  border-radius: 6px;
}

#active.expo-workspace-thumbnail-frame {
  border: 4px solid #949cbb;
  background-color: black;
  border-radius: 6px;
}

.expo-background {
  background-color: #${config.colorScheme.palette.base01};
}

.workspace-thumbnails {
  spacing: 26px;
}

.workspace-thumbnails-background,
.workspace-thumbnails-background:rtl {
  padding: 8px;
}

.workspace-add-button {
  background-image: url('assets/add-workspace.svg');
  height: 200px;
  width: 35px;
  transition-duration: 100;
}

.workspace-add-button:hover {
  background-image: url('assets/add-workspace-hover.svg');
  transition-duration: 100;
}

.workspace-add-button:active {
  background-image: url('assets/add-workspace-active.svg');
  transition-duration: 100;
}

.workspace-overview-background-shade {
  background-color: rgba(0, 0, 0, 0.5);
}

.workspace-close-button,
.window-close {
  background-image: url('assets/close.svg');
  background-size: 26px;
  height: 26px;
  width: 26px;
  -cinnamon-close-overlap: 13px;
}

.workspace-close-button:hover,
.window-close:hover {
  background-image: url('assets/close-hover.svg');
  background-size: 26px;
  height: 26px;
  width: 26px;
}

.workspace-close-button:active,
.window-close:active {
  background-image: url('assets/close-active.svg');
  background-size: 26px;
  height: 26px;
  width: 26px;
}

.workspace-thumbnail-indicator {
  outline: 2px solid red;
  border: 1px solid green;
}

.window-close:rtl {
  -st-background-image-shadow: 2px 2px 6px rgba(0, 0, 0, 0.5);
}

.window-close-area {
  background-image: url('assets/trash-icon.svg');
  height: 120px;
  width: 400px;
}

.about-content {
  width: 550px;
  height: 250px;
  spacing: 8px;
  padding-bottom: 10px;
}

.about-title {
  font-size: 2em;
  font-weight: bold;
}

.about-uuid {
  font-size: 10px;
  color: #${config.colorScheme.palette.base04};
}

.about-icon {
  padding-right: 20px;
  padding-bottom: 14px;
}

.about-scrollBox {
  border: 1px solid rgba(242, 213, 207, 0.12);
  border-radius: 6px;
  background-color: #${config.colorScheme.palette.base00};
  padding: 4px;
  padding-right: 0;
  border-radius: 0;
}

.about-scrollBox-innerBox {
  padding: 1.2em;
  spacing: 1.2em;
}

.about-description {
  padding-top: 4px;
  padding-bottom: 16px;
}

.about-version {
  padding-left: 7px;
  font-size: 10px;
  color: #${config.colorScheme.palette.base04};
}

.calendar {
  padding: 0.4em 1.75em;
  spacing-rows: 0px;
  spacing-columns: 0px;
}

.calendar-month-label {
  color: #${config.colorScheme.palette.base06};
  font-weight: bold;
  margin: 0 2px;
  padding: 2px;
}

.calendar-change-month-back,
.calendar-change-month-forward {
  width: 24px;
  height: 24px;
  margin: 0;
  padding: 0;
  border-radius: 9999px;
}

.calendar-change-month-back:focus,
.calendar-change-month-back:hover,
.calendar-change-month-forward:focus,
.calendar-change-month-forward:hover {
  background-color: rgba(242, 213, 207, 0.1);
}

.calendar-change-month-back:active,
.calendar-change-month-forward:active {
  background-color: rgba(242, 213, 207, 0.25);
}

.calendar-change-month-back {
  background-image: url('assets/calendar-arrow-left.svg');
}

.calendar-change-month-back:rtl {
  background-image: url('assets/calendar-arrow-right.svg');
}

.calendar-change-month-forward {
  background-image: url('assets/calendar-arrow-right.svg');
}

.calendar-change-month-forward:rtl {
  background-image: url('assets/calendar-arrow-left.svg');
}

.datemenu-date-label {
  padding: 0.4em 1.75em;
  font-weight: normal;
  text-align: center;
  font-size: 14px;
  color: #${config.colorScheme.palette.base06};
  border-radius: 6px;
}

.calendar-day-base {
  text-align: center;
  width: 28px;
  height: 28px;
  padding: 0;
  margin: 2px;
  border-radius: 9999px;
}

.calendar-day-heading {
  color: rgba(242, 213, 207, 0.7);
  margin-top: 1em;
}

.calendar-day {
  border-width: 0;
  color: rgba(242, 213, 207, 0.7);
}

.calendar-day-top {
  border-top-width: 0;
}

.calendar-day-left {
  border-left-width: 0;
}

.calendar-nonwork-day {
  color: #${config.colorScheme.palette.base06};
  background-color: transparent;
  font-weight: bold;
}

.calendar-today,
.calendar-today:active,
.calendar-today:focus,
.calendar-today:hover {
  font-weight: bold;
  color: rgba(0, 0, 0, 0.87);
  background-color: #949cbb;
  border-width: 0;
}

.calendar-other-month-day {
  color: rgba(242, 213, 207, 0.7);
  opacity: 1;
}

.calendar-week-number {
  width: 20px;
  height: 20px;
  margin: 6px 0;
  color: rgba(242, 213, 207, 0.3);
  font-weight: bold;
  background-color: rgba(242, 213, 207, 0.04);
  border-radius: 9999px;
}

.calendar-week-number StLabel {
  padding: 0;
  margin-top: 3px;
}

#notification {
  border-radius: 12px;
  padding: 12px;
  spacing-rows: 9px;
  spacing-columns: 9px;
  margin-from-right-edge-of-screen: 18px;
  width: 28em;
  color: #${config.colorScheme.palette.base06};
  background-color: rgba(65, 69, 89, 0.8);
  box-shadow: 0 5px 12px rgba(0, 0, 0, 0.35);
  margin: 7px 12px 17px 12px;
}

#notification .notification-button,
#notification .notification-icon-button {
  padding: 6px;
}

.menu #notification,
.popup-menu #notification {
  border: none;
  border-radius: 6px;
  background-color: rgba(242, 213, 207, 0.05);
  box-shadow: none;
  margin: 0;
}

.menu #notification:hover,
.popup-menu #notification:hover {
  background-color: rgba(242, 213, 207, 0.1);
  box-shadow: 0 3px 8px rgba(0, 0, 0, 0.15);
}

.menu #notification,
.menu #notification.multi-line-notification,
.popup-menu #notification,
.popup-menu #notification.multi-line-notification {
  color: #${config.colorScheme.palette.base06};
}

.menu #notification .notification-button,
.menu #notification .notification-icon-button,
.popup-menu #notification .notification-button,
.popup-menu #notification .notification-icon-button {
  padding: 6px;
}

#notification.multi-line-notification {
  padding-bottom: 12px;
  color: #${config.colorScheme.palette.base06};
}

#notification-scrollview {
  max-height: 10em;
}

#notification-scrollview > .top-shadow,
#notification-scrollview > .bottom-shadow {
  height: 1em;
}

#notification-scrollview:ltr > StScrollBar {
  padding-left: 6px;
}

#notification-scrollview:rtl > StScrollBar {
  padding-right: 6px;
}

#notification-body {
  spacing: 6px;
}

#notification-actions {
  spacing: 9px;
}

.notification-with-image {
  min-height: 159px;
  color: #${config.colorScheme.palette.base06};
}

.notification-button,
.notification-icon-button {
  padding: 6px;
}

.notification-icon-button > StIcon {
  icon-size: 36px;
}

#altTabPopup {
  padding: 8px;
  spacing: 16px;
}

.switcher-list {
  color: #${config.colorScheme.palette.base06};
  background-color: rgba(65, 69, 89, 0.95);
  border: none;
  border-radius: 6px;
  padding: 20px;
}

.switcher-list > StBoxLayout {
  padding: 4px;
}

.switcher-list-item-container {
  spacing: 8px;
}

.switcher-list .item-box {
  padding: 8px;
  border-radius: 6px;
}

.switcher-list .item-box:outlined {
  padding: 8px;
  border: 1px solid #949cbb;
}

.switcher-list .item-box:selected {
  color: rgba(0, 0, 0, 0.87);
  background-color: #949cbb;
  border: 0px solid #949cbb;
}

.switcher-list .thumbnail {
  width: 256px;
}

.switcher-list .thumbnail-box {
  padding: 2px;
  spacing: 4px;
}

.switcher-list .separator {
  width: 1px;
  background: rgba(242, 213, 207, 0.2);
}

.switcher-arrow {
  border-color: rgba(0, 0, 0, 0);
  color: #${config.colorScheme.palette.base06};
}

.switcher-arrow:highlighted {
  border-color: rgba(0, 0, 0, 0);
  color: rgba(242, 213, 207, 0.7);
}

.thumbnail-scroll-gradient-left {
  background-color: rgba(0, 0, 0, 0);
  border-radius: 24px;
  border-radius-topright: 0px;
  border-radius-bottomright: 0px;
  width: 60px;
}

.thumbnail-scroll-gradient-right {
  background-color: rgba(0, 0, 0, 0);
  border-radius: 24px;
  border-radius-topleft: 0px;
  border-radius-bottomleft: 0px;
  width: 60px;
}

.ripple-box {
  width: 104px;
  height: 104px;
  background-image: url('assets/corner-ripple.svg');
  background-size: contain;
}

.lightbox {
  background-color: rgba(0, 0, 0, 0.4);
}

.flashspot {
  background-color: #${config.colorScheme.palette.base06};
}

.modal-dialog {
  color: #${config.colorScheme.palette.base06};
  background-color: rgba(17, 17, 27, 0.9);
  border: 1px solid rgba(0, 0, 0, 0.65);
  padding: 0 5px 6px 5px;
  border-radius: 6px;
  box-shadow: 0 3px 8px rgba(0, 0, 0, 0.75), 0 5px 18px rgba(0, 0, 0, 0.55);
}

.modal-dialog > StBoxLayout:first-child {
  padding: 20px 10px 10px 10px;
}

.modal-dialog-button-box {
  spacing: 0;
  margin: 0;
  padding: 14px 10px;
  background-color: transparent;
  border: none;
}

.modal-dialog-button-box .modal-dialog-button {
  padding-top: 0;
  padding-bottom: 0;
  height: 30px;
}

.run-dialog {
  padding: 6px 12px;
  background-color: rgba(17, 17, 27, 0.9);
  border-radius: 6px;
  color: #${config.colorScheme.palette.base06};
}

.run-dialog > * {
  padding: 0;
}

.run-dialog-label {
  font-size: 0;
  font-weight: bold;
  color: #${config.colorScheme.palette.base06};
  padding-bottom: 0;
}

.run-dialog-error-label {
  color: #${config.colorScheme.palette.base08};
}

.run-dialog-error-box {
  padding-top: 15px;
  spacing: 5px;
}

.run-dialog-completion-box {
  padding-left: 15px;
  font-size: 10px;
}

.run-dialog-entry {
  width: 21em;
  padding: 3px 12px;
  border-radius: 6px;
  caret-color: #${config.colorScheme.palette.base06};
  selected-color: rgba(0, 0, 0, 0.87);
  selection-background-color: #949cbb;
  color: #${config.colorScheme.palette.base06};
  background-color: rgba(242, 213, 207, 0.04);
  border: 2px solid transparent;
}

.run-dialog-entry:focus {
  color: #${config.colorScheme.palette.base06};
  background-color: rgba(242, 213, 207, 0.04);
  border: 2px solid #${config.colorScheme.palette.base0E};
}

.run-dialog .modal-dialog-button-box {
  border: none;
  box-shadow: none;
  background: none;
  background-gradient-direction: none;
}

/* CinnamonMountOperation Dialogs */
.cinnamon-mount-operation-icon {
  icon-size: 48px;
}

.mount-password-reask {
  color: #${config.colorScheme.palette.base0A};
}

.show-processes-dialog,
.mount-question-dialog {
  spacing: 24px;
}

.show-processes-dialog-subject,
.mount-question-dialog-subject {
  padding-top: 10px;
  padding-left: 17px;
  padding-bottom: 6px;
}

.show-processes-dialog-subject:rtl,
.mount-question-dialog-subject:rtl {
  padding-left: 0px;
  padding-right: 17px;
}

.show-processes-dialog-description,
.mount-question-dialog-description {
  padding-left: 17px;
  width: 28em;
}

.show-processes-dialog-description:rtl,
.mount-question-dialog-description:rtl {
  padding-right: 17px;
}

.show-processes-dialog-app-list {
  max-height: 200px;
  padding-top: 24px;
  padding-left: 49px;
  padding-right: 32px;
}

.show-processes-dialog-app-list:rtl {
  padding-right: 49px;
  padding-left: 32px;
}

.show-processes-dialog-app-list-item {
  color: #ccc;
}

.show-processes-dialog-app-list-item:hover {
  color: #${config.colorScheme.palette.base06};
}

.show-processes-dialog-app-list-item:ltr {
  padding-right: 1em;
}

.show-processes-dialog-app-list-item:rtl {
  padding-left: 1em;
}

.show-processes-dialog-app-list-item-icon:ltr {
  padding-right: 17px;
}

.show-processes-dialog-app-list-item-icon:rtl {
  padding-left: 17px;
}

.show-processes-dialog-app-list-item-name {
  font-size: 1.1em;
}

.magnifier-zoom-region {
  border: 2px solid maroon;
}

.magnifier-zoom-region .full-screen {
  border-width: 0px;
}

#keyboard {
  background-color: rgba(17, 17, 27, 0.9);
  border-width: 0;
  border-top-width: 1px;
  border-color: rgba(0, 0, 0, 0.4);
}

.keyboard-layout {
  spacing: 10px;
  padding: 10px;
}

.keyboard-row {
  spacing: 15px;
}

.keyboard-key {
  min-height: 2em;
  min-width: 2em;
  font-size: 14pt;
  font-weight: bold;
  border-radius: 6px;
  box-shadow: none;
  color: rgba(242, 213, 207, 0.7);
  background-color: rgba(242, 213, 207, 0.04);
}

.keyboard-key:hover {
  color: #${config.colorScheme.palette.base06};
  background-color: rgba(242, 213, 207, 0.12);
}

.keyboard-key:active,
.keyboard-key:checked {
  color: #${config.colorScheme.palette.base06};
  background-color: rgba(242, 213, 207, 0.3);
}

.keyboard-key:grayed {
  color: rgba(242, 213, 207, 0.3);
  background-color: transparent;
}

.keyboard-subkeys {
  color: #${config.colorScheme.palette.base06};
  padding: 5px;
  -arrow-border-radius: 6px;
  -arrow-background-color: rgba(17, 17, 27, 0.9);
  -arrow-border-width: 1px;
  -arrow-border-color: rgba(0, 0, 0, 0.4);
  -arrow-base: 20px;
  -arrow-rise: 10px;
  -boxpointer-gap: 5px;
}

.menu-favorites-box {
  margin: auto;
  margin-bottom: 6px;
  padding: 6px;
  transition-duration: 300;
  background-color: rgba(242, 213, 207, 0.05);
  border: none;
  border-radius: 6px;
}

.menu-favorites-button {
  padding: 9px;
  border: none;
  border-radius: 6px;
}

.menu-favorites-button:hover {
  border-radius: 6px;
  background-color: rgba(242, 213, 207, 0.1);
}

.menu-places-box {
  margin: auto;
  padding: 9px;
  border: 1px solid rgba(0, 0, 0, 0);
}

.menu-places-button {
  padding: 9px;
}

.menu-categories-box {
  padding: 9px 30px;
}

.menu-applications-inner-box,
.menu-applications-outer-box {
  padding: 9px 9px 0 9px;
}

.menu-application-button {
  padding: 6px;
  border-radius: 6px;
  border: none;
}

.menu-application-button:highlighted {
  font-weight: bold;
}

.menu-application-button-selected {
  color: #${config.colorScheme.palette.base06};
  background-color: rgba(242, 213, 207, 0.12);
  padding: 6px;
  border-radius: 6px;
  border: none;
}

.menu-application-button-selected:highlighted {
  font-weight: bold;
}

.menu-application-button-label:ltr {
  padding-left: 6px;
}

.menu-application-button-label:rtl {
  padding-right: 6px;
}

.menu StScrollView.menu-application-button {
  padding: 3px 0;
  border-radius: 6px;
  background-color: #949cbb;
  color: rgba(0, 0, 0, 0.87);
}

.menu StScrollView.menu-application-button .popup-menu-item {
  padding: 0;
  spacing: 0;
  margin: 0 3px;
  border-radius: 6px;
  color: rgba(0, 0, 0, 0.87);
}

.menu StScrollView.menu-application-button .popup-menu-item:ltr {
  padding-left: 6px;
}

.menu StScrollView.menu-application-button .popup-menu-item:rtl {
  padding-right: 6px;
}

.menu StScrollView.menu-application-button .popup-menu-item:active {
  border-image: none;
  background-color: rgba(0, 0, 0, 0.12);
  color: rgba(0, 0, 0, 0.87);
}

.menu StScrollView.menu-application-button .popup-menu-item StIcon {
  min-width: 22px;
}

.menu StScrollView.menu-application-button .popup-menu-item StLabel:ltr {
  padding: 6px 0 6px 6px;
}

.menu StScrollView.menu-application-button .popup-menu-item StLabel:rtl {
  padding: 6px 6px 6px 0;
}

.menu-category-button {
  padding: 6px;
  border-radius: 6px;
}

.menu-category-button-selected {
  padding: 6px;
}

.menu-category-button-hover,
.menu-category-button-selected {
  color: #${config.colorScheme.palette.base06};
  background-color: rgba(242, 213, 207, 0.12);
  border-radius: 6px;
}

.menu-category-button-greyed {
  padding: 6px;
  color: rgba(242, 213, 207, 0.5);
}

.menu-category-button-label:ltr {
  padding-left: 6px;
}

.menu-category-button-label:rtl {
  padding-right: 6px;
}

.menu-selected-app-box {
  padding-right: 30px;
  padding-left: 28px;
  text-align: right;
  height: 30px;
}

.menu-selected-app-box:rtl {
  padding-top: 10px;
  height: 30px;
}

.menu-selected-app-title {
  font-weight: bold;
}

.menu-selected-app-description {
  max-width: 150px;
  margin-bottom: 6px;
}

.menu-search-box:ltr {
  padding-left: 30px;
}

.menu-search-box-rtl {
  padding-right: 30px;
}

#menu-search-entry {
  width: 250px;
  height: 15px;
  font-weight: normal;
  caret-color: #${config.colorScheme.palette.base06};
}

.menu-search-entry-icon {
  icon-size: 1em;
  color: #${config.colorScheme.palette.base06};
}

.info-osd {
  text-align: center;
  font-weight: bold;
  spacing: 1em;
  padding: 16px;
  color: rgba(242, 213, 207, 0.7);
  background-color: rgba(48, 52, 70, 0.85);
}

.osd-window {
  text-align: center;
  font-weight: bold;
  spacing: 1em;
  padding: 20px;
  min-width: 64px;
  min-height: 64px;
  color: rgba(242, 213, 207, 0.7);
  border-radius: 0;
  background-color: rgba(48, 52, 70, 0.85);
  border: none;
}

.osd-window .osd-monitor-label {
  font-size: 3em;
}

.osd-window .level {
  padding: 0;
  height: 4px;
  background-color: rgba(0, 0, 0, 0.35);
  border-radius: 6px;
  color: #949cbb;
}

.osd-window .level-bar {
  border-radius: 6px;
  background-color: #949cbb;
}

.window-list-box {
  spacing: 2px;
}

.panel-bottom .window-list-box:ltr,
.panel-top .window-list-box:ltr {
  padding: 0 0 0 8px;
}

.panel-bottom .window-list-box:rtl,
.panel-top .window-list-box:rtl {
  padding: 0 8px 0 0;
}

.window-list-box.vertical {
  padding: 6px 0 0 0;
}

.window-list-box.vertical #appMenuIcon {
  padding-top: 2px;
}

.window-list-box:highlight {
  background-color: rgba(242, 139, 130, 0.5);
}

.window-list-item-label {
  font-weight: normal;
  width: 15em;
  min-width: 5px;
}

.window-list-item-box {
  font-weight: normal;
  background-image: none;
  transition-duration: 100ms;
  color: rgba(242, 213, 207, 0.9);
  border-radius: 0;
}

.panel-bottom .window-list-item-box StLabel {
  padding-left: 6px;
}

.panel-top .window-list-item-box StLabel {
  padding-left: 6px;
}

.panel-left .window-list-item-box StLabel {
  padding-top: 6px;
}

.panel-right .window-list-item-box StLabel {
  padding-top: 6px;
}

.panel-top .window-list-item-box {
  border-top: 2px solid transparent;
}

.panel-top .window-list-item-box StIcon,
.panel-top .window-list-item-box StBin,
.panel-top .window-list-item-box #appMenuIcon {
  padding: 2px;
  padding-top: 0;
}

.panel-bottom .window-list-item-box {
  border-bottom: 2px solid transparent;
}

.panel-bottom .window-list-item-box StIcon,
.panel-bottom .window-list-item-box StBin,
.panel-bottom .window-list-item-box #appMenuIcon {
  padding: 2px;
  padding-bottom: 0;
}

.panel-left .window-list-item-box {
  border-left: 2px solid transparent;
}

.panel-left .window-list-item-box StIcon,
.panel-left .window-list-item-box StBin,
.panel-left .window-list-item-box #appMenuIcon {
  padding: 2px;
  padding-left: 0;
}

.panel-right .window-list-item-box {
  border-right: 2px solid transparent;
}

.panel-right .window-list-item-box StIcon,
.panel-right .window-list-item-box StBin,
.panel-right .window-list-item-box #appMenuIcon {
  padding: 2px;
  padding-right: 0;
}

.window-list-item-box:hover {
  color: rgba(242, 213, 207, 0.7);
  background-gradient-direction: none;
  background-color: rgba(242, 213, 207, 0.15);
}

.window-list-item-box:active,
.window-list-item-box:checked,
.window-list-item-box:running {
  color: rgba(242, 213, 207, 0.7);
  background-gradient-direction: none;
  background-color: rgba(242, 213, 207, 0.25);
  border-color: rgba(242, 213, 207, 0.3);
}

.window-list-item-box:active:hover,
.window-list-item-box:checked:hover,
.window-list-item-box:running:hover {
  background-color: rgba(242, 213, 207, 0.3);
}

.window-list-item-box:focus {
  color: rgba(242, 213, 207, 0.7);
  background-gradient-direction: none;
  background-image: radial-gradient(
    5px 5px 45deg,
    circle cover,
    rgba(242, 213, 207, 0.7) 0%,
    rgba(242, 213, 207, 0.7) 100%
  );
  border-color: #949cbb;
  background-color: rgba(242, 213, 207, 0.2);
}

.window-list-item-box:focus:hover {
  background-color: rgba(242, 213, 207, 0.3);
}

.panel-top .window-list-item-box:focus {
  background-position: top center;
}

.panel-bottom .window-list-item-box:focus {
  background-position: bottom center;
}

.panel-left .window-list-item-box:focus {
  background-position: left center;
}

.panel-right .window-list-item-box:focus {
  background-position: right center;
}

.window-list-item-box.right,
.window-list-item-box.left {
  padding-left: 0px;
  padding-right: 0px;
}

.window-list-item-box .progress {
  background-gradient-direction: vertical;
  background-gradient-start: #${config.colorScheme.palette.base0B};
  background-gradient-end: #${config.colorScheme.palette.base0B};
  border-radius: 6px;
  box-shadow: none;
}

.window-list-item-demands-attention {
  background-gradient-start: #${config.colorScheme.palette.base0A};
  background-gradient-end: #${config.colorScheme.palette.base0A};
}

.window-list-preview {
  padding: 12px;
  spacing: 6px;
  border: none;
  background-color: #${config.colorScheme.palette.base00};
  border-radius: 6px;
  color: #${config.colorScheme.palette.base06};
  box-shadow: 0 3px 5px rgba(0, 0, 0, 0.35), 0 3px 12px rgba(0, 0, 0, 0.16);
}

.grouped-window-list-thumbnail-label {
  padding-left: 4px;
}

.grouped-window-list-thumbnail-alert {
  background-color: rgba(242, 139, 130, 0.5);
}

.grouped-window-list-thumbnail-menu {
  padding: 6px;
}

.grouped-window-list-thumbnail-menu .item-box {
  padding: 6px;
  border-radius: 6px;
  spacing: 6px;
  margin: 1px;
}

.grouped-window-list-thumbnail-menu .item-box:outlined {
  background-color: rgba(242, 213, 207, 0.1);
}

.grouped-window-list-thumbnail-menu .item-box:hover {
  background-color: rgba(242, 213, 207, 0.15);
}

.grouped-window-list-thumbnail-menu .thumbnail {
  width: 256px;
}

.grouped-window-list-thumbnail-menu .separator {
  width: 1px;
  background-color: rgba(242, 213, 207, 0.12);
}

.grouped-window-list-number-label {
  z-index: 120;
  text-shadow: none;
  color: rgba(0, 0, 0, 0.87);
  padding: 0;
}

.grouped-window-list-button-label {
  padding-left: 2px;
}

.grouped-window-list-badge {
  border-radius: 256px;
  background-color: #949cbb;
}

.grouped-window-list-item-box {
  font-weight: normal;
  transition-duration: 100ms;
  border: none;
  margin: 0;
  color: rgba(242, 213, 207, 0.6);
  border-radius: 0;
  spacing: 6px;
  border-bottom: 2px solid transparent;
}

.grouped-window-list-item-box.top,
.grouped-window-list-item-box.bottom {
  padding: 0 2px;
}

.grouped-window-list-item-box:hover {
  color: rgba(242, 213, 207, 0.7);
  background-gradient-direction: none;
  background-color: rgba(242, 213, 207, 0.15);
}

.grouped-window-list-item-box:active {
  color: rgba(242, 213, 207, 0.7);
  background-gradient-direction: none;
  background-color: transparent;
  border-color: rgba(242, 213, 207, 0.3);
}

.grouped-window-list-item-box:active:hover {
  background-color: rgba(242, 213, 207, 0.15);
}

.grouped-window-list-item-box:focus {
  color: rgba(242, 213, 207, 0.7);
  background-gradient-direction: none;
  background-color: rgba(242, 213, 207, 0.2);
  border-color: #949cbb;
}

.grouped-window-list-item-box:focus:hover {
  background-color: rgba(242, 213, 207, 0.3);
}

.grouped-window-list-item-box .progress {
  background-gradient-direction: vertical;
  background-gradient-start: #${config.colorScheme.palette.base0B};
  background-gradient-end: #${config.colorScheme.palette.base0B};
  border-radius: 6px;
  box-shadow: none;
}

.grouped-window-list-item-demands-attention {
  background-gradient-start: #${config.colorScheme.palette.base0A};
  background-gradient-end: #${config.colorScheme.palette.base0A};
}

.sound-button {
  width: 22px;
  height: 13px;
  padding: 8px;
}

.sound-button-container {
  padding-right: 3px;
  padding-left: 3px;
}

.sound-button StIcon {
  icon-size: 1.4em;
}

.sound-track-infos {
  padding: 5px;
}

.sound-track-info {
  padding-top: 2px;
  padding-bottom: 2px;
}

.sound-track-info StIcon {
  icon-size: 16px;
}

.sound-track-info StLabel {
  padding-left: 5px;
  padding-right: 5px;
}

.sound-track-box {
  padding-left: 15px;
  padding-right: 15px;
  max-width: 220px;
}

.sound-seek-box {
  padding-left: 15px;
}

.sound-seek-box StLabel {
  padding-top: 2px;
}

.sound-seek-box StIcon {
  icon-size: 16px;
}

.sound-seek-slider {
  width: 140px;
}

.sound-volume-menu-item {
  padding: 0.4em 1.75em;
}

.sound-volume-menu-item StIcon {
  icon-size: 1.14em;
  padding-left: 8px;
  padding-right: 8px;
}

.sound-playback-control {
  padding: 5px 10px 10px 10px;
}

.sound-player {
  padding: 0 0;
  margin-top: 6px;
  border-radius: 6px;
  background-color: #949cbb;
  color: rgba(0, 0, 0, 0.87);
}

.sound-player > StBoxLayout:first-child {
  padding: 5px 10px 10px 10px;
  spacing: 0.5em;
}

.sound-player > StBoxLayout:first-child StButton:small {
  width: 24px;
  height: 24px;
  border-radius: 9999px;
}

.sound-player > StBoxLayout:first-child StButton:small:hover {
  background-color: rgba(0, 0, 0, 0.12);
}

.sound-player > StBoxLayout:first-child StButton:small:active {
  background-color: rgba(0, 0, 0, 0.26);
}

.sound-player > StBoxLayout:first-child StButton:small StIcon {
  icon-size: 16px;
}

.sound-player-generic-coverart {
  background: rgba(0, 0, 0, 0.2);
}

.sound-player-overlay {
  width: 290px;
  height: 80px;
  padding: 12px 18px;
  spacing: 6px;
  background-color: rgba(0, 0, 0, 0.45);
  border: none;
  border-radius: 0 0 6px 6px;
  color: #${config.colorScheme.palette.base06};
  text-shadow: none;
}

.sound-player-overlay StButton {
  width: 16px;
  height: 16px;
  padding: 8px;
  margin: 0 6px 6px;
  color: #${config.colorScheme.palette.base06};
  border-radius: 9999px;
  border: none;
  text-shadow: none;
}

.sound-player-overlay StButton StIcon {
  icon-size: 16px;
}

.sound-player-overlay StButton:hover {
  background-color: rgba(242, 213, 207, 0.12);
}

.sound-player-overlay StButton:active {
  background-color: rgba(242, 213, 207, 0.3);
}

.sound-player-overlay StButton:insensitive {
  opacty: 0.35;
  color: rgba(242, 213, 207, 0.5);
}

.sound-player-overlay StLabel {
  padding: 0 6px;
}

.sound-player-overlay StBoxLayout {
  padding-top: 2px;
}

.sound-player .slider {
  height: 0.5em;
  padding: 0;
  border: 0px solid rgba(5, 5, 5, 0.9);
  border-bottom: 1px;
  -slider-height: 0.5em;
  -slider-background-color: #${config.colorScheme.palette.base01};
  -slider-border-color: rgba(0, 0, 0, 0);
  -slider-active-background-color: #949cbb;
  -slider-active-border-color: rgba(0, 0, 0, 0);
  -slider-border-width: 0px;
  -slider-handle-radius: 0px;
}

#workspaceSwitcher {
  spacing: 0px;
  padding: 3px;
}

/* Controls the styling when using the "Simple buttons" option */
.workspace-switcher {
  padding-left: 3px;
  padding-right: 3px;
}

.workspace-button {
  width: 20px;
  height: 10px;
  color: rgba(242, 213, 207, 0.7);
  padding: 3px;
  padding-top: 4px;
  transition-duration: 300;
}

.workspace-button:outlined,
.workspace-button:outlined:hover {
  color: #949cbb;
}

.workspace-button:hover {
  color: #${config.colorScheme.palette.base06};
}

/* Controls the style when using the "Visual representation" option */
.workspace-graph {
  padding: 3px;
  spacing: 3px;
}

.workspace-graph .workspace {
  border: 1px solid rgba(0, 0, 0, 0.4);
  background-gradient-direction: none;
  background-color: rgba(0, 0, 0, 0.2);
}

.workspace-graph .workspace:active {
  border: 1px solid #949cbb;
  background-gradient-direction: none;
}

.workspace-graph .workspace .windows {
  -active-window-background: rgba(65, 69, 89, 0.75);
  -active-window-border: rgba(0, 0, 0, 0.8);
  -inactive-window-background: rgba(65, 69, 89, 0.75);
  -inactive-window-border: rgba(0, 0, 0, 0.8);
}

.workspace-graph .workspace:active .windows {
  -active-window-background: rgba(81, 87, 109, 0.75);
  -active-window-border: rgba(0, 0, 0, 0.8);
  -inactive-window-background: rgba(81, 87, 109, 0.5);
  -inactive-window-border: rgba(0, 0, 0, 0.8);
}

#panel-launchers-box {
  padding: 0 6px;
}

#panel-launchers-box.vertical {
  padding: 3px 0;
}

.panel-launcher {
  padding: 2px;
  transition-duration: 200ms;
  border-radius: 0;
}

.panel-launcher:hover {
  background-gradient-direction: none;
  background-color: rgba(242, 213, 207, 0.1);
}

.panel-launcher:active {
  background-color: rgba(242, 213, 207, 0.2);
}

.launcher {
  padding: 2px;
  spacing: 2px;
  transition-duration: 0.2s;
  border-radius: 0;
}

.launcher:hover {
  background-gradient-direction: none;
  background-color: rgba(242, 213, 207, 0.1);
}

.launcher:active {
  background-color: rgba(242, 213, 207, 0.2);
}

.launcher .icon-box {
  padding: 2px;
}

.applet-separator {
  padding: 1px 3px;
}

.applet-separator-line {
  width: 1px;
  background: rgba(242, 213, 207, 0.12);
}

.applet-box {
  padding: 0 6px;
  color: rgba(242, 213, 207, 0.7);
  text-shadow: none;
  transition-duration: 100ms;
  border-radius: 0;
}

.applet-box.vertical {
  padding: 6px 0;
}

.applet-box:hover {
  color: rgba(242, 213, 207, 0.7);
  background-color: rgba(242, 213, 207, 0.15);
}

.applet-box:checked,
.applet-box:checked:hover {
  color: rgba(0, 0, 0, 0.87);
  background-color: #949cbb;
}

.applet-box:highlight {
  background-image: none;
  border-image: none;
  background-color: rgba(242, 139, 130, 0.5);
}

.applet-label {
  font-weight: bold;
  color: rgba(242, 213, 207, 0.7);
}

.applet-box:checked .applet-label {
  color: rgba(0, 0, 0, 0.87);
  text-shadow: none;
}

.applet-icon {
  color: rgba(242, 213, 207, 0.7);
  icon-size: 16px;
}

.applet-box:checked .applet-icon {
  color: rgba(242, 213, 207, 0.7);
  text-shadow: none;
}

.user-icon {
  width: 32px;
  height: 32px;
  background-color: transparent;
  border: none;
  border-radius: 0;
}

.user-label {
  color: #${config.colorScheme.palette.base06};
  font-size: 1em;
  font-weight: bold;
  margin: 0px;
}

.desklet {
  color: #${config.colorScheme.palette.base06};
}

.desklet:highlight {
  background-color: rgba(242, 139, 130, 0.5);
}

.desklet-with-borders {
  color: #${config.colorScheme.palette.base06};
  background-color: rgba(17, 17, 27, 0.9);
  padding: 12px;
  padding-bottom: 16px;
}

.desklet-with-borders:highlight {
  background-color: rgba(242, 139, 130, 0.5);
}

.desklet-with-borders-and-header {
  color: #${config.colorScheme.palette.base06};
  background-color: rgba(17, 17, 27, 0.9);
  border-radius: 6px;
  border-radius-topleft: 0;
  border-radius-topright: 0;
  padding: 12px;
  padding-bottom: 17px;
}

.desklet-with-borders-and-header:highlight {
  background-color: rgba(242, 139, 130, 0.5);
}

.desklet-header {
  color: #${config.colorScheme.palette.base06};
  background-color: rgba(17, 17, 27, 0.9);
  border-radius: 0;
  border-radius-topleft: 6px;
  border-radius-topright: 6px;
  font-size: 1em;
  padding: 12px;
  padding-bottom: 6px;
}

.desklet-drag-placeholder {
  border: 2px solid #${config.colorScheme.palette.base0E};
  background-color: rgba(242, 205, 205, 0.3);
}

.photoframe-box {
  color: #${config.colorScheme.palette.base06};
  background-color: rgba(17, 17, 27, 0.9);
  padding: 12px;
  padding-bottom: 16px;
}

.workspace-osd {
  text-shadow: black 5px 5px 5px;
  font-weight: bold;
  font-size: 48pt;
}

.notification-applet-padding {
  padding: 0.5em 1em;
}

.notification-applet-container {
  max-height: 9999px;
}

.tile-preview,
.tile-preview.snap,
.tile-hud,
.tile-hud.snap {
  background-color: rgba(242, 205, 205, 0.3);
  border: 1px solid #949cbb;
}

.xkcd-box {
  padding: 6px;
  border: 0px;
  background-color: rgba(0, 0, 0, 0);
  border-radius: 0px;
}
  '';
}