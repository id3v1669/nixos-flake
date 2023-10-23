{ config, lib, pkgs, uservars, ... }:
{
  imports = [
		./assets
	];
	home.file.".themes/dynamic-color-theme/gnome-shell/gnome-shell.css".text = ''
/*****************
* Drawing mixins *
*****************/
/* GLOBALS */
stage {
  font-size: 10pt;
  color: #C3C7D1; }

/* WIDGETS */
/* Buttons */
.button {
  color: #C3C7D1;
  background-color: #2c2f3c;
  box-shadow: none;
  border: 1px solid #1b1c24;
  text-shadow: 0 1px black;
  icon-shadow: 0 1px black;
  border-radius: 4px;
  border-width: 0;
  padding: 4px 32px; }
  .button:focus {
    background-color: #353848;
    color: #f8f8f2;
    text-shadow: 0 1px black;
    icon-shadow: 0 1px black;
    box-shadow: none;
    border: 1px solid #1b1c24; }
  .button:insensitive {
    color: #767984;
    background-color: rgba(57, 59, 71, 0.66);
    box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
    border: none;
    text-shadow: none;
    icon-shadow: none; }
  .button:active {
    color: #bd93f9;
    background-color: rgba(40, 42, 54, 0.95);
    border: 1px solid #1b1c24;
    text-shadow: none;
    icon-shadow: none; }
  .button:hover {
    background-color: #353848;
    color: #f8f8f2;
    border: 1px solid #1b1c24;
    text-shadow: 0 1px black;
    icon-shadow: 0 1px black; }

.modal-dialog-linked-button {
  padding: 10px;
  border: 1px solid #1b1c24;
  color: #C3C7D1;
  background: #21232d;
  text-shadow: none;
  icon-shadow: none;
  box-shadow: none; }
  .modal-dialog-linked-button:insensitive {
    color: #767984;
    background-color: rgba(57, 59, 71, 0.66);
    box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
    border: none;
    text-shadow: none;
    icon-shadow: none; }
  .modal-dialog-linked-button:active {
    color: #bd93f9;
    background-color: rgba(40, 42, 54, 0.95);
    border: 1px solid #1b1c24;
    text-shadow: none;
    icon-shadow: none; }
  .modal-dialog-linked-button:focus {
    background-color: #353848;
    color: #f8f8f2;
    text-shadow: 0 1px black;
    icon-shadow: 0 1px black;
    box-shadow: none;
    border: 1px solid #1b1c24; }
    .modal-dialog-linked-button:focus:hover {
      background-color: #353848;
      color: #f8f8f2;
      text-shadow: 0 1px black;
      icon-shadow: 0 1px black;
      box-shadow: none;
      border: 1px solid #1b1c24; }
  .modal-dialog-linked-button:hover {
    background-color: #353848;
    color: #f8f8f2;
    border: 1px solid #1b1c24;
    text-shadow: 0 1px black;
    icon-shadow: 0 1px black; }
  .modal-dialog-linked-button:first-child {
    border-radius: 0px 0px 0px 2px; }
  .modal-dialog-linked-button:last-child {
    border-radius: 0px 0px 2px 0px; }
  .modal-dialog-linked-button:first-child:last-child {
    border-radius: 0px 0px 2px 2px; }

/* Entries */
StEntry {
  background-color: #333545;
  border-color: #1b1c24;
  border-radius: 2px;
  padding: 4px;
  border-width: 0;
  color: #C3C7D1;
  selection-background-color: rgba(189, 147, 249, 0.5);
  selected-color: #f8f8f2; }
  StEntry:focus {
    box-shadow: inset 0px 0px 1px 1px rgba(189, 147, 249, 0.5);
    border-color: rgba(189, 147, 249, 0.5); }
  StEntry:insensitive {
    color: #767984;
    box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1); }
  StEntry StIcon.capslock-warning {
    icon-size: 16px;
    warning-color: #ff9f39;
    padding: 0 4px; }
  StEntry StLabel.hint-text {
    color: rgba(195, 199, 209, 0.7); }

/* Scrollbars */
StScrollView.vfade {
  -st-vfade-offset: 68px; }
StScrollView.hfade {
  -st-hfade-offset: 68px; }

StScrollBar {
  padding: 0; }
  StScrollView StScrollBar {
    min-width: 14px;
    min-height: 14px; }
  StScrollBar StBin#trough {
    border-radius: 0;
    background-color: transparent; }
  StScrollBar StButton#vhandle, StScrollBar StButton#hhandle {
    border-radius: 8px;
    background-color: #474955;
    margin: 3px; }
    StScrollBar StButton#vhandle:hover, StScrollBar StButton#hhandle:hover {
      background-color: #a4a8b2; }
    StScrollBar StButton#vhandle:active, StScrollBar StButton#hhandle:active {
      background-color: rgba(189, 147, 249, 0.5); }

/* Slider */
.slider {
  height: 1em;
  color: #cbcb9f;
  border-color: black;
  -slider-height: 0.1em;
  -slider-background-color: #373a4b;
  -slider-border-color: black;
  -slider-active-background-color: #bd93f9;
  -slider-active-border-color: #50fa7a;
  -slider-border-width: 0;
  -slider-handle-radius: 6px;
  -barlevel-height: 0.1em;
  -barlevel-background-color: #373a4b;
  -barlevel-border-color: black;
  -barlevel-active-background-color: #bd93f9;
  -barlevel-active-border-color: #50fa7a;
  -barlevel-border-width: 0;
  -barlevel-handle-radius: 6px;
  -barlevel-overdrive-color: #bd93f9;
  -barlevel-overdrive-border-color: transparent;
  -barlevel-overdrive-separator-width: 0px; }

/* Check Boxes */
.check-box StBoxLayout {
  spacing: .8em; }
.check-box StBin {
  width: 24px;
  height: 22px;
  background-image: url("assets/checkbox-off.svg"); }
.check-box:focus, .check-box:hover StBin {
  background-image: url("assets/checkbox-off-focused.svg"); }
.check-box:checked StBin {
  background-image: url("assets/checkbox.svg"); }
.check-box:focus:checked StBin {
  background-image: url("assets/checkbox-focused.svg"); }

/* Switches */
.toggle-switch {
  width: 65px;
  height: 22px;
  background-size: contain;
  background-image: url("assets/toggle-off.svg"); }
  .toggle-switch:checked {
    background-image: url("assets/toggle-on.svg"); }

.toggle-switch-us {
  background-image: url("assets/toggle-off.svg"); }
  .toggle-switch-us:checked {
    background-image: url("assets/toggle-on.svg"); }

.toggle-switch-intl {
  background-image: url("assets/toggle-off.svg"); }
  .toggle-switch-intl:checked {
    background-image: url("assets/toggle-on.svg"); }

/* links */
.shell-link {
  color: #A0C1B9; }
  .shell-link:hover {
    color: #bfd5d0; }

/* Modal Dialogs */
.headline {
  font-size: 110%; }

.lightbox {
  background-color: black; }

.flashspot {
  background-color: white; }

.modal-dialog {
  border: none;
  border-radius: 2px;
  color: #C3C7D1;
  background-color: rgba(29, 31, 39, 0.95);
  box-shadow: 0 2px 4px 2px rgba(0, 0, 0, 0.2); }
  .modal-dialog .modal-dialog-content-box {
    padding: 24px; }
  .modal-dialog .run-dialog-entry {
    width: 20em;
    margin-bottom: 6px; }
  .modal-dialog .run-dialog-error-box {
    color: #ff3c3c;
    padding-top: 16px;
    spacing: 6px; }
  .modal-dialog .run-dialog-button-box {
    padding-top: 1em; }
  .modal-dialog .run-dialog-label {
    font-size: 11pt;
    font-weight: bold;
    color: #a6acbb;
    padding-bottom: .4em; }
  .modal-dialog .run-dialog-description {
    color: #C3C7D1; }

.mount-dialog-subject,
.end-session-dialog-subject {
  font-size: 13pt; }

/* Message Dialog */
.message-dialog-main-layout {
  padding: 12px 20px 0;
  spacing: 12px; }

.message-dialog-content {
  max-width: 28em;
  spacing: 20px; }

.message-dialog-icon {
  min-width: 48px;
  icon-size: 48px; }

.message-dialog-title {
  font-weight: bold; }

.message-dialog-subtitle {
  color: #575e71;
  font-weight: bold; }

/* End Session Dialog */
.end-session-dialog {
  spacing: 42px;
  border: none; }
  .end-session-dialog .modal-dialog-linked-button:last-child {
    background-color: #ff5555;
    color: #fff; }
    .end-session-dialog .modal-dialog-linked-button:last-child:hover, .end-session-dialog .modal-dialog-linked-button:last-child:focus {
      background: #ff2c2c;
      color: #fff; }

.end-session-dialog-list {
  padding-top: 20px; }

.end-session-dialog-layout {
  padding-left: 17px; }
  .end-session-dialog-layout:rtl {
    padding-right: 17px; }

.end-session-dialog-description {
  width: 28em;
  padding-bottom: 10px; }
  .end-session-dialog-description:rtl {
    text-align: right; }

.end-session-dialog-warning {
  width: 28em;
  color: #ff9f39;
  padding-top: 6px; }
  .end-session-dialog-warning:rtl {
    text-align: right; }

.end-session-dialog-logout-icon {
  border-radius: 3px;
  width: 48px;
  height: 48px;
  background-size: contain; }

.end-session-dialog-shutdown-icon {
  color: #ff3c3c;
  width: 48px;
  height: 48px; }

.end-session-dialog-inhibitor-layout {
  spacing: 16px;
  max-height: 200px;
  padding-right: 65px;
  padding-left: 65px; }

.end-session-dialog-session-list,
.end-session-dialog-app-list {
  spacing: 1em; }

.end-session-dialog-list-header {
  font-weight: bold; }
  .end-session-dialog-list-header:rtl {
    text-align: right; }

.end-session-dialog-app-list-item,
.end-session-dialog-session-list-item {
  spacing: 1em; }

.end-session-dialog-app-list-item-name,
.end-session-dialog-session-list-item-name {
  font-weight: bold; }

.end-session-dialog-app-list-item-description {
  color: #b5bac6;
  font-size: 10pt; }

/* ShellMountOperation Dialogs */
.shell-mount-operation-icon {
  icon-size: 48px; }

.mount-dialog {
  spacing: 24px; }
  .mount-dialog .message-dialog-title {
    padding-top: 10px;
    padding-left: 17px;
    padding-bottom: 6px;
    max-width: 34em; }
  .mount-dialog .message-dialog-title:rtl {
    padding-left: 0px;
    padding-right: 17px; }
  .mount-dialog .message-dialog-body {
    padding-left: 17px;
    width: 28em; }
  .mount-dialog .message-dialog-body:rtl {
    padding-left: 0px;
    padding-right: 17px; }

.mount-dialog-app-list {
  max-height: 200px;
  padding-top: 24px;
  padding-left: 49px;
  padding-right: 32px; }

.mount-dialog-app-list:rtl {
  padding-right: 49px;
  padding-left: 32px; }

.mount-dialog-app-list-item {
  color: #a6acbb; }
  .mount-dialog-app-list-item:hover {
    color: #C3C7D1; }
  .mount-dialog-app-list-item:ltr {
    padding-right: 1em; }
  .mount-dialog-app-list-item:rtl {
    padding-left: 1em; }

.mount-dialog-app-list-item-icon:ltr {
  padding-right: 17px; }
.mount-dialog-app-list-item-icon:rtl {
  padding-left: 17px; }

.mount-dialog-app-list-item-name {
  font-size: 10pt; }

/* Password or Authentication Dialog */
.prompt-dialog {
  width: 34em;
  border: none;
  border-radius: 2px; }
  .prompt-dialog .message-dialog-main-layout {
    spacing: 24px;
    padding: 10px; }
  .prompt-dialog .message-dialog-content {
    spacing: 16px; }
  .prompt-dialog .message-dialog-title {
    color: #7b849a; }

.prompt-dialog-description:rtl {
  text-align: right; }

.prompt-dialog-password-box {
  spacing: 1em;
  padding-bottom: 1em; }

.prompt-dialog-error-label {
  font-size: 10pt;
  color: #ff3c3c;
  padding-bottom: 8px; }

.prompt-dialog-info-label {
  font-size: 10pt;
  padding-bottom: 8px; }

.hidden {
  color: rgba(0, 0, 0, 0); }

.prompt-dialog-null-label {
  font-size: 10pt;
  padding-bottom: 8px; }

/* Polkit Dialog */
.polkit-dialog-user-layout {
  padding-left: 10px;
  spacing: 10px; }
  .polkit-dialog-user-layout:rtl {
    padding-left: 0px;
    padding-right: 10px; }

.polkit-dialog-user-root-label {
  color: #ff9f39; }

.polkit-dialog-user-icon {
  border-radius: 3px;
  background-size: contain;
  width: 48px;
  height: 48px; }

/* Audio selection dialog */
.audio-device-selection-dialog {
  spacing: 30px; }

.audio-selection-content {
  spacing: 20px;
  padding: 24px; }

.audio-selection-title {
  font-weight: bold;
  text-align: center; }

.audio-selection-box {
  spacing: 20px; }

.audio-selection-device {
  border: 1px solid #C3C7D1;
  border-radius: 12px; }
  .audio-selection-device:active, .audio-selection-device:hover, .audio-selection-device:focus {
    background-color: rgba(189, 147, 249, 0.5); }

.audio-selection-device-box {
  padding: 20px;
  spacing: 20px; }

.audio-selection-device-icon {
  icon-size: 64px; }

/* Access Dialog */
.access-dialog {
  spacing: 30px; }

/* Geolocation Dialog */
.geolocation-dialog {
  spacing: 30px; }

/* Extension Dialog */
.extension-dialog .message-dialog-main-layout {
  spacing: 24px;
  padding: 10px; }
.extension-dialog .message-dialog-title {
  color: #7b849a; }

/* Inhibit-Shortcuts Dialog */
.inhibit-shortcuts-dialog {
  spacing: 30px; }

/* Network Agent Dialog */
.network-dialog-secret-table {
  spacing-rows: 15px;
  spacing-columns: 1em; }

.keyring-dialog-control-table {
  spacing-rows: 15px;
  spacing-columns: 1em; }

/* Popovers/Menus */
.popup-menu {
  min-width: 15em;
  background-color: transparent;
  color: #C3C7D1; }
  .popup-menu .popup-sub-menu {
    background-color: rgba(0, 0, 0, 0.2);
    box-shadow: 0 2px 4px 2px rgba(0, 0, 0, 0.2); }
  .popup-menu .popup-menu-content {
    padding: 16px 0;
    background-color: #282a36;
    border-radius: 7px; }
  .popup-menu .popup-menu-item {
    spacing: 6px;
    padding: 6px; }
    .popup-menu .popup-menu-item:ltr {
      padding-right: 1.75em;
      padding-left: 0; }
    .popup-menu .popup-menu-item:rtl {
      padding-right: 0;
      padding-left: 1.75em; }
    .popup-menu .popup-menu-item:checked {
      background-color: rgba(31, 33, 42, 0.93);
      color: #f8f8f2;
      box-shadow: inset 1px 0px 0px rgba(204, 171, 250, 0.5);
      font-weight: normal; }
      .popup-menu .popup-menu-item:checked:hover {
        background-color: rgba(31, 33, 42, 0.93);
        color: rgba(189, 147, 249, 0.5); }
    .popup-menu .popup-menu-item.selected {
      background-color: rgba(195, 199, 209, 0.1);
      color: #C3C7D1; }
    .popup-menu .popup-menu-item:active {
      background-color: rgba(189, 147, 249, 0.5);
      color: #f8f8f2; }
    .popup-menu .popup-menu-item:insensitive {
      color: rgba(195, 199, 209, 0.5); }
  .popup-menu .popup-inactive-menu-item {
    color: #C3C7D1; }
    .popup-menu .popup-inactive-menu-item:insensitive {
      color: rgba(195, 199, 209, 0.5); }
  .popup-menu.panel-menu {
    -boxpointer-gap: 4px;
    margin-bottom: 1.75em; }

.popup-menu-ornament {
  text-align: right;
  width: 1.2em; }

.popup-menu-boxpointer,
.candidate-popup-boxpointer {
  -arrow-border-radius: 7px;
  -arrow-background-color: #282a36;
  -arrow-border-width: 1px;
  -arrow-border-color: #1b1c24;
  -arrow-base: 24px;
  -arrow-rise: 11px;
  -arrow-box-shadow: 0 1px 3px black; }

.popup-separator-menu-item {
  background: transparent; }
  .popup-separator-menu-item-separator {
    height: 1px;
    margin: 6px 64px;
    background-color: transparent;
    border-color: transparent;
    border-bottom-width: 1px;
    border-bottom-style: solid; }
  .popup-sub-menu .popup-separator-menu-item .popup-separator-menu-item-separator {
    margin: 0 64px 0 32px;
    background: transparent; }

.background-menu {
  -boxpointer-gap: 4px;
  -arrow-rise: 0px; }

/* fallback menu
- odd thing for styling App menu when apparently not running under shell. Light Adwaita styled
  app menu inside the main app window itself rather than the top bar
*/
/* OSD */
.osd-window {
  text-align: center;
  font-weight: bold;
  spacing: 1em;
  margin: 32px;
  min-width: 64px;
  min-height: 64px; }
  .osd-window .osd-monitor-label {
    font-size: 3em; }
  .osd-window .level {
    height: 0.4em;
    border-radius: 0.3em;
    color: #C3C7D1;
    border: 1px solid #1b1c24;
    -barlevel-height: 0.4em;
    -barlevel-background-color: rgba(1, 1, 1, 0.5);
    -barlevel-active-background-color: rgba(189, 147, 249, 0.5);
    -barlevel-overdrive-color: #ff5555;
    -barlevel-overdrive-separator-width: 0.2em; }
  .osd-window .level-bar {
    background-color: rgba(189, 147, 249, 0.5);
    border-radius: 0.3em; }

/* Pad OSD */
.pad-osd-window {
  padding: 32px;
  background-color: rgba(0, 0, 0, 0.8); }
  .pad-osd-window .pad-osd-title-box {
    spacing: 12px; }
  .pad-osd-window .pad-osd-title-menu-box {
    spacing: 6px; }

.combo-box-label {
  width: 15em; }

/* App Switcher */
.switcher-popup {
  padding: 8px;
  spacing: 16px; }

.switcher-list-item-container {
  spacing: 8px; }

.switcher-list .item-box {
  padding: 8px;
  border-radius: 4px; }

.switcher-list .item-box:outlined {
  padding: 6px;
  border: 2px solid #050607; }

.switcher-list .item-box:selected {
  background-color: rgba(189, 147, 249, 0.5);
  color: #f8f8f2; }

.switcher-list .thumbnail-box {
  padding: 2px;
  spacing: 4px; }

.switcher-list .thumbnail {
  width: 256px; }

.switcher-list .separator {
  width: 1px;
  background: #1b1c24; }

.switcher-arrow {
  border-color: rgba(0, 0, 0, 0);
  color: rgba(195, 199, 209, 0.8); }
  .switcher-arrow:highlighted {
    color: #C3C7D1; }

.input-source-switcher-symbol {
  font-size: 34pt;
  width: 96px;
  height: 96px; }

/* Window Cycler */
.cycler-highlight {
  border: 5px solid rgba(189, 147, 249, 0.5); }

/* Workspace Switcher */
.workspace-switcher-group {
  padding: 12px; }

.workspace-switcher {
  background: transparent;
  border: 0px;
  border-radius: 0px;
  padding: 0px;
  spacing: 8px; }

.ws-switcher-active-up,
.ws-switcher-active-down,
.ws-switcher-active-left,
.ws-switcher-active-right {
  height: 50px;
  background-color: rgba(189, 147, 249, 0.5);
  color: #f8f8f2;
  border: none;
  background-size: 32px;
  border-radius: 8px; }

.ws-switcher-active-up {
  background-image: url("assets/ws-switch-arrow-up.png"); }

.ws-switcher-active-down {
  background-image: url("assets/ws-switch-arrow-down.png"); }

.ws-switcher-box {
  height: 50px;
  border: 1px solid rgba(195, 199, 209, 0.1);
  background: rgba(18, 19, 25, 0.95);
  border-radius: 8px; }

.osd-window,
.resize-popup,
.switcher-list, .workspace-switcher-container {
  color: #C3C7D1;
  background-color: rgba(40, 42, 54, 0.95);
  border: 1px solid #1b1c24;
  box-shadow: 0px 0px 7px #1b1c24;
  border-radius: 5px;
  padding: 12px; }

/* Tiled window previews */
.tile-preview {
  background-color: rgba(189, 147, 249, 0.3);
  border: 1px solid rgba(189, 147, 249, 0.5); }

.tile-preview-left.on-primary {
  border-radius: 2px 2px 0 0; }

.tile-preview-right.on-primary {
  border-radius: 0 2px 0 0; }

.tile-preview-left.tile-preview-right.on-primary {
  border-radius: 2px 2px 0 0; }

/* TOP BAR */
#panel {
  background-gradient-direction: none;
  background-color: rgba(40, 42, 54, 0.95);
  /* transition from solid to transparent */
  transition-duration: 500ms;
  font-weight: bold;
  height: 1.86em;
  padding: 0px 0px; }
  #panel.unlock-screen, #panel.login-screen, #panel.lock-screen {
    background-color: transparent; }
  #panel #panelLeft, #panel #panelCenter {
    spacing: 4px; }
  #panel .panel-corner {
    -panel-corner-radius: 0px;
    -panel-corner-background-color: rgba(0, 0, 0, 0.2);
    -panel-corner-border-width: 2px;
    -panel-corner-border-color: transparent; }
    #panel .panel-corner:active, #panel .panel-corner:overview, #panel .panel-corner:focus {
      -panel-corner-border-color: rgba(204, 171, 250, 0.5); }
    #panel .panel-corner.lock-screen, #panel .panel-corner.login-screen, #panel .panel-corner.unlock-screen {
      -panel-corner-radius: 0;
      -panel-corner-background-color: transparent;
      -panel-corner-border-color: transparent; }
  #panel .panel-button {
    -natural-hpadding: 12px;
    -minimum-hpadding: 6px;
    font-weight: bold;
    color: #f8f8f2;
    transition-duration: 100ms; }
    #panel .panel-button .app-menu-icon {
      -st-icon-style: symbolic;
      margin-left: 4px;
      margin-right: 4px; }
    #panel .panel-button .system-status-icon,
    #panel .panel-button .app-menu-icon > StIcon,
    #panel .panel-button .popup-menu-arrow {
      icon-shadow: none; }
    #panel .panel-button:hover {
      background: rgba(62, 65, 83, 0.95);
      color: white;
      transition-duration: 200ms; }
    #panel .panel-button:active, #panel .panel-button:overview, #panel .panel-button:focus, #panel .panel-button:checked {
      box-shadow: none;
      background-gradient-start: rgba(189, 147, 249, 0.5);
      background-gradient-end: rgba(189, 147, 249, 0.5);
      background-gradient-direction: horizontal;
      color: #f8f8f2;
      transition-duration: 200ms; }
      #panel .panel-button:active > .system-status-icon, #panel .panel-button:overview > .system-status-icon, #panel .panel-button:focus > .system-status-icon, #panel .panel-button:checked > .system-status-icon {
        icon-shadow: red 0 2px 2px; }
    #panel .panel-button .system-status-icon {
      icon-size: 1.09em;
      padding: 0 5px; }
    .unlock-screen #panel .panel-button, .login-screen #panel .panel-button, .lock-screen #panel .panel-button {
      color: #e0e2e7; }
      .unlock-screen #panel .panel-button:focus, .unlock-screen #panel .panel-button:hover, .unlock-screen #panel .panel-button:active, .login-screen #panel .panel-button:focus, .login-screen #panel .panel-button:hover, .login-screen #panel .panel-button:active, .lock-screen #panel .panel-button:focus, .lock-screen #panel .panel-button:hover, .lock-screen #panel .panel-button:active {
        color: #e0e2e7; }
    #panel .panel-button.clock-display:active, #panel .panel-button.clock-display:overview, #panel .panel-button.clock-display:focus, #panel .panel-button.clock-display:checked {
      box-shadow: none; }
      #panel .panel-button.clock-display:active .clock, #panel .panel-button.clock-display:overview .clock, #panel .panel-button.clock-display:focus .clock, #panel .panel-button.clock-display:checked .clock {
        box-shadow: none; }
  #panel .panel-status-indicators-box,
  #panel .panel-status-menu-box {
    spacing: 2px; }
  #panel .power-status.panel-status-indicators-box {
    spacing: 0; }
  #panel .screencast-indicator {
    color: #ff9f39; }
  #panel.solid {
    background-color: #282a36;
    /* transition from transparent to solid */
    transition-duration: 300ms; }
    #panel.solid .panel-corner {
      -panel-corner-background-color: black; }
    #panel.solid .system-status-icon,
    #panel.solid .app-menu-icon > StIcon,
    #panel.solid .popup-menu-arrow {
      icon-shadow: none; }

#calendarArea {
  padding: 0.75em 1.0em; }

.calendar {
  margin-bottom: 1em; }

.calendar, .world-clocks-button, .weather-button, .events-button {
  background: transparent;
  border: none; }

.calendar,
.datemenu-today-button,
.datemenu-displays-box,
.message-list-sections {
  margin: 0 1.5em; }

.datemenu-calendar-column {
  spacing: 0.5em; }

.datemenu-displays-section {
  padding-bottom: 3em; }

.datemenu-displays-box {
  spacing: 1em; }

.datemenu-calendar-column {
  border: 0 solid transparent;
  background: #262834; }
  .datemenu-calendar-column:ltr {
    border-left-width: 1px; }
  .datemenu-calendar-column:rtl {
    border-right-width: 1px; }

.datemenu-today-button,
.world-clocks-button,
.weather-button,
.events-section-title,
.message-list-section-title,
.events-button {
  border-radius: 4px;
  color: #C3C7D1;
  padding: .4em; }

.message-list-section-list:ltr {
  padding-left: .4em; }

.message-list-section-list:rtl {
  padding-right: .4em; }

.datemenu-today-button:hover, .datemenu-today-button:focus,
.world-clocks-button:hover,
.world-clocks-button:focus,
.weather-button:hover,
.weather-button:focus,
.events-section-title:hover,
.events-section-title:focus,
.message-list-section-title:hover,
.message-list-section-title:focus,
.events-button:hover,
.events-button:focus {
  background-color: #333545; }
.datemenu-today-button:active,
.world-clocks-button:active,
.weather-button:active,
.events-section-title:active,
.message-list-section-title:active,
.events-button:active {
  color: white;
  background-color: rgba(189, 147, 249, 0.5); }

.datemenu-today-button .date-label {
  font-size: 1.5em; }

.world-clocks-header,
.weather-header,
.events-section-title,
.message-list-section-title,
.events-title {
  color: #a6acbb;
  font-weight: bold; }

.events-button .event-time {
  color: #b7bcc8; }

.world-clocks-grid {
  spacing-rows: 0.4em; }

.weather-box {
  spacing: 0.4em; }

.calendar-month-label {
  color: #b5bac6;
  font-weight: bold;
  padding: 8px 0; }

.pager-button {
  color: white;
  background-color: transparent;
  width: 32px;
  border-radius: 4px; }
  .pager-button:hover, .pager-button:focus {
    background-color: rgba(195, 199, 209, 0.05); }
  .pager-button:active {
    background-color: rgba(40, 42, 54, 0.05); }

.calendar-change-month-back {
  background-image: url("assets/calendar-arrow-left.svg"); }
  .calendar-change-month-back:rtl {
    background-image: url("assets/calendar-arrow-right.svg"); }

.calendar-change-month-forward {
  background-image: url("assets/calendar-arrow-right.svg"); }
  .calendar-change-month-forward:rtl {
    background-image: url("assets/calendar-arrow-left.svg"); }

.calendar-change-month-back StIcon,
.calendar-change-month-forward StIcon {
  color: #b5bac6; }

.calendar-day-base {
  font-size: 80%;
  text-align: center;
  width: 2.4em;
  height: 2.4em;
  padding: 0.1em;
  margin: 2px;
  border-radius: 1.4em;
  color: #C3C7D1; }
  .calendar-day-base:hover, .calendar-day-base:focus {
    background-color: #333545; }
  .calendar-day-base:active, .calendar-day-base:selected {
    color: #f8f8f2;
    background-color: rgba(189, 147, 249, 0.5);
    border-color: transparent; }
  .calendar-day-base.calendar-day-heading {
    color: #a6acbb;
    margin-top: 1em;
    font-size: 70%; }

.calendar-day {
  border-width: 0; }

.calendar-day-top {
  border-top-width: 1px; }

.calendar-day-left {
  border-left-width: 1px; }

.calendar-nonwork-day {
  color: #767984; }

.calendar-today {
  font-weight: bold;
  border: 1px solid rgba(189, 147, 249, 0.5);
  background-color: transparent;
  color: #f8f8f2; }
  .calendar-today:hover, .calendar-today:focus {
    background-color: rgba(198, 161, 250, 0.5);
    color: #f8f8f2; }
  .calendar-today:active, .calendar-today:selected {
    background-color: rgba(189, 147, 249, 0.5);
    color: #f8f8f2; }
    .calendar-today:active:hover, .calendar-today:active:focus, .calendar-today:selected:hover, .calendar-today:selected:focus {
      background-color: rgba(198, 161, 250, 0.5);
      color: #f8f8f2; }

.calendar-day-with-events {
  color: #e0e2e7;
  font-weight: bold;
  background-image: url("assets/calendar-today.svg"); }

.calendar-other-month-day {
  color: #767984;
  opacity: 0.5; }

.calendar-week-number {
  font-size: 70%;
  font-weight: bold;
  width: 2.3em;
  height: 1.8em;
  border-radius: 2px;
  padding: 0.5em 0 0;
  margin: 6px;
  background-color: rgba(195, 199, 209, 0.3);
  color: #282a36; }

/* Message list */
.message-list {
  width: 31.5em; }
  .message-list .message-title {
    color: #babfca; }
  .message-list .message-content, .message-list .message-body {
    color: #b7bcc8; }

.message-list-clear-button.button {
  background: #262834;
  border: 1px solid transparent;
  margin: 1.5em 1.5em 0; }
  .message-list-clear-button.button:hover, .message-list-clear-button.button:focus {
    background-color: #353848;
    color: #f8f8f2;
    border: 1px solid #1b1c24;
    text-shadow: 0 1px black;
    icon-shadow: 0 1px black; }

.message-list-sections {
  spacing: 1em; }

.message-list-section,
.message-list-section-list {
  spacing: 0.4em; }

.message-list-section-close > StIcon {
  icon-size: 16px;
  border-radius: 16px;
  padding: 8px;
  color: #C3C7D1;
  background-color: transparent; }
.message-list-section-close:hover > StIcon, .message-list-section-close:focus > StIcon
.message-list-section-close:active > StIcon {
  color: #ff5555;
  background: transparent; }

.message {
  background: #262834;
  border: 1px solid #1b1c24;
  border-radius: 5px;
  box-shadow: none; }
  .message:hover, .message:focus {
    background-color: #21232d;
    box-shadow: 2px 0px 0px 0px #bd93f9 inset;
    border-radius: 1px 5px 5px 1px; }

.message-close-button {
  color: #C3C7D1; }

.message-icon-bin {
  padding: 10px 3px 10px 10px; }
  .message-icon-bin:rtl {
    padding: 10px 10px 10px 3px; }

.message-icon-bin > StIcon {
  icon-size: 16px;
  -st-icon-style: symbolic; }

.message-secondary-bin {
  padding: 0 12px; }

.message-secondary-bin > .event-time {
  color: #989fb0;
  font-size: 0.7em;
  /* HACK: the label should be baseline-aligned with a 1em label,
           fake this with some bottom padding */
  padding-bottom: 0.13em; }

.message-secondary-bin > StIcon {
  icon-size: 16px; }

.message-content {
  padding: 10px; }
  .message-content *:hover > StIcon,
  .message-content *:focus > StIcon {
    color: #ff5555; }

.message-media-control {
  padding: 12px;
  color: #8991a5; }
  .message-media-control:last-child:ltr {
    padding-right: 18px; }
  .message-media-control:last-child:rtl {
    padding-left: 18px; }
  .message-media-control:hover {
    color: #C3C7D1; }
  .message-media-control:insensitive {
    color: #575e71; }

.media-message-cover-icon {
  icon-size: 48px !important; }
  .media-message-cover-icon.fallback {
    color: #3e4153;
    background-color: #282a36;
    border: 2px solid #282a36;
    border-radius: 2px;
    icon-size: 16px;
    padding: 8px; }

/* World clocks */
.world-clocks-button .world-clocks-city {
  color: #C3C7D1;
  font-weight: normal; }
.world-clocks-button .world-clocks-time {
  font-weight: bold;
  color: #C3C7D1;
  font-feature-settings: "lnum";
  text-align: right; }
.world-clocks-button .world-clocks-timezone {
  color: #8991a5;
  font-feature-settings: "tnum"; }

/* Weather */
.weather-button .weather-header {
  color: #a6acbb;
  font-weight: bold; }
  .weather-button .weather-header.location {
    font-weight: normal; }
.weather-button .weather-forecast-time {
  color: #a6acbb;
  font-feature-settings: "tnum";
  font-weight: normal;
  padding-top: 0.2em;
  padding-bottom: 0.4em; }
.weather-button .weather-forecast-temp {
  font-weight: bold; }

.system-switch-user-submenu-icon.user-icon {
  icon-size: 20px;
  padding: 0 2px; }

.system-switch-user-submenu-icon.default-icon {
  icon-size: 16px;
  padding: 0 4px; }

#appMenu {
  spinner-image: url("assets/process-working.svg");
  spacing: 4px; }
  #appMenu .label-shadow {
    color: transparent; }

.aggregate-menu {
  min-width: 21em; }
  .aggregate-menu .popup-menu-icon {
    padding: 0 4px; }

.system-menu-action {
  color: #C3C7D1;
  border-radius: 32px;
  /* wish we could do 50% */
  border: 1px solid #1b1c24;
  background: #21232d;
  padding: 13px; }
  .system-menu-action:hover, .system-menu-action:focus {
    border: 1px solid rgba(189, 147, 249, 0.5);
    color: rgba(189, 147, 249, 0.5);
    background: transparent; }
  .system-menu-action:active {
    background-color: rgba(159, 99, 246, 0.5);
    color: #f8f8f2;
    border: 1px solid rgba(159, 99, 246, 0.5); }
  .system-menu-action > StIcon {
    icon-size: 16px; }

.ripple-box {
  width: 52px;
  height: 52px;
  background-image: url("assets/corner-ripple-ltr.png");
  background-size: contain; }

.ripple-box:rtl {
  background-image: url("assets/corner-ripple-rtl.png"); }

.popup-menu-arrow {
  width: 16px;
  height: 16px; }

.popup-menu-icon {
  icon-size: 1.09em; }

.window-close {
  background-color: transparent;
  background-image: url("assets/close-window.svg");
  background-size: 32px;
  border: none;
  box-shadow: none;
  color: transparent;
  height: 32px;
  width: 32px; }

.window-close {
  -shell-close-overlap: 16px; }
  .window-close:rtl {
    -st-background-image-shadow: 2px 2px 6px rgba(0, 0, 0, 0.5); }

/* NETWORK DIALOGS */
.nm-dialog {
  max-height: 34em;
  min-height: 31em;
  min-width: 32em; }

.nm-dialog-content {
  spacing: 20px;
  padding: 24px; }

.nm-dialog-header-hbox {
  spacing: 10px; }

.nm-dialog-airplane-box {
  spacing: 12px; }

.nm-dialog-airplane-headline {
  font-weight: bold;
  text-align: center; }

.nm-dialog-airplane-text {
  color: #C3C7D1; }

.nm-dialog-header-icon {
  icon-size: 32px; }

.nm-dialog-scroll-view {
  border: 2px solid #1b1c24;
  background: transparent; }

.nm-dialog-header {
  font-weight: bold; }

.nm-dialog-item {
  font-size: 110%;
  border-bottom: 1px solid #1b1c24;
  padding: 12px;
  spacing: 20px; }

.nm-dialog-item:selected {
  background-color: rgba(189, 147, 249, 0.5);
  color: #f8f8f2; }

.nm-dialog-icons {
  spacing: .5em; }

.nm-dialog-icon {
  icon-size: 16px; }

.no-networks-label {
  color: #999999; }

.no-networks-box {
  spacing: 12px; }

/* OVERVIEW */
#overview {
  spacing: 24px; }

#overview.cosmic-solid-bg {
  background-color: #282a36 !important; }

.overview-controls {
  padding-bottom: 32px; }

.window-picker {
  -horizontal-spacing: 16px;
  -vertical-spacing: 16px;
  padding: 0 16px 16px; }
  .window-picker.external-monitor {
    padding: 16px; }

.window-clone-border {
  border: 1px solid rgba(255, 255, 255, 0);
  border-radius: 0px;
  box-shadow: inset 0 0 0 1px rgba(255, 255, 255, 0.3); }

.window-caption {
  spacing: 20px;
  color: #f8f8f2;
  background-color: rgba(40, 42, 54, 0.65);
  border-radius: 2px;
  padding: 4px 8px; }

.search-entry {
  width: 320px;
  padding: 9px;
  border-radius: 100px;
  border: 1px solid #1b1c24;
  color: #C3C7D1;
  background-color: rgba(40, 42, 54, 0.6);
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1); }
  .search-entry:focus {
    color: #C3C7D1;
    background-color: rgba(40, 42, 54, 0.8);
    box-shadow: 0 1px 2px rgba(0, 0, 0, 0.15); }
  .search-entry .search-entry-icon {
    icon-size: 1em;
    padding: 0 4px;
    color: rgba(195, 199, 209, 0.7); }
  .search-entry:hover, .search-entry:focus {
    background-color: rgba(40, 42, 54, 0.8);
    border-color: rgba(189, 147, 249, 0.3); }
    .search-entry:hover .search-entry-icon, .search-entry:focus .search-entry-icon {
      color: #C3C7D1; }

#searchResultsBin {
  max-width: 1000px; }

#searchResultsContent {
  padding-left: 20px;
  padding-right: 20px;
  spacing: 16px; }

.search-section {
  spacing: 16px; }

.search-section-content {
  background-color: transparent;
  border-radius: 0;
  border: none;
  box-shadow: none;
  spacing: 32px; }

.list-search-results {
  spacing: 3px; }

.search-section-separator {
  height: 2px;
  background-color: rgba(255, 255, 255, 0.2); }

.list-search-result-content {
  spacing: 30px; }

.list-search-result-title {
  color: white;
  spacing: 12px; }

.list-search-result-description {
  color: rgba(255, 255, 255, 0.5); }

.list-search-provider-details {
  width: 150px;
  color: white;
  margin-top: 0.24em; }

.list-search-provider-content {
  spacing: 20px; }

.search-provider-icon {
  padding: 15px; }

/* DASHBOARD */
#dash {
  font-size: 9pt;
  color: #f8f8f2;
  background-color: rgba(40, 42, 54, 0.95);
  padding: 6px 0;
  border: 1px solid #1b1c24;
  border-left: 0px;
  border-radius: 0px 5px 5px 0px; }
  #dash:rtl {
    border-radius: 9px 0 0 9px; }
  #dash .placeholder {
    background-image: url("assets/dash-placeholder.svg");
    background-size: contain;
    height: 24px; }
  #dash .empty-dash-drop-target {
    width: 24px;
    height: 24px; }

.dash-item-container > StWidget {
  padding: 4px 8px; }

.dash-label {
  border-radius: 7px;
  padding: 4px 12px;
  color: #f8f8f2;
  background-color: rgba(40, 42, 54, 0.95);
  text-align: center;
  -x-offset: 8px; }

/* App Vault/Grid */
.icon-grid {
  spacing: 30px;
  -shell-grid-horizontal-item-size: 136px;
  -shell-grid-vertical-item-size: 136px; }
  .icon-grid .overview-icon {
    icon-size: 96px; }

.system-action-icon {
  background-color: black;
  color: white;
  border-radius: 99px;
  icon-size: 48px; }

.app-view-controls {
  padding-bottom: 32px; }

.app-view-control {
  padding: 4px 32px; }
  .app-view-control:checked {
    color: #bd93f9;
    background-color: rgba(40, 42, 54, 0.95);
    border: 1px solid #1b1c24;
    text-shadow: none;
    icon-shadow: none; }
  .app-view-control:first-child {
    border-right-width: 0;
    border-radius: 3px 0 0 3px; }
  .app-view-control:last-child {
    border-radius: 0 3px 3px 0; }

.search-provider-icon:active, .search-provider-icon:checked,
.list-search-result:active,
.list-search-result:checked {
  background-color: rgba(18, 19, 25, 0.85); }
.search-provider-icon:focus, .search-provider-icon:selected, .search-provider-icon:hover,
.list-search-result:focus,
.list-search-result:selected,
.list-search-result:hover {
  background-color: rgba(40, 42, 54, 0.3);
  transition-duration: 200ms; }

.app-well-app,
.app-well-app.app-folder,
.show-apps,
.grid-search-result {
  border: none; }
  .app-well-app:active .overview-icon, .app-well-app:checked .overview-icon,
  .app-well-app.app-folder:active .overview-icon,
  .app-well-app.app-folder:checked .overview-icon,
  .show-apps:active .overview-icon,
  .show-apps:checked .overview-icon,
  .grid-search-result:active .overview-icon,
  .grid-search-result:checked .overview-icon {
    background-color: rgba(25, 26, 33, 0.85);
    box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.15);
    color: #C3C7D1; }
  .app-well-app:hover .overview-icon, .app-well-app:focus .overview-icon, .app-well-app:selected .overview-icon,
  .app-well-app.app-folder:hover .overview-icon,
  .app-well-app.app-folder:focus .overview-icon,
  .app-well-app.app-folder:selected .overview-icon,
  .show-apps:hover .overview-icon,
  .show-apps:focus .overview-icon,
  .show-apps:selected .overview-icon,
  .grid-search-result:hover .overview-icon,
  .grid-search-result:focus .overview-icon,
  .grid-search-result:selected .overview-icon {
    background-color: rgba(40, 42, 54, 0.5);
    transition-duration: 0ms;
    border-image: none;
    background-image: none; }

.app-well-app-running-dot {
  width: 4px;
  height: 4px;
  background-color: rgba(189, 147, 249, 0.5);
  border-radius: 10px !important;
  box-shadow: 0px 0px 5px 4px rgba(189, 147, 249, 0.8);
  margin-bottom: 0px; }

.search-provider-icon,
.list-search-result, .app-well-app .overview-icon,
.app-well-app.app-folder .overview-icon,
.show-apps .overview-icon,
.grid-search-result .overview-icon {
  color: #f8f8f2;
  border-radius: 2px;
  padding: 7px 6px;
  border: none;
  transition-duration: 100ms;
  text-align: center;
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1); }

.app-well-app.app-folder > .overview-icon {
  background-color: rgba(40, 42, 54, 0.35); }

.show-apps .show-apps-icon {
  color: #f8f8f2; }

.show-apps:checked .show-apps-icon,
.show-apps:focus .show-apps-icon {
  color: #C3C7D1;
  transition-duration: 100ms; }

.app-folder-popup {
  -arrow-border-radius: 8px;
  -arrow-background-color: rgba(40, 42, 54, 0.5);
  -arrow-base: 24px;
  -arrow-rise: 11px; }

.app-folder-popup-bin {
  padding: 5px;
  background: rgba(40, 42, 54, 0.5); }

.app-folder-icon {
  padding: 5px;
  spacing-rows: 5px;
  spacing-columns: 5px; }

.page-indicator {
  padding: 15px 20px; }
  .page-indicator .page-indicator-icon {
    width: 12px;
    height: 12px;
    border-radius: 12px;
    background-image: none;
    background-color: rgba(255, 255, 255, 0.3);
    border: none; }
  .page-indicator:hover .page-indicator-icon {
    background-image: none;
    background-color: rgba(255, 255, 255, 0.5); }
  .page-indicator:active .page-indicator-icon {
    background-image: none;
    background-color: rgba(255, 255, 255, 0.7);
    margin: 0; }
  .page-indicator:checked .page-indicator-icon {
    background-image: none;
    background-color: #FFFFFF;
    transition-duration: 0.3s;
    transition-timing-function: ease-in-out; }

.app-well-app > .overview-icon.overview-icon-with-label,
.grid-search-result .overview-icon.overview-icon-with-label {
  padding: 10px 8px 5px 8px;
  spacing: 4px; }

.workspace-thumbnails {
  visible-width: 32px;
  spacing: 11px;
  padding: 8px;
  border-radius: 0; }
  .workspace-thumbnails:rtl {
    border-radius: 0; }

.workspace-thumbnail-indicator {
  border: 4px solid rgba(189, 147, 249, 0.4);
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
  padding: 0; }

.search-display > StBoxLayout,
.all-apps,
.frequent-apps > StBoxLayout {
  padding: 0px 88px 10px 88px; }

.workspace-thumbnails {
  color: #C3C7D1;
  background-color: transparent;
  border: none; }

.search-statustext, .no-frequent-applications-label {
  font-size: 2em;
  font-weight: bold;
  color: #C3C7D1; }

/* NOTIFICATIONS & MESSAGE TRAY */
.url-highlighter {
  link-color: rgba(219, 195, 252, 0.5); }

.notification-banner {
  font-size: 11pt;
  width: 34em;
  margin: 5px;
  border-radius: 3px;
  color: #f8f8f2;
  background-color: #282a36;
  border: 1px solid #1b1c24;
  box-shadow: 0 1px 4px black; }
  .notification-banner:hover {
    background-color: rgba(40, 42, 54, 0.96); }
  .notification-banner:focus {
    background-color: rgba(40, 42, 54, 0.96); }
  .notification-banner * {
    color: #fefefe; }
  .notification-banner .notification-icon {
    padding: 5px; }
  .notification-banner .notification-content {
    padding: 5px;
    spacing: 5px; }
  .notification-banner .secondary-icon {
    icon-size: 1.09em; }
  .notification-banner .notification-actions {
    background-color: #242530;
    padding-top: 2px;
    spacing: 1px; }
  .notification-banner .notification-button {
    padding: 5px;
    background-color: rgba(40, 42, 54, 0.9);
    box-shadow: none; }
    .notification-banner .notification-button:first-child {
      border-radius: 0 0 0 3px; }
    .notification-banner .notification-button:last-child {
      border-radius: 0 0 3px 0; }
    .notification-banner .notification-button:hover, .notification-banner .notification-buttonfocus {
      background-color: #242530;
      color: rgba(189, 147, 249, 0.5); }

.summary-source-counter {
  font-size: 10pt;
  font-weight: bold;
  height: 1.6em;
  width: 1.6em;
  -shell-counter-overlap-x: 3px;
  -shell-counter-overlap-y: 3px;
  background-color: rgba(189, 147, 249, 0.5);
  color: #f8f8f2;
  border: 2px solid #C3C7D1;
  box-shadow: 0 2px 2px rgba(0, 0, 0, 0.5);
  border-radius: 0.9em; }

.secondary-icon {
  icon-size: 1.09em; }

.chat-body {
  spacing: 5px; }

.chat-response {
  margin: 5px; }

.chat-log-message {
  color: #a6acbb; }

.chat-new-group {
  padding-top: 1em; }

.chat-received {
  padding-left: 4px; }
  .chat-received:rtl {
    padding-left: 0px;
    padding-right: 4px; }

.chat-sent {
  padding-left: 18pt;
  color: #989fb0; }
  .chat-sent:rtl {
    padding-left: 0;
    padding-right: 18pt; }

.chat-meta-message {
  padding-left: 4px;
  font-size: 9pt;
  font-weight: bold;
  color: #8991a5; }
  .chat-meta-message:rtl {
    padding-left: 0;
    padding-right: 4px; }

.hotplug-transient-box {
  spacing: 6px;
  padding: 2px 72px 2px 12px; }

.hotplug-notification-item {
  padding: 2px 10px; }
  .hotplug-notification-item:focus {
    padding: 1px 71px 1px 11px; }

.hotplug-notification-item-icon {
  icon-size: 24px;
  padding: 2px 5px; }

.hotplug-resident-box {
  spacing: 8px; }

.hotplug-resident-mount {
  spacing: 8px;
  border-radius: 4px; }
  .hotplug-resident-mount:hover {
    background-color: rgba(40, 42, 54, 0.3); }

.hotplug-resident-mount-label {
  color: inherit;
  padding-left: 6px; }

.hotplug-resident-mount-icon {
  icon-size: 24px;
  padding-left: 6px; }

.hotplug-resident-eject-icon {
  icon-size: 16px; }

.hotplug-resident-eject-button {
  padding: 7px;
  border-radius: 5px;
  color: pink; }

/* Eeeky things */
.magnifier-zoom-region {
  border: 2px solid rgba(189, 147, 249, 0.5); }
  .magnifier-zoom-region.full-screen {
    border-width: 0; }

/* On-screen Keyboard */
#keyboard {
  background-color: rgba(40, 42, 54, 0.65); }

.keyboard-layout {
  spacing: 10px;
  padding: 10px; }

.keyboard-row {
  spacing: 15px; }

.keyboard-key {
  color: #C3C7D1;
  background-color: #2c2f3c;
  box-shadow: none;
  border: 1px solid #1b1c24;
  text-shadow: 0 1px black;
  icon-shadow: 0 1px black;
  background-color: #282a36;
  min-height: 2em;
  min-width: 2em;
  font-size: 14pt;
  font-weight: bold;
  border-radius: 5px; }
  .keyboard-key:focus {
    background-color: #353848;
    color: #f8f8f2;
    text-shadow: 0 1px black;
    icon-shadow: 0 1px black;
    box-shadow: none;
    border: 1px solid #1b1c24; }
  .keyboard-key:hover, .keyboard-key:checked {
    background-color: #353848;
    color: #f8f8f2;
    border: 1px solid #1b1c24;
    text-shadow: 0 1px black;
    icon-shadow: 0 1px black; }
  .keyboard-key:active {
    color: #bd93f9;
    background-color: rgba(40, 42, 54, 0.95);
    border: 1px solid #1b1c24;
    text-shadow: none;
    icon-shadow: none; }
  .keyboard-key:grayed {
    background-color: rgba(40, 42, 54, 0.95);
    color: #C3C7D1;
    border-color: rgba(0, 0, 0, 0.7); }

.keyboard-subkeys {
  color: white;
  padding: 5px;
  -arrow-border-radius: 10px;
  -arrow-background-color: rgba(40, 42, 54, 0.65);
  -arrow-border-width: 2px;
  -arrow-border-color: #C3C7D1;
  -arrow-base: 20px;
  -arrow-rise: 10px;
  -boxpointer-gap: 5px; }

.candidate-popup-content {
  padding: 0.5em;
  spacing: 0.3em; }

.candidate-index {
  padding: 0 0.5em 0 0;
  color: #a6acbb; }

.candidate-box {
  padding: 0.3em 0.5em 0.3em 0.5em;
  border-radius: 4px; }
  .candidate-box:selected, .candidate-box:hover {
    background-color: rgba(189, 147, 249, 0.5);
    color: #f8f8f2; }

.candidate-page-button-box {
  height: 2em; }
  .vertical .candidate-page-button-box {
    padding-top: 0.5em; }
  .horizontal .candidate-page-button-box {
    padding-left: 0.5em; }

.candidate-page-button {
  padding: 4px; }

.candidate-page-button-previous {
  border-radius: 4px 0px 0px 4px;
  border-right-width: 0; }

.candidate-page-button-next {
  border-radius: 0px 4px 4px 0px; }

.candidate-page-button-icon {
  icon-size: 1em; }

/* Auth Dialogs & Screen Shield */
.framed-user-icon {
  background-size: contain;
  border: 2px solid #C3C7D1;
  color: #C3C7D1;
  border-radius: 3px; }
  .framed-user-icon:hover {
    border-color: white;
    color: white; }

.login-dialog-banner-view {
  padding-top: 24px;
  max-width: 23em; }

.login-dialog {
  border: none;
  background-color: transparent; }
  .login-dialog .modal-dialog-button-box {
    spacing: 3px; }
  .login-dialog .modal-dialog-button {
    padding: 3px 18px; }
    .login-dialog .modal-dialog-button:default {
      color: #C3C7D1;
      background-color: #2c2f3c;
      box-shadow: none;
      border: 1px solid #1b1c24;
      text-shadow: 0 1px black;
      icon-shadow: 0 1px black; }
      .login-dialog .modal-dialog-button:default:hover, .login-dialog .modal-dialog-button:default:focus {
        background-color: #353848;
        color: #f8f8f2;
        border: 1px solid #1b1c24;
        text-shadow: 0 1px black;
        icon-shadow: 0 1px black; }
      .login-dialog .modal-dialog-button:default:active {
        color: #bd93f9;
        background-color: rgba(189, 147, 249, 0.5);
        border: 1px solid #1b1c24;
        text-shadow: none;
        icon-shadow: none; }
      .login-dialog .modal-dialog-button:default:insensitive {
        color: #767984;
        background-color: rgba(57, 59, 71, 0.66);
        box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
        border: none;
        text-shadow: none;
        icon-shadow: none; }

.login-dialog-logo-bin {
  padding: 24px 0px; }

.login-dialog-banner {
  color: #a6acbb; }

.login-dialog-button-box {
  spacing: 5px; }

.login-dialog-message-warning {
  color: #ff9f39; }

.login-dialog-message-hint {
  padding-top: 0;
  padding-bottom: 20px; }

.login-dialog-user-selection-box {
  padding: 100px 0px; }

.login-dialog-not-listed-label {
  padding-left: 2px; }
  .login-dialog-not-listed-button:focus .login-dialog-not-listed-label, .login-dialog-not-listed-button:hover .login-dialog-not-listed-label {
    color: #C3C7D1; }

.login-dialog-not-listed-label {
  font-size: 90%;
  font-weight: bold;
  color: #6d768e;
  padding-top: 1em; }

.login-dialog-user-list-view {
  -st-vfade-offset: 1em; }

.login-dialog-user-list {
  spacing: 12px;
  padding: .2em;
  width: 23em; }
  .login-dialog-user-list:expanded .login-dialog-user-list-item:selected {
    background-color: rgba(189, 147, 249, 0.5);
    color: #f8f8f2; }
  .login-dialog-user-list:expanded .login-dialog-user-list-item:logged-in {
    border-right: 2px solid rgba(189, 147, 249, 0.5); }

.login-dialog-user-list-item {
  border-radius: 5px;
  padding: .2em;
  color: #6d768e; }
  .login-dialog-user-list-item:ltr {
    padding-right: 1em; }
  .login-dialog-user-list-item:rtl {
    padding-left: 1em; }
  .login-dialog-user-list-item .login-dialog-timed-login-indicator {
    height: 2px;
    margin: 2px 0 0 0;
    background-color: #C3C7D1; }
  .login-dialog-user-list-item:focus .login-dialog-timed-login-indicator {
    background-color: #f8f8f2; }

.login-dialog-username,
.user-widget-label {
  color: #C3C7D1;
  font-size: 120%;
  font-weight: bold;
  text-align: left;
  padding-left: 15px; }

.user-widget-label:ltr {
  padding-left: 18px; }
.user-widget-label:rtl {
  padding-right: 18px; }

.login-dialog-prompt-layout {
  padding-top: 24px;
  padding-bottom: 12px;
  spacing: 8px;
  width: 23em; }

.login-dialog-prompt-label {
  color: #8991a5;
  font-size: 110%;
  padding-top: 1em; }

.login-dialog-session-list-button StIcon {
  icon-size: 1.25em; }

.login-dialog-session-list-button {
  color: #6d768e; }
  .login-dialog-session-list-button:hover, .login-dialog-session-list-button:focus {
    color: #C3C7D1; }
  .login-dialog-session-list-button:active {
    color: #414654; }

.screen-shield-arrows {
  padding-bottom: 3em; }

.screen-shield-arrows Gjs_Arrow {
  color: white;
  width: 80px;
  height: 48px;
  -arrow-thickness: 12px;
  -arrow-shadow: 0 1px 1px rgba(0, 0, 0, 0.4); }

.screen-shield-clock {
  color: white;
  text-shadow: 0px 1px 2px rgba(0, 0, 0, 0.6);
  font-weight: bold;
  text-align: center;
  padding-bottom: 1.5em; }

.screen-shield-clock-time {
  font-size: 72pt;
  text-shadow: 0px 2px 2px rgba(0, 0, 0, 0.4); }

.screen-shield-clock-date {
  font-size: 28pt; }

.screen-shield-notifications-container {
  spacing: 6px;
  width: 30em;
  background-color: transparent;
  max-height: 500px; }
  .screen-shield-notifications-container .summary-notification-stack-scrollview {
    padding-top: 0;
    padding-bottom: 0; }
  .screen-shield-notifications-container .notification,
  .screen-shield-notifications-container .screen-shield-notification-source {
    padding: 12px 6px;
    border: 1px solid #C3C7D1;
    background-color: rgba(40, 42, 54, 0.45);
    color: #C3C7D1;
    border-radius: 4px; }
  .screen-shield-notifications-container .notification {
    margin-right: 15px; }

.screen-shield-notification-label {
  font-weight: bold;
  padding: 0px 0px 0px 12px; }

.screen-shield-notification-count-text {
  padding: 0px 0px 0px 12px; }

#panel.lock-screen {
  background-color: rgba(40, 42, 54, 0.45); }

.screen-shield-background {
  background: black;
  box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.4); }

#lockDialogGroup {
  background: #2e3436 url(resource:///org/gnome/shell/theme/noise-texture.png);
  background-repeat: repeat; }

#screenShieldNotifications StButton#vhandle, #screenShieldNotifications StButton#hhandle {
  background-color: rgba(40, 42, 54, 0.3); }
  #screenShieldNotifications StButton#vhandle:hover, #screenShieldNotifications StButton#vhandle:focus, #screenShieldNotifications StButton#hhandle:hover, #screenShieldNotifications StButton#hhandle:focus {
    background-color: rgba(40, 42, 54, 0.5); }
  #screenShieldNotifications StButton#vhandle:active, #screenShieldNotifications StButton#hhandle:active {
    background-color: rgba(189, 147, 249, 0.4); }

#LookingGlassDialog {
  background-color: rgba(0, 0, 0, 0.8);
  spacing: 4px;
  padding: 4px;
  border: 2px solid grey;
  border-radius: 4px; }
  #LookingGlassDialog > #Toolbar {
    border: 1px solid grey;
    border-radius: 4px; }
  #LookingGlassDialog .labels {
    spacing: 4px; }
  #LookingGlassDialog .notebook-tab {
    -natural-hpadding: 12px;
    -minimum-hpadding: 6px;
    font-weight: bold;
    color: #ccc;
    transition-duration: 100ms;
    padding-left: .3em;
    padding-right: .3em; }
    #LookingGlassDialog .notebook-tab:hover {
      color: white;
      text-shadow: black 0px 2px 2px; }
    #LookingGlassDialog .notebook-tab:selected {
      border-bottom-width: 2px;
      border-color: rgba(204, 171, 250, 0.5);
      color: white;
      text-shadow: black 0px 2px 2px; }
  #LookingGlassDialog StBoxLayout#EvalBox {
    padding: 4px;
    spacing: 4px; }
  #LookingGlassDialog StBoxLayout#ResultsArea {
    spacing: 4px; }

.lg-dialog StEntry {
  selection-background-color: #bbbbbb;
  selected-color: #333333; }
.lg-dialog .shell-link {
  color: #999999; }
  .lg-dialog .shell-link:hover {
    color: #dddddd; }

.lg-completions-text {
  font-size: .9em;
  font-style: italic; }

.lg-obj-inspector-title {
  spacing: 4px; }

.lg-obj-inspector-button {
  border: 1px solid gray;
  padding: 4px;
  border-radius: 4px; }
  .lg-obj-inspector-button:hover {
    border: 1px solid #ffffff; }

#lookingGlassExtensions {
  padding: 4px; }

.lg-extensions-list {
  padding: 4px;
  spacing: 6px; }

.lg-extension {
  border: 1px solid #6f6f6f;
  border-radius: 4px;
  padding: 4px; }

.lg-extension-name {
  font-weight: bold; }

.lg-extension-meta {
  spacing: 6px; }

#LookingGlassPropertyInspector {
  background: rgba(0, 0, 0, 0.8);
  border: 2px solid grey;
  border-radius: 4px;
  padding: 6px; }

.openweather-current-summarybox,
.openweather-forecast-icon,
.openweather-current-databox-captions,
.openweather-current-databox-values,
.openweather-current-icon,
.openweather-forecast-summary,
.openweather-forecast-temperature {
  background: transparent; }

.openweather-current-databox-captions, .openweather-forecast-day {
  color: rgba(189, 147, 249, 0.5); }

#dashtodockContainer #dash {
  background: transparent !important; }
  #dashtodockContainer #dash .dash-background {
    background: #21232d !important;
    border: none; }
  #dashtodockContainer #dash .dash-item-container .app-well-app .overview-icon.focused .overview-icon,
  #dashtodockContainer #dash .dash-item-container .show-apps .overview-icon.focused .overview-icon {
    background-color: #373a4b !important; }

/* Pop_OS COSMIC Dock styling, append !important to any changed rules */
.cosmic-dock #dock {
  border-radius: 12px 12px 12px 12px !important;
  border: 0 !important;
  background-color: #21232d;
  margin: 4px !important; }

.cosmic-dock.extended #dock {
  border-radius: 0px !important;
  margin: 0 !important; }

.cosmic-dock.extended.side #dock {
  border-top-width: 0 !important;
  border-bottom-width: 0 !important; }

.cosmic-dock.extended.side.left #dock {
  border-left-width: 0 !important; }

.cosmic-dock.extended.side.right #dock {
  border-right-width: 0 !important; }

.cosmic-dock.extended.bottom #dock {
  border-bottom-width: 0 !important;
  border-left-width: 0 !important;
  border-right-width: 0 !important; }

.cosmic-dock .app-well-app:hover .overview-icon, .cosmic-dock .app-well-app:focus .overview-icon, .cosmic-dock .app-well-app:selected .overview-icon {
  border-radius: 11px; }

/*# sourceMappingURL=gnome-shell.css.map */

	'';
}