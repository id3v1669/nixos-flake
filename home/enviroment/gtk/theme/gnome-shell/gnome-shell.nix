{ config, lib, pkgs, uservars, ... }:
{
	home.file.".themes/dynamic-color-theme/gnome-shell/gnome-shell.css".text = ''
.message-list .message-list-placeholder {
  font-weight: 800;
  font-size: 15pt;
}

.quick-toggle-menu .header .title {
  font-weight: 700;
  font-size: 15pt;
}

.quick-toggle-menu .header .subtitle {
  font-weight: 700;
  font-size: 9pt;
}

.icon-label-button-container {
  font-weight: 400;
  font-size: 9pt;
}

.ripple-pointer-location {
  width: 48px;
  height: 48px;
  border-radius: 24px;
  background-color: rgba(242, 213, 207, 0.3);
  box-shadow: 0 0 2px 2px #${config.colorScheme.colors.base06};
}

.pie-timer {
  width: 60px;
  height: 60px;
  -pie-border-width: 3px;
  -pie-border-color: #${config.colorScheme.colors.base0F};
  -pie-background-color: rgba(242, 213, 207, 0.3);
}

.magnifier-zoom-region {
  border: 2px solid #${config.colorScheme.colors.base0F};
}

.magnifier-zoom-region.full-screen {
  border-width: 0;
}

/* App Icons */
.show-apps .show-apps-icon {
  color: transparent;
  background-image: url('assets/applogo.svg');
  background-size: contain;
  border-radius: 6px;
  padding: 2px 4px;
}

.show-apps .overview-icon,
.app-well-app .overview-icon,
.grid-search-result .overview-icon {
  color: #${config.colorScheme.colors.base06};
  border-radius: 9px;
  padding: 6px;
  border: none;
  transition-duration: 100ms;
  text-align: center;
}

.show-apps:hover .overview-icon,
.show-apps:focus .overview-icon,
.show-apps:selected .overview-icon,
.app-well-app:hover .overview-icon,
.app-well-app:focus .overview-icon,
.app-well-app:selected .overview-icon,
.grid-search-result:hover .overview-icon,
.grid-search-result:focus .overview-icon,
.grid-search-result:selected .overview-icon {
  color: #${config.colorScheme.colors.base09};
  background-color: rgba(65, 69, 89, 0.65);
  border-image: none;
  background-image: none;
}

.show-apps:active .overview-icon,
.show-apps:checked .overview-icon,
.app-well-app:active .overview-icon,
.app-well-app:checked .overview-icon,
.grid-search-result:active .overview-icon,
.grid-search-result:checked .overview-icon {
  background-color: rgba(65, 69, 89, 1);
  box-shadow: none;
}

.app-well-app.app-folder {
  background-color: rgba(65, 69, 89, 0.65);
  border-radius: 12px;
}

.app-well-app.app-folder .overview-icon {
  background-color: transparent;
  border-radius: 12px;
}

.app-well-app.app-folder:hover {
  background-color: rgba(65, 69, 89, 1);
}

.app-well-app.app-folder:active {
  background-color: rgba(242, 213, 207, 0.3);
}

.app-folder-dialog {
  border-radius: 36px;
  padding: 12px;
  background-color: rgba(48, 52, 70, 0.95);
  border: 1px solid rgba(13, 185, 215, 0.55);
  box-shadow: inset 0 0 0 1px rgba(13, 185, 215, 0.2);
}

.app-folder-dialog .folder-name-container {
  padding: 24px 36px 0;
  spacing: 12px;
}

.app-folder-dialog .folder-name-container .folder-name-label,
.app-folder-dialog .folder-name-container .folder-name-entry {
  font-size: 18pt;
  font-weight: bold;
}

.app-folder-dialog .folder-name-container .folder-name-entry {
  width: 300px;
  border: 2px solid transparent;
}

.app-folder-dialog .folder-name-container .folder-name-label {
  padding: 9px 8px;
  color: rgba(242, 213, 207, 0.7);
}

.app-folder-dialog .folder-name-container .edit-folder-button {
  background-color: rgba(242, 213, 207, 0.06);
  color: rgba(242, 213, 207, 0.7);
  border: none;
  padding: 0;
  width: 36px;
  height: 36px;
  border-radius: 9999px;
}

.app-folder-dialog .folder-name-container .edit-folder-button > StIcon {
  icon-size: 16px;
}

.app-folder-dialog .folder-name-container .edit-folder-button:hover {
  background-color: rgba(242, 213, 207, 0.12);
}

.app-folder-dialog .folder-name-container .edit-folder-button:checked,
.app-folder-dialog .folder-name-container .edit-folder-button:active {
  background-color: #${config.colorScheme.colors.base06};
  color: rgba(0, 0, 0, 0.87);
}

.app-folder-dialog .icon-grid {
  row-spacing: 12px;
  column-spacing: 24px;
  page-padding-top: 0;
  page-padding-bottom: 0;
  page-padding-left: 0;
  page-padding-right: 0;
}

.app-folder-dialog .page-indicators {
  margin-bottom: 18px;
}

.app-folder-dialog-container {
  padding: 0;
  width: 620px;
  height: 620px;
}

.app-well-app-running-dot {
  width: 6px;
  height: 3px;
  border-radius: 2px;
  background-color: rgba(242, 213, 207, 0.3);
  margin-bottom: 0;
}

StWidget.focused .app-well-app-running-dot {
  width: 24px;
  background-color: #${config.colorScheme.colors.base06} !important;
}

.app-menu,
.app-well-menu {
  max-width: 27.25em;
}

.rename-folder-popup .rename-folder-popup-item {
  spacing: 6px;
}

.rename-folder-popup .rename-folder-popup-item:ltr,
.rename-folder-popup .rename-folder-popup-item:rtl {
  padding: 0 12px;
}

.system-action-icon {
  box-shadow: 0 4px 4px rgba(0, 0, 0, 0.2);
  background-color: rgba(48, 52, 70, 0.95);
  color: #${config.colorScheme.colors.base06};
  border-radius: 9999px;
  icon-size: 48px;
}

.shell-link {
  border-radius: 6px;
  color: #85c1dc;
}

.shell-link:hover {
  color: #85c1dc;
  background-color: rgba(133, 193, 220, 0.15);
}

.shell-link:active {
  color: #85c1dc;
  background-color: rgba(133, 193, 220, 0.25);
}

.lowres-icon {
  icon-shadow: 0 1px 2px rgba(0, 0, 0, 0.3);
}

.icon-dropshadow {
  icon-shadow: 0 1px 5px rgba(0, 0, 0, 0.8);
}

/* Buttons */
.hotplug-notification-item,
.icon-button,
.button {
  color: #${config.colorScheme.colors.base06};
  background-color: rgba(41, 44, 60, 0.95);
  box-shadow: none !important;
}

.hotplug-notification-item:focus,
.icon-button:focus,
.button:focus {
  color: #${config.colorScheme.colors.base06};
  background-color: rgba(242, 213, 207, 0.08);
  box-shadow: none !important;
}

.hotplug-notification-item:hover,
.icon-button:hover,
.button:hover {
  color: #${config.colorScheme.colors.base06};
  background-color: rgba(242, 213, 207, 0.12);
  box-shadow: none !important;
}

.hotplug-notification-item:active,
.icon-button:active,
.button:active {
  color: #${config.colorScheme.colors.base06};
  background-color: rgba(242, 213, 207, 0.2);
  box-shadow: none !important;
}

.hotplug-notification-item:insensitive,
.icon-button:insensitive,
.button:insensitive {
  color: rgba(242, 213, 207, 0.35);
  background-color: rgba(41, 44, 60, 0.95);
  box-shadow: none !important;
}

.lg-obj-inspector-button,
#LookingGlassDialog > #Toolbar .lg-toolbar-button,
.candidate-page-button,
.modal-dialog-linked-button,
.popup-menu .button {
  color: #${config.colorScheme.colors.base06};
  background-color: transparent;
  box-shadow: none !important;
}

.lg-obj-inspector-button:focus,
#LookingGlassDialog > #Toolbar .lg-toolbar-button:focus,
.candidate-page-button:focus,
.modal-dialog-linked-button:focus,
.popup-menu .button:focus {
  color: #${config.colorScheme.colors.base06};
  background-color: rgba(242, 213, 207, 0.08);
  box-shadow: none !important;
}

.lg-obj-inspector-button:hover,
#LookingGlassDialog > #Toolbar .lg-toolbar-button:hover,
.candidate-page-button:hover,
.modal-dialog-linked-button:hover,
.popup-menu .button:hover {
  color: #${config.colorScheme.colors.base06};
  background-color: rgba(242, 213, 207, 0.12);
}

.lg-obj-inspector-button:active,
#LookingGlassDialog > #Toolbar .lg-toolbar-button:active,
.candidate-page-button:active,
.modal-dialog-linked-button:active,
.popup-menu .button:active {
  color: #${config.colorScheme.colors.base06};
  background-color: rgba(242, 213, 207, 0.2);
  box-shadow: none !important;
}

.lg-obj-inspector-button:insensitive,
#LookingGlassDialog > #Toolbar .lg-toolbar-button:insensitive,
.candidate-page-button:insensitive,
.modal-dialog-linked-button:insensitive,
.popup-menu .button:insensitive {
  background-color: transparent;
  color: rgba(242, 213, 207, 0.35);
  box-shadow: none !important;
}

.screenshot-ui-show-pointer-button,
.screenshot-ui-type-button,
.login-dialog .cancel-button,
.login-dialog .switch-user-button,
.login-dialog .login-dialog-session-list-button,
.unlock-dialog .cancel-button,
.unlock-dialog .switch-user-button,
.unlock-dialog .login-dialog-session-list-button,
.login-dialog .modal-dialog-button,
.login-dialog .modal-dialog-button:default,
.unlock-dialog .modal-dialog-button,
.unlock-dialog .modal-dialog-button:default {
  color: #${config.colorScheme.colors.base06};
  background-color: transparent;
  box-shadow: none !important;
}

.screenshot-ui-show-pointer-button:insensitive,
.screenshot-ui-type-button:insensitive,
.login-dialog .cancel-button:insensitive,
.login-dialog .switch-user-button:insensitive,
.login-dialog .login-dialog-session-list-button:insensitive,
.unlock-dialog .cancel-button:insensitive,
.unlock-dialog .switch-user-button:insensitive,
.unlock-dialog .login-dialog-session-list-button:insensitive,
.login-dialog .modal-dialog-button:insensitive,
.unlock-dialog .modal-dialog-button:insensitive {
  color: rgba(242, 213, 207, 0.35);
  background-color: rgba(48, 52, 70, 0.95);
  box-shadow: none !important;
}

.screenshot-ui-show-pointer-button:focus,
.screenshot-ui-type-button:focus,
.login-dialog .cancel-button:focus,
.login-dialog .switch-user-button:focus,
.login-dialog .login-dialog-session-list-button:focus,
.unlock-dialog .cancel-button:focus,
.unlock-dialog .switch-user-button:focus,
.unlock-dialog .login-dialog-session-list-button:focus,
.login-dialog .modal-dialog-button:focus,
.unlock-dialog .modal-dialog-button:focus {
  color: #${config.colorScheme.colors.base06};
  background-color: rgba(242, 213, 207, 0.08);
  box-shadow: none !important;
}

.screenshot-ui-show-pointer-button:hover,
.screenshot-ui-type-button:hover,
.login-dialog .cancel-button:hover,
.login-dialog .switch-user-button:hover,
.login-dialog .login-dialog-session-list-button:hover,
.unlock-dialog .cancel-button:hover,
.unlock-dialog .switch-user-button:hover,
.unlock-dialog .login-dialog-session-list-button:hover,
.login-dialog .modal-dialog-button:hover,
.unlock-dialog .modal-dialog-button:hover {
  color: #${config.colorScheme.colors.base06};
  background-color: rgba(242, 213, 207, 0.12);
  box-shadow: none !important;
}

.screenshot-ui-show-pointer-button:active,
.screenshot-ui-type-button:active,
.login-dialog .cancel-button:active,
.login-dialog .switch-user-button:active,
.login-dialog .login-dialog-session-list-button:active,
.unlock-dialog .cancel-button:active,
.unlock-dialog .switch-user-button:active,
.unlock-dialog .login-dialog-session-list-button:active,
.login-dialog .modal-dialog-button:active,
.unlock-dialog .modal-dialog-button:active {
  color: #${config.colorScheme.colors.base06};
  background-color: rgba(242, 213, 207, 0.2);
  box-shadow: none !important;
}

.button {
  min-height: 20px;
  padding: 6px 12px;
  border-radius: 6px;
  border: none;
}

.icon-button {
  border-radius: 9999px;
  padding: 6px;
}

.icon-button StIcon {
  icon-size: 16px !important;
  -st-icon-style: symbolic;
}

/* Date/Time Menu */
.popup-menu .message,
.world-clocks-button,
.weather-button,
.events-button {
  color: rgba(242, 213, 207, 0.7);
  background-color: rgba(242, 213, 207, 0.04);
  border-radius: 6px;
  border: none;
  box-shadow: none;
  text-shadow: none;
  padding: 6px 9px;
}

.popup-menu .message:hover,
.world-clocks-button:hover,
.weather-button:hover,
.events-button:hover,
.popup-menu .message:focus,
.world-clocks-button:focus,
.weather-button:focus,
.events-button:focus {
  color: #${config.colorScheme.colors.base06};
  background-color: rgba(242, 213, 207, 0.12);
  box-shadow: none;
}

.popup-menu .message:active,
.world-clocks-button:active,
.weather-button:active,
.events-button:active {
  color: #${config.colorScheme.colors.base06};
  background-color: rgba(242, 213, 207, 0.2);
  box-shadow: none;
}

.clock-display-box {
  spacing: 2px;
}

.clock-display-box .clock {
  padding-left: 12px;
  padding-right: 12px;
}

#calendarArea {
  padding: 6px 0;
}

.datemenu-calendar-column {
  spacing: 6px;
  border: 0 solid rgba(242, 213, 207, 0.12);
  padding: 0 12px;
}

.datemenu-calendar-column:ltr {
  margin-right: 0;
  border-left-width: 0;
}

.datemenu-calendar-column:rtl {
  margin-left: 0;
  border-right-width: 0;
}

.datemenu-calendar-column .datemenu-displays-section {
  padding-bottom: 0;
}

.datemenu-calendar-column .datemenu-displays-box {
  spacing: 6px;
}

.world-clocks-header,
.weather-header,
.events-section-title {
  color: rgba(242, 213, 207, 0.7);
  font-weight: bold;
}

.datemenu-today-button,
.datemenu-displays-box,
.message-list-sections {
  margin: 4px 6px;
}

/* today button (the date) */
.datemenu-today-button {
  border: none;
  box-shadow: none;
  background: none;
  padding: 6px;
  margin: 0 12px;
  text-shadow: none;
  color: rgba(242, 213, 207, 0.7);
  border-radius: 12px;
}

.datemenu-today-button:hover,
.datemenu-today-button:focus {
  background-color: rgba(242, 213, 207, 0.12);
}

.datemenu-today-button:active {
  background-color: rgba(242, 213, 207, 0.2);
}

.datemenu-today-button .day-label {
  font-size: 12pt;
  font-weight: bold;
}

.datemenu-today-button .date-label {
  font-size: 18pt;
  font-weight: normal;
}

/* Calendar */
.calendar {
  border: none;
  box-shadow: none;
  background-color: transparent;
  padding: 0 3px !important;
  margin: 0 !important;
  text-shadow: none;
  border-radius: 12px;
}

.calendar .calendar-month-label {
  padding: 6px 0;
  color: rgba(242, 213, 207, 0.7);
  font-weight: bold;
  text-align: center;
  text-shadow: none;
  font-size: 12pt;
}

.calendar .calendar-change-month-back,
.calendar .calendar-change-month-forward {
  padding: 0 0 !important;
  margin: 3px 0 !important;
}

.calendar .calendar-change-month-back StIcon,
.calendar .calendar-change-month-forward StIcon {
  icon-size: 16px;
}

.calendar .pager-button {
  width: 32px !important;
  height: 32px !important;
  margin: 2px !important;
  border-radius: 9999px;
  background-color: transparent;
  color: #${config.colorScheme.colors.base06};
}

.calendar .pager-button:hover,
.calendar .pager-button:focus {
  background-color: rgba(242, 213, 207, 0.12);
}

.calendar .pager-button:active {
  background-color: rgba(242, 213, 207, 0.3);
}

.calendar .calendar-day-base {
  font-size: 10pt;
  text-align: center;
  width: 34px !important;
  height: 34px !important;
  padding: 0 !important;
  margin: 2px !important;
  border-radius: 9999px;
  color: rgba(242, 213, 207, 0.7);
  border: none;
  font-feature-settings: 'tnum';
}

.calendar .calendar-day-base:hover,
.calendar .calendar-day-base:focus {
  background-color: rgba(242, 213, 207, 0.12);
  box-shadow: none;
  outline: none;
}

.calendar .calendar-day-base:active,
.calendar .calendar-day-base:selected {
  color: #${config.colorScheme.colors.base06};
  background-color: rgba(242, 213, 207, 0.3);
  border-color: transparent;
}

.calendar .calendar-day-base.calendar-day-heading {
  margin-top: 1em;
  color: rgba(242, 213, 207, 0.5);
  font-size: 10pt;
}

.calendar .calendar-day {
  border-width: 0;
}

.calendar .calendar-day-top {
  border-top-width: 0;
}

.calendar .calendar-day-left {
  border-left-width: 0;
}

.calendar .calendar-nonwork-day {
  color: rgba(242, 213, 207, 0.5);
  font-weight: bold;
}

.calendar .calendar-today {
  font-weight: bold;
  color: rgba(242, 213, 207, 0.7) !important;
  background-color: rgba(242, 213, 207, 0.06);
  border: none;
}

.calendar .calendar-today:hover,
.calendar .calendar-today:focus {
  background-color: rgba(242, 213, 207, 0.12);
  color: #${config.colorScheme.colors.base06} !important;
}

.calendar .calendar-today:active {
  background-color: #b5bfe2;
  color: rgba(0, 0, 0, 0.87) !important;
}

.calendar .calendar-today:selected {
  background-color: #${config.colorScheme.colors.base09};
  color: rgba(0, 0, 0, 0.87) !important;
}

.calendar .calendar-today:selected:hover,
.calendar .calendar-today:selected:focus {
  background-color: #${config.colorScheme.colors.base0E};
  color: rgba(0, 0, 0, 0.87) !important;
}

.calendar .calendar-day-with-events {
  color: rgba(242, 213, 207, 0.7);
  background-image: url('assets/calendar-today.svg');
}

.calendar .calendar-day-with-events.calendar-work-day {
  color: rgba(242, 213, 207, 0.7);
  font-weight: bold;
}

.calendar .calendar-other-month-day {
  color: rgba(242, 213, 207, 0.3);
  opacity: 0.5;
}

.calendar .calendar-week-number {
  width: 26px;
  height: 20px;
  margin: 6px 2px !important;
  padding: 0 0;
  border-radius: 6px;
  background-color: rgba(242, 213, 207, 0.04);
  color: rgba(242, 213, 207, 0.5);
  font-size: inherit;
  font-weight: bold;
  text-align: center;
}

.world-clocks-button,
.weather-button,
.events-button {
  padding: 12px !important;
  margin: 2px 0 !important;
}

.events-button .events-box {
  spacing: 6px;
}

.events-button .events-list {
  spacing: 12px;
  text-shadow: none;
}

.events-button .events-title {
  color: rgba(242, 213, 207, 0.5);
  font-weight: bold;
  text-shadow: none;
}

.events-button .event-time {
  color: rgba(242, 213, 207, 0.5);
  font-feature-settings: 'tnum';
  font-size: 10pt;
}

.world-clocks-button .world-clocks-city {
  color: rgba(242, 213, 207, 0.5);
  font-weight: bold;
  font-size: 11pt;
}

.world-clocks-button .world-clocks-time {
  color: rgba(242, 213, 207, 0.5);
  font-feature-settings: 'tnum';
  font-size: 11pt;
}

.world-clocks-button .world-clocks-time:ltr {
  text-align: right;
}

.world-clocks-button .world-clocks-time:rtl {
  text-align: left;
}

.world-clocks-button .world-clocks-timezone {
  color: rgba(242, 213, 207, 0.5);
  font-feature-settings: 'tnum';
  font-size: 10pt;
}

.world-clocks-grid,
.weather-grid {
  spacing-rows: 0.4em;
  spacing-columns: 0.8em;
}

.weather-button {
  margin-bottom: 6px !important;
}

.weather-button .weather-box {
  spacing: 10px;
}

.weather-button .weather-header-box {
  spacing: 6px;
}

.weather-button .weather-header {
  color: rgba(242, 213, 207, 0.7);
  font-weight: bold;
}

.weather-button .weather-header.location {
  font-weight: normal;
  color: rgba(242, 213, 207, 0.5);
  font-size: 10pt;
}

.weather-button .weather-grid {
  spacing-rows: 6px;
  spacing-columns: 12px;
}

.weather-button .weather-forecast-time {
  color: rgba(242, 213, 207, 0.7);
  font-feature-settings: 'tnum';
  font-size: 9pt;
  font-weight: normal;
  padding-top: 0.2em;
  padding-bottom: 0.4em;
}

.weather-button .weather-forecast-icon {
  icon-size: 32px;
}

.weather-button .weather-forecast-temp {
  font-weight: bold;
}

/* Check Boxes */
.check-box StBoxLayout {
  spacing: 0.8em;
}

.check-box StBin {
  width: 24px;
  height: 24px;
  padding: 6px;
  border-radius: 6px;
}

.check-box StBin,
.check-box:focus StBin {
  background-image: url('assets/checkbox-off.svg');
}

.check-box:hover StBin {
  background-color: rgba(242, 213, 207, 0.12);
}

.check-box:active StBin {
  background-color: rgba(242, 213, 207, 0.3);
}

.check-box:checked StBin,
.check-box:focus:checked StBin {
  background-image: url('assets/checkbox-dark.svg');
}

/* Activities Ripple */
.ripple-box {
  background-color: rgba(238, 190, 190, 0.35);
  box-shadow: 0 0 2px 2px #${config.colorScheme.colors.base06};
  width: 52px;
  height: 52px;
  border-radius: 0 0 52px 0;
}

.ripple-box:rtl {
  border-radius: 0 0 0 52px;
}

/* Dash */
#dash {
  font-size: 9pt;
}

#dash .empty-dash-drop-target {
  width: 32px;
  height: 32px;
}

.dash-label {
  background-color: rgba(41, 44, 60, 0.95);
  color: #${config.colorScheme.colors.base09};
  padding: 6px 12px;
  text-align: center;
  border-radius: 12px;
  border: 1px solid rgba(65, 72, 104, 0.55);
  box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.15);
  -y-offset: 12px;
  -x-offset: 8px;
}

/* Modal Dialogs */
.candidate-popup-content,
.modal-dialog {
  background-color: rgba(41, 44, 60, 0.95);
  border-radius: 12px;
  box-shadow: 3px 3px 8px -5px rgba(0, 0, 0, 0.35);
  margin: 15px;
  border: 2px solid #${config.colorScheme.colors.base09};
}

.modal-dialog-linked-button:last-child {
  color: #${config.colorScheme.colors.base06};
  background-color: #${config.colorScheme.colors.base02};
}

.modal-dialog-linked-button:hover:last-child {
  color: #${config.colorScheme.colors.base06};
  background-color: #${config.colorScheme.colors.base0E};
}

.modal-dialog-linked-button:active:last-child {
  color: #${config.colorScheme.colors.base06};
  background-color: #ea999c;
}

.modal-dialog-linked-button:insensitive:last-child {
  background-color: rgba(238, 190, 190, 0.05);
  color: rgba(238, 190, 190, 0.35);
}

.headline {
  font-size: 12pt;
}

.modal-dialog {
  color: #${config.colorScheme.colors.base06};
  padding: 0 6px 6px 6px;
}

.modal-dialog-linked-button {
  min-height: 32px;
  padding: 6px;
  margin: 3px !important;
  border: none !important;
  border-radius: 6px;
}

.modal-dialog-linked-button:first-child {
  background-color: rgba(242, 213, 207, 0.04);
}

.modal-dialog-linked-button:first-child:focus {
  color: #${config.colorScheme.colors.base06};
  background-color: rgba(242, 213, 207, 0.08);
  box-shadow: none !important;
}

.modal-dialog-linked-button:first-child:hover {
  color: #${config.colorScheme.colors.base06};
  background-color: rgba(242, 213, 207, 0.12);
}

.modal-dialog-linked-button:first-child:active {
  color: #${config.colorScheme.colors.base06};
  background-color: rgba(242, 213, 207, 0.2);
  box-shadow: none !important;
}

.modal-dialog .modal-dialog-content-box {
  margin: 30px 42px;
  spacing: 30px;
  max-width: 28em;
}

.end-session-dialog {
  width: 30em;
}

.end-session-dialog .end-session-dialog-battery-warning,
.end-session-dialog .dialog-list-title {
  color: #${config.colorScheme.colors.base0A};
}

.message-dialog-content {
  spacing: 18px;
}

.message-dialog-content .message-dialog-title {
  text-align: center;
  font-size: 18pt;
  font-weight: 800;
}

.message-dialog-content .message-dialog-title.lightweight {
  font-size: 13pt;
  font-weight: 800;
}

.message-dialog-content .message-dialog-description {
  text-align: center;
}

.dialog-list {
  spacing: 18px;
}

.dialog-list .dialog-list-title {
  text-align: center;
  font-weight: bold;
}

.dialog-list .dialog-list-scrollview {
  max-height: 200px;
}

.dialog-list .dialog-list-box {
  spacing: 1em;
}

.dialog-list .dialog-list-box .dialog-list-item {
  spacing: 1em;
}

.dialog-list .dialog-list-box .dialog-list-item .dialog-list-item-title {
  font-weight: bold;
}

.dialog-list .dialog-list-box .dialog-list-item .dialog-list-item-description {
  color: rgba(242, 213, 207, 0.7);
  font-size: 10pt;
}

.run-dialog .modal-dialog-content-box {
  margin-top: 24px;
  margin-bottom: 12px;
}

.run-dialog .run-dialog-entry {
  width: 20em;
}

.run-dialog .run-dialog-description {
  text-align: center;
  color: rgba(242, 213, 207, 0.7);
  font-size: 10pt;
}

.prompt-dialog {
  width: 28em;
}

.prompt-dialog .modal-dialog-content-box {
  margin-bottom: 24px;
}

.prompt-dialog-password-grid {
  spacing-rows: 8px;
  spacing-columns: 4px;
}

.prompt-dialog-password-grid .prompt-dialog-password-entry {
  width: auto;
}

.prompt-dialog-password-grid .prompt-dialog-password-entry:ltr {
  margin-left: 20px;
}

.prompt-dialog-password-grid .prompt-dialog-password-entry:rtl {
  margin-right: 20px;
}

.prompt-dialog-password-layout {
  spacing: 8px;
}

.prompt-dialog-password-entry {
  width: 20em;
}

.prompt-dialog-error-label,
.prompt-dialog-info-label,
.prompt-dialog-null-label {
  text-align: center;
  font-size: 10pt;
  margin: 6px;
}

.prompt-dialog-error-label {
  color: #${config.colorScheme.colors.base08};
}

.prompt-dialog-info-label,
.prompt-dialog-null-label {
  color: rgba(242, 213, 207, 0.5);
}

.polkit-dialog-user-layout {
  text-align: center;
  spacing: 8px;
  margin-bottom: 6px;
}

.polkit-dialog-user-layout .polkit-dialog-user-root-label {
  color: #${config.colorScheme.colors.base0A};
}

.audio-device-selection-dialog .modal-dialog-content-box {
  margin-bottom: 28px;
}

.audio-device-selection-dialog .audio-selection-box {
  spacing: 20px;
}

.audio-selection-device {
  border: 1px solid rgba(242, 213, 207, 0.12);
  border-radius: 6px;
}

.audio-selection-device:hover,
.audio-selection-device:focus {
  background-color: rgba(242, 213, 207, 0.12);
}

.audio-selection-device:active {
  background-color: #${config.colorScheme.colors.base0F};
  color: rgba(0, 0, 0, 0.87);
}

.audio-selection-device-box {
  padding: 18px;
  spacing: 18px;
}

.audio-selection-device-icon {
  icon-size: 64px;
}

.welcome-dialog-image {
  background-image: url('resource:///org/gnome/shell/theme/gnome-shell-start.svg');
  background-size: contain;
  height: 300px;
  width: 300px;
}

/* Entries */
StEntry,
.search-entry {
  min-height: 20px;
  padding: 6px 12px;
  margin: 2px;
  border: none;
  border-radius: 6px;
  color: #${config.colorScheme.colors.base06};
  background-color: rgba(242, 213, 207, 0.04);
  border: 2px solid transparent;
  box-shadow: none;
  caret-color: #${config.colorScheme.colors.base06};
  selection-background-color: rgba(242, 213, 207, 0.25);
  selected-color: #${config.colorScheme.colors.base06};
}

StEntry:hover,
.search-entry:hover {
  color: #${config.colorScheme.colors.base06};
  border-color: rgba(238, 190, 190, 0.35);
  background-color: rgba(242, 213, 207, 0.04);
}

StEntry:focus,
.search-entry:focus {
  color: #${config.colorScheme.colors.base06};
  border-color: #${config.colorScheme.colors.base0F};
  background-color: rgba(242, 213, 207, 0.04);
  box-shadow: none;
}

StEntry:insensitive,
.search-entry:insensitive {
  background-color: rgba(242, 213, 207, 0.04);
  color: rgba(242, 213, 207, 0.35);
  border-color: transparent;
}

StEntry StIcon.capslock-warning,
.search-entry StIcon.capslock-warning {
  icon-size: 16px;
  warning-color: #${config.colorScheme.colors.base0A};
  padding: 0;
}

StEntry StIcon.peek-password,
.search-entry StIcon.peek-password {
  icon-size: 16px;
  padding: 0 4px;
}

StEntry StLabel.hint-text,
.search-entry StLabel.hint-text {
  margin-left: 2px;
  color: rgba(242, 213, 207, 0.5);
}

.hotplug-notification-item {
  padding: 12px;
  border-style: solid;
  border-width: 0;
  border-left-width: 0;
  border-bottom-width: 0;
}

.hotplug-notification-item:first-child {
  border-radius: 0 0 0 6px;
}

.hotplug-notification-item:last-child {
  border-right-width: 0;
  border-radius: 0 0 6px 0;
}

.hotplug-notification-item:first-child:last-child {
  border-radius: 0 0 6px 6px;
}

.hotplug-notification-item-icon {
  icon-size: 24px;
  padding: 0 4px;
}

.candidate-popup-boxpointer {
  -arrow-border-radius: 2px;
  -arrow-background-color: transparent;
  -arrow-border-width: 0;
  -arrow-border-color: transparent;
  -arrow-base: 64px;
  -arrow-rise: 12px;
}

.candidate-popup-content {
  color: rgba(242, 213, 207, 0.7);
  box-shadow: 0 3px 8px 0 rgba(0, 0, 0, 0.35) !important;
  border: none;
  margin: 3px 8px 12px !important;
  padding: 6px;
  spacing: 6px;
}

.candidate-index {
  padding: 0 0.5em 0 0;
  color: rgba(242, 213, 207, 0.7);
}

.candidate-box:selected .candidate-index {
  color: rgba(0, 0, 0, 0.6);
}

.candidate-box {
  padding: 0.3em 0.5em 0.3em 0.5em;
  margin-right: 2px;
  border-radius: 6px;
  color: rgba(242, 213, 207, 0.7);
}

.candidate-box:hover {
  background-color: rgba(242, 213, 207, 0.12);
  color: #${config.colorScheme.colors.base06};
}

.candidate-box:active {
  background-color: rgba(242, 213, 207, 0.3);
  color: #${config.colorScheme.colors.base06};
}

.candidate-box:selected {
  background-color: #${config.colorScheme.colors.base0F};
  color: rgba(0, 0, 0, 0.87);
}

.candidate-box:last-child {
  margin-right: 0;
}

.candidate-page-button-box {
  height: 2em;
}

.vertical .candidate-page-button-box {
  padding-top: 0.5em;
}

.horizontal .candidate-page-button-box {
  padding-left: 0.5em;
}

.candidate-page-button {
  padding: 6px 9px;
}

.candidate-page-button-previous,
.candidate-page-button-next {
  border-radius: 6px;
}

.candidate-page-button-icon {
  icon-size: 1em;
}

/* On-screen Keyboard */
#keyboard {
  background-color: #${config.colorScheme.colors.base02};
  box-shadow: none;
}

#keyboard .page-indicator {
  padding: 6px;
}

#keyboard .page-indicator .page-indicator-icon {
  width: 8px;
  height: 8px;
}

.key-container,
.keyboard-layout {
  padding: 4px;
  spacing: 4px;
}

.keyboard-key {
  font-size: 16pt;
  font-weight: bold;
  min-height: 1.2em;
  min-width: 1.2em;
  border-radius: 9px;
  border: none;
  color: rgba(242, 213, 207, 0.7);
  background-color: #${config.colorScheme.colors.base03};
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.15);
}

.keyboard-key:focus,
.keyboard-key:hover {
  color: #${config.colorScheme.colors.base06};
  background-color: #${config.colorScheme.colors.base04};
}

.keyboard-key:checked,
.keyboard-key:active {
  color: #${config.colorScheme.colors.base06};
  background-color: #${config.colorScheme.colors.base04};
}

.keyboard-key:grayed {
  background-color: rgba(41, 44, 60, 0.95);
  color: rgba(242, 213, 207, 0.7);
}

.keyboard-key.default-key {
  background-color: #${config.colorScheme.colors.base03};
  box-shadow: 0 2px 3px rgba(0, 0, 0, 0.15);
}

.keyboard-key.default-key:focus,
.keyboard-key.default-key:hover {
  color: #${config.colorScheme.colors.base06};
  background-color: #${config.colorScheme.colors.base04};
}

.keyboard-key.default-key:checked,
.keyboard-key.default-key:active {
  color: #${config.colorScheme.colors.base06};
  background-color: #${config.colorScheme.colors.base04};
}

.keyboard-key.enter-key {
  color: rgba(0, 0, 0, 0.87);
  background-color: #${config.colorScheme.colors.base0F};
  box-shadow: 0 2px 3px rgba(0, 0, 0, 0.15);
}

.keyboard-key.enter-key:focus,
.keyboard-key.enter-key:hover {
  color: rgba(0, 0, 0, 0.87);
  background-color: #f5c2e7;
}

.keyboard-key.enter-key:checked,
.keyboard-key.enter-key:active {
  color: rgba(0, 0, 0, 0.87);
  background-color: #838ba7;
}

.keyboard-key.shift-key-uppercase,
.keyboard-key.shift-key-uppercase:focus,
.keyboard-key.shift-key-uppercase:hover,
.keyboard-key.shift-key-uppercase:checked,
.keyboard-key.shift-key-uppercase:active {
  color: #${config.colorScheme.colors.base0F};
}

.keyboard-key StIcon {
  icon-size: 1.125em;
}

.keyboard-subkeys {
  color: inherit;
  -arrow-border-radius: 12px;
  -arrow-background-color: #${config.colorScheme.colors.base02};
  -arrow-border-width: 0;
  -arrow-border-color: transparent;
  -arrow-base: 20px;
  -arrow-rise: 10px;
  -boxpointer-gap: 5px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.25);
}

.emoji-page .keyboard-key {
  background-color: transparent;
  border: none;
  color: initial;
}

.emoji-panel .keyboard-key:latched {
  border: none;
  background-color: #${config.colorScheme.colors.base0F};
}

.word-suggestions {
  font-size: 14pt;
  spacing: 12px;
  min-height: 20pt;
}

/* Login Dialog */
#lockDialogGroup {
  background-color: rgba(48, 52, 70, 0.95);
}

.login-dialog-banner-view {
  padding-top: 24px;
  max-width: 23em;
}

.login-dialog,
.unlock-dialog {
  border: none;
  background-color: transparent;
  color: #${config.colorScheme.colors.base06};
}

.login-dialog .modal-dialog-button-box,
.unlock-dialog .modal-dialog-button-box {
  spacing: 3px;
}

.login-dialog .modal-dialog-button,
.unlock-dialog .modal-dialog-button {
  padding: 0 16px;
  border: none;
}

.login-dialog .cancel-button,
.login-dialog .switch-user-button,
.login-dialog .login-dialog-session-list-button,
.unlock-dialog .cancel-button,
.unlock-dialog .switch-user-button,
.unlock-dialog .login-dialog-session-list-button {
  padding: 0;
  border-radius: 9999px;
  width: 32px;
  height: 32px;
  border: none;
}

.login-dialog .cancel-button StIcon,
.login-dialog .switch-user-button StIcon,
.login-dialog .login-dialog-session-list-button StIcon,
.unlock-dialog .cancel-button StIcon,
.unlock-dialog .switch-user-button StIcon,
.unlock-dialog .login-dialog-session-list-button StIcon {
  icon-size: 16px;
}

.login-dialog .login-dialog-message-warning,
.unlock-dialog .login-dialog-message-warning {
  color: rgba(242, 213, 207, 0.7);
}

.login-dialog .user-icon,
.unlock-dialog .user-icon {
  color: rgba(242, 213, 207, 0.7);
}

.login-dialog .user-icon StIcon,
.unlock-dialog .user-icon StIcon {
  background-color: rgba(48, 52, 70, 0.95);
  color: #${config.colorScheme.colors.base06};
}

.login-dialog .user-icon,
.login-dialog .user-icon.user-avatar,
.unlock-dialog .user-icon,
.unlock-dialog .user-icon.user-avatar {
  border: 2px solid #${config.colorScheme.colors.base0F};
}

.login-dialog-logo-bin {
  padding: 24px 0px;
}

.login-dialog-banner {
  color: rgba(242, 213, 207, 0.7);
}

.login-dialog-button-box {
  spacing: 5px;
}

.login-dialog-message {
  text-align: center;
}

.login-dialog-message-warning {
  color: #${config.colorScheme.colors.base0A};
}

.login-dialog-message-hint {
  padding-top: 0;
  padding-bottom: 20px;
}

.login-dialog-user-selection-box {
  padding: 100px 0px;
}

.login-dialog-not-listed-label {
  padding-left: 2px;
}

.login-dialog-not-listed-button:focus .login-dialog-not-listed-label,
.login-dialog-not-listed-button:hover .login-dialog-not-listed-label {
  color: #${config.colorScheme.colors.base06};
}

.login-dialog-not-listed-label {
  font-size: 1em;
  font-weight: bold;
  color: rgba(242, 213, 207, 0.7);
  padding-top: 1em;
}

.login-dialog-not-listed-label:hover {
  color: rgba(242, 213, 207, 0.7);
}

.login-dialog-not-listed-label:focus {
  background-color: rgba(242, 213, 207, 0.12);
}

.login-dialog-user-list-view {
  -st-vfade-offset: 1em;
}

.login-dialog-user-list {
  spacing: 12px;
  padding: 0.2em;
  width: 23em;
}

.login-dialog-user-list:expanded .login-dialog-user-list-item:selected,
.login-dialog-user-list:expanded .login-dialog-user-list-item:hover,
.login-dialog-user-list:expanded .login-dialog-user-list-item:active {
  background-color: rgba(242, 213, 207, 0.3);
  color: rgba(242, 213, 207, 0.7);
}

.login-dialog-user-list:expanded .login-dialog-user-list-item:logged-in {
  border-right: 2px solid #${config.colorScheme.colors.base0F};
}

.login-dialog-user-list-item {
  border-radius: 12px;
  padding: 6px;
  color: rgba(242, 213, 207, 0.7);
}

.login-dialog-user-list-item:ltr .user-widget {
  padding-right: 1em;
}

.login-dialog-user-list-item:rtl .user-widget {
  padding-left: 1em;
}

.login-dialog-user-list-item:focus {
  background-color: rgba(242, 213, 207, 0.04) !important;
}

.login-dialog-user-list-item:hover,
.login-dialog-user-list-item:focus:hover {
  background-color: rgba(242, 213, 207, 0.12) !important;
  color: rgba(242, 213, 207, 0.7);
}

.login-dialog-user-list-item:active,
.login-dialog-user-list-item:focus:active {
  background-color: rgba(242, 213, 207, 0.3) !important;
  color: rgba(242, 213, 207, 0.7);
}

.login-dialog-user-list-item .login-dialog-timed-login-indicator {
  height: 2px;
  margin: 6px 0 0 0;
  background-color: rgba(242, 213, 207, 0.12) !important;
}

.user-widget-label {
  color: rgba(242, 213, 207, 0.7);
}

.user-widget.horizontal .user-widget-label {
  font-size: 13pt;
  font-weight: bold;
  padding-left: 15px;
}

.user-widget.horizontal .user-widget-label:ltr {
  padding-left: 14px;
  text-align: left;
}

.user-widget.horizontal .user-widget-label:rtl {
  padding-right: 14px;
  text-align: right;
}

.user-widget.vertical .user-widget-label {
  font-size: 16pt;
  text-align: center;
  font-weight: normal;
  padding-top: 16px;
}

.login-dialog-prompt-layout {
  padding-top: 24px;
  padding-bottom: 12px;
  spacing: 12px;
  width: 23em;
}

.login-dialog-prompt-entry {
  height: 1.5em;
}

.login-dialog-prompt-label {
  color: rgba(242, 213, 207, 0.7);
  font-size: 12pt;
  padding-top: 1em;
}

/* Looking Glass */
#LookingGlassDialog {
  background-color: rgba(41, 44, 60, 0.95) !important;
  spacing: 4px;
  padding: 0;
  border-radius: 6px;
  box-shadow: 0 3px 8px 0 rgba(0, 0, 0, 0.25);
  color: #${config.colorScheme.colors.base06} !important;
  border: 2px solid #${config.colorScheme.colors.base0F};
  border-top: none;
}

#LookingGlassDialog > #Toolbar {
  padding: 0 6px;
  border: none;
  border-radius: 0;
  background-color: rgba(41, 44, 60, 0.95) !important;
  box-shadow: inset 0 -1px 0 rgba(242, 213, 207, 0.12);
  spacing: 6px;
}

#LookingGlassDialog > #Toolbar .lg-toolbar-button {
  padding: 6px 12px;
}

#LookingGlassDialog > #Toolbar .lg-toolbar-button > StIcon {
  icon-size: 16px;
}

#LookingGlassDialog .labels {
  spacing: 6px;
}

#LookingGlassDialog .notebook-tab {
  -natural-hpadding: 12px;
  -minimum-hpadding: 12px;
  font-weight: bold;
  color: rgba(242, 213, 207, 0.5);
  padding: 6px 12px;
  transition-duration: 100ms;
  border-bottom-width: 0;
  border-radius: 0;
}

#LookingGlassDialog .notebook-tab:hover {
  background-color: rgba(242, 213, 207, 0.04);
  color: #${config.colorScheme.colors.base06};
  text-shadow: none;
}

#LookingGlassDialog .notebook-tab:selected {
  border-color: transparent;
  background-color: rgba(242, 213, 207, 0.12);
  box-shadow: inset 0 -2px 0 #${config.colorScheme.colors.base0F};
  color: #${config.colorScheme.colors.base06};
  text-shadow: none;
}

#LookingGlassDialog StBoxLayout#EvalBox {
  padding: 4px;
  spacing: 6px;
  padding: 6px;
}

#LookingGlassDialog StBoxLayout#ResultsArea {
  spacing: 6px;
  padding: 6px;
}

.lg-dialog StEntry {
  min-height: 22px;
  selection-background-color: #${config.colorScheme.colors.base0F};
  selected-color: rgba(0, 0, 0, 0.87);
}

.lg-dialog .shell-link {
  color: #85c1dc;
}

.lg-dialog .shell-link:hover {
  color: #51adf6;
}

.lg-dialog .shell-link:active {
  color: #0c7cd5;
}

.lg-dialog .actor-link {
  color: rgba(242, 213, 207, 0.7);
}

.lg-dialog .actor-link:hover {
  color: #${config.colorScheme.colors.base06};
}

.lg-dialog .actor-link:active {
  color: rgba(242, 213, 207, 0.7);
}

.lg-completions-text {
  font-size: 0.9em;
  font-style: italic;
}

.lg-obj-inspector-title {
  spacing: 6px;
}

.lg-obj-inspector-button {
  padding: 0 16px;
  border: none;
  border-radius: 6px;
}

.lg-obj-inspector-button:hover {
  border: none;
}

#lookingGlassExtensions {
  padding: 6px;
}

.lg-extensions-list {
  padding: 6px;
  spacing: 6px;
}

.lg-extension {
  border-radius: 6px;
  background-color: rgba(242, 213, 207, 0.04) !important;
  color: #${config.colorScheme.colors.base06} !important;
  padding: 12px;
  box-shadow: none;
  border: 2px solid #${config.colorScheme.colors.base0F};
}

.lg-extension-name {
  font-weight: bold;
}

.lg-extension-meta {
  spacing: 6px;
}

#LookingGlassPropertyInspector {
  color: rgba(242, 213, 207, 0.7) !important;
  background: rgba(41, 44, 60, 0.95) !important;
  border: none;
  border-radius: 6px;
  padding: 6px;
  margin: 5px 8px 11px;
  box-shadow: 0 3px 8px 0 rgba(0, 0, 0, 0.25);
}

.lg-debug-flag-button {
  color: rgba(242, 213, 207, 0.7);
}

.lg-debug-flag-button StLabel {
  padding: 6px 12px;
}

.lg-debug-flag-button:hover {
  color: #${config.colorScheme.colors.base06};
}

.lg-debug-flag-button:active {
  color: rgba(242, 213, 207, 0.7);
}

.lg-debug-flags-header {
  padding-top: 12px;
  padding: 6px;
  margin: 6px;
  color: rgba(242, 213, 207, 0.3);
}

/* Message List */
.message-list {
  width: 31.5em;
  text-shadow: none;
  border: solid rgba(242, 213, 207, 0.12);
  padding: 6px;
}

.message-list:ltr {
  margin-left: 0;
  margin-right: 4px;
  padding-right: 12px;
  border-right-width: 1px;
}

.message-list:rtl {
  margin-right: 0;
  margin-left: 4px;
  padding-left: 12px;
  border-left-width: 1px;
}

.message-list .message-list-placeholder {
  spacing: 12px;
  color: rgba(242, 213, 207, 0.3);
}

.message-list .message-list-placeholder > StIcon {
  icon-size: 48px;
  margin-bottom: 12px;
  -st-icon-style: symbolic;
}

.message-list-sections {
  margin: 0 8px;
}

.message-list-section,
.message-list-sections,
.message-list-section-list {
  spacing: 6px;
}

.message-list-controls {
  margin: 8px 16px 0;
  padding: 4px;
  spacing: 12px;
}

.message {
  margin: 3px 0;
}

.message .message-icon-bin {
  padding: 18px 12px;
  padding-right: 6px;
}

.message .message-icon-bin:rtl {
  padding-left: 6px;
}

.message .message-icon-bin > StIcon {
  icon-size: 32px;
  -st-icon-style: symbolic;
}

.message .message-icon-bin > .fallback-app-icon {
  width: 16px;
  height: 16px;
}

.message .message-secondary-bin {
  padding: 0 8px;
}

.message .message-secondary-bin > .event-time {
  color: rgba(242, 213, 207, 0.5);
  font-size: 9pt;
  text-align: right;
  padding-bottom: 0;
}

.message .message-secondary-bin > .event-time:ltr {
  text-align: right;
}

.message .message-secondary-bin > .event-time:rtl {
  text-align: left;
}

.message .message-title {
  color: #${config.colorScheme.colors.base06};
  font-weight: bold;
  padding-top: 0.57em;
}

.message .message-content {
  padding: 6px;
  margin-bottom: 4px;
  spacing: 4px;
  color: rgba(242, 213, 207, 0.5);
}

.message .message-close-button {
  color: rgba(242, 213, 207, 0.7);
  padding: 4px;
  height: 20px;
  width: 20px;
  border-radius: 9999px;
}

.message .message-close-button:hover,
.message .message-close-button:active {
  color: #${config.colorScheme.colors.base06};
}

.message .message-close-button:hover,
.message .message-close-button:focus {
  background-color: rgba(242, 213, 207, 0.12);
}

.message .message-close-button:active {
  background-color: rgba(242, 213, 207, 0.3);
}

.message .message-body {
  color: rgba(242, 213, 207, 0.5);
}

.url-highlighter {
  link-color: #85c1dc;
}

.message-media-control {
  margin: 20px 6px;
  padding: 9px;
  border-radius: 9999px;
  color: rgba(242, 213, 207, 0.7);
}

.message-media-control:hover,
.message-media-control:focus {
  color: #${config.colorScheme.colors.base06};
  background-color: rgba(242, 213, 207, 0.12);
}

.message-media-control:active {
  color: #${config.colorScheme.colors.base06};
  background-color: rgba(242, 213, 207, 0.3);
}

.message-media-control:insensitive {
  color: rgba(242, 213, 207, 0.3);
}

.message-media-control:last-child:ltr {
  margin-right: 16px;
}

.message-media-control:last-child:rtl {
  margin-left: 16px;
}

.message-media-control StIcon {
  icon-size: 16px;
}

.media-message-cover-icon {
  icon-size: 32px !important;
}

.media-message-cover-icon.fallback {
  icon-size: 24px !important;
  padding: 6px;
  border: none;
  border-radius: 6px;
  background-color: rgba(242, 213, 207, 0.12);
  color: rgba(242, 213, 207, 0.5);
}

.select-area-rubberband {
  background-color: rgba(238, 190, 190, 0.3);
  border: 1px solid #${config.colorScheme.colors.base0F};
  border-radius: 6px;
}

.user-icon {
  background-size: contain;
  color: rgba(242, 213, 207, 0.7);
  border-radius: 9999px;
  box-shadow: none;
  icon-size: 64px;
}

.modal-dialog .user-icon {
  box-shadow: none;
}

.user-icon:hover {
  color: #${config.colorScheme.colors.base06};
}

.user-icon StIcon {
  background-color: rgba(41, 44, 60, 0.95);
  color: #${config.colorScheme.colors.base06};
  border-radius: 9999px;
  padding: 12px;
  width: 40px;
  height: 40px;
}

.user-icon,
.user-icon.user-avatar {
  border: 2px solid #${config.colorScheme.colors.base0F};
}

.user-widget.vertical .user-icon {
  icon-size: 96px;
}

.user-widget.vertical .user-icon StIcon {
  padding: 20px;
  padding-top: 18px;
  padding-bottom: 22px;
  width: 88px;
  height: 88px;
}

.lightbox {
  background-color: black;
}

.flashspot {
  background-color: #${config.colorScheme.colors.base06};
}

.hidden {
  color: rgba(0, 0, 0, 0);
}

.caps-lock-warning-label {
  text-align: center;
  padding-bottom: 8px;
  font-size: 10pt;
  color: #${config.colorScheme.colors.base0A};
}

/* Network Dialogs */
.nm-dialog {
  max-height: 34em;
  min-height: 31em;
  min-width: 32em;
}

.nm-dialog-content {
  spacing: 20px;
  padding: 24px;
}

.nm-dialog-header-hbox {
  spacing: 10px;
}

.nm-dialog-airplane-box {
  spacing: 12px;
}

.nm-dialog-airplane-headline {
  font-weight: bold;
  text-align: center;
}

.nm-dialog-airplane-text {
  color: #${config.colorScheme.colors.base06};
}

.nm-dialog-header {
  font-weight: bold;
}

.nm-dialog-header-icon {
  icon-size: 32px;
}

.nm-dialog-header-hbox {
  spacing: 10px;
}

.nm-dialog-scroll-view {
  border: none;
  padding: 0;
  background-color: rgba(242, 213, 207, 0.04);
  border-radius: 6px;
}

.nm-dialog-item {
  font-size: 11pt;
  border-bottom: none;
  padding: 12px;
  spacing: 0px;
}

.nm-dialog-item:selected {
  background-color: #${config.colorScheme.colors.base0F};
  color: rgba(0, 0, 0, 0.87);
}

.nm-dialog-item:hover,
.nm-dialog-item:focus {
  background-color: rgba(242, 213, 207, 0.12);
}

.nm-dialog-item:active {
  background-color: rgba(242, 213, 207, 0.3);
}

.nm-dialog-icon {
  icon-size: 16px;
}

.nm-dialog-icons {
  spacing: 12px;
}

.no-networks-label {
  color: rgba(242, 213, 207, 0.5);
}

.no-networks-box {
  spacing: 6px;
}

/* Notifications & Message Tray */
.notification-banner {
  width: 25em;
  min-height: 65px;
  color: rgba(242, 213, 207, 0.7);
  background-color: rgba(65, 69, 89, 0.95);
  text-shadow: none;
  border: solid 1px rgba(242, 213, 207, 0.25);
  box-shadow: 0 3px 5px rgba(0, 0, 0, 0.25);
  margin: 20px 20px 10px;
  border-radius: 12px;
}

.notification-banner:hover {
  color: #${config.colorScheme.colors.base06};
  background-color: rgba(65, 69, 89, 0.95);
  border: solid 1px rgba(242, 213, 207, 0.25);
  box-shadow: 0 3px 5px rgba(0, 0, 0, 0.25);
  margin: 20px 20px 10px;
}

.notification-banner:focus {
  color: #${config.colorScheme.colors.base06};
  background-color: rgba(65, 69, 89, 0.95);
}

.notification-banner .notification-actions {
  background-color: transparent;
  padding-top: 0;
  border-top: 1px solid rgba(242, 213, 207, 0.12);
  spacing: 0;
}

.notification-banner .notification-button {
  min-height: 44px;
  padding: 0 18px;
  background-color: transparent;
  color: rgba(242, 213, 207, 0.7);
  font-weight: 500;
  border-width: 0;
}

.notification-banner .notification-button:first-child {
  border-radius: 0 0 0 12px;
}

.notification-banner .notification-button:last-child {
  border-radius: 0 0 12px 0;
}

.notification-banner .notification-button:only-child,
.notification-banner .notification-button:first-child:last-child {
  border-radius: 0 0 12px 12px;
}

.notification-banner .notification-button:focus {
  background-color: transparent;
  color: #${config.colorScheme.colors.base06};
  box-shadow: inset 0 0 0 2px rgba(242, 213, 207, 0.12);
}

.notification-banner .notification-button:hover,
.notification-banner .notification-button:focus:hover {
  background-color: rgba(242, 213, 207, 0.12);
  color: #${config.colorScheme.colors.base06};
  box-shadow: none;
}

.notification-banner .notification-button:active {
  background-color: rgba(242, 213, 207, 0.3);
  color: #${config.colorScheme.colors.base06};
}

.summary-source-counter {
  font-size: fontsize(10);
  font-weight: bold;
  height: 1.6em;
  width: 1.6em;
  -shell-counter-overlap-x: 3px;
  -shell-counter-overlap-y: 3px;
  background-color: #${config.colorScheme.colors.base0F};
  color: rgba(0, 0, 0, 0.87);
  border: 2px solid rgba(242, 213, 207, 0.3);
  box-shadow: 0 2px 2px rgba(0, 0, 0, 0.5);
  border-radius: 0.9em;
}

.chat-body {
  spacing: 5px;
}

.chat-response {
  margin: 5px;
}

.chat-log-message {
  color: rgba(242, 213, 207, 0.7);
}

.chat-new-group {
  padding-top: 1em;
}

.chat-received {
  padding-left: 4px;
}

.chat-received:rtl {
  padding-left: 0px;
  padding-right: 4px;
}

.chat-sent {
  padding-left: 18pt;
  color: rgba(242, 213, 207, 0.7);
}

.chat-sent:rtl {
  padding-left: 0;
  padding-right: 18pt;
}

.chat-meta-message {
  padding-left: 4px;
  font-size: 9pt;
  color: rgba(242, 213, 207, 0.5);
}

.chat-meta-message:rtl {
  padding-left: 0;
  padding-right: 4px;
}

/* OSD */
.screenshot-ui-panel,
.workspace-switcher-container,
.resize-popup,
.osd-window {
  color: rgba(242, 213, 207, 0.7);
  background-color: rgba(48, 52, 70, 0.95);
  border: solid 1px rgba(242, 213, 207, 0.25);
  box-shadow: 0 3px 8px 0 rgba(0, 0, 0, 0.25);
  margin: 50px 8px 11px;
  border-radius: 12px;
  padding: 10px;
}

.osd-window {
  text-align: center;
  font-weight: bold;
}

.osd-window .osd-monitor-label {
  font-size: 3em;
}

.osd-window .level {
  height: 3px;
  border-radius: 2px;
  background-color: rgba(242, 213, 207, 0.15);
  color: #${config.colorScheme.colors.base06};
  -barlevel-height: 3px;
  -barlevel-background-color: rgba(242, 213, 207, 0.15);
  -barlevel-active-background-color: #${config.colorScheme.colors.base06};
  -barlevel-overdrive-color: #${config.colorScheme.colors.base08};
  -barlevel-overdrive-separator-width: 2px;
  -barlevel-border-width: 0;
  -barlevel-border-color: rgba(242, 213, 207, 0.12);
}

.osd-window .level-bar {
  background-color: #${config.colorScheme.colors.base06};
  border-radius: 2px;
}

.pad-osd-window {
  padding: 32px;
  background-color: rgba(48, 52, 70, 0.95);
}

.pad-osd-window .pad-osd-title-box {
  spacing: 12px;
}

.pad-osd-window .pad-osd-title-menu-box {
  spacing: 6px;
}

.combo-box-label {
  width: 15em;
}

#overview StScrollBar StBin#trough {
  background-color: rgba(242, 213, 207, 0.12);
}

#overview StScrollBar StButton#vhandle,
#overview StScrollBar StButton#hhandle {
  background-color: rgba(242, 213, 207, 0.5);
}

#overview StScrollBar StButton#vhandle:hover,
#overview StScrollBar StButton#hhandle:hover {
  background-color: rgba(242, 213, 207, 0.7);
}

#overview StScrollBar StButton#vhandle:active,
#overview StScrollBar StButton#hhandle:active {
  background-color: #${config.colorScheme.colors.base06};
}

#overview {
  spacing: 24px;
}

.overview-controls {
  padding-bottom: 30px;
}

/* Top Bar */
#panel {
  background-color: rgba(48, 52, 70, 0.95);
  height: 32px;
  color: #${config.colorScheme.colors.base06};
  font-feature-settings: 'tnum';
  transition-duration: 250ms;
  font-size: 10pt;
  font-weight: bold;
  margin: 4px 10px 1px;
  border: 2px solid #${config.colorScheme.colors.base0D};
  border-radius: 50px;
}

#panel .panel-corner {
  -panel-corner-radius: 0;
  -panel-corner-background-color: rgba(48, 52, 70, 0.95);
  -panel-corner-border-width: 2px;
  -panel-corner-border-color: transparent;
  -panel-corner-opacity: 1;
  transition-duration: 250ms;
}

#panel .panel-button {
  -natural-hpadding: 12px;
  -minimum-hpadding: 6px;
  font-weight: bold;
  color: #${config.colorScheme.colors.base06};
  transition-duration: 150ms;
  border-radius: 9999px;
  text-shadow: none;
  border: 4px solid transparent;
}

#panel .panel-button.clock-display .clock {
  transition-duration: 150ms;
  border: 4px solid transparent;
  border-radius: 9999px;
}

#panel .panel-button:hover {
  color: #${config.colorScheme.colors.base09};
  background-color: transparent;
  box-shadow: inset 0 0 0 1000px #${config.colorScheme.colors.base02};
}

#panel .panel-button.clock-display:hover {
  box-shadow: none;
  color: #${config.colorScheme.colors.base09};
}

#panel .panel-button.clock-display:hover .clock {
  color: #${config.colorScheme.colors.base09};
  box-shadow: inset 0 0 0 1000px #${config.colorScheme.colors.base02};
}

#panel .panel-button:active,
#panel .panel-button:active:hover,
#panel .panel-button:overview,
#panel .panel-button:overview:hover,
#panel .panel-button:focus,
#panel .panel-button:focus:hover,
#panel .panel-button:checked,
#panel .panel-button:checked:hover {
  background-color: transparent;
  color: #${config.colorScheme.colors.base09};
  box-shadow: inset 0 0 0 1000px #${config.colorScheme.colors.base03};
}

#panel .panel-button:active .panel-button,
#panel .panel-button:overview .panel-button,
#panel .panel-button:focus .panel-button,
#panel .panel-button:checked .panel-button {
  background-color: transparent;
  color: rgba(0, 0, 0, 0.87);
  box-shadow: inset 0 0 0 1000px #${config.colorScheme.colors.base02};
}

#panel .panel-button:active .panel-button:hover,
#panel .panel-button:overview .panel-button:hover,
#panel .panel-button:focus .panel-button:hover,
#panel .panel-button:checked .panel-button:hover {
  color: #${config.colorScheme.colors.base09};
  background-color: transparent;
  box-shadow: inset 0 0 0 1000px rgba(0, 0, 0, 0.12);
}

#panel .panel-button:active .panel-button:active,
#panel .panel-button:active .panel-button:overview,
#panel .panel-button:active .panel-button:focus,
#panel .panel-button:active .panel-button:checked,
#panel .panel-button:overview .panel-button:active,
#panel .panel-button:overview .panel-button:overview,
#panel .panel-button:overview .panel-button:focus,
#panel .panel-button:overview .panel-button:checked,
#panel .panel-button:focus .panel-button:active,
#panel .panel-button:focus .panel-button:overview,
#panel .panel-button:focus .panel-button:focus,
#panel .panel-button:focus .panel-button:checked,
#panel .panel-button:checked .panel-button:active,
#panel .panel-button:checked .panel-button:overview,
#panel .panel-button:checked .panel-button:focus,
#panel .panel-button:checked .panel-button:checked {
  color: rgba(0, 0, 0, 0.87);
  background-color: transparent;
  box-shadow: inset 0 0 0 1000px rgba(0, 0, 0, 0.2);
}

#panel .panel-button.clock-display:active,
#panel .panel-button.clock-display:overview,
#panel .panel-button.clock-display:focus,
#panel .panel-button.clock-display:checked {
  box-shadow: none;
  color: #${config.colorScheme.colors.base09};
}

#panel .panel-button.clock-display:active .clock,
#panel .panel-button.clock-display:overview .clock,
#panel .panel-button.clock-display:focus .clock,
#panel .panel-button.clock-display:checked .clock {
  box-shadow: inset 0 0 0 1000px #${config.colorScheme.colors.base03};
  color: #${config.colorScheme.colors.base09};
}

.unlock-screen #panel .panel-button,
.login-screen #panel .panel-button,
.lock-screen #panel .panel-button {
  color: #${config.colorScheme.colors.base09};
}

.unlock-screen #panel .panel-button:focus,
.unlock-screen #panel .panel-button:hover,
.unlock-screen #panel .panel-button:active,
.login-screen #panel .panel-button:focus,
.login-screen #panel .panel-button:hover,
.login-screen #panel .panel-button:active,
.lock-screen #panel .panel-button:focus,
.lock-screen #panel .panel-button:hover,
.lock-screen #panel .panel-button:active {
  color: #${config.colorScheme.colors.base09};
}

#panel .panel-button .system-status-icon {
  icon-size: 16px;
  padding: 8px;
  margin: 0 4px;
  -st-icon-style: symbolic;
}

#panel .panel-button .panel-status-indicators-box .system-status-icon,
#panel .panel-button .panel-status-menu-box .system-status-icon {
  margin: 0;
}

#panel .panel-button .app-menu-icon {
  -st-icon-style: symbolic;
}

#panel #panelActivities.panel-button {
  -natural-hpadding: 18px;
}

#panel:overview,
#panel.unlock-screen,
#panel.login-screen,
#panel.lock-screen {
  background-color: transparent;
  box-shadow: none;
  border: transparent;
}

#panel:overview StLabel,
#panel:overview StIcon,
#panel.unlock-screen StLabel,
#panel.unlock-screen StIcon,
#panel.login-screen StLabel,
#panel.login-screen StIcon,
#panel.lock-screen StLabel,
#panel.lock-screen StIcon {
  color: #${config.colorScheme.colors.base09};
}

#panel:overview .panel-button:hover,
#panel.unlock-screen .panel-button:hover,
#panel.login-screen .panel-button:hover,
#panel.lock-screen .panel-button:hover {
  color: #${config.colorScheme.colors.base09};
  background-color: transparent;
  box-shadow: inset 0 0 0 1000px rgba(242, 213, 207, 0.12);
}

#panel:overview .panel-button.clock-display:hover,
#panel.unlock-screen .panel-button.clock-display:hover,
#panel.login-screen .panel-button.clock-display:hover,
#panel.lock-screen .panel-button.clock-display:hover {
  box-shadow: none;
  color: #${config.colorScheme.colors.base09};
}

#panel:overview .panel-button.clock-display:hover .clock,
#panel.unlock-screen .panel-button.clock-display:hover .clock,
#panel.login-screen .panel-button.clock-display:hover .clock,
#panel.lock-screen .panel-button.clock-display:hover .clock {
  color: #${config.colorScheme.colors.base09};
  box-shadow: inset 0 0 0 1000px rgba(242, 213, 207, 0.12);
}

#panel:overview .panel-button:active,
#panel:overview .panel-button:overview,
#panel:overview .panel-button:focus,
#panel:overview .panel-button:checked,
#panel.unlock-screen .panel-button:active,
#panel.unlock-screen .panel-button:overview,
#panel.unlock-screen .panel-button:focus,
#panel.unlock-screen .panel-button:checked,
#panel.login-screen .panel-button:active,
#panel.login-screen .panel-button:overview,
#panel.login-screen .panel-button:focus,
#panel.login-screen .panel-button:checked,
#panel.lock-screen .panel-button:active,
#panel.lock-screen .panel-button:overview,
#panel.lock-screen .panel-button:focus,
#panel.lock-screen .panel-button:checked {
  color: #${config.colorScheme.colors.base09};
  background-color: transparent;
  box-shadow: inset 0 0 0 1000px rgba(242, 213, 207, 0.2);
}

#panel:overview .panel-button.clock-display:active,
#panel:overview .panel-button.clock-display:overview,
#panel:overview .panel-button.clock-display:focus,
#panel:overview .panel-button.clock-display:checked,
#panel.unlock-screen .panel-button.clock-display:active,
#panel.unlock-screen .panel-button.clock-display:overview,
#panel.unlock-screen .panel-button.clock-display:focus,
#panel.unlock-screen .panel-button.clock-display:checked,
#panel.login-screen .panel-button.clock-display:active,
#panel.login-screen .panel-button.clock-display:overview,
#panel.login-screen .panel-button.clock-display:focus,
#panel.login-screen .panel-button.clock-display:checked,
#panel.lock-screen .panel-button.clock-display:active,
#panel.lock-screen .panel-button.clock-display:overview,
#panel.lock-screen .panel-button.clock-display:focus,
#panel.lock-screen .panel-button.clock-display:checked {
  box-shadow: none;
  color: #${config.colorScheme.colors.base09};
}

#panel:overview .panel-button.clock-display:active .clock,
#panel:overview .panel-button.clock-display:overview .clock,
#panel:overview .panel-button.clock-display:focus .clock,
#panel:overview .panel-button.clock-display:checked .clock,
#panel.unlock-screen .panel-button.clock-display:active .clock,
#panel.unlock-screen .panel-button.clock-display:overview .clock,
#panel.unlock-screen .panel-button.clock-display:focus .clock,
#panel.unlock-screen .panel-button.clock-display:checked .clock,
#panel.login-screen .panel-button.clock-display:active .clock,
#panel.login-screen .panel-button.clock-display:overview .clock,
#panel.login-screen .panel-button.clock-display:focus .clock,
#panel.login-screen .panel-button.clock-display:checked .clock,
#panel.lock-screen .panel-button.clock-display:active .clock,
#panel.lock-screen .panel-button.clock-display:overview .clock,
#panel.lock-screen .panel-button.clock-display:focus .clock,
#panel.lock-screen .panel-button.clock-display:checked .clock {
  box-shadow: inset 0 0 0 1000px rgba(242, 213, 207, 0.2);
  color: #${config.colorScheme.colors.base09};
}

#panel:overview .panel-corner,
#panel.unlock-screen .panel-corner,
#panel.login-screen .panel-corner,
#panel.lock-screen .panel-corner {
  -panel-corner-radius: 0;
  -panel-corner-background-color: transparent;
  -panel-corner-border-color: transparent;
}

#panel .panel-status-indicators-box,
#panel .panel-status-menu-box {
  spacing: 2px;
}

#panel .power-status.panel-status-indicators-box {
  spacing: 0;
}

#panel .screencast-indicator,
#panel .remote-access-indicator {
  color: #${config.colorScheme.colors.base0A};
}

/* Popovers/Menus */
.popup-menu-boxpointer {
  -arrow-border-radius: 2px;
  -arrow-background-color: transparent;
  -arrow-border-width: 0;
  -arrow-border-color: transparent;
  -arrow-base: 12px;
  -arrow-rise: 0;
  -arrow-box-shadow: none;
  background: transparent;
}

.popup-menu {
  min-width: 12em;
  color: #${config.colorScheme.colors.base06};
  padding: 0 !important;
  margin: 0 3px;
  font-weight: 500;
  font-size: 10pt;
  border-radius: 12px;
}

.popup-menu .popup-menu-content {
  padding: 6px;
  background-color: rgba(65, 69, 89, 0.95);
  border-radius: 12px;
  margin: 4px;
  font-weight: 500;
  border: 2px solid #${config.colorScheme.colors.base09};
  box-shadow: 0 3px 8px 0 rgba(0, 0, 0, 0.15);
}

.popup-menu .popup-menu-item {
  spacing: 9px;
  padding: 6px;
  color: #${config.colorScheme.colors.base06} !important;
  text-shadow: none;
  border-radius: 6px;
  margin: 0 6px;
  font-weight: 500;
}

.popup-menu .popup-menu-item:checked {
  font-weight: 500;
  border: none;
  box-shadow: none;
  color: rgba(0, 0, 0, 0.87) !important;
  background-color: #${config.colorScheme.colors.base06} !important;
  border-radius: 6px 6px 0 0;
}

.popup-menu .popup-menu-item:checked:focus,
.popup-menu .popup-menu-item:checked:hover,
.popup-menu .popup-menu-item.selected:checked {
  color: rgba(0, 0, 0, 0.87) !important;
  background-color: #a5adce !important;
}

.popup-menu .popup-menu-item:checked:active {
  color: rgba(0, 0, 0, 0.87) !important;
  background-color: #b5bfe2 !important;
}

.popup-menu .popup-menu-item:checked:insensitive {
  color: rgba(0, 0, 0, 0.38) !important;
}

.popup-menu .popup-menu-item:focus,
.popup-menu .popup-menu-item:hover,
.popup-menu .popup-menu-item.selected {
  color: #${config.colorScheme.colors.base06} !important;
  background-color: rgba(242, 213, 207, 0.12) !important;
  transition-duration: 0;
}

.popup-menu .popup-menu-item:active,
.popup-menu .popup-menu-item.selected:active {
  color: #${config.colorScheme.colors.base06} !important;
  background-color: rgba(242, 213, 207, 0.3) !important;
}

.popup-menu .popup-menu-item:insensitive {
  color: rgba(242, 213, 207, 0.3) !important;
}

.popup-menu .popup-sub-menu {
  border: none;
  box-shadow: none;
  margin: 0 6px;
  border-radius: 0 0 6px 6px;
  background-color: #${config.colorScheme.colors.base06} !important;
  color: rgba(0, 0, 0, 0.6) !important;
}

.popup-menu .popup-sub-menu .popup-menu-item {
  border-radius: 0;
  margin: 0;
  color: rgba(0, 0, 0, 0.6) !important;
}

.popup-menu .popup-sub-menu .popup-menu-item:focus,
.popup-menu .popup-sub-menu .popup-menu-item.hover,
.popup-menu .popup-sub-menu .popup-menu-item.selected {
  color: rgba(0, 0, 0, 0.87) !important;
  background-color: rgba(0, 0, 0, 0.12) !important;
}

.popup-menu .popup-sub-menu .popup-menu-item:active,
.popup-menu .popup-sub-menu .popup-menu-item.selected:active {
  color: rgba(0, 0, 0, 0.87) !important;
  background-color: rgba(0, 0, 0, 0.26) !important;
}

.popup-menu .popup-sub-menu .popup-menu-item:insensitive {
  color: rgba(0, 0, 0, 0.26) !important;
}

.popup-menu
  .popup-sub-menu
  .popup-menu-section:last-child
  .popup-menu-item:last-child {
  border-radius: 0 0 6px 6px;
}

.popup-menu .popup-inactive-menu-item {
  color: #${config.colorScheme.colors.base09} !important;
}

.popup-menu .popup-inactive-menu-item:insensitive {
  color: rgba(242, 213, 207, 0.3) !important;
}

.popup-menu.panel-menu {
  -boxpointer-gap: 4px;
  margin-bottom: 1.75em;
}

.popup-menu-arrow,
.popup-menu-icon {
  icon-size: 16px !important;
}

.popup-menu-ornament {
  width: 1.2em;
}

.popup-menu-ornament:ltr {
  text-align: right;
}

.popup-menu-ornament:rtl {
  text-align: left;
}

.background-menu {
  -boxpointer-gap: 4px;
  -arrow-rise: 0px;
}

.aggregate-menu {
  min-width: 21em;
}

.aggregate-menu .popup-menu-icon {
  padding: 0;
  margin: 0 3px;
  -st-icon-style: symbolic;
}

.quick-settings {
  padding: 12px !important;
  border-radius: 12px !important;
}

.quick-settings .icon-button,
.quick-settings .button {
  padding: 10.5px;
}

.quick-settings .icon-button > StIcon,
.quick-settings .button > StIcon {
  icon-size: 16px !important;
}

.quick-settings-grid {
  spacing-rows: 12px;
  spacing-columns: 12px;
}

.quick-toggle {
  border-radius: 8px;
  min-width: 12em;
  max-width: 12em;
  min-height: 40px;
  border: none;
  border: 1px solid rgba(242, 213, 207, 0.2);
  background-color: rgba(242, 213, 207, 0.08) !important;
}

.quick-toggle:hover {
  background-color: rgba(242, 213, 207, 0.12) !important;
}

.quick-toggle:active {
  background-color: rgba(242, 213, 207, 0.15) !important;
}

.quick-toggle:checked {
  background-color: #${config.colorScheme.colors.base0D} !important;
  color: rgba(0, 0, 0, 0.87);
}

.quick-toggle:checked:hover {
  background-color: #85c1dc !important;
  color: rgba(0, 0, 0, 0.87);
}

.quick-toggle:checked:active {
  background-color: #99d1db !important;
  color: rgba(0, 0, 0, 0.87);
}

.quick-toggle > StBoxLayout {
  spacing: 6px;
  padding: 0 12px;
}

.quick-toggle.button {
  padding: 0;
}

.quick-toggle:ltr > StBoxLayout {
  padding-left: 15px;
}

.quick-toggle:rtl > StBoxLayout {
  padding-right: 15px;
}

.quick-toggle .quick-toggle-label {
  font-weight: bold;
}

.quick-toggle .quick-toggle-icon,
.quick-toggle .quick-toggle-arrow {
  icon-size: 16px !important;
}

.quick-menu-toggle:ltr > StBoxLayout {
  padding-right: 0;
}

.quick-menu-toggle:rtl > StBoxLayout {
  padding-left: 0;
}

.quick-menu-toggle .quick-toggle-arrow {
  background-color: rgba(242, 213, 207, 0.08) !important;
  padding: 6px 10.5px;
  icon-size: 16px !important;
}

.quick-menu-toggle .quick-toggle-arrow:active {
  background-color: rgba(242, 213, 207, 0.12) !important;
}

.quick-menu-toggle .quick-toggle-arrow:ltr {
  border-radius: 0 6px 6px 0;
}

.quick-menu-toggle .quick-toggle-arrow:rtl {
  border-radius: 6px 0 0 6px;
}

.quick-slider {
  padding: 0 6px;
}

.quick-slider > StBoxLayout {
  spacing: 6px;
}

.quick-slider .slider-bin {
  min-height: 16px;
  padding: 6px;
  border-radius: 9999px;
}

.quick-slider .slider-bin:focus {
  color: #${config.colorScheme.colors.base06};
  background-color: rgba(242, 213, 207, 0.08);
  box-shadow: none !important;
}

.quick-slider .quick-toggle-icon,
.quick-slider .quick-toggle-arrow {
  icon-size: 16px !important;
}

.quick-slider .icon-button {
  background-color: transparent;
  color: #${config.colorScheme.colors.base09} !important;
}

.quick-slider .icon-button:hover {
  background-color: rgba(242, 213, 207, 0.04);
}

.quick-slider .icon-button:active {
  background-color: rgba(242, 213, 207, 0.12);
}

.quick-toggle-menu {
  background-color: #${config.colorScheme.colors.base03} !important;
  color: #${config.colorScheme.colors.base06} !important;
  border-radius: 12px !important;
  padding: 12px;
  margin: 12px 30px 0;
  box-shadow: inset 0 0 0 1px rgba(239, 240, 242, 0.2);
}

.quick-toggle-menu .popup-menu-item {
  min-height: 20px;
  padding: 6px;
  spacing: 6px;
  border-radius: 6px !important;
  color: #${config.colorScheme.colors.base06} !important;
}

.quick-toggle-menu .popup-menu-item:focus,
.quick-toggle-menu .popup-menu-item.hover,
.quick-toggle-menu .popup-menu-item.selected {
  color: #${config.colorScheme.colors.base06} !important;
  background-color: rgba(242, 213, 207, 0.1) !important;
}

.quick-toggle-menu .popup-menu-item:active,
.quick-toggle-menu .popup-menu-item.selected:active {
  color: #${config.colorScheme.colors.base06} !important;
  background-color: rgba(242, 213, 207, 0.2) !important;
}

.quick-toggle-menu .popup-menu-item > StIcon {
  -st-icon-style: symbolic;
}

.quick-toggle-menu .header {
  spacing-rows: 3px;
  spacing-columns: 12px;
  padding-bottom: 12px;
}

.quick-toggle-menu .header .icon {
  icon-size: 24px;
  border-radius: 6px;
  padding: 9px;
  background-color: #${config.colorScheme.colors.base09} !important;
  color: rgba(0, 0, 0, 0.87);
}

.quick-toggle-menu .header .icon.active {
  background-color: #${config.colorScheme.colors.base09} !important;
  color: rgba(0, 0, 0, 0.87);
}

.quick-settings-system-item > StBoxLayout {
  spacing: 12px;
}

.quick-settings-system-item .icon-button {
  background-color: rgba(242, 213, 207, 0.12);
  color: #${config.colorScheme.colors.base09};
  border-radius: 6px;
  border: 1px solid rgba(242, 213, 207, 0.2);
}

.quick-settings-system-item .icon-button:hover {
  background-color: rgba(234, 232, 255, 0.12);
  color: #99d1db;
  border-radius: 6px;
  border: 1px solid rgba(234, 232, 255, 0.2);
}

.quick-settings-system-item .icon-button > StIcon {
  -st-icon-style: symbolic;
  icon-size: 16px !important;
}

.quick-settings-system-item .power-item {
  min-height: 0;
  min-width: 0;
  color: #${config.colorScheme.colors.base09};
}

.quick-settings-system-item .power-item:hover {
  min-height: 0;
  min-width: 0;
  color: #99d1db;
}

.quick-settings-system-item .power-item:insensitive {
  color: #${config.colorScheme.colors.base09};
  background-color: rgba(41, 44, 60, 0.95);
  box-shadow: none !important;
  background-color: transparent;
}

.nm-network-item .wireless-secure-icon {
  icon-size: 8px;
}

/* Screen Shield */
.unlock-dialog-clock {
  color: #${config.colorScheme.colors.base06};
  font-weight: 300;
  text-align: center;
  spacing: 24px;
  padding-bottom: 2.5em;
}

.unlock-dialog-clock-time {
  font-size: 64pt;
  padding-top: 42px;
  font-feature-settings: 'tnum';
}

.unlock-dialog-clock-date {
  font-size: 16pt;
  font-weight: normal;
}

.unlock-dialog-clock-hint {
  font-weight: normal;
  padding-top: 48px;
}

.unlock-dialog-notifications-container {
  margin: 12px 0;
  spacing: 6px;
  width: 23em;
  background-color: transparent;
}

.unlock-dialog-notifications-container .summary-notification-stack-scrollview {
  padding-top: 0;
  padding-bottom: 0;
}

.unlock-dialog-notifications-container .notification,
.unlock-dialog-notifications-container .unlock-dialog-notification-source {
  padding: 12px 6px;
  border: none;
  background-color: rgba(48, 52, 70, 0.95);
  color: #${config.colorScheme.colors.base06};
  border-radius: 12px;
}

.unlock-dialog-notifications-container .notification.critical,
.unlock-dialog-notifications-container
  .unlock-dialog-notification-source.critical {
  background-color: #${config.colorScheme.colors.base03};
}

.unlock-dialog-notification-label {
  padding: 0px 0px 0px 12px;
}

.unlock-dialog-notification-count-text {
  weight: bold;
  padding: 0 6px;
  color: rgba(0, 0, 0, 0.87);
  background-color: #${config.colorScheme.colors.base0F};
  border-radius: 9999px;
  margin-right: 12px;
}

.screen-shield-background {
  background: black;
  box-shadow: 0 2px 3px 0 rgba(0, 0, 0, 0.15);
}

#unlockDialogNotifications StButton#vhandle,
#unlockDialogNotifications StButton#hhandle {
  background-color: rgba(65, 69, 89, 0.3);
}

#unlockDialogNotifications StButton#vhandle:hover,
#unlockDialogNotifications StButton#vhandle:focus,
#unlockDialogNotifications StButton#hhandle:hover,
#unlockDialogNotifications StButton#hhandle:focus {
  background-color: rgba(65, 69, 89, 0.5);
}

#unlockDialogNotifications StButton#vhandle:active,
#unlockDialogNotifications StButton#hhandle:active {
  background-color: rgba(238, 190, 190, 0.5);
}

/* Scrollbars */
StScrollView.vfade {
  -st-vfade-offset: 32px;
}

StScrollView.hfade {
  -st-hfade-offset: 32px;
}

StScrollBar {
  padding: 6px;
}

StScrollView StScrollBar {
  min-width: 8px;
  min-height: 8px;
}

StScrollBar StBin#trough {
  border-radius: 9999px;
  background-color: rgba(242, 213, 207, 0.12);
}

StScrollBar StButton#vhandle,
StScrollBar StButton#hhandle {
  border-radius: 9999px;
  background-color: rgba(242, 213, 207, 0.5);
  border: 4px solid transparent;
}

StScrollBar StButton#vhandle:hover,
StScrollBar StButton#hhandle:hover {
  background-color: rgba(242, 213, 207, 0.7);
}

StScrollBar StButton#vhandle:active,
StScrollBar StButton#hhandle:active {
  background-color: #${config.colorScheme.colors.base06};
}

.popup-sub-menu StScrollBar StBin#trough {
  background-color: rgba(0, 0, 0, 0.12);
}

.popup-sub-menu StScrollBar StButton#vhandle,
.popup-sub-menu StScrollBar StButton#hhandle {
  background-color: rgba(0, 0, 0, 0.26);
}

.popup-sub-menu StScrollBar StButton#vhandle:hover,
.popup-sub-menu StScrollBar StButton#hhandle:hover {
  background-color: rgba(0, 0, 0, 0.38);
}

.popup-sub-menu StScrollBar StButton#vhandle:active,
.popup-sub-menu StScrollBar StButton#hhandle:active {
  background-color: rgba(0, 0, 0, 0.6);
}

.search-entry {
  width: 320px;
  min-height: 20px;
  padding: 6px 12px;
  transition-duration: 150ms;
  border-radius: 6px;
}

.search-entry .search-entry-icon {
  color: rgba(242, 213, 207, 0.5);
  icon-size: 16px;
  margin-top: 0;
  padding: 0 4px;
}

.search-entry StLabel.hint-text {
  color: rgba(242, 213, 207, 0.5);
}

.search-entry:hover .search-entry-icon,
.search-entry:focus .search-entry-icon {
  color: rgba(242, 213, 207, 0.7);
}

.search-entry:insensitive StLabel.hint-text,
.search-entry:insensitive .search-entry-icon {
  color: rgba(242, 213, 207, 0.3);
}

.app-folder-dialog .folder-name-container .folder-name-entry,
.login-dialog StEntry,
.unlock-dialog StEntry,
#overview .search-entry {
  color: #${config.colorScheme.colors.base06};
  background-color: rgba(242, 213, 207, 0.04);
  border: 2px solid transparent;
  box-shadow: none;
  caret-color: #${config.colorScheme.colors.base06};
  selection-background-color: rgba(242, 213, 207, 0.25);
  selected-color: #${config.colorScheme.colors.base06};
}

.app-folder-dialog .folder-name-container .folder-name-entry:hover,
.login-dialog StEntry:hover,
.unlock-dialog StEntry:hover,
#overview .search-entry:hover {
  color: #${config.colorScheme.colors.base06};
  border-color: rgba(242, 213, 207, 0.35);
  background-color: rgba(242, 213, 207, 0.04);
}

.app-folder-dialog .folder-name-container .folder-name-entry:focus,
.login-dialog StEntry:focus,
.unlock-dialog StEntry:focus,
#overview .search-entry:focus {
  color: #${config.colorScheme.colors.base06};
  border-color: #${config.colorScheme.colors.base06};
  background-color: rgba(242, 213, 207, 0.04);
  box-shadow: none;
}

.app-folder-dialog .folder-name-container .folder-name-entry .search-entry-icon,
.login-dialog StEntry .search-entry-icon,
.unlock-dialog StEntry .search-entry-icon,
#overview .search-entry .search-entry-icon {
  color: rgba(242, 213, 207, 0.5);
}

.app-folder-dialog .folder-name-container .folder-name-entry StLabel.hint-text,
.login-dialog StEntry StLabel.hint-text,
.unlock-dialog StEntry StLabel.hint-text,
#overview .search-entry StLabel.hint-text {
  color: rgba(242, 213, 207, 0.5);
}

.app-folder-dialog
  .folder-name-container
  .folder-name-entry:hover
  .search-entry-icon,
.login-dialog StEntry:hover .search-entry-icon,
.unlock-dialog StEntry:hover .search-entry-icon,
.app-folder-dialog
  .folder-name-container
  .folder-name-entry:focus
  .search-entry-icon,
.login-dialog StEntry:focus .search-entry-icon,
.unlock-dialog StEntry:focus .search-entry-icon,
#overview .search-entry:hover .search-entry-icon,
#overview .search-entry:focus .search-entry-icon {
  color: rgba(242, 213, 207, 0.7);
}

.app-folder-dialog .folder-name-container .folder-name-entry:insensitive,
.login-dialog StEntry:insensitive,
.unlock-dialog StEntry:insensitive,
#overview .search-entry:insensitive {
  background-color: transparent;
  color: rgba(242, 213, 207, 0.35);
  border-color: transparent;
}

.app-folder-dialog
  .folder-name-container
  .folder-name-entry:insensitive
  StLabel.hint-text,
.login-dialog StEntry:insensitive StLabel.hint-text,
.unlock-dialog StEntry:insensitive StLabel.hint-text,
.app-folder-dialog
  .folder-name-container
  .folder-name-entry:insensitive
  .search-entry-icon,
.login-dialog StEntry:insensitive .search-entry-icon,
.unlock-dialog StEntry:insensitive .search-entry-icon,
#overview .search-entry:insensitive StLabel.hint-text,
#overview .search-entry:insensitive .search-entry-icon {
  color: rgba(242, 213, 207, 0.3);
}

/* Search */
.list-search-result,
.search-provider-icon {
  border-radius: 6px;
  padding: 6px;
  transition-duration: 100ms;
  text-align: center;
}

.list-search-result:focus,
.search-provider-icon:focus,
.list-search-result:hover,
.search-provider-icon:hover,
.list-search-result:selected,
.search-provider-icon:selected {
  background-color: rgba(242, 213, 207, 0.12);
  transition-duration: 200ms;
}

.list-search-result:active,
.search-provider-icon:active,
.list-search-result:checked,
.search-provider-icon:checked {
  background-color: rgba(242, 213, 207, 0.2);
}

#searchResultsContent {
  max-width: 1024px;
  spacing: 8px;
}

.search-section {
  spacing: 8px;
  background: none;
}

.search-section .search-section-separator {
  height: 1px;
  background-color: rgba(242, 213, 207, 0.12);
}

.search-section-content {
  spacing: 8px;
  border-radius: 0;
  padding: 18px;
  border: none;
  box-shadow: none;
  background: none;
  text-shadow: none;
  color: #${config.colorScheme.colors.base06};
}

.search-statustext {
  font-size: 2em;
  font-weight: bold;
  color: rgba(242, 213, 207, 0.5);
}

.grid-search-results {
  spacing: 36px;
}

.search-provider-icon .list-search-provider-content {
  spacing: 12px;
}

.search-provider-icon
  .list-search-provider-content
  .list-search-provider-details {
  width: 120px;
  margin-top: 0;
  color: #${config.colorScheme.colors.base08};
}

.list-search-results {
  spacing: 6px;
}

.list-search-result .list-search-result-content {
  spacing: 6px;
}

.list-search-result .list-search-result-title {
  spacing: 12px;
}

.list-search-result .list-search-result-description {
  color: #ff9e64;
}

/* Slider */
.slider {
  height: 20px;
  color: rgba(65, 69, 89, 0.95);
  -slider-height: 2px;
  -slider-background-color: rgba(242, 213, 207, 0.3);
  -slider-border-color: #${config.colorScheme.colors.base09};
  -slider-active-background-color: #${config.colorScheme.colors.base09};
  -slider-active-border-color: #${config.colorScheme.colors.base09};
  -slider-border-width: 2px;
  -slider-handle-radius: 7px;
  -slider-handle-border-width: 2px;
  -slider-handle-border-color: #ff9e64;
  -barlevel-height: 2px;
  -barlevel-background-color: rgba(242, 213, 207, 0.3);
  -barlevel-border-color: transparent;
  -barlevel-active-background-color: #${config.colorScheme.colors.base09};
  -barlevel-active-border-color: transparent;
  -barlevel-overdrive-color: #${config.colorScheme.colors.base08};
  -barlevel-overdrive-border-color: transparent;
  -barlevel-overdrive-separator-width: 2px;
  -barlevel-border-width: 0;
}

/* App Switcher */
.switcher-popup {
  padding: 8px;
  spacing: 24px;
}

.switcher-list {
  background-color: rgba(65, 69, 89, 0.95);
  box-shadow: inset 0 0 0 1px rgba(242, 213, 207, 0.1);
}

.switcher-list .item-box {
  padding: 8px;
  border-radius: 15px;
  border: 1px solid transparent;
}

.switcher-list .item-box:outlined {
  background-color: #${config.colorScheme.colors.base03};
  color: #${config.colorScheme.colors.base09};
  border-radius: 15px;
}

.switcher-list .item-box:selected {
  background-color: #${config.colorScheme.colors.base03};
  color: #${config.colorScheme.colors.base09};
  border-radius: 15px;
}

.switcher-list .thumbnail-box {
  padding: 2px;
  spacing: 6px;
}

.switcher-list .thumbnail {
  width: 256px;
}

.switcher-list .separator {
  width: 1px;
  background: rgba(242, 213, 207, 0.12);
}

.switcher-list .switcher-list-item-container {
  spacing: 12px;
}

.switcher-arrow {
  border-color: rgba(0, 0, 0, 0);
  color: #${config.colorScheme.colors.base0D};
}

.switcher-arrow:highlighted {
  color: #${config.colorScheme.colors.base0D};
}

.input-source-switcher-symbol {
  font-size: 34pt;
  width: 96px;
  height: 96px;
}

.cycler-highlight {
  border: 5px solid #${config.colorScheme.colors.base0F};
}

/* Switches */
.toggle-switch {
  width: 40px;
  height: 20px;
  background-size: contain;
  background-image: url('assets/toggle-off-dark.svg');
}

.toggle-switch:checked {
  background-image: url('assets/toggle-on-dark.svg');
}

.popup-sub-menu .toggle-switch {
  background-image: url('assets/toggle-off.svg');
}

.popup-sub-menu .toggle-switch:checked {
  background-image: url('assets/toggle-on.svg');
}

/* Tiled window previews */
.tile-preview {
  background-color: rgba(238, 190, 190, 0.3);
  border: 1px solid #${config.colorScheme.colors.base0F};
  border-radius: 12px;
}

.tile-preview-left.on-primary {
  border-radius: 12px;
}

.tile-preview-right.on-primary {
  border-radius: 12px;
}

.tile-preview-left.tile-preview-right.on-primary {
  border-radius: 12px;
}

/* Workspace Switcher */
.workspace-switcher-group {
  padding: 12px;
}

.workspace-switcher {
  background: transparent;
  border: none;
  border-radius: 0;
  padding: 0;
  spacing: 12px;
}

.ws-switcher-box {
  background: transparent;
  height: 50px;
  background-size: 32px;
  background: rgba(242, 213, 207, 0.12);
  border-radius: 6px;
}

.ws-switcher-active-up,
.ws-switcher-active-down,
.ws-switcher-active-left,
.ws-switcher-active-right {
  height: 52px;
  background-color: #${config.colorScheme.colors.base0F};
  color: rgba(0, 0, 0, 0.87);
  border-radius: 9px;
  border: none;
}

.icon-grid {
  row-spacing: 12px;
  column-spacing: 12px;
  max-row-spacing: 72px;
  max-column-spacing: 72px;
  page-padding-top: 24px;
  page-padding-bottom: 24px;
  page-padding-left: 12px;
  page-padding-right: 12px;
}

.page-indicator {
  padding: 6px 12px 0;
}

.page-indicator .page-indicator-icon {
  width: 10px;
  height: 10px;
  border-radius: 10px;
  background-color: #${config.colorScheme.colors.base06};
}

.apps-scroll-view {
  padding: 0;
}

.page-navigation-hint {
  width: 300px;
}

.page-navigation-hint.dnd {
  background: rgba(242, 213, 207, 0.1);
}

.page-navigation-hint.next:ltr,
.page-navigation-hint.previous:rtl {
  background-gradient-start: rgba(242, 213, 207, 0.05);
  background-gradient-end: transparent;
  background-gradient-direction: horizontal;
  border-radius: 15px 0px 0px 15px;
}

.page-navigation-hint.previous:ltr,
.page-navigation-hint.next:rtl {
  background-gradient-start: transparent;
  background-gradient-end: rgba(242, 213, 207, 0.05);
  background-gradient-direction: horizontal;
  border-radius: 0px 15px 15px 0px;
}

.page-navigation-arrow > StIcon {
  margin: 6px;
  padding: 18px;
  width: 24px;
  height: 24px;
  border-radius: 9999px;
  color: rgba(242, 213, 207, 0.7);
}

.page-navigation-arrow:insensitive > StIcon {
  background-color: rgba(242, 213, 207, 0.04);
  color: rgba(242, 213, 207, 0.5);
}

.page-navigation-arrow:hover > StIcon {
  background-color: rgba(242, 213, 207, 0.12);
  color: #${config.colorScheme.colors.base06};
}

.page-navigation-arrow:active > StIcon {
  background-color: rgba(242, 213, 207, 0.3);
  color: #${config.colorScheme.colors.base06};
}

#dash {
  margin-top: 12px;
  padding: 0 10px;
}

#dash .placeholder {
  background-image: none;
  background-size: contain;
  height: 32px;
}

#dash .overview-icon {
  padding: 5px;
}

.dash-background {
  background-color: rgba(242, 213, 207, 0.3);
  border: 2px solid #${config.colorScheme.colors.base09};
  margin-bottom: 16px;
  padding: 10px;
  border-radius: 16px;
}

.dash-item-container .app-well-app,
.show-apps {
  padding: 10px 2px 26px;
}

.dash-separator {
  width: 1px;
  margin: 0 7px 16px;
  background-color: rgba(242, 213, 207, 0.12);
}

.workspace-animation {
  background-color: rgba(48, 52, 70, 0.95);
}

.calendar .calendar-change-month-back,
.calendar .calendar-change-month-forward {
  padding: 0 2px;
}

.controls-manager,
.secondary-monitor-workspaces {
  spacing: 12px;
}

#overviewGroup {
  background-color: #${config.colorScheme.colors.base01};
}

.osd-window {
  spacing: 12px;
  padding: 12px 18px;
  margin-bottom: 4em;
}

.osd-window > * {
  spacing: 8px;
}

.osd-window StIcon {
  icon-size: 32px;
}

.osd-window StLabel:ltr {
  margin-right: 6px;
}

.osd-window StLabel:rtl {
  margin-left: 6px;
}

#appMenu {
  spacing: 6px;
}

#appMenu .label-shadow {
  color: transparent;
}

#appMenu .panel-status-menu-box {
  padding: 0 6px;
  spacing: 6px;
}

.popup-menu .popup-menu-item {
  padding: 6px 12px;
}

.popup-menu .popup-menu-item:ltr {
  padding-right: 9px !important;
  padding-left: 0 !important;
}

.popup-menu .popup-menu-item:rtl {
  padding-right: 0 !important;
  padding-left: 9px !important;
}

.popup-separator-menu-item {
  padding: 0;
  margin: 6px 0;
}

.popup-separator-menu-item:ltr {
  margin-right: 4px;
}

.popup-separator-menu-item:rtl {
  margin-left: 4px;
}

.popup-separator-menu-item .popup-separator-menu-item-separator {
  height: 1px;
  background-color: rgba(242, 213, 207, 0.12);
}

.popup-separator-menu-item .popup-menu-ornament {
  width: 0 !important;
}

.popup-sub-menu .popup-separator-menu-item {
  background-color: transparent;
}

.popup-sub-menu .popup-separator-menu-item:ltr {
  margin-right: 2.5em;
}

.popup-sub-menu .popup-separator-menu-item:rtl {
  margin-left: 2.5em;
}

.popup-sub-menu
  .popup-separator-menu-item
  .popup-separator-menu-item-separator {
  background-color: rgba(0, 0, 0, 0.12);
}

.aggregate-menu .popup-sub-menu .popup-menu-item > :first-child:ltr {
  padding-left: 12px !important;
  margin-left: 3px !important;
}

.aggregate-menu .popup-sub-menu .popup-menu-item > :first-child:rtl {
  padding-right: 12px !important;
  margin-right: 3px !important;
}

.search-entry {
  margin-top: 24px;
  margin-bottom: 6px;
}

.icon-label-button-container {
  spacing: 6px;
}

.icon-label-button-container StIcon {
  icon-size: 32px;
}

.screenshot-ui-panel {
  border-radius: 33px;
  padding: 18px;
  padding-bottom: 12px;
  margin-bottom: 4em;
  spacing: 12px;
  border: 2px solid #${config.colorScheme.colors.base0F};
}

.screenshot-ui-close-button {
  padding: 6px !important;
  margin-top: 12px;
  box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.15);
}

.screenshot-ui-close-button.left {
  margin-left: 12px;
}

.screenshot-ui-close-button.right {
  margin-right: 12px;
}

.screenshot-ui-type-button {
  min-width: 48px;
  padding: 12px 18px !important;
  border-radius: 15px;
}

.screenshot-ui-capture-button {
  width: 36px;
  height: 36px;
  border-radius: 9999px;
  border: 4px #${config.colorScheme.colors.base06};
  padding: 4px;
}

.screenshot-ui-capture-button .screenshot-ui-capture-button-circle {
  background-color: #${config.colorScheme.colors.base06};
  transition-duration: 200ms;
  border-radius: 9999px;
}

.screenshot-ui-capture-button .screenshot-ui-capture-button-circle:hover,
.screenshot-ui-capture-button .screenshot-ui-capture-button-circle:focus {
  background-color: rgba(242, 213, 207, 0.12);
}

.screenshot-ui-capture-button:hover .screenshot-ui-capture-button-circle,
.screenshot-ui-capture-button:focus .screenshot-ui-capture-button-circle {
  background-color: #d9d9d9;
}

.screenshot-ui-capture-button:active .screenshot-ui-capture-button-circle {
  background-color: #838ba7;
}

.screenshot-ui-capture-button:cast .screenshot-ui-capture-button-circle {
  background-color: #${config.colorScheme.colors.base08};
}

.screenshot-ui-capture-button:cast:hover .screenshot-ui-capture-button-circle,
.screenshot-ui-capture-button:cast:focus .screenshot-ui-capture-button-circle {
  background-color: #f4a099;
}

.screenshot-ui-capture-button:cast:active .screenshot-ui-capture-button-circle {
  background-color: #ef6d62;
}

.screenshot-ui-shot-cast-container {
  background-color: #${config.colorScheme.colors.base02};
  border-radius: 12px;
  padding: 3px;
  spacing: 3px;
}

.screenshot-ui-shot-cast-container:ltr {
  margin-left: 3px;
}

.screenshot-ui-shot-cast-container:rtl {
  margin-right: 3px;
}

.screenshot-ui-shot-cast-button {
  padding: 6px 12px;
  background-color: transparent;
  border-radius: 9px;
}

.screenshot-ui-shot-cast-button:hover,
.screenshot-ui-shot-cast-button:focus {
  background-color: #${config.colorScheme.colors.base03};
}

.screenshot-ui-shot-cast-button:active {
  background-color: rgba(242, 213, 207, 0.3);
}

.screenshot-ui-shot-cast-button:checked {
  background-color: #${config.colorScheme.colors.base06};
  color: black;
}

.screenshot-ui-shot-cast-button:insensitive {
  color: rgba(242, 213, 207, 0.5);
}

.screenshot-ui-shot-cast-button StIcon {
  icon-size: 16px;
}

.screenshot-ui-show-pointer-button {
  border-radius: 9999px;
  padding: 12px !important;
}

.screenshot-ui-show-pointer-button StIcon {
  icon-size: 16px;
}

.screenshot-ui-area-indicator-shade {
  background-color: rgba(0, 0, 0, 0.3);
}

.screenshot-ui-area-selector .screenshot-ui-area-indicator-shade {
  background-color: rgba(0, 0, 0, 0.5);
}

.screenshot-ui-area-selector .screenshot-ui-area-indicator-selection {
  border: 2px #${config.colorScheme.colors.base06};
}

.screenshot-ui-area-selector-handle {
  border-radius: 9999px;
  background-color: #${config.colorScheme.colors.base06};
  box-shadow: 0 1px 3px 2px rgba(0, 0, 0, 0.2);
  width: 24px;
  height: 24px;
}

.screenshot-ui-window-selector {
  background-color: #${config.colorScheme.colors.base02};
}

.screenshot-ui-window-selector .screenshot-ui-window-selector-window-container {
  margin: 100px;
}

.screenshot-ui-window-selector:primary-monitor
  .screenshot-ui-window-selector-window-container {
  margin-bottom: 200px;
}

.screenshot-ui-window-selector-window-border {
  transition-duration: 200ms;
  border-radius: 12px;
  border: 6px transparent;
}

.screenshot-ui-window-selector-check {
  transition-duration: 200ms;
  color: transparent;
  border-radius: 99px;
  border-width: 12px;
  icon-size: 24px;
}

.screenshot-ui-window-selector-window:hover
  .screenshot-ui-window-selector-window-border {
  border-color: #949cbb;
}

.screenshot-ui-window-selector-window:checked
  .screenshot-ui-window-selector-window-border {
  border-color: #${config.colorScheme.colors.base0F};
  background-color: rgba(238, 190, 190, 0.2);
}

.screenshot-ui-window-selector-window:checked
  .screenshot-ui-window-selector-check {
  color: rgba(0, 0, 0, 0.87);
  background-color: #${config.colorScheme.colors.base0F};
}

.screenshot-ui-screen-selector {
  transition-duration: 200ms;
  background-color: rgba(0, 0, 0, 0.5);
}

.screenshot-ui-screen-selector:hover {
  background-color: rgba(0, 0, 0, 0.3);
}

.screenshot-ui-screen-selector:active {
  background-color: rgba(0, 0, 0, 0.7);
}

.screenshot-ui-screen-selector:checked {
  background-color: transparent;
  border: 2px #${config.colorScheme.colors.base06};
}

.screenshot-ui-tooltip {
  color: #${config.colorScheme.colors.base06};
  background-color: rgba(48, 52, 70, 0.95);
  border-radius: 9999px;
  padding: 6px 12px;
  text-align: center;
  -y-offset: 24px;
}

.window-picker {
  spacing: 6px;
}

.window-caption {
  color: #${config.colorScheme.colors.base06};
  background-color: rgba(48, 52, 70, 0.95);
  border-radius: 9999px;
  padding: 6px 12px;
}

.window-close,
.screenshot-ui-close-button {
  background-color: #${config.colorScheme.colors.base02};
  color: #${config.colorScheme.colors.base06};
  border-radius: 21px;
  padding: 3px;
  height: 30px;
  width: 30px;
  box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.5);
  transition-duration: 200ms;
}

.window-close:hover,
.screenshot-ui-close-button:hover {
  color: #${config.colorScheme.colors.base06};
  background-color: #bb7a61;
}

.window-close:active,
.screenshot-ui-close-button:active {
  color: #${config.colorScheme.colors.base06};
  background-color: #823c41;
}

.window-close StIcon,
.screenshot-ui-close-button StIcon {
  icon-size: 24px;
}

.workspace-background {
  border-radius: 30px;
  background-color: rgba(48, 52, 70, 0.95);
  box-shadow: 0 4px 16px 4px rgba(0, 0, 0, 0.3);
}

/* Workspace pager */
.workspace-thumbnails {
  visible-width: 32px;
  spacing: 6px;
  padding: 6px;
}

.workspace-thumbnails .workspace-thumbnail {
  color: rgba(242, 213, 207, 0.7);
  background-color: rgba(242, 213, 207, 0.12);
  border: none;
  border-radius: 6px;
}

.workspace-thumbnails .placeholder {
  background-image: url('assets/dash-placeholder.svg');
  background-size: contain;
  width: 18px;
  height: 24px;
}

.workspace-thumbnail-indicator {
  border: 3px solid #${config.colorScheme.colors.base0F};
  border-radius: 6px;
  padding: 0;
}

.bottom #dashtodockDashScrollview,
.top #dashtodockDashScrollview {
  -st-hfade-offset: 24px;
}

.left #dashtodockDashScrollview,
.right #dashtodockDashScrollview {
  -st-vfade-offset: 24px;
}

#dashtodockContainer {
  background-color: transparent;
}

#dashtodockContainer .number-overlay {
  color: #${config.colorScheme.colors.base06};
  background-color: rgba(0, 0, 0, 0.75);
  text-align: center;
}

#dashtodockContainer .notification-badge {
  color: rgba(0, 0, 0, 0.87);
  background-color: #${config.colorScheme.colors.base0F};
  box-shadow: 0 2px 3px 0 rgba(0, 0, 0, 0.25);
  border-radius: 9999px;
  margin: 2px;
  padding: 0.2em 0.6em;
  font-weight: bold;
  text-align: center;
}

#dashtodockContainer.straight-corner #dash,
#dashtodockContainer.shrink.straight-corner #dash {
  border-radius: 0;
  margin: 0;
}

#dashtodockContainer.straight-corner #dash .dash-background,
#dashtodockContainer.shrink.straight-corner #dash .dash-background {
  border-radius: 0;
}

#dashtodockContainer.extended.top #dash,
#dashtodockContainer.extended.bottom #dash,
#dashtodockContainer.extended.right #dash,
#dashtodockContainer.extended.left #dash {
  margin-left: 0;
  margin-right: 0;
  margin-top: 0;
  margin-bottom: 0;
  padding: 0 0;
}

#dashtodockContainer.extended.top #dash .dash-background,
#dashtodockContainer.extended.bottom #dash .dash-background,
#dashtodockContainer.extended.right #dash .dash-background,
#dashtodockContainer.extended.left #dash .dash-background {
  border-radius: 0;
  margin-left: 0;
  margin-right: 0;
  margin-top: 0;
  margin-bottom: 0;
}

#dashtodockContainer.left #dash,
#dashtodockContainer.right #dash {
  margin-top: 0;
  padding: 10px 0;
}

#dashtodockContainer.left #dash .dash-background,
#dashtodockContainer.right #dash .dash-background {
  margin-bottom: 0;
}

#dashtodockContainer.left .dash-item-container .app-well-app,
#dashtodockContainer.left .show-apps,
#dashtodockContainer.right .dash-item-container .app-well-app,
#dashtodockContainer.right .show-apps {
  padding: 6px;
}

#dashtodockContainer.left #dash {
  margin-left: 6px;
}

#dashtodockContainer.right #dash {
  margin-right: 6px;
}

#dashtodockContainer.dashtodock #dash .dash-background {
  background-color: rgba(48, 52, 70, 0.95);
}

#dashtodockContainer #dash .dash-background {
  background-color: rgba(48, 52, 70, 0.95);
  border: 2px solid #${config.colorScheme.colors.base0D};
}

#dashtodockContainer .app-well-app-running-dot {
  background-color: #${config.colorScheme.colors.base08};
}

#dashtodockContainer StWidget.focused .app-well-app-running-dot {
  background-color: #${config.colorScheme.colors.base0B} !important;
}

#dashtodockContainer:overview #dash .app-well-app-running-dot {
  background-color: #${config.colorScheme.colors.base08};
}

#dashtodockContainer:overview #dash StWidget.focused .app-well-app-running-dot {
  background-color: #${config.colorScheme.colors.base0B} !important;
}

#dashtodockContainer .show-apps .overview-icon,
#dashtodockContainer .app-well-app .overview-icon {
  color: rgba(242, 213, 207, 0.7);
  border-radius: 15px;
}

#dashtodockContainer .show-apps:hover .overview-icon,
#dashtodockContainer .show-apps:focus .overview-icon,
#dashtodockContainer .show-apps:selected .overview-icon,
#dashtodockContainer .app-well-app:hover .overview-icon,
#dashtodockContainer .app-well-app:focus .overview-icon,
#dashtodockContainer .app-well-app:selected .overview-icon {
  background-color: rgba(242, 213, 207, 0.12);
  border-radius: 15px;
}

#dashtodockContainer .show-apps:active .overview-icon,
#dashtodockContainer .show-apps:checked .overview-icon,
#dashtodockContainer .app-well-app:active .overview-icon,
#dashtodockContainer .app-well-app:checked .overview-icon {
  background-color: rgba(242, 213, 207, 0.3);
  border-radius: 15px;
}

#dashtodockContainer:overview #dash .show-apps .overview-icon,
#dashtodockContainer:overview #dash .app-well-app .overview-icon {
  color: rgba(242, 213, 207, 0.7);
  border-radius: 15px;
}

#dashtodockContainer:overview #dash .show-apps:hover .overview-icon,
#dashtodockContainer:overview #dash .show-apps:focus .overview-icon,
#dashtodockContainer:overview #dash .show-apps:selected .overview-icon,
#dashtodockContainer:overview #dash .app-well-app:hover .overview-icon,
#dashtodockContainer:overview #dash .app-well-app:focus .overview-icon,
#dashtodockContainer:overview #dash .app-well-app:selected .overview-icon {
  background-color: rgba(242, 213, 207, 0.12);
}

#dashtodockContainer:overview #dash .show-apps:active .overview-icon,
#dashtodockContainer:overview #dash .show-apps:checked .overview-icon,
#dashtodockContainer:overview #dash .app-well-app:active .overview-icon,
#dashtodockContainer:overview #dash .app-well-app:checked .overview-icon {
  background-color: rgba(242, 213, 207, 0.3);
}

#dashtodockContainer.opaque #dash .dash-background {
  background-color: rgba(48, 52, 70, 0.95);
}

#dashtodockContainer.transparent #dash .dash-background {
  background-color: rgba(33, 33, 33, 0.35);
}

#dashtodockContainer:overview #dash .dash-background {
  background-color: rgba(65, 69, 89, 0.95);
  border: 2px solid #${config.colorScheme.colors.base0D};
}

#dashtodockContainer.opaque:overview #dash .dash-background,
#dashtodockContainer.transparent:overview #dash .dash-background {
  background-color: transparent !important;
  box-shadow: none !important;
}

#dashtodockContainer.extended:overview #dash .dash-background,
#dashtodockContainer.opaque.extended:overview #dash .dash-background,
#dashtodockContainer.transparent.extended:overview #dash .dash-background {
  background-color: rgba(48, 52, 70, 0.95);
}

#dashtodockContainer.running-dots .dash-item-container > StButton,
#dashtodockContainer.dashtodock .dash-item-container > StButton {
  transition-duration: 250ms;
  background-size: contain;
}

#dashtodockContainer.shrink .dash-item-container > StButton,
#dashtodockContainer.dashtodock .dash-item-container > StButton {
  padding: 1px 2px;
}

#dashtodockContainer.extended .app-well-app .overview-icon,
#dashtodockContainer.extended .show-apps .overview-icon,
#dashtodockContainer.extended:overview .app-well-app .overview-icon,
#dashtodockContainer.extended:overview .show-apps .overview-icon {
  border-radius: 6px;
}

#dashtodockContainer .metro .overview-icon {
  border-radius: 0;
}

.dashtodock-app-well-preview-menu-item {
  padding: 1em 1em 0.5em 1em;
}

#dashtodockPreviewSeparator.popup-separator-menu-item-horizontal {
  width: 1px;
  height: auto;
  border-right-width: 1px;
  margin: 32px 0;
}

.openweather-button,
.openweather-button-action,
.openweather-menu-button-container,
.openweather-button-box {
  border: 1px solid transparent;
}

.openweather-provider {
  padding: 0 16px;
  font-weight: 500;
  border: 1px solid transparent;
}

.openweather-current-icon,
.openweather-current-summary,
.openweather-current-summarybox {
  background: none;
  color: #${config.colorScheme.colors.base06};
}

.openweather-current-databox-values {
  background: none;
  color: rgba(242, 213, 207, 0.5);
}

.openweather-current-databox-captions {
  background: none;
  color: rgba(242, 213, 207, 0.5);
}

.openweather-forecast-icon,
.openweather-forecast-summary {
  background: none;
  color: rgba(242, 213, 207, 0.7);
}

.openweather-forecast-day,
.openweather-forecast-temperature {
  background: none;
  color: rgba(242, 213, 207, 0.5);
}

.openweather-sunrise-icon,
.openweather-sunset-icon,
.openweather-build-icon {
  color: rgba(242, 213, 207, 0.7);
}

.popup-sub-menu .openweather-current-icon,
.popup-sub-menu .openweather-current-summary,
.popup-sub-menu .openweather-current-summarybox {
  background: none;
  color: rgba(0, 0, 0, 0.87);
}

.popup-sub-menu .openweather-current-databox-values {
  color: rgba(0, 0, 0, 0.6);
}

.popup-sub-menu .openweather-current-databox-captions {
  color: rgba(0, 0, 0, 0.6);
}

.popup-sub-menu .openweather-forecast-icon,
.popup-sub-menu .openweather-forecast-summary {
  color: rgba(0, 0, 0, 0.87);
}

.popup-sub-menu .openweather-forecast-day,
.popup-sub-menu .openweather-forecast-temperature {
  color: rgba(0, 0, 0, 0.6);
}

.popup-sub-menu .openweather-sunrise-icon,
.popup-sub-menu .openweather-sunset-icon,
.popup-sub-menu .openweather-build-icon {
  color: rgba(0, 0, 0, 0.87);
}

  '';
}