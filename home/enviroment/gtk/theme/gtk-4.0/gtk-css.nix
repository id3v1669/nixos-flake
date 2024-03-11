{config, lib, pkgs, ...}:
let
    inherit (import ./../../../../../lib/h2rgba.nix { inherit lib; }) hexToRgba;
in
{
  home.file.".themes/dynamic-color-theme/gtk-4.0/gtk.css".text = ''
/* GTK NAMED COLORS -- USE RESPONSIBLY! */

/* widget text/foreground color */
@define-color theme_fg_color #${config.colorScheme.palette.base06};
/* text color for entries, views and content in general */
@define-color theme_text_color #${config.colorScheme.palette.base06};
/* widget base background color */
@define-color theme_bg_color #${config.colorScheme.palette.base00};
/* text widgets and the like base background color */
@define-color theme_base_color #${config.colorScheme.palette.base00};
/* base background color of selections */
@define-color theme_selected_bg_color #${config.colorScheme.palette.base0F};
/* text/foreground color of selections */
@define-color theme_selected_fg_color rgba(0, 0, 0, 0.87);
/* base background color of insensitive widgets */
@define-color insensitive_bg_color #${config.colorScheme.palette.base00};
/* text foreground color of insensitive widgets */
@define-color insensitive_fg_color rgba(242, 213, 207, 0.5);
/* insensitive text widgets and the like base background color */
@define-color insensitive_base_color #${config.colorScheme.palette.base01};
/* widget text/foreground color on backdrop windows */
@define-color theme_unfocused_fg_color #${config.colorScheme.palette.base06};
/* text color for entries, views and content in general on backdrop windows */
@define-color theme_unfocused_text_color #${config.colorScheme.palette.base06};
/* widget base background color on backdrop windows */
@define-color theme_unfocused_bg_color #${config.colorScheme.palette.base00};
/* text widgets and the like base background color on backdrop windows */
@define-color theme_unfocused_base_color #${config.colorScheme.palette.base00};
/* base background color of selections on backdrop windows */
@define-color theme_unfocused_selected_bg_color #${config.colorScheme.palette.base0F};
/* text/foreground color of selections on backdrop windows */
@define-color theme_unfocused_selected_fg_color rgba(0, 0, 0, 0.87);
/* insensitive color on backdrop windows */
@define-color unfocused_insensitive_color rgba(242, 213, 207, 0.5);
/* widgets main borders color */
@define-color borders rgba(242, 213, 207, 0.12);
/* widgets main borders color on backdrop windows */
@define-color unfocused_borders rgba(242, 213, 207, 0.12);
/* these are pretty self explicative */
@define-color warning_color #FDD633;
@define-color error_color #F28B82;
@define-color success_color #81C995;
/* these colors are exported for the window manager and shouldn't be used in applications,
read if you used those and something break with a version upgrade you're on your own... */
@define-color wm_title #${config.colorScheme.palette.base06};
@define-color wm_unfocused_title rgba(242, 213, 207, 0.7);
@define-color wm_highlight rgba(242, 213, 207, 0.1);
@define-color wm_bg #${config.colorScheme.palette.base00};
@define-color wm_unfocused_bg #${config.colorScheme.palette.base00};
@define-color wm_button_close_icon #${config.colorScheme.palette.base00};
@define-color wm_button_close_hover_bg #${config.colorScheme.palette.base0F};
@define-color wm_button_close_active_bg #c7c7c7;
/* FIXME this is really an API */
@define-color content_view_bg #${config.colorScheme.palette.base00};
@define-color placeholder_text_color silver;
/* Very contrasty background for text views (@theme_text_color foreground) */
@define-color text_view_bg #${config.colorScheme.palette.base01};
@define-color budgie_tasklist_indicator_color #${config.colorScheme.palette.base06};
@define-color budgie_tasklist_indicator_color_active #${config.colorScheme.palette.base06};
@define-color budgie_tasklist_indicator_color_active_window #999999;
@define-color budgie_tasklist_indicator_color_attention #FDD633;
@define-color STRAWBERRY_100 #FF9262;
@define-color STRAWBERRY_300 #FF793E;
@define-color STRAWBERRY_500 #F15D22;
@define-color STRAWBERRY_700 #CF3B00;
@define-color STRAWBERRY_900 #AC1800;
@define-color ORANGE_100 #FFDB91;
@define-color ORANGE_300 #FFCA40;
@define-color ORANGE_500 #FAA41A;
@define-color ORANGE_700 #DE8800;
@define-color ORANGE_900 #C26C00;
@define-color BANANA_100 #FFFFA8;
@define-color BANANA_300 #FFFA7D;
@define-color BANANA_500 #FFCE51;
@define-color BANANA_700 #D1A023;
@define-color BANANA_900 #A27100;
@define-color LIME_100 ${hexToRgba "${config.colorScheme.palette.base0B}" "0.8"};
@define-color LIME_300 ${hexToRgba "${config.colorScheme.palette.base0B}" "0.85"};
@define-color LIME_500 ${hexToRgba "${config.colorScheme.palette.base0B}" "0.9"};
@define-color LIME_700 ${hexToRgba "${config.colorScheme.palette.base0B}" "0.95"};
@define-color LIME_900 ${hexToRgba "${config.colorScheme.palette.base0B}" "1"};
@define-color BLUEBERRY_100 ${hexToRgba "${config.colorScheme.palette.base0D}" "0.8"};
@define-color BLUEBERRY_300 ${hexToRgba "${config.colorScheme.palette.base0D}" "0.85"};
@define-color BLUEBERRY_500 ${hexToRgba "${config.colorScheme.palette.base0D}" "0.9"};
@define-color BLUEBERRY_700 ${hexToRgba "${config.colorScheme.palette.base0D}" "0.95"};
@define-color BLUEBERRY_900 ${hexToRgba "${config.colorScheme.palette.base0D}" "1"};
@define-color GRAPE_100 #D25DE6;
@define-color GRAPE_300 #B84ACB;
@define-color GRAPE_500 #9C27B0;
@define-color GRAPE_700 #830E97;
@define-color GRAPE_900 #6A007E;
@define-color COCOA_100 #9F9792;
@define-color COCOA_300 #7B736E;
@define-color COCOA_500 #574F4A;
@define-color COCOA_700 #463E39;
@define-color COCOA_900 #342C27;
@define-color SILVER_100 #EEE;
@define-color SILVER_300 #CCC;
@define-color SILVER_500 #AAA;
@define-color SILVER_700 #888;
@define-color SILVER_900 #666;
@define-color SLATE_100 #888;
@define-color SLATE_300 #666;
@define-color SLATE_500 #444;
@define-color SLATE_700 #222;
@define-color SLATE_900 #111;
@define-color BLACK_100 ${hexToRgba "${config.colorScheme.palette.base01}" "0.8"};
@define-color BLACK_300 ${hexToRgba "${config.colorScheme.palette.base01}" "0.85"};
@define-color BLACK_500 ${hexToRgba "${config.colorScheme.palette.base01}" "0.9"};
@define-color BLACK_700 ${hexToRgba "${config.colorScheme.palette.base01}" "0.95"};
@define-color BLACK_900 ${hexToRgba "${config.colorScheme.palette.base01}" "1"};

/* GTK LIBADWAITA NAMED COLORS -- USE RESPONSIBLY! */
@define-color accent_bg_color #${config.colorScheme.palette.base0F};
@define-color accent_fg_color rgba(0, 0, 0, 0.87);
@define-color accent_color #${config.colorScheme.palette.base0F};
@define-color destructive_bg_color #F28B82;
@define-color destructive_fg_color rgba(0, 0, 0, 0.87);
@define-color destructive_color #F28B82;
@define-color success_bg_color #81C995;
@define-color success_fg_color rgba(0, 0, 0, 0.87);
@define-color success_color #81C995;
@define-color warning_bg_color #FDD633;
@define-color warning_fg_color rgba(0, 0, 0, 0.87);
@define-color warning_color #FDD633;
@define-color error_bg_color #F28B82;
@define-color error_fg_color rgba(0, 0, 0, 0.87);
@define-color error_color #F28B82;
@define-color window_bg_color #${config.colorScheme.palette.base00};
@define-color window_fg_color #${config.colorScheme.palette.base06};
@define-color view_bg_color #${config.colorScheme.palette.base00};
@define-color view_fg_color #${config.colorScheme.palette.base06};
@define-color headerbar_bg_color #${config.colorScheme.palette.base00};
@define-color headerbar_fg_color #${config.colorScheme.palette.base06};
@define-color headerbar_border_color rgba(242, 213, 207, 0.12);
@define-color headerbar_backdrop_color @window_bg_color;
@define-color headerbar_shade_color rgba(0, 0, 0, 0.36);
@define-color card_bg_color #${config.colorScheme.palette.base00};
@define-color card_fg_color #${config.colorScheme.palette.base06};
@define-color card_shade_color rgba(0, 0, 0, 0.36);
@define-color dialog_bg_color #${config.colorScheme.palette.base00};
@define-color dialog_fg_color #${config.colorScheme.palette.base06};
@define-color popover_bg_color #${config.colorScheme.palette.base00};
@define-color popover_fg_color #${config.colorScheme.palette.base06};
@define-color thumbnail_bg_color #${config.colorScheme.palette.base00};
@define-color thumbnail_fg_color #${config.colorScheme.palette.base06};
@define-color shade_color rgba(0, 0, 0, 0.36);
@define-color scrollbar_outline_color rgba(0, 0, 0, 0.5);

/***************
 * Base States *
 ***************/
.background {
  background-color: #${config.colorScheme.palette.base00};
  color: #${config.colorScheme.palette.base06};
}

dnd {
  color: #${config.colorScheme.palette.base06};
}

.normal-icons {
  -gtk-icon-size: 16px;
}

.large-icons {
  -gtk-icon-size: 32px;
}

spinner:disabled,
arrow:disabled,
scrollbar:disabled,
check:disabled,
radio:disabled,
treeview.expander:disabled {
  -gtk-icon-filter: opacity(0.5);
}

iconview,
.view {
  color: #${config.colorScheme.palette.base06};
}

iconview:disabled,
.view:disabled {
  color: rgba(242, 213, 207, 0.5);
}

textview text {
  background-color: #${config.colorScheme.palette.base00};
}

textview border {
  background-color: #${config.colorScheme.palette.base01};
  color: rgba(242, 213, 207, 0.7);
}

iconview:hover,
iconview:selected {
  border-radius: 3px;
}

rubberband,
.content-view rubberband,
.content-view columnview.view > rubberband,
.content-view treeview.view > rubberband,
.content-view .rubberband,
columnview.view > rubberband,
treeview.view > rubberband,
gridview > rubberband,
flowbox > rubberband {
  border: 1px solid #${config.colorScheme.palette.base0F};
  background-color: rgba(238, 190, 190, 0.3);
}

flowbox > flowboxchild {
  padding: 4px;
  border-radius: 6px;
}

.content-view .tile:selected {
  background-color: transparent;
}

gridview > child {
  padding: 3px;
}

gridview > child:selected {
  outline-color: alpha(currentColor, 0.06);
}

gridview > child box {
  border-spacing: 8px;
  margin: 12px;
}

coverflow cover {
  color: #${config.colorScheme.palette.base06};
  background-color: #${config.colorScheme.palette.base00};
  border: 1px solid black;
}

label.separator {
  color: rgba(242, 213, 207, 0.7);
}

label:disabled {
  color: rgba(242, 213, 207, 0.5);
  opacity: 1;
  filter: none;
}

headerbar label:disabled,
tab label:disabled,
button label:disabled {
  color: inherit;
}

label.osd {
  border-radius: 6px;
  background-color: rgba(24, 24, 37, 0.9);
  color: #${config.colorScheme.palette.base06};
}

label.search-information {
  background-color: #${config.colorScheme.palette.base0F};
  color: rgba(0, 0, 0, 0.87);
}

.dim-label,
row label.subtitle {
  color: rgba(242, 213, 207, 0.7);
  opacity: 1;
}

window.assistant .sidebar {
  padding: 4px 0;
}

window.assistant .sidebar label {
  min-height: 36px;
  padding: 0 12px;
  color: rgba(242, 213, 207, 0.5);
  font-weight: 500;
}

window.assistant .sidebar label.highlight {
  color: #${config.colorScheme.palette.base06};
}

.osd popover.background > arrow,
.osd popover.background > contents,
popover.background.touch-selection > arrow,
popover.background.touch-selection > contents,
popover.background.magnifier > arrow,
popover.background.magnifier > contents,
.osd {
  color: #${config.colorScheme.palette.base06};
  background-clip: padding-box;
  border-radius: 6px;
  border: none;
}

.osd {
  padding: 6px;
  margin: 6px;
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2),
    0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12);
}

.osd.circular {
  border-radius: 9999px;
}

/*********************
 * Spinner Animation *
 *********************/
@keyframes spin {
  to {
    transform: rotate(1turn);
  }
}

spinner {
  background: none;
  opacity: 0;
  -gtk-icon-source: -gtk-icontheme('process-working-symbolic');
}

spinner:checked {
  opacity: 1;
  animation: spin 1s linear infinite;
}

spinner:checked:disabled {
  opacity: 0.5;
}

.large-title {
  font-weight: 300;
  font-size: 24pt;
}

.title-1 {
  font-weight: 800;
  font-size: 20pt;
}

.title-2 {
  font-weight: 800;
  font-size: 15pt;
}

.title-3 {
  font-weight: 700;
  font-size: 15pt;
}

.title-4 {
  font-weight: 700;
  font-size: 13pt;
}

.heading {
  font-weight: 700;
  font-size: 11pt;
}

.body {
  font-weight: 400;
  font-size: 11pt;
}

.caption {
  font-weight: 400;
  font-size: 9pt;
}

.caption-heading {
  font-weight: 700;
  font-size: 9pt;
}

/****************
 * Text Entries *
 ****************/
entry {
  min-height: 36px;
  padding: 0 8px;
  border-spacing: 6px;
  border-radius: 6px;
  caret-color: currentColor;
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1),
    box-shadow 300ms cubic-bezier(0, 0, 0.2, 1);
  box-shadow: inset 0 0 0 2px transparent;
  background-color: rgba(242, 213, 207, 0.08);
  color: #${config.colorScheme.palette.base06};
  outline: none;
}

entry:focus-within {
  background-color: rgba(242, 213, 207, 0.08);
  box-shadow: inset 0 0 0 2px #${config.colorScheme.palette.base0F};
  outline: none;
}

entry:drop(active) {
  background-color: alpha(currentColor, 0.08);
  box-shadow: inset 0 0 0 2px alpha(currentColor, 0.08);
  outline: none;
}

entry:disabled {
  box-shadow: inset 0 0 0 2px transparent;
  background-color: rgba(242, 213, 207, 0.04);
  color: rgba(242, 213, 207, 0.5);
  outline: none;
  opacity: 1;
  filter: none;
}

entry.search {
  border-radius: 6px;
  padding: 2px 12px;
}

entry.flat {
  min-height: 0;
  padding: 2px;
  border-radius: 0;
  background-color: transparent;
}

entry image {
  color: rgba(242, 213, 207, 0.7);
}

entry image:hover,
entry image:active {
  color: #${config.colorScheme.palette.base06};
}

entry image:disabled {
  color: rgba(242, 213, 207, 0.5);
}

entry image.left {
  margin-left: 2px;
  margin-right: 6px;
}

entry image.right {
  margin-left: 6px;
  margin-right: 2px;
}

entry undershoot.left {
  background-color: transparent;
  background-image: linear-gradient(
    to top,
    transparent 50%,
    rgba(242, 213, 207, 0.3) 50%
  );
  padding-left: 1px;
  background-size: 1px 12px;
  background-repeat: repeat-y;
  background-origin: content-box;
  background-position: left top;
  margin: 0 4px;
  margin: 4px 0;
}

entry undershoot.right {
  background-color: transparent;
  background-image: linear-gradient(
    to top,
    transparent 50%,
    rgba(242, 213, 207, 0.3) 50%
  );
  padding-right: 1px;
  background-size: 1px 12px;
  background-repeat: repeat-y;
  background-origin: content-box;
  background-position: right top;
  margin: 0 4px;
  margin: 4px 0;
}

entry.error {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1),
    box-shadow 300ms cubic-bezier(0, 0, 0.2, 1);
  box-shadow: inset 0 0 0 2px transparent;
  background-color: rgba(242, 213, 207, 0.08);
  color: #${config.colorScheme.palette.base06};
  outline: none;
}

entry.error:focus-within {
  background-color: rgba(242, 213, 207, 0.08);
  box-shadow: inset 0 0 0 2px #${config.colorScheme.palette.base08};
  outline: none;
}

entry.error:disabled {
  box-shadow: inset 0 0 0 2px transparent;
  background-color: rgba(242, 213, 207, 0.04);
  color: rgba(242, 213, 207, 0.5);
  outline: none;
  opacity: 1;
  filter: none;
}

entry.warning {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1),
    box-shadow 300ms cubic-bezier(0, 0, 0.2, 1);
  box-shadow: inset 0 0 0 2px transparent;
  background-color: rgba(242, 213, 207, 0.08);
  color: #${config.colorScheme.palette.base06};
  outline: none;
}

entry.warning:focus-within {
  background-color: rgba(242, 213, 207, 0.08);
  box-shadow: inset 0 0 0 2px #fdd633;
  outline: none;
}

entry.warning:disabled {
  box-shadow: inset 0 0 0 2px transparent;
  background-color: rgba(242, 213, 207, 0.04);
  color: rgba(242, 213, 207, 0.5);
  outline: none;
  opacity: 1;
  filter: none;
}

entry > progress,
entry progress > trough > progress {
  margin: 2px -8px;
  border-bottom: 2px solid #${config.colorScheme.palette.base0F};
  background-color: transparent;
}

treeview entry.flat,
treeview entry {
  background-color: #${config.colorScheme.palette.base00};
}

treeview entry.flat,
treeview entry.flat:focus-within,
treeview entry,
treeview entry:focus-within {
  border-image: none;
  box-shadow: none;
}

.entry-tag {
  margin: 2px;
  border-radius: 9999px;
  box-shadow: none;
  background-color: rgba(242, 213, 207, 0.12);
  color: #${config.colorScheme.palette.base06};
}

.entry-tag:hover {
  background-image: image(alpha(currentColor, 0.08));
}

:dir(ltr) .entry-tag {
  margin-left: 4px;
  margin-right: 0;
  padding-left: 12px;
  padding-right: 8px;
}

:dir(rtl) .entry-tag {
  margin-left: 0;
  margin-right: 4px;
  padding-left: 8px;
  padding-right: 12px;
}

.entry-tag.button {
  box-shadow: none;
  background-color: transparent;
}

.entry-tag.button:not(:hover):not(:active) {
  color: rgba(242, 213, 207, 0.7);
}

editablelabel > stack > text {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1),
    box-shadow 300ms cubic-bezier(0, 0, 0.2, 1);
  box-shadow: inset 0 0 0 2px transparent;
  background-color: rgba(242, 213, 207, 0.08);
  color: #${config.colorScheme.palette.base06};
  outline: none;
}

/***********
 * Buttons *
 ***********/
@keyframes needs-attention {
  from {
    background-image: radial-gradient(
      farthest-side,
      #${config.colorScheme.palette.base0F} 0%,
      rgba(238, 190, 190, 0) 0%
    );
  }
  to {
    background-image: radial-gradient(
      farthest-side,
      #${config.colorScheme.palette.base0F} 95%,
      rgba(238, 190, 190, 0)
    );
  }
}

toast button,
toast button.text-button,
toast button.circular.flat,
infobar.warning > revealer > box button,
infobar.warning:backdrop > revealer > box button,
popover.background.touch-selection button,
popover.background.magnifier button,
headerbar.selection-mode
  button:not(.suggested-action):not(.destructive-action) {
  color: rgba(242, 213, 207, 0.7);
}

toast button:focus,
toast button.circular.flat:focus,
infobar.warning > revealer > box button:focus,
popover.background.touch-selection button:focus,
popover.background.magnifier button:focus,
headerbar.selection-mode
  button:focus:not(.suggested-action):not(.destructive-action),
toast button:hover,
toast button.circular.flat:hover,
infobar.warning > revealer > box button:hover,
popover.background.touch-selection button:hover,
popover.background.magnifier button:hover,
headerbar.selection-mode
  button:hover:not(.suggested-action):not(.destructive-action),
toast button:active,
toast button.circular.flat:active,
infobar.warning > revealer > box button:active,
popover.background.touch-selection button:active,
popover.background.magnifier button:active,
headerbar.selection-mode
  button:active:not(.suggested-action):not(.destructive-action),
toast button:checked,
toast button.circular.flat:checked,
infobar.warning > revealer > box button:checked,
popover.background.touch-selection button:checked,
popover.background.magnifier button:checked,
headerbar.selection-mode
  button:checked:not(.suggested-action):not(.destructive-action) {
  color: #${config.colorScheme.palette.base06};
}

toast button:disabled,
toast button.circular.flat:disabled,
infobar.warning > revealer > box button:disabled,
popover.background.touch-selection button:disabled,
popover.background.magnifier button:disabled,
headerbar.selection-mode
  button:disabled:not(.suggested-action):not(.destructive-action) {
  color: rgba(242, 213, 207, 0.3);
}

toast button:checked:disabled,
infobar.warning > revealer > box button:checked:disabled,
popover.background.touch-selection button:checked:disabled,
popover.background.magnifier button:checked:disabled,
headerbar.selection-mode
  button:checked:disabled:not(.suggested-action):not(.destructive-action) {
  color: rgba(242, 213, 207, 0.5);
}

headerbar
  popover
  button:not(.suggested-action):not(.destructive-action):not(.flat),
button {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1),
    background-color 225ms cubic-bezier(0, 0, 0.2, 1),
    box-shadow 300ms cubic-bezier(0, 0, 0.2, 1);
  outline: none;
  background-color: rgba(242, 213, 207, 0.08);
  color: #${config.colorScheme.palette.base06};
  box-shadow: inset 0 0 0 2px transparent;
}

headerbar
  popover
  button:focus:not(.suggested-action):not(.destructive-action):not(.flat),
button:focus {
  box-shadow: inset 0 0 0 2px alpha(currentColor, 0.08);
  color: #${config.colorScheme.palette.base06};
  outline: none;
}

headerbar
  popover
  button:hover:not(.suggested-action):not(.destructive-action):not(.flat),
button:hover {
  background-color: alpha(currentColor, 0.08);
  color: #${config.colorScheme.palette.base06};
  box-shadow: inset 0 0 0 2px transparent;
}

headerbar
  popover
  button:active:not(.suggested-action):not(.destructive-action):not(.flat),
button:active {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1),
    background-color 225ms cubic-bezier(0, 0, 0.2, 1),
    box-shadow 300ms cubic-bezier(0, 0, 0.2, 1);
  background-color: alpha(currentColor, 0.12);
  box-shadow: inset 0 0 0 2px transparent;
  color: #${config.colorScheme.palette.base06};
}

headerbar
  popover
  button:disabled:not(.suggested-action):not(.destructive-action):not(.flat),
button:disabled {
  box-shadow: none;
  background-color: rgba(242, 213, 207, 0.04);
  color: rgba(242, 213, 207, 0.5);
  transition: none;
  opacity: 1;
  filter: none;
}

headerbar
  popover
  button:checked:not(.suggested-action):not(.destructive-action):not(.flat),
button:checked {
  box-shadow: none;
  background-color: #${config.colorScheme.palette.base0F};
  color: rgba(0, 0, 0, 0.87);
  outline: none;
}

headerbar
  popover
  button:checked:hover:not(.suggested-action):not(.destructive-action):not(
    .flat
  ),
button:checked:hover {
  box-shadow: none;
}

headerbar
  popover
  button:checked:disabled:not(.suggested-action):not(.destructive-action):not(
    .flat
  ),
button:checked:disabled {
  box-shadow: none;
  background-color: rgba(242, 213, 207, 0.04);
  color: rgba(242, 213, 207, 0.5);
  opacity: 1;
  filter: none;
}

button {
  min-height: 24px;
  min-width: 16px;
  padding: 6px 10px;
  border-radius: 6px;
  font-weight: 500;
}

button:drop(active) {
  background-color: alpha(currentColor, 0.08);
  color: #${config.colorScheme.palette.base06};
  box-shadow: inset 0 0 0 2px transparent;
}

placessidebar .navigation-sidebar > row button.sidebar-button,
calendar > header > button,
columnview.view > header > button button.circular,
treeview.view > header > button button.circular,
row.activatable button.circular,
scrollbar button,
notebook > header > tabs > arrow,
popover.menu box.circular-buttons button.circular.image-button.model,
headerbar popover calendar > header > button,
spinbutton.vertical > button,
spinbutton:not(.vertical) > button,
splitbutton.flat > button,
splitbutton.flat > menubutton > button,
filechooser #pathbarbox > stack > box > button,
window.dialog.message.csd .dialog-action-area > button,
.app-notification button,
headerbar button:not(.suggested-action):not(.destructive-action),
.toolbar button,
toolbar button,
dropdown > .linked:not(.vertical) > button:not(:only-child),
combobox > .linked:not(.vertical) > button:not(:only-child),
splitbutton.suggested-action > button,
splitbutton.suggested-action > menubutton > button,
splitbutton.destructive-action > button,
splitbutton.destructive-action > menubutton > button,
splitbutton.opaque > button,
splitbutton.opaque > menubutton > button,
menubutton.suggested-action > button,
menubutton.destructive-action > button,
menubutton.opaque > button,
menubutton.flat > button,
button.flat {
  background-color: transparent;
  color: rgba(242, 213, 207, 0.7);
}

placessidebar .navigation-sidebar > row button.sidebar-button:focus,
calendar > header > button:focus,
columnview.view > header > button button.circular:focus,
treeview.view > header > button button.circular:focus,
row.activatable button.circular:focus,
scrollbar button:focus,
notebook > header > tabs > arrow:focus,
popover.menu box.circular-buttons button.circular.image-button.model:focus,
headerbar popover calendar > header > button:focus,
spinbutton.vertical > button:focus,
spinbutton:not(.vertical) > button:focus,
splitbutton.flat > button:focus,
splitbutton.flat > menubutton > button:focus,
filechooser #pathbarbox > stack > box > button:focus,
window.dialog.message.csd .dialog-action-area > button:focus,
.app-notification button:focus,
headerbar button:focus:not(.suggested-action):not(.destructive-action),
.toolbar button:focus,
toolbar button:focus,
dropdown > .linked:not(.vertical) > button:focus:not(:only-child),
combobox > .linked:not(.vertical) > button:focus:not(:only-child),
splitbutton.suggested-action > button:focus,
splitbutton.suggested-action > menubutton > button:focus,
splitbutton.destructive-action > button:focus,
splitbutton.destructive-action > menubutton > button:focus,
splitbutton.opaque > button:focus,
splitbutton.opaque > menubutton > button:focus,
menubutton.suggested-action > button:focus,
menubutton.destructive-action > button:focus,
menubutton.opaque > button:focus,
menubutton.flat > button:focus,
button.flat:focus {
  box-shadow: inset 0 0 0 2px alpha(currentColor, 0.08);
  color: #${config.colorScheme.palette.base06};
}

placessidebar .navigation-sidebar > row button.sidebar-button:hover,
calendar > header > button:hover,
columnview.view > header > button button.circular:hover,
treeview.view > header > button button.circular:hover,
row.activatable button.circular:hover,
scrollbar button:hover,
notebook > header > tabs > arrow:hover,
popover.menu box.circular-buttons button.circular.image-button.model:hover,
headerbar popover calendar > header > button:hover,
spinbutton.vertical > button:hover,
spinbutton:not(.vertical) > button:hover,
splitbutton.flat > button:hover,
splitbutton.flat > menubutton > button:hover,
filechooser #pathbarbox > stack > box > button:hover,
window.dialog.message.csd .dialog-action-area > button:hover,
.app-notification button:hover,
headerbar button:hover:not(.suggested-action):not(.destructive-action),
.toolbar button:hover,
toolbar button:hover,
dropdown > .linked:not(.vertical) > button:hover:not(:only-child),
combobox > .linked:not(.vertical) > button:hover:not(:only-child),
splitbutton.suggested-action > button:hover,
splitbutton.suggested-action > menubutton > button:hover,
splitbutton.destructive-action > button:hover,
splitbutton.destructive-action > menubutton > button:hover,
splitbutton.opaque > button:hover,
splitbutton.opaque > menubutton > button:hover,
menubutton.suggested-action > button:hover,
menubutton.destructive-action > button:hover,
menubutton.opaque > button:hover,
menubutton.flat > button:hover,
button.flat:hover {
  background-color: alpha(currentColor, 0.08);
  color: #${config.colorScheme.palette.base06};
}

placessidebar .navigation-sidebar > row button.sidebar-button:active,
calendar > header > button:active,
columnview.view > header > button button.circular:active,
treeview.view > header > button button.circular:active,
row.activatable button.circular:active,
scrollbar button:active,
notebook > header > tabs > arrow:active,
popover.menu box.circular-buttons button.circular.image-button.model:active,
headerbar popover calendar > header > button:active,
spinbutton.vertical > button:active,
spinbutton:not(.vertical) > button:active,
splitbutton.flat > button:active,
splitbutton.flat > menubutton > button:active,
filechooser #pathbarbox > stack > box > button:active,
window.dialog.message.csd .dialog-action-area > button:active,
.app-notification button:active,
headerbar button:active:not(.suggested-action):not(.destructive-action),
.toolbar button:active,
toolbar button:active,
dropdown > .linked:not(.vertical) > button:active:not(:only-child),
combobox > .linked:not(.vertical) > button:active:not(:only-child),
splitbutton.suggested-action > button:active,
splitbutton.suggested-action > menubutton > button:active,
splitbutton.destructive-action > button:active,
splitbutton.destructive-action > menubutton > button:active,
splitbutton.opaque > button:active,
splitbutton.opaque > menubutton > button:active,
menubutton.suggested-action > button:active,
menubutton.destructive-action > button:active,
menubutton.opaque > button:active,
menubutton.flat > button:active,
button.flat:active {
  background-color: alpha(currentColor, 0.12);
  color: #${config.colorScheme.palette.base06};
  box-shadow: none;
}

placessidebar .navigation-sidebar > row button.sidebar-button:disabled,
calendar > header > button:disabled,
columnview.view > header > button button.circular:disabled,
treeview.view > header > button button.circular:disabled,
row.activatable button.circular:disabled,
scrollbar button:disabled,
notebook > header > tabs > arrow:disabled,
popover.menu box.circular-buttons button.circular.image-button.model:disabled,
headerbar popover calendar > header > button:disabled,
spinbutton.vertical > button:disabled,
spinbutton:not(.vertical) > button:disabled,
splitbutton.flat > button:disabled,
splitbutton.flat > menubutton > button:disabled,
filechooser #pathbarbox > stack > box > button:disabled,
window.dialog.message.csd .dialog-action-area > button:disabled,
.app-notification button:disabled,
headerbar button:disabled:not(.suggested-action):not(.destructive-action),
.toolbar button:disabled,
toolbar button:disabled,
dropdown > .linked:not(.vertical) > button:disabled:not(:only-child),
combobox > .linked:not(.vertical) > button:disabled:not(:only-child),
splitbutton.suggested-action > button:disabled,
splitbutton.suggested-action > menubutton > button:disabled,
splitbutton.destructive-action > button:disabled,
splitbutton.destructive-action > menubutton > button:disabled,
splitbutton.opaque > button:disabled,
splitbutton.opaque > menubutton > button:disabled,
menubutton.suggested-action > button:disabled,
menubutton.destructive-action > button:disabled,
menubutton.opaque > button:disabled,
menubutton.flat > button:disabled,
button.flat:disabled {
  box-shadow: none;
  background-color: transparent;
  color: rgba(242, 213, 207, 0.3);
  opacity: 1;
  filter: none;
}

filechooser #pathbarbox > stack > box > button:checked,
window.dialog.message.csd .dialog-action-area > button:checked,
.app-notification button:checked,
headerbar button:checked:not(.suggested-action):not(.destructive-action),
.toolbar button:checked,
toolbar button:checked,
dropdown > .linked:not(.vertical) > button:checked:not(:only-child),
combobox > .linked:not(.vertical) > button:checked:not(:only-child),
splitbutton.suggested-action > button:checked,
splitbutton.suggested-action > menubutton > button:checked,
splitbutton.destructive-action > button:checked,
splitbutton.destructive-action > menubutton > button:checked,
splitbutton.opaque > button:checked,
splitbutton.opaque > menubutton > button:checked,
menubutton.suggested-action > button:checked,
menubutton.destructive-action > button:checked,
menubutton.opaque > button:checked,
menubutton.flat > button:checked,
button.flat:checked,
button.flat:checked:hover {
  background-color: alpha(currentColor, 0.1);
  color: #${config.colorScheme.palette.base06};
  outline: none;
  box-shadow: none;
}

filechooser #pathbarbox > stack > box > button:checked:disabled,
window.dialog.message.csd .dialog-action-area > button:checked:disabled,
.app-notification button:checked:disabled,
headerbar
  button:checked:disabled:not(.suggested-action):not(.destructive-action),
.toolbar button:checked:disabled,
toolbar button:checked:disabled,
dropdown > .linked:not(.vertical) > button:checked:disabled:not(:only-child),
combobox > .linked:not(.vertical) > button:checked:disabled:not(:only-child),
splitbutton.suggested-action > button:checked:disabled,
splitbutton.suggested-action > menubutton > button:checked:disabled,
splitbutton.destructive-action > button:checked:disabled,
splitbutton.destructive-action > menubutton > button:checked:disabled,
splitbutton.opaque > button:checked:disabled,
splitbutton.opaque > menubutton > button:checked:disabled,
menubutton.suggested-action > button:checked:disabled,
menubutton.destructive-action > button:checked:disabled,
menubutton.opaque > button:checked:disabled,
menubutton.flat > button:checked:disabled,
button.flat:checked:disabled {
  background-color: alpha(currentColor, 0.06);
  color: rgba(242, 213, 207, 0.5);
  opacity: 1;
  filter: none;
}

button.text-button {
  min-width: 32px;
  padding-left: 16px;
  padding-right: 16px;
}

button.text-button.flat {
  min-width: 48px;
  padding-left: 8px;
  padding-right: 8px;
}

button.image-button {
  min-width: 24px;
  padding: 6px;
  border-radius: 6px;
}

.linked button.image-button {
  border-radius: 6px;
}

button.text-button.image-button {
  min-width: 24px;
  padding: 6px;
  border-radius: 6px;
}

button.text-button.image-button label:first-child {
  margin-left: 10px;
}

button.text-button.image-button label:last-child {
  margin-right: 10px;
}

button.text-button.image-button.flat label:first-child {
  margin-left: 6px;
}

button.text-button.image-button.flat label:last-child {
  margin-right: 6px;
}

button.text-button.image-button image:not(:only-child) {
  margin: 0 4px;
}

.linked:not(.vertical) > button.flat:not(:only-child),
.linked.vertical > button.flat:not(:only-child) {
  border-radius: 6px;
}

.linked:not(.vertical) > button.flat:focus,
.linked.vertical > button.flat:focus {
  box-shadow: inset 0 0 0 9999px alpha(currentColor, 0.08);
}

button.osd {
  padding: 12px 16px;
  box-shadow: none;
  background-color: #${config.colorScheme.palette.base01};
  color: #${config.colorScheme.palette.base06};
}

button.osd:hover {
  background-color: #${config.colorScheme.palette.base03};
  color: #${config.colorScheme.palette.base06};
}

button.osd:active {
  background-color: #080808;
  color: #${config.colorScheme.palette.base06};
}

button.osd.image-button {
  padding: 6px;
}

button.osd:disabled {
  opacity: 0;
}

button.suggested-action {
  background-color: #${config.colorScheme.palette.base0F};
  color: rgba(0, 0, 0, 0.87);
  box-shadow: none;
}

button.suggested-action:disabled {
  box-shadow: none;
  background-color: rgba(242, 213, 207, 0.04);
  color: rgba(242, 213, 207, 0.5);
  transition: none;
  opacity: 1;
  filter: none;
}

button.suggested-action:hover {
  box-shadow: inset 0 0 0 9999px transparent,
    0 2px 2.4px -1px rgba(238, 190, 190, 0.2),
    0 4px 3px 0 rgba(238, 190, 190, 0.14), 0 1px 6px 0 rgba(238, 190, 190, 0.12);
}

button.suggested-action:checked {
  background-color: rgba(168, 168, 168, 0.961);
}

button.suggested-action:checked:hover {
  box-shadow: inset 0 0 0 9999px transparent,
    0 3px 3px -3px rgba(238, 190, 190, 0.3),
    0 2px 3px -1px rgba(238, 190, 190, 0.24),
    0 2px 5px 0 rgba(238, 190, 190, 0.12);
}

button.suggested-action:focus {
  box-shadow: 0 0 0 2px rgba(238, 190, 190, 0.35);
}

button.suggested-action.flat {
  background-color: transparent;
  color: #${config.colorScheme.palette.base0F};
}

button.suggested-action.flat:disabled {
  box-shadow: none;
  background-color: transparent;
  color: rgba(242, 213, 207, 0.3);
  opacity: 1;
  filter: none;
}

button.suggested-action.flat:checked {
  background-color: rgba(238, 190, 190, 0.3);
}

button.destructive-action {
  background-color: #${config.colorScheme.palette.base08};
  color: rgba(0, 0, 0, 0.87);
  box-shadow: none;
}

button.destructive-action:disabled {
  box-shadow: none;
  background-color: rgba(242, 213, 207, 0.04);
  color: rgba(242, 213, 207, 0.5);
  transition: none;
  opacity: 1;
  filter: none;
}

button.destructive-action:hover {
  box-shadow: inset 0 0 0 9999px transparent,
    0 2px 2.4px -1px rgba(242, 139, 130, 0.2),
    0 4px 3px 0 rgba(242, 139, 130, 0.14), 0 1px 6px 0 rgba(242, 139, 130, 0.12);
}

button.destructive-action:checked {
  background-color: rgba(182, 105, 98, 0.961);
}

button.destructive-action:checked:hover {
  box-shadow: inset 0 0 0 9999px transparent,
    0 3px 3px -3px rgba(242, 139, 130, 0.3),
    0 2px 3px -1px rgba(242, 139, 130, 0.24),
    0 2px 5px 0 rgba(242, 139, 130, 0.12);
}

button.destructive-action:focus {
  box-shadow: 0 0 0 2px rgba(242, 139, 130, 0.35);
}

button.destructive-action.flat {
  background-color: transparent;
  color: #${config.colorScheme.palette.base08};
}

button.destructive-action.flat:disabled {
  box-shadow: none;
  background-color: transparent;
  color: rgba(242, 213, 207, 0.3);
  opacity: 1;
  filter: none;
}

button.destructive-action.flat:checked {
  background-color: rgba(242, 139, 130, 0.3);
}

menubutton.pill > button,
button.pill {
  padding: 9px 30px;
  border-radius: 9999px;
}

button.card {
  background-clip: padding-box;
  font-weight: inherit;
  background-clip: border-box;
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1),
    background-color 225ms cubic-bezier(0, 0, 0.2, 1),
    box-shadow 300ms cubic-bezier(0, 0, 0.2, 1);
  outline: none;
  background-color: rgba(242, 213, 207, 0.08);
  color: #${config.colorScheme.palette.base06};
  box-shadow: inset 0 0 0 2px transparent;
}

button.card:hover {
  background-image: none;
  background-color: alpha(currentColor, 0.08);
  color: #${config.colorScheme.palette.base06};
  box-shadow: inset 0 0 0 2px transparent;
}

button.card.keyboard-activating,
button.card:active {
  background-image: none;
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1),
    background-color 225ms cubic-bezier(0, 0, 0.2, 1),
    box-shadow 300ms cubic-bezier(0, 0, 0.2, 1);
  background-color: alpha(currentColor, 0.12);
  box-shadow: inset 0 0 0 2px transparent;
  color: #${config.colorScheme.palette.base06};
}

button.card:checked {
  background-image: none;
  box-shadow: none;
  background-color: #${config.colorScheme.palette.base0F};
  color: rgba(0, 0, 0, 0.87);
  outline: none;
  border-color: #${config.colorScheme.palette.base0F};
}

button.card:checked:hover {
  background-image: none;
  box-shadow: none;
}

button.card:checked:disabled {
  box-shadow: none;
  background-color: rgba(242, 213, 207, 0.04);
  color: rgba(242, 213, 207, 0.5);
  opacity: 1;
  filter: none;
}

button.card.keyboard-activating:checked,
button.card:checked:active {
  background-image: none;
}

button.card.has-open-popup:checked {
  background-image: none;
}

button.card:drop(active) {
  color: #${config.colorScheme.palette.base09};
  box-shadow: inset 0 0 0 1px #${config.colorScheme.palette.base09};
}

stackswitcher > button > label {
  margin: 0 -6px;
  padding: 0 6px;
}

stackswitcher > button > image {
  margin: -3px -6px;
  padding: 3px 6px;
}

stackswitcher > button.needs-attention:checked > label,
stackswitcher > button.needs-attention:checked > image {
  animation: none;
  background-image: none;
}

button.font > box,
button.file > box {
  border-spacing: 6px;
}

button.font > box > box > label,
button.file > box > box > label {
  font-weight: bold;
}

windowcontrols button:not(.suggested-action):not(.destructive-action),
filechooser #pathbarbox > stack > box > button,
menubutton.circular > button,
button.close,
button.circular {
  border-radius: 9999px;
  min-width: 24px;
  min-height: 24px;
  padding: 6px;
}

windowcontrols button:not(.suggested-action):not(.destructive-action) label,
filechooser #pathbarbox > stack > box > button label,
menubutton.circular > button label,
button.close label,
button.circular label {
  padding: 0;
}

.nautilus-window .floating-bar button,
placessidebar .navigation-sidebar > row button.sidebar-button,
notebook > header tab button.flat,
popover.menu box.circular-buttons button.circular.image-button.model,
spinbutton.vertical > button,
spinbutton:not(.vertical) > button {
  min-height: 24px;
  min-width: 24px;
  padding: 0;
  border-radius: 9999px;
}

menubutton.osd {
  background: none;
  color: inherit;
}

menubutton.suggested-action {
  background-color: #${config.colorScheme.palette.base0F};
  color: #${config.colorScheme.palette.base06};
}

menubutton.destructive-action {
  background-color: #${config.colorScheme.palette.base08};
  color: #${config.colorScheme.palette.base06};
}

menubutton.opaque {
  background-color: #${config.colorScheme.palette.base04};
  color: #${config.colorScheme.palette.base06};
}

menubutton.suggested-action,
menubutton.destructive-action,
menubutton.opaque {
  border-radius: 6px;
}

menubutton.suggested-action.circular,
menubutton.suggested-action.pill,
menubutton.destructive-action.circular,
menubutton.destructive-action.pill,
menubutton.opaque.circular,
menubutton.opaque.pill {
  border-radius: 9999px;
}

menubutton.suggested-action > button,
menubutton.suggested-action > button:checked,
menubutton.destructive-action > button,
menubutton.destructive-action > button:checked,
menubutton.opaque > button,
menubutton.opaque > button:checked {
  background-color: transparent;
  color: inherit;
}

menubutton.image-button > button {
  min-width: 24px;
  padding-left: 6px;
  padding-right: 6px;
}

menubutton arrow {
  min-height: 16px;
  min-width: 16px;
}

menubutton arrow.none {
  -gtk-icon-source: -gtk-icontheme('open-menu-symbolic');
}

menubutton arrow.down {
  -gtk-icon-source: -gtk-icontheme('pan-down-symbolic');
}

menubutton arrow.up {
  -gtk-icon-source: -gtk-icontheme('pan-up-symbolic');
}

menubutton arrow.left {
  -gtk-icon-source: -gtk-icontheme('pan-start-symbolic');
}

menubutton arrow.right {
  -gtk-icon-source: -gtk-icontheme('pan-end-symbolic');
}

splitbutton {
  border-radius: 6px;
}

splitbutton,
splitbutton > separator {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
  transition-property: background;
}

splitbutton:disabled {
  filter: none;
}

splitbutton:disabled > button,
splitbutton:disabled > menubutton > button {
  filter: none;
}

splitbutton > separator {
  margin-top: 6px;
  margin-bottom: 6px;
  background: none;
}

splitbutton > menubutton > button {
  padding-left: 4px;
  padding-right: 4px;
}

splitbutton.image-button > button {
  min-width: 24px;
  padding-left: 6px;
  padding-right: 6px;
}

splitbutton.text-button.image-button > button,
splitbutton.image-text-button > button {
  padding-left: 9px;
  padding-right: 9px;
}

splitbutton.text-button.image-button > button > box,
splitbutton.image-text-button > button > box {
  border-spacing: 6px;
}

splitbutton > button:dir(ltr),
splitbutton > menubutton > button:dir(rtl) {
  border-top-right-radius: 0;
  border-bottom-right-radius: 0;
  margin-right: -1px;
}

splitbutton > button:dir(rtl),
splitbutton > menubutton > button:dir(ltr) {
  border-top-left-radius: 0;
  border-bottom-left-radius: 0;
  margin-left: -1px;
}

splitbutton.flat > separator {
  background: rgba(242, 213, 207, 0.12);
}

splitbutton.flat:hover,
splitbutton.flat:active,
splitbutton.flat:checked {
  background: alpha(currentColor, 0.07);
}

splitbutton.flat:hover > separator,
splitbutton.flat:active > separator,
splitbutton.flat:checked > separator {
  background: none;
}

splitbutton.flat:focus-within:focus-visible > separator {
  background: none;
}

splitbutton.flat > button,
splitbutton.flat > menubutton > button {
  border-radius: 6px;
}

splitbutton.suggested-action {
  background-color: #${config.colorScheme.palette.base0F};
  color: #${config.colorScheme.palette.base06};
}

splitbutton.destructive-action {
  background-color: #${config.colorScheme.palette.base08};
  color: #${config.colorScheme.palette.base06};
}

splitbutton.opaque {
  background-color: #${config.colorScheme.palette.base04};
  color: #${config.colorScheme.palette.base06};
}

splitbutton.suggested-action > button,
splitbutton.suggested-action > button:checked,
splitbutton.suggested-action > menubutton > button,
splitbutton.suggested-action > menubutton > button:checked,
splitbutton.destructive-action > button,
splitbutton.destructive-action > button:checked,
splitbutton.destructive-action > menubutton > button,
splitbutton.destructive-action > menubutton > button:checked,
splitbutton.opaque > button,
splitbutton.opaque > button:checked,
splitbutton.opaque > menubutton > button,
splitbutton.opaque > menubutton > button:checked {
  color: inherit;
  background-color: transparent;
}

splitbutton.suggested-action > menubutton > button:dir(ltr),
splitbutton.destructive-action > menubutton > button:dir(ltr),
splitbutton.opaque > menubutton > button:dir(ltr) {
  box-shadow: inset 1px 0 rgba(242, 213, 207, 0.12);
}

splitbutton.suggested-action > menubutton > button:dir(rtl),
splitbutton.destructive-action > menubutton > button:dir(rtl),
splitbutton.opaque > menubutton > button:dir(rtl) {
  box-shadow: inset -1px 0 rgba(242, 213, 207, 0.12);
}

splitbutton > menubutton > button > arrow.none {
  -gtk-icon-source: -gtk-icontheme('pan-down-symbolic');
}

buttoncontent {
  border-spacing: 6px;
}

buttoncontent > label {
  font-weight: bold;
}

buttoncontent > label:dir(ltr) {
  padding-right: 2px;
}

buttoncontent > label:dir(rtl) {
  padding-left: 2px;
}

.arrow-button > box > buttoncontent > label:dir(ltr),
splitbutton > button > buttoncontent > label:dir(ltr) {
  padding-right: 0;
}

.arrow-button > box > buttoncontent > label:dir(rtl),
splitbutton > button > buttoncontent > label:dir(rtl) {
  padding-left: 0;
}

stacksidebar row.needs-attention > label,
stackswitcher > button.needs-attention > label,
stackswitcher > button.needs-attention > image {
  animation: needs-attention 225ms cubic-bezier(0, 0, 0.2, 1) forwards;
  background-repeat: no-repeat;
  background-position: right 3px;
  background-size: 6px 6px;
}

stacksidebar row.needs-attention > label:dir(rtl),
stackswitcher > button.needs-attention > label:dir(rtl),
stackswitcher > button.needs-attention > image:dir(rtl) {
  background-position: left 3px;
}

.linked:not(.vertical) > entry,
.linked:not(.vertical) > button,
.linked:not(.vertical) > button.image-button {
  border-radius: 0;
}

.linked:not(.vertical) > entry:first-child,
.linked:not(.vertical) > button:first-child {
  border-top-left-radius: 6px;
  border-bottom-left-radius: 6px;
}

.linked:not(.vertical) > entry:last-child,
.linked:not(.vertical) > button:last-child {
  border-top-right-radius: 6px;
  border-bottom-right-radius: 6px;
}

.linked:not(.vertical) > entry:only-child,
.linked:not(.vertical) > button:only-child {
  border-radius: 6px;
}

.linked.vertical > entry,
.linked.vertical > button,
.linked.vertical > button.image-button {
  border-radius: 0;
}

.linked.vertical > entry:first-child,
.linked.vertical > button:first-child {
  border-top-left-radius: 6px;
  border-top-right-radius: 6px;
}

.linked.vertical > entry:last-child,
.linked.vertical > button:last-child {
  border-bottom-left-radius: 6px;
  border-bottom-right-radius: 6px;
}

.linked.vertical > entry:only-child,
.linked.vertical > button:only-child {
  border-radius: 6px;
}

.linked:not(.vertical) > button:not(.combo):dir(ltr):not(:first-child),
.linked:not(.vertical) > button:not(.combo):dir(rtl):not(:last-child) {
  border-top-left-radius: 0;
  border-bottom-left-radius: 0;
  margin-left: 0;
}

.linked:not(.vertical) > button:not(.combo):dir(ltr):not(:last-child),
.linked:not(.vertical) > button:not(.combo):dir(rtl):not(:first-child) {
  border-top-right-radius: 0;
  border-bottom-right-radius: 0;
}

.linked.vertical button:not(.combo):not(:first-child) {
  border-top-left-radius: 0;
  border-top-right-radius: 0;
  margin-top: 0;
}

.linked.vertical button:not(.combo):not(:last-child) {
  border-bottom-left-radius: 0;
  border-bottom-right-radius: 0;
}

.linked:not(.vertical) > menubutton:dir(ltr):not(:first-child) > button,
.linked:not(.vertical) > menubutton:dir(rtl):not(:last-child) > button {
  border-top-left-radius: 0;
  border-bottom-left-radius: 0;
  margin-left: 0;
}

.linked:not(.vertical) > menubutton:dir(ltr):not(:last-child) > button,
.linked:not(.vertical) > menubutton:dir(rtl):not(:first-child) > button {
  border-top-right-radius: 0;
  border-bottom-right-radius: 0;
}

.linked.vertical menubutton:not(:first-child) > button {
  border-top-left-radius: 0;
  border-top-right-radius: 0;
  margin-top: 0;
}

.linked.vertical menubutton:not(:last-child) > button {
  border-bottom-left-radius: 0;
  border-bottom-right-radius: 0;
}

.linked:not(.vertical) > dropdown:dir(ltr):not(:first-child) > button,
.linked:not(.vertical) > dropdown:dir(rtl):not(:last-child) > button {
  border-top-left-radius: 0;
  border-bottom-left-radius: 0;
  margin-left: 0;
}

.linked:not(.vertical) > dropdown:dir(ltr):not(:last-child) > button,
.linked:not(.vertical) > dropdown:dir(rtl):not(:first-child) > button {
  border-top-right-radius: 0;
  border-bottom-right-radius: 0;
}

.linked.vertical dropdown:not(:first-child) > button {
  border-top-left-radius: 0;
  border-top-right-radius: 0;
  margin-top: 0;
}

.linked.vertical dropdown:not(:last-child) > button {
  border-bottom-left-radius: 0;
  border-bottom-right-radius: 0;
}

.linked:not(.vertical) > colorbutton:dir(ltr):not(:first-child) > button,
.linked:not(.vertical) > colorbutton:dir(rtl):not(:last-child) > button {
  border-top-left-radius: 0;
  border-bottom-left-radius: 0;
  margin-left: 0;
}

.linked:not(.vertical) > colorbutton:dir(ltr):not(:last-child) > button,
.linked:not(.vertical) > colorbutton:dir(rtl):not(:first-child) > button {
  border-top-right-radius: 0;
  border-bottom-right-radius: 0;
}

.linked.vertical colorbutton:not(:first-child) > button {
  border-top-left-radius: 0;
  border-top-right-radius: 0;
  margin-top: 0;
}

.linked.vertical colorbutton:not(:last-child) > button {
  border-bottom-left-radius: 0;
  border-bottom-right-radius: 0;
}

.linked:not(.vertical) > fontbutton:dir(ltr):not(:first-child) > button,
.linked:not(.vertical) > fontbutton:dir(rtl):not(:last-child) > button {
  border-top-left-radius: 0;
  border-bottom-left-radius: 0;
  margin-left: 0;
}

.linked:not(.vertical) > fontbutton:dir(ltr):not(:last-child) > button,
.linked:not(.vertical) > fontbutton:dir(rtl):not(:first-child) > button {
  border-top-right-radius: 0;
  border-bottom-right-radius: 0;
}

.linked.vertical fontbutton:not(:first-child) > button {
  border-top-left-radius: 0;
  border-top-right-radius: 0;
  margin-top: 0;
}

.linked.vertical fontbutton:not(:last-child) > button {
  border-bottom-left-radius: 0;
  border-bottom-right-radius: 0;
}

.linked:not(.vertical) > tabbutton:dir(ltr):not(:first-child) > button,
.linked:not(.vertical) > tabbutton:dir(rtl):not(:last-child) > button {
  border-top-left-radius: 0;
  border-bottom-left-radius: 0;
  margin-left: 0;
}

.linked:not(.vertical) > tabbutton:dir(ltr):not(:last-child) > button,
.linked:not(.vertical) > tabbutton:dir(rtl):not(:first-child) > button {
  border-top-right-radius: 0;
  border-bottom-right-radius: 0;
}

.linked.vertical tabbutton:not(:first-child) > button {
  border-top-left-radius: 0;
  border-top-right-radius: 0;
  margin-top: 0;
}

.linked.vertical tabbutton:not(:last-child) > button {
  border-bottom-left-radius: 0;
  border-bottom-right-radius: 0;
}

.linked:not(.vertical) > entry:not(.combo):dir(ltr):not(:first-child),
.linked:not(.vertical) > entry:not(.combo):dir(rtl):not(:last-child) {
  border-top-left-radius: 0;
  border-bottom-left-radius: 0;
  margin-left: 0;
}

.linked:not(.vertical) > entry:not(.combo):dir(ltr):not(:last-child),
.linked:not(.vertical) > entry:not(.combo):dir(rtl):not(:first-child) {
  border-top-right-radius: 0;
  border-bottom-right-radius: 0;
}

.linked.vertical entry:not(.combo):not(:first-child) {
  border-top-left-radius: 0;
  border-top-right-radius: 0;
  margin-top: 0;
}

.linked.vertical entry:not(.combo):not(:last-child) {
  border-bottom-left-radius: 0;
  border-bottom-right-radius: 0;
}

button.color {
  min-height: 24px;
  min-width: 24px;
  padding: 6px;
}

list > row button.image-button:not(.flat) {
  background-color: transparent;
  box-shadow: none;
  border: none;
}

list > row button.image-button:not(.flat):hover {
  background-color: alpha(currentColor, 0.08);
  color: #${config.colorScheme.palette.base06};
  box-shadow: inset 0 0 0 2px transparent;
}

list > row button.image-button:not(.flat):active,
list > row button.image-button:not(.flat):checked {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1),
    background-color 225ms cubic-bezier(0, 0, 0.2, 1),
    box-shadow 300ms cubic-bezier(0, 0, 0.2, 1);
  background-color: alpha(currentColor, 0.12);
  box-shadow: inset 0 0 0 2px transparent;
  color: #${config.colorScheme.palette.base06};
}

list > row button.image-button.suggested-action:not(.flat) {
  background-color: #${config.colorScheme.palette.base0F};
  color: rgba(0, 0, 0, 0.87);
}

list > row button.image-button.destructive-action:not(.flat) {
  background-color: #${config.colorScheme.palette.base08};
  color: rgba(0, 0, 0, 0.87);
}

/*********
 * Links *
 *********/
link {
  color: #85c1dc;
}

link:visited {
  color: #${config.colorScheme.palette.base0E};
}

button.link:link,
button.link:link:focus,
button.link:link:hover,
button.link:link:active {
  color: #85c1dc;
}

button.link:visited,
button.link:visited:focus,
button.link:visited:hover,
button.link:visited:active {
  color: #${config.colorScheme.palette.base0E};
}

button.link > label {
  text-decoration-line: underline;
}

/*****************
 * GtkSpinButton *
 *****************/
spinbutton {
  border-radius: 6px;
  padding: 0;
  border-spacing: 0;
  min-height: 0;
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1),
    box-shadow 300ms cubic-bezier(0, 0, 0.2, 1);
  box-shadow: inset 0 0 0 2px transparent;
  background-color: rgba(242, 213, 207, 0.08);
  color: #${config.colorScheme.palette.base06};
  outline: none;
}

spinbutton:focus-within {
  background-color: rgba(242, 213, 207, 0.08);
  box-shadow: inset 0 0 0 2px #${config.colorScheme.palette.base0F};
  outline: none;
}

spinbutton:disabled {
  box-shadow: inset 0 0 0 2px transparent;
  background-color: rgba(242, 213, 207, 0.04);
  color: rgba(242, 213, 207, 0.5);
  outline: none;
  opacity: 1;
  filter: none;
}

spinbutton:not(.vertical) > text {
  min-width: 32px;
  margin: 0;
  padding-left: 12px;
  border-image: none;
  border-radius: 0;
  box-shadow: none;
  background-color: transparent;
}

spinbutton:not(.vertical) > button {
  border: solid 6px transparent;
}

spinbutton:not(.vertical)
  > button:focus:not(:hover):not(:active):not(:disabled) {
  box-shadow: inset 0 0 0 9999px transparent;
  color: rgba(242, 213, 207, 0.7);
}

spinbutton:not(.vertical) > button.up:dir(ltr),
spinbutton:not(.vertical) > button.down:dir(rtl) {
  margin-left: -3px;
}

spinbutton:not(.vertical) > button.up:dir(rtl),
spinbutton:not(.vertical) > button.down:dir(ltr) {
  margin-right: -3px;
}

spinbutton.vertical > text {
  margin: 0;
  border-image: none;
  border-radius: 0;
  box-shadow: none;
  background-color: transparent;
  min-height: 36px;
  min-width: 42px;
  padding: 0;
}

spinbutton.vertical > button {
  padding: 0;
  border: solid 6px transparent;
}

spinbutton.vertical > button:focus:not(:hover):not(:active) {
  box-shadow: inset 0 0 0 9999px transparent;
  color: rgba(242, 213, 207, 0.7);
}

spinbutton.vertical > button.up {
  margin: 0 3px;
}

spinbutton.vertical > button.down {
  margin: 0 3px;
}

list > row spinbutton:not(.vertical) > button {
  margin: 6px;
}

list > row spinbutton:not(.vertical) > button.up:dir(ltr),
list > row spinbutton:not(.vertical) > button.down:dir(rtl) {
  margin-left: 3px;
}

list > row spinbutton:not(.vertical) > button.up:dir(rtl),
list > row spinbutton:not(.vertical) > button.down:dir(ltr) {
  margin-right: 3px;
}

/**************
 * ComboBoxes *
 **************/
dropdown > button > box {
  border-spacing: 6px;
}

dropdown arrow,
combobox arrow {
  -gtk-icon-source: -gtk-icontheme('pan-down-symbolic');
  min-height: 16px;
  min-width: 16px;
}

dropdown > popover.menu > contents modelbutton,
combobox > popover.menu > contents modelbutton {
  padding-left: 9px;
  padding-right: 9px;
}

dropdown button.combo cellview:dir(ltr),
combobox button.combo cellview:dir(ltr) {
  margin-left: -2px;
}

dropdown button.combo cellview:dir(rtl),
combobox button.combo cellview:dir(rtl) {
  margin-right: -2px;
}

dropdown popover,
combobox popover {
  margin-top: 4px;
  padding: 0;
}

dropdown popover listview,
combobox popover listview {
  margin: 0;
}

dropdown popover listview > row,
combobox popover listview > row {
  padding: 6px;
}

dropdown popover listview > row:selected,
combobox popover listview > row:selected {
  color: #${config.colorScheme.palette.base06};
  background-color: alpha(currentColor, 0.06);
}

dropdown popover .dropdown-searchbar,
combobox popover .dropdown-searchbar {
  padding: 6px;
}

dropdown.linked button:nth-child(2):dir(ltr),
combobox.linked button:nth-child(2):dir(ltr) {
  border-top-left-radius: 0;
  border-bottom-left-radius: 0;
}

dropdown.linked button:nth-child(2):dir(rtl),
combobox.linked button:nth-child(2):dir(rtl) {
  border-top-right-radius: 0;
  border-bottom-right-radius: 0;
}

dropdown > .linked:not(.vertical) > entry:not(:only-child),
combobox > .linked:not(.vertical) > entry:not(:only-child) {
  border-radius: 6px;
}

dropdown > .linked:not(.vertical) > entry:not(:only-child):first-child,
combobox > .linked:not(.vertical) > entry:not(:only-child):first-child {
  margin-right: -36px;
  padding-right: 36px;
}

dropdown > .linked:not(.vertical) > entry:not(:only-child):last-child,
combobox > .linked:not(.vertical) > entry:not(:only-child):last-child {
  margin-left: -36px;
  padding-left: 36px;
}

dropdown > .linked:not(.vertical) > button:not(:only-child),
combobox > .linked:not(.vertical) > button:not(:only-child) {
  min-height: 16px;
  min-width: 16px;
  margin: 6px;
  padding: 4px;
  border-radius: 9999px;
}

.linked:not(.vertical) > combobox:not(:first-child) > box > button.combo {
  border-top-left-radius: 0;
  border-bottom-left-radius: 0;
}

.linked:not(.vertical) > combobox:not(:last-child) > box > button.combo {
  border-top-right-radius: 0;
  border-bottom-right-radius: 0;
}

.linked.vertical > combobox:not(:first-child) > box > button.combo {
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}

.linked.vertical > combobox:not(:last-child) > box > button.combo {
  border-bottom-left-radius: 0;
  border-bottom-right-radius: 0;
}

button.combo:only-child {
  border-radius: 6px;
  font-weight: normal;
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1),
    box-shadow 300ms cubic-bezier(0, 0, 0.2, 1);
  box-shadow: inset 0 0 0 2px transparent;
  background-color: rgba(242, 213, 207, 0.08);
  color: #${config.colorScheme.palette.base06};
  outline: none;
}

button.combo:only-child:focus {
  box-shadow: inset 0 0 0 2px alpha(currentColor, 0.08);
  color: #${config.colorScheme.palette.base06};
}

button.combo:only-child:hover {
  background-color: alpha(currentColor, 0.08);
  color: #${config.colorScheme.palette.base06};
}

button.combo:only-child:active {
  background-color: alpha(currentColor, 0.12);
  color: #${config.colorScheme.palette.base06};
  box-shadow: none;
}

button.combo:only-child:checked {
  background-color: alpha(currentColor, 0.1);
  color: #${config.colorScheme.palette.base06};
  outline: none;
  box-shadow: none;
}

button.combo:only-child:disabled {
  box-shadow: none;
  background-color: rgba(242, 213, 207, 0.04);
  color: rgba(242, 213, 207, 0.5);
  transition: none;
  opacity: 1;
  filter: none;
}

/************
 * Toolbars *
 ************/
.toolbar,
toolbar {
  padding: 3px 6px;
  background-color: #${config.colorScheme.palette.base00};
  border-spacing: 6px;
}

.osd .toolbar,
.osd toolbar {
  background-color: transparent;
}

.app-notification,
.toolbar.osd,
toolbar.osd {
  transition: box-shadow 75ms cubic-bezier(0, 0, 0.2, 1);
  padding: 6px;
  border-radius: 6px;
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2),
    0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12),
    inset 0 1px rgba(242, 213, 207, 0.1);
  background-color: #${config.colorScheme.palette.base02};
}

.app-notification:backdrop,
.toolbar.osd:backdrop,
toolbar.osd:backdrop {
  box-shadow: 0 3px 2px -3px rgba(0, 0, 0, 0.3),
    0 2px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 3px 0 rgba(0, 0, 0, 0.12),
    inset 0 1px rgba(242, 213, 207, 0.1);
}

.left.app-notification,
.right.app-notification,
.top.app-notification,
.bottom.app-notification,
.toolbar.osd.left,
.toolbar.osd.right,
.toolbar.osd.top,
.toolbar.osd.bottom,
toolbar.osd.left,
toolbar.osd.right,
toolbar.osd.top,
toolbar.osd.bottom {
  border-radius: 0;
}

.bottom.app-notification,
.toolbar.osd.bottom,
toolbar.osd.bottom {
  box-shadow: none;
  background-color: transparent;
  background-image: linear-gradient(
    to bottom,
    transparent,
    rgba(0, 0, 0, 0.1) 30%,
    rgba(0, 0, 0, 0.2) 50%,
    rgba(0, 0, 0, 0.4)
  );
}

.toolbar.horizontal > separator,
toolbar.horizontal > separator {
  margin: 2px;
}

.toolbar.vertical > separator,
toolbar.vertical > separator {
  margin: 2px;
}

.toolbar:not(.inline-toolbar):not(.osd) scale,
.toolbar:not(.inline-toolbar):not(.osd) entry,
.toolbar:not(.inline-toolbar):not(.osd) spinbutton,
.toolbar:not(.inline-toolbar):not(.osd) button,
toolbar:not(.inline-toolbar):not(.osd) scale,
toolbar:not(.inline-toolbar):not(.osd) entry,
toolbar:not(.inline-toolbar):not(.osd) spinbutton,
toolbar:not(.inline-toolbar):not(.osd) button {
  margin: 2px;
}

.toolbar:not(.inline-toolbar):not(.osd) .linked entry:not(:first-child),
.toolbar:not(.inline-toolbar):not(.osd) .linked spinbutton:not(:first-child),
.toolbar:not(.inline-toolbar):not(.osd) .linked button:not(:first-child),
toolbar:not(.inline-toolbar):not(.osd) .linked entry:not(:first-child),
toolbar:not(.inline-toolbar):not(.osd) .linked spinbutton:not(:first-child),
toolbar:not(.inline-toolbar):not(.osd) .linked button:not(:first-child) {
  margin-left: 0;
}

.toolbar:not(.inline-toolbar):not(.osd) .linked entry:not(:last-child),
.toolbar:not(.inline-toolbar):not(.osd) .linked spinbutton:not(:last-child),
.toolbar:not(.inline-toolbar):not(.osd) .linked button:not(:last-child),
toolbar:not(.inline-toolbar):not(.osd) .linked entry:not(:last-child),
toolbar:not(.inline-toolbar):not(.osd) .linked spinbutton:not(:last-child),
toolbar:not(.inline-toolbar):not(.osd) .linked button:not(:last-child) {
  margin-right: 0;
}

.toolbar:not(.inline-toolbar):not(.osd) spinbutton entry,
.toolbar:not(.inline-toolbar):not(.osd) spinbutton button,
toolbar:not(.inline-toolbar):not(.osd) spinbutton entry,
toolbar:not(.inline-toolbar):not(.osd) spinbutton button {
  margin: 0;
}

.toolbar:not(.inline-toolbar):not(.osd) switch,
toolbar:not(.inline-toolbar):not(.osd) switch {
  margin: 8px 2px;
}

searchbar > revealer > box {
  padding: 6px;
  border-spacing: 6px;
  border-style: solid;
  border-width: 0 0 1px;
  border-color: rgba(242, 213, 207, 0.12);
  background-color: #${config.colorScheme.palette.base00};
  background-clip: border-box;
  box-shadow: none;
}

searchbar > revealer > box entry,
searchbar > revealer > box button {
  margin: 0;
}

/***************
 * Header bars *
 ***************/
headerbar button:not(.suggested-action):not(.destructive-action) {
  color: rgba(242, 213, 207, 0.7);
  border-radius: 6px;
}

headerbar button:focus:not(.suggested-action):not(.destructive-action),
headerbar button:hover:not(.suggested-action):not(.destructive-action),
headerbar button:active:not(.suggested-action):not(.destructive-action),
headerbar button:checked:not(.suggested-action):not(.destructive-action) {
  color: #${config.colorScheme.palette.base06};
}

headerbar button:disabled:not(.suggested-action):not(.destructive-action) {
  color: rgba(242, 213, 207, 0.3);
}

headerbar
  button:checked:disabled:not(.suggested-action):not(.destructive-action) {
  background-color: transparent;
  color: rgba(242, 213, 207, 0.5);
}

headerbar button:backdrop:not(.suggested-action):not(.destructive-action) {
  color: rgba(242, 213, 207, 0.5);
}

headerbar button:backdrop:focus:not(.suggested-action):not(.destructive-action),
headerbar button:backdrop:hover:not(.suggested-action):not(.destructive-action),
headerbar
  button:backdrop:active:not(.suggested-action):not(.destructive-action) {
  color: rgba(242, 213, 207, 0.7);
}

headerbar
  button:backdrop:disabled:not(.suggested-action):not(.destructive-action) {
  color: rgba(242, 213, 207, 0.3);
}

headerbar
  button:backdrop:checked:not(.suggested-action):not(.destructive-action) {
  color: rgba(242, 213, 207, 0.7);
}

headerbar
  button:backdrop:checked:disabled:not(.suggested-action):not(
    .destructive-action
  ) {
  color: rgba(242, 213, 207, 0.3);
}

headerbar entry {
  background-color: rgba(242, 213, 207, 0.04);
  color: #${config.colorScheme.palette.base06};
}

headerbar entry:focus-within {
  box-shadow: inset 0 0 0 2px #${config.colorScheme.palette.base0F};
}

headerbar entry:disabled {
  background-color: rgba(242, 213, 207, 0.04);
  color: rgba(242, 213, 207, 0.5);
}

headerbar entry image {
  color: rgba(242, 213, 207, 0.7);
}

headerbar entry image:hover,
headerbar entry image:active {
  color: #${config.colorScheme.palette.base06};
}

headerbar entry image:disabled {
  color: rgba(242, 213, 207, 0.5);
}

headerbar {
  min-height: 48px;
  padding: 0;
  margin: 0;
  border: none;
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
  background-color: #${config.colorScheme.palette.base00};
  color: #${config.colorScheme.palette.base06};
  box-shadow: none;
}

headerbar:disabled {
  color: rgba(242, 213, 207, 0.5);
}

headerbar:backdrop {
  background-color: #${config.colorScheme.palette.base00};
  color: rgba(242, 213, 207, 0.7);
}

headerbar:backdrop:disabled {
  color: rgba(242, 213, 207, 0.3);
}

headerbar.flat {
  background-color: transparent;
  color: #${config.colorScheme.palette.base06};
}

headerbar .title {
  padding: 0 12px;
  font-weight: bold;
}

headerbar .subtitle {
  padding: 0 12px;
  font-size: smaller;
}

headerbar .subtitle,
headerbar .dim-label,
headerbar row label.subtitle,
row headerbar label.subtitle {
  transition: color 75ms cubic-bezier(0, 0, 0.2, 1);
  color: rgba(242, 213, 207, 0.7);
}

headerbar .subtitle:backdrop,
headerbar .dim-label:backdrop,
headerbar row label.subtitle:backdrop,
row headerbar label.subtitle:backdrop {
  color: rgba(242, 213, 207, 0.5);
}

headerbar > windowhandle > box {
  padding: 0 6px;
}

headerbar > windowhandle > box,
headerbar > windowhandle > box > box.start,
headerbar > windowhandle > box > box.end {
  border-spacing: 6px;
}

headerbar entry,
headerbar spinbutton,
headerbar button,
headerbar stackswitcher,
headerbar menubutton,
headerbar splitbutton,
headerbar separator {
  margin-top: 6px;
  margin-bottom: 6px;
}

headerbar menubutton > button,
headerbar spinbutton > button,
headerbar splitbutton > button,
headerbar splitbutton > menubutton,
headerbar stackswitcher > button {
  margin-top: 0;
  margin-bottom: 0;
}

headerbar separator:not(.spacer) {
  background-color: rgba(242, 213, 207, 0.12);
}

headerbar switch {
  margin-top: 12px;
  margin-bottom: 12px;
}

headerbar spinbutton button {
  margin-top: 0;
  margin-bottom: 0;
}

headerbar .entry-tag {
  margin-top: 5px;
  margin-bottom: 5px;
}

headerbar .titlebar {
  background-color: transparent;
  box-shadow: none;
}

headerbar headerbar + separator {
  background-color: rgba(242, 213, 207, 0.12);
}

headerbar .linked:not(.vertical) > entry:not(:only-child) {
  border-radius: 6px;
}

headerbar button.suggested-action:disabled,
headerbar button.destructive-action:disabled {
  background-color: rgba(242, 213, 207, 0.04);
  color: rgba(242, 213, 207, 0.5);
}

headerbar stackswitcher {
  margin: 6px 0;
  border-radius: 9999px;
  border: 2px solid #${config.colorScheme.palette.base0F};
}

headerbar
  stackswitcher.linked:not(.vertical)
  > button.text-button:not(.suggested-action):not(.destructive-action) {
  border-radius: 9999px;
}

headerbar
  stackswitcher.linked:not(.vertical)
  > button.text-button:not(.suggested-action):not(.destructive-action):checked {
  background-color: #${config.colorScheme.palette.base0F};
  color: rgba(0, 0, 0, 0.87);
}

headerbar.selection-mode {
  transition: background-color 0.1ms 225ms,
    color 75ms cubic-bezier(0, 0, 0.2, 1);
  box-shadow: inset 0 1px rgba(242, 213, 207, 0);
  background-color: #${config.colorScheme.palette.base0F};
  color: rgba(0, 0, 0, 0.87);
}

headerbar.selection-mode:backdrop {
  color: rgba(0, 0, 0, 0.6);
}

headerbar.selection-mode .subtitle:link {
  color: rgba(0, 0, 0, 0.87);
}

headerbar.selection-mode .selection-menu {
  padding-left: 16px;
  padding-right: 16px;
}

headerbar.selection-mode .selection-menu .arrow {
  -gtk-icon-source: -gtk-icontheme('pan-down-symbolic');
}

headerbar .selection-mode {
  box-shadow: inset 0 1px rgba(242, 213, 207, 0);
  background-color: #${config.colorScheme.palette.base0F};
}

.tiled headerbar,
.tiled-top headerbar,
.tiled-right headerbar,
.tiled-bottom headerbar,
.tiled-left headerbar,
.maximized headerbar,
.fullscreen headerbar {
  border-radius: 0;
}

headerbar.default-decoration {
  min-height: 24px;
  padding: 6px;
  border-radius: 6px 6px 0 0;
}

headerbar.default-decoration windowcontrols button,
headerbar.default-decoration windowcontrols menubutton {
  min-height: 24px;
  min-width: 24px;
  margin: 0;
  padding: 0;
}

.solid-csd headerbar:dir(rtl),
.solid-csd headerbar:dir(ltr) {
  border-radius: 0;
  box-shadow: none;
}

window.devel headerbar.titlebar {
  background: #${config.colorScheme.palette.base00}
      cross-fade(10% -gtk-icontheme('system-run-symbolic'), image(transparent))
      90% 0/256px 256px no-repeat,
    linear-gradient(to right, transparent 65%, rgba(238, 190, 190, 0.1)),
    linear-gradient(to top, #343434 3px, #393939);
}

window.devel headerbar.titlebar:backdrop {
  background: #${config.colorScheme.palette.base00}
      cross-fade(10% -gtk-icontheme('system-run-symbolic'), image(transparent))
      90% 0/256px 256px no-repeat,
    image(#${config.colorScheme.palette.base00});
  /* background-color would flash */
}

/************
 * Pathbars *
 ************/

pathbar > button {
  padding-left: 6px;
  padding-right: 6px;
  border-radius: 6px;
}

pathbar > button label:not(:only-child):first-child {
  margin-left: 0;
}

pathbar > button label:not(:only-child):last-child {
  margin-right: 0;
}

pathbar > button.text-button {
  min-width: 0;
}

pathbar > button.slider-button {
  padding-left: 4px;
  padding-right: 4px;
}

.pathbar {
  background-color: rgba(242, 213, 207, 0.04);
  color: rgba(242, 213, 207, 0.7);
  border: none;
  border-radius: 6px;
  padding: 2px;
}

headerbar .pathbar {
  margin-top: 6px;
  margin-bottom: 6px;
  background-color: rgba(242, 213, 207, 0.04);
  color: rgba(242, 213, 207, 0.7);
}

.pathbar > button {
  margin-top: 0;
  margin-bottom: 0;
  min-height: 20px;
  border-radius: 4px;
  border: none;
  box-shadow: none;
}

.pathbar > button:last-child {
  background-color: alpha(currentColor, 0.1);
  color: #${config.colorScheme.palette.base06};
  outline: none;
  box-shadow: none;
}

/**************
 * Tree Views *
 **************/
columnview.view,
treeview.view {
  border-left-color: #${config.colorScheme.palette.base03};
  border-top-color: #${config.colorScheme.palette.base03};
}

columnview.view:selected,
treeview.view:selected {
  background-color: alpha(currentColor, 0.1);
  box-shadow: none;
}

columnview.view:focus,
treeview.view:focus {
  box-shadow: none;
  outline: none;
}

columnview.view:hover,
columnview.view:selected,
treeview.view:hover,
treeview.view:selected {
  border-radius: 0;
  box-shadow: none;
}

columnview.view.separator,
treeview.view.separator {
  min-height: 5px;
  color: rgba(242, 213, 207, 0.12);
}

columnview.view:drop(active),
treeview.view:drop(active) {
  box-shadow: none;
}

columnview.view.after:drop(active),
treeview.view.after:drop(active) {
  border-top-style: none;
}

columnview.view.before:drop(active),
treeview.view.before:drop(active) {
  border-bottom-style: none;
}

columnview.view > dndtarget:drop(active),
treeview.view > dndtarget:drop(active) {
  border-style: solid none;
  border-width: 1px;
  border-color: alpha(currentColor, 0.06);
}

columnview.view > dndtarget.after:drop(active),
treeview.view > dndtarget.after:drop(active) {
  border-top-style: none;
}

columnview.view > dndtarget.before:drop(active),
treeview.view > dndtarget.before:drop(active) {
  border-bottom-style: none;
}

columnview.view.expander,
treeview.view.expander {
  min-width: 16px;
  min-height: 16px;
  -gtk-icon-source: -gtk-icontheme('pan-end-symbolic');
  color: rgba(242, 213, 207, 0.7);
}

columnview.view.expander:dir(rtl),
treeview.view.expander:dir(rtl) {
  -gtk-icon-source: -gtk-icontheme('pan-end-symbolic-rtl');
}

columnview.view.expander:hover,
treeview.view.expander:hover {
  color: #${config.colorScheme.palette.base06};
}

columnview.view.expander:selected,
treeview.view.expander:selected {
  color: #${config.colorScheme.palette.base06};
}

columnview.view.expander:selected:hover,
treeview.view.expander:selected:hover {
  color: #${config.colorScheme.palette.base06};
}

columnview.view.expander:checked,
treeview.view.expander:checked {
  -gtk-icon-source: -gtk-icontheme('pan-down-symbolic');
}

columnview.view.expander:disabled,
treeview.view.expander:disabled {
  color: rgba(242, 213, 207, 0.3);
}

columnview.view.progressbar,
treeview.view.progressbar {
  border-bottom: 6px solid #${config.colorScheme.palette.base0F};
  box-shadow: none;
  background-color: transparent;
  background-image: none;
}

columnview.view.progressbar:selected:hover,
treeview.view.progressbar:selected:hover {
  box-shadow: none;
}

columnview.view.trough,
treeview.view.trough {
  border-bottom: 6px solid rgba(242, 213, 207, 0.12);
  box-shadow: none;
  background-color: transparent;
  background-image: none;
}

columnview.view.trough:selected:hover,
treeview.view.trough:selected:hover {
  box-shadow: none;
}

columnview.view > header > button,
treeview.view > header > button {
  padding: 2px 6px;
  border-style: none solid solid none;
  border-width: 1px;
  border-color: rgba(242, 213, 207, 0.12);
  border-radius: 0;
  background-clip: border-box;
}

columnview.view > header > button:not(:focus):not(:hover):not(:active),
treeview.view > header > button:not(:focus):not(:hover):not(:active) {
  color: rgba(242, 213, 207, 0.7);
}

columnview.view > header > button,
columnview.view > header > button:disabled,
treeview.view > header > button,
treeview.view > header > button:disabled {
  background-color: #${config.colorScheme.palette.base00};
}

columnview.view > header > button:last-child,
treeview.view > header > button:last-child {
  border-right-style: none;
}

columnview.view button.dnd,
columnview.view header.button.dnd,
treeview.view button.dnd,
treeview.view header.button.dnd {
  padding: 2px 6px;
  border-style: none solid solid;
  border-width: 1px;
  border-color: rgba(242, 213, 207, 0.12);
  border-radius: 0;
  box-shadow: none;
  background-color: #${config.colorScheme.palette.base00};
  background-clip: border-box;
  color: #${config.colorScheme.palette.base0F};
}

columnview.view acceleditor > label,
treeview.view acceleditor > label {
  background-color: #${config.colorScheme.palette.base0F};
}

/*********
 * Menus *
 *********/
menubar {
  padding: 0;
  color: #${config.colorScheme.palette.base06};
}

menubar:backdrop {
  color: rgba(242, 213, 207, 0.7);
}

.csd menubar {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
}

menubar > item {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
  min-height: 20px;
  padding: 4px 8px;
  color: rgba(242, 213, 207, 0.7);
}

menubar > item:selected {
  transition: none;
  background-color: alpha(currentColor, 0.1);
  color: #${config.colorScheme.palette.base06};
}

menubar > item:disabled {
  color: rgba(242, 213, 207, 0.3);
}

menubar > item label:disabled {
  color: inherit;
}

menubar > item popover.menu popover.menu {
  margin-left: 9px;
}

menubar > item popover.menu.background popover.menu.background > contents {
  margin: 0;
  border-radius: 12px;
}

/**********************
 * Popover Base Menus *
 **********************/
popover.menu box.inline-buttons {
  padding: 0 6px;
}

popover.menu box.inline-buttons button.image-button.model {
  min-height: 28px;
  min-width: 28px;
  padding: 0;
  border: none;
  outline: none;
  transition: none;
}

popover.menu box.inline-buttons button.image-button.model:selected {
  background-image: image(alpha(currentColor, 0.06));
}

popover.menu box.circular-buttons {
  padding: 6px;
}

popover.menu box.circular-buttons button.circular.image-button.model {
  padding: 6px;
}

popover.menu box.circular-buttons button.circular.image-button.model:focus {
  background-color: alpha(currentColor, 0.06);
}

popover.menu arrow.left,
popover.menu radio.left,
popover.menu check.left {
  margin-left: 0;
  margin-right: 0;
}

popover.menu arrow.right,
popover.menu radio.right,
popover.menu check.right {
  margin-left: 0;
  margin-right: 0;
}

/************
 * Popovers *
 ************/
popover.background {
  font: initial;
}

popover.background,
popover.background:backdrop {
  background-color: transparent;
}

popover.background > arrow,
popover.background > contents {
  transition: box-shadow 75ms cubic-bezier(0, 0, 0.2, 1);
  padding: 6px;
  background-color: #${config.colorScheme.palette.base02};
  background-clip: border-box;
  border-radius: 12px;
  color: #${config.colorScheme.palette.base06};
  border: 2px solid #${config.colorScheme.palette.base07};
}

popover.background:backdrop > arrow,
popover.background:backdrop > contents {
  border: 2px solid #${config.colorScheme.palette.base07};
}

popover.background separator {
  margin: 6px 0;
}

popover.background modelbutton {
  transition: background-color 75ms cubic-bezier(0, 0, 0.2, 1);
  min-height: 22px;
  min-width: 56px;
  padding: 3px 9px;
  border-radius: 6px;
  color: #${config.colorScheme.palette.base06};
  font: initial;
  text-shadow: none;
  box-shadow: none;
  background: none;
}

popover.background modelbutton:hover {
  transition: none;
  background-color: #${config.colorScheme.palette.base03};
  color: #${config.colorScheme.palette.base0E};
}

popover.background modelbutton:disabled {
  color: rgba(242, 213, 207, 0.5);
}

popover.background modelbutton arrow.left {
  -gtk-icon-source: -gtk-icontheme('go-previous-symbolic');
}

popover.background modelbutton arrow.right {
  -gtk-icon-source: -gtk-icontheme('go-next-symbolic');
}

popover.background label.title {
  font-weight: bold;
  padding: 4px 26px;
}

popover.background > contents > list,
popover.background > contents > .view,
popover.background > contents > toolbar {
  border-style: none;
  box-shadow: none;
  background-color: transparent;
}

popover.background > contents separator {
  background-color: rgba(242, 213, 207, 0.12);
  margin: 3px 0;
}

popover.background > contents list separator {
  margin: 0;
}

popover.background > contents stack > box {
  padding: 0;
}

popover.background > contents stack > scrolledwindow > viewport {
  border: 1px solid rgba(242, 213, 207, 0.12);
  border-radius: 2px;
}

popover.background > contents > box > button {
  margin: 0;
}

popover.background.menu button,
popover.background button.model {
  min-height: 32px;
  padding: 0 8px;
  border-radius: 6px;
}

.osd popover.background,
popover.background.touch-selection,
popover.background.magnifier {
  background-color: transparent;
}

.osd popover.background > arrow,
.osd popover.background > contents,
popover.background.touch-selection > arrow,
popover.background.touch-selection > contents,
popover.background.magnifier > arrow,
popover.background.magnifier > contents {
  border: none;
  box-shadow: none;
}

/*************
 * Notebooks *
 *************/
tabbar scrolledwindow:not(.pinned) > tabbox tab,
notebook > header tab {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1), background-size 0ms,
    background-image 0ms;
  min-height: 24px;
  min-width: 24px;
  padding: 6px;
  border: none;
  outline: none;
  background-clip: padding-box;
  color: rgba(242, 213, 207, 0.7);
  font-weight: 500;
  border-radius: 6px;
}

tabbar scrolledwindow:not(.pinned) > tabbox tab:hover,
notebook > header tab:hover {
  background-color: rgba(242, 213, 207, 0.04);
  color: #${config.colorScheme.palette.base0E};
}

tabbar scrolledwindow:not(.pinned) > tabbox tab:disabled,
notebook > header tab:disabled {
  color: rgba(242, 213, 207, 0.3);
}

tabbar scrolledwindow:not(.pinned) > tabbox tab:checked,
notebook > header tab:checked,
tabbar scrolledwindow:not(.pinned) > tabbox tab:selected,
notebook > header tab:selected {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
  background-color: #${config.colorScheme.palette.base02};
  color: #${config.colorScheme.palette.base0E};
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.06);
}

tabbar scrolledwindow:not(.pinned) > tabbox tab:checked:disabled,
notebook > header tab:checked:disabled,
tabbar scrolledwindow:not(.pinned) > tabbox tab:selected:disabled,
notebook > header tab:selected:disabled {
  color: rgba(242, 213, 207, 0.5);
}

frame > paned > notebook > header,
notebook.frame > header {
  background-color: rgba(242, 213, 207, 0.04);
}

notebook,
notebook.frame {
  background-color: #${config.colorScheme.palette.base00};
  border-radius: 12px;
}

notebook.frame frame > border {
  border: none;
  border-radius: 6px;
}

notebook.frame frame > list row.activatable {
  border-radius: 6px;
}

notebook > header {
  border: none;
  background-color: rgba(242, 213, 207, 0.04);
  padding: 3px;
  margin: 3px;
  border-radius: 9px;
}

notebook > header.top > tabs > arrow {
  border-top-style: none;
}

notebook > header.bottom > tabs > arrow {
  border-bottom-style: none;
}

notebook > header.top > tabs > arrow,
notebook > header.bottom > tabs > arrow {
  padding-left: 4px;
  padding-right: 4px;
}

notebook > header.top > tabs > arrow.down,
notebook > header.bottom > tabs > arrow.down {
  margin-left: 0;
  -gtk-icon-source: -gtk-icontheme('pan-start-symbolic');
}

notebook > header.top > tabs > arrow.up,
notebook > header.bottom > tabs > arrow.up {
  margin-right: 0;
  -gtk-icon-source: -gtk-icontheme('pan-end-symbolic');
}

notebook > header.left > tabs > arrow {
  border-left-style: none;
}

notebook > header.right > tabs > arrow {
  border-right-style: none;
}

notebook > header.left > tabs > arrow,
notebook > header.right > tabs > arrow {
  padding-top: 4px;
  padding-bottom: 4px;
}

notebook > header.left > tabs > arrow.down,
notebook > header.right > tabs > arrow.down {
  margin-top: 0;
  -gtk-icon-source: -gtk-icontheme('pan-up-symbolic');
}

notebook > header.left > tabs > arrow.up,
notebook > header.right > tabs > arrow.up {
  margin-bottom: 0;
  -gtk-icon-source: -gtk-icontheme('pan-down-symbolic');
}

notebook > header > tabs > arrow {
  min-height: 16px;
  min-width: 16px;
  border-radius: 6px;
}

notebook > header tab > box {
  transition: background-color 75ms cubic-bezier(0, 0, 0.2, 1);
  margin: -6px -12px;
  padding: 6px 12px;
}

notebook > header tab > box:drop(active) {
  background-color: rgba(242, 213, 207, 0.12);
  color: #${config.colorScheme.palette.base06};
}

notebook > header tab button.flat:last-child {
  margin-left: 6px;
  margin-right: -6px;
}

notebook > header tab button.flat:first-child {
  margin-left: -6px;
  margin-right: 6px;
}

notebook > header tab button.close-button {
  min-width: 24px;
  min-height: 24px;
}

notebook > header.top tabs:not(:only-child):first-child,
notebook > header.bottom tabs:not(:only-child):first-child {
  margin-left: 0;
}

notebook > header.top tabs:not(:only-child):last-child,
notebook > header.bottom tabs:not(:only-child):last-child {
  margin-right: 0;
}

notebook > header.top tabs tab.reorderable-page,
notebook > header.bottom tabs tab.reorderable-page {
  border-style: solid;
}

notebook > header.left tabs:not(:only-child):first-child,
notebook > header.right tabs:not(:only-child):first-child {
  margin-top: 0;
}

notebook > header.left tabs:not(:only-child):last-child,
notebook > header.right tabs:not(:only-child):last-child {
  margin-bottom: 0;
}

notebook > header.left tabs tab.reorderable-page,
notebook > header.right tabs tab.reorderable-page {
  border-style: solid;
}

notebook > header > menubutton > button.image-button {
  padding: 3px;
  min-width: 24px;
  min-height: 24px;
  margin-left: 3px;
}

notebook > stack:not(:only-child) {
  background-color: transparent;
  border-radius: 6px;
}

tabbar .box {
  min-height: 36px;
}

tabbar:not(.inline) .box {
  border: none;
  background-color: transparent;
  padding: 0;
  margin: 3px;
  border-radius: 12px;
  box-shadow: none;
}

tabbar:not(.inline):backdrop .box {
  background-color: transparent;
}

tabbar:not(.inline):backdrop .box > scrolledwindow,
tabbar:not(.inline):backdrop .box > .start-action,
tabbar:not(.inline):backdrop .box > .end-action {
  filter: opacity(0.5);
}

tabbar scrolledwindow:not(.pinned) > tabbox > tabboxchild {
  padding: 3px 0;
  margin: 0 -3px;
}

tabbar scrolledwindow:not(.pinned) > tabbox > tabboxchild > tab {
  margin: 3px;
}

tabbar scrolledwindow.pinned > tabbox > tabboxchild {
  padding: 3px 0;
  margin: 0;
}

tabbar scrolledwindow.pinned > tabbox > tabboxchild > tab {
  margin: 3px;
  padding: 3px;
}

tabbar .start-action,
tabbar .end-action {
  padding: 6px;
}

tabbar .start-action:dir(ltr),
tabbar .end-action:dir(rtl) {
  padding-right: 0;
}

tabbar .start-action:dir(rtl),
tabbar .end-action:dir(ltr) {
  padding-left: 0;
}

dnd tab {
  min-height: 24px;
  background-color: #${config.colorScheme.palette.base00};
  color: #${config.colorScheme.palette.base06};
  margin: 24px;
  outline: none;
  box-shadow: 0 1px 5px 1px rgba(0, 0, 0, 0.09),
    0 2px 14px 3px rgba(0, 0, 0, 0.05), 0 0 0 1px rgba(0, 0, 0, 0.05);
}

tabbar tab,
dnd tab {
  padding: 6px;
}

tabbar tab button.image-button,
dnd tab button.image-button {
  padding: 0;
  margin: 0;
  min-width: 24px;
  min-height: 24px;
  border-radius: 9999px;
}

tabbar tab indicator,
dnd tab indicator {
  min-height: 2px;
  border-radius: 2px;
  background: alpha(#${config.colorScheme.palette.base0F}, 0.5);
  transform: translateY(4px);
}

tabthumbnail {
  border-radius: 10px;
  transition: box-shadow 200ms cubic-bezier(0, 0, 0.2, 1),
    background-color cubic-bezier(0, 0, 0.2, 1);
}

tabthumbnail > box {
  margin: 6px;
}

tabthumbnail:drop(active) {
  box-shadow: inset 0 0 0 2px alpha(#${config.colorScheme.palette.base09}, 0.4);
  background-color: alpha(#${config.colorScheme.palette.base09}, 0.1);
}

tabthumbnail .needs-attention:dir(ltr) {
  transform: translate(8px, -8px);
}

tabthumbnail .needs-attention:dir(rtl) {
  transform: translate(-8px, -8px);
}

tabthumbnail .needs-attention > widget {
  background: #${config.colorScheme.palette.base0F};
  min-width: 12px;
  min-height: 12px;
  border-radius: 6px;
  margin: 3px;
  box-shadow: 0 1px 2px alpha(#${config.colorScheme.palette.base0F}, 0.4);
}

tabthumbnail .card {
  background: none;
  color: inherit;
}

tabthumbnail .card picture {
  outline: none;
  border-radius: 6px;
}

tabthumbnail.pinned .card {
  background-color: #${config.colorScheme.palette.base00};
  color: #${config.colorScheme.palette.base06};
}

tabthumbnail .pinned-box {
  margin-left: 10px;
  margin-right: 10px;
}

tabthumbnail .icon-title-box {
  border-spacing: 6px;
}

tabthumbnail .tab-unpin-icon {
  margin: 6px;
  min-width: 24px;
  min-height: 24px;
}

taboverview > .overview.scrolled-to-top headerbar,
taboverview > .overview.scrolled-to-top searchbar > revealer > box {
  background: none;
  color: inherit;
  box-shadow: none;
}

taboverview > .overview .new-tab-button {
  margin: 18px;
}

tabview:drop(active),
tabbox:drop(active),
tabgrid:drop(active) {
  box-shadow: none;
}

/**************
 * Scrollbars *
 **************/
scrollbar {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
  background-color: #${config.colorScheme.palette.base00};
}

scrollbar > range > trough {
  outline: none;
  background: none;
  border: none;
}

scrollbar > range > trough > slider {
  transition: background-color 75ms cubic-bezier(0, 0, 0.2, 1);
  min-width: 8px;
  min-height: 8px;
  border: 4px solid transparent;
  border-radius: 9999px;
  background-clip: padding-box;
  background-color: rgba(242, 213, 207, 0.5);
  box-shadow: none;
  outline: none;
}

scrollbar > range > trough > slider:hover {
  background-color: rgba(242, 213, 207, 0.7);
}

scrollbar > range > trough > slider:active {
  background-color: #${config.colorScheme.palette.base06};
}

scrollbar > range > trough > slider:disabled {
  background-color: rgba(242, 213, 207, 0.3);
}

scrollbar > range.fine-tune > trough > slider {
  min-width: 4px;
  min-height: 4px;
}

scrollbar > range.fine-tune.horizontal > trough > slider {
  margin: 2px 0;
}

scrollbar > range.fine-tune.vertical > trough > slider {
  margin: 0 2px;
}

scrollbar.overlay-indicator:not(.fine-tune) > range > trough > slider {
  transition-property: background-color, min-height, min-width;
}

scrollbar.overlay-indicator:not(.dragging):not(.hovering) {
  border-color: transparent;
  background-color: transparent;
}

scrollbar.overlay-indicator:not(.dragging):not(.hovering)
  > range
  > trough
  > slider {
  min-width: 4px;
  min-height: 4px;
  margin: 3px;
  border: 1px solid rgba(44, 44, 44, 0.3);
}

scrollbar.overlay-indicator:not(.dragging):not(.hovering) button {
  min-width: 4px;
  min-height: 4px;
  margin: 3px;
  border: 1px solid rgba(44, 44, 44, 0.3);
  border-radius: 9999px;
  background-color: rgba(242, 213, 207, 0.5);
  background-clip: padding-box;
  -gtk-icon-source: none;
}

scrollbar.overlay-indicator:not(.dragging):not(.hovering) button:disabled {
  background-color: rgba(242, 213, 207, 0.3);
}

scrollbar.overlay-indicator.horizontal:not(.dragging):not(.hovering)
  > range
  > trough
  > slider {
  min-width: 24px;
}

scrollbar.overlay-indicator.horizontal:not(.dragging):not(.hovering) button {
  min-width: 8px;
}

scrollbar.overlay-indicator.vertical:not(.dragging):not(.hovering)
  > range
  > trough
  > slider {
  min-height: 24px;
}

scrollbar.overlay-indicator.vertical:not(.dragging):not(.hovering) button {
  min-height: 8px;
}

scrollbar.overlay-indicator.dragging,
scrollbar.overlay-indicator.hovering {
  background-color: transparent;
}

scrollbar.horizontal > range > trough > slider {
  min-width: 24px;
}

scrollbar.vertical > range > trough > slider {
  min-height: 24px;
}

scrollbar button {
  min-width: 16px;
  min-height: 16px;
  padding: 0;
  border-radius: 0;
}

scrollbar.vertical button.down {
  -gtk-icon-source: -gtk-icontheme('pan-down-symbolic');
}

scrollbar.vertical button.up {
  -gtk-icon-source: -gtk-icontheme('pan-up-symbolic');
}

scrollbar.horizontal button.down {
  -gtk-icon-source: -gtk-icontheme('pan-end-symbolic');
}

scrollbar.horizontal button.up {
  -gtk-icon-source: -gtk-icontheme('pan-start-symbolic');
}

/**********
 * Switch *
 **********/
switch {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
  margin: 6px 0;
  padding: 0;
  border: 2px solid rgba(242, 213, 207, 0.7);
  border-radius: 9999px;
  background-color: transparent;
  background-clip: border-box;
  font-size: 0;
  color: transparent;
}

switch:checked {
  background-color: #${config.colorScheme.palette.base0F};
  border-color: #${config.colorScheme.palette.base0F};
}

switch:disabled {
  opacity: 0.5;
}

switch image {
  margin: -8px;
}

switch > slider {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
  min-width: 16px;
  min-height: 16px;
  margin: 2px;
  border-radius: 9999px;
  outline: none;
  box-shadow: none;
  background-color: rgba(242, 213, 207, 0.7);
  border: none;
}

switch:focus > slider {
  box-shadow: 0 0 0 10px rgba(242, 213, 207, 0.04);
}

switch:hover > slider {
  box-shadow: 0 0 0 10px rgba(242, 213, 207, 0.12);
}

switch:focus:hover > slider {
  box-shadow: 0 0 0 10px rgba(242, 213, 207, 0.12);
}

switch:checked > slider {
  background-color: #${config.colorScheme.palette.base00};
  color: #${config.colorScheme.palette.base00};
}

/*************************
 * Check and Radio items *
 *************************/
checkbutton,
radiobutton {
  outline: none;
  border-spacing: 4px;
}

checkbutton.text-button,
radiobutton.text-button {
  padding: 2px;
}

checkbutton.text-button label:not(:only-child),
radiobutton.text-button label:not(:only-child) {
  margin: 0 4px;
}

check,
radio {
  min-height: 16px;
  min-width: 16px;
  -gtk-icon-size: 16px;
  padding: 0;
  margin: 3px;
  border: 2px solid rgba(242, 213, 207, 0.7);
  background-clip: border-box;
  background-color: transparent;
  border-radius: 9999px;
  box-shadow: 0 0 0 10px transparent;
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1),
    background-color 225ms cubic-bezier(0, 0, 0.2, 1),
    box-shadow 225ms cubic-bezier(0, 0, 0.2, 1);
}

check:hover,
radio:hover {
  border-color: inherit;
  box-shadow: 0 0 0 10px rgba(242, 213, 207, 0.04);
}

check:active,
radio:active {
  border-color: #${config.colorScheme.palette.base06};
  box-shadow: 0 0 0 10px rgba(242, 213, 207, 0.12);
}

check:checked,
check:indeterminate,
radio:checked,
radio:indeterminate {
  border-color: transparent;
  background-color: #${config.colorScheme.palette.base0F};
  color: rgba(0, 0, 0, 0.87);
}

check:checked:hover,
check:indeterminate:hover,
radio:checked:hover,
radio:indeterminate:hover {
  background-color: #9399b2;
  color: rgba(0, 0, 0, 0.87);
}

check:checked:active,
check:indeterminate:active,
radio:checked:active,
radio:indeterminate:active {
  background-color: #${config.colorScheme.palette.base0F};
  color: rgba(0, 0, 0, 0.87);
}

check:checked:disabled,
check:indeterminate:disabled,
radio:checked:disabled,
radio:indeterminate:disabled {
  border-color: transparent;
  background-color: rgba(242, 213, 207, 0.3);
  color: #${config.colorScheme.palette.base00};
}

check:disabled,
radio:disabled {
  border-color: rgba(242, 213, 207, 0.3);
}

check:not(:hover):focus,
radio:not(:hover):focus {
  box-shadow: none;
}

popover.menu check,
popover.menu radio {
  transition: none;
  margin: 0;
  padding: 0;
}

popover.menu check,
popover.menu check:focus,
popover.menu check:hover,
popover.menu check:focus:hover,
popover.menu check:active,
popover.menu check:disabled,
popover.menu radio,
popover.menu radio:focus,
popover.menu radio:hover,
popover.menu radio:focus:hover,
popover.menu radio:active,
popover.menu radio:disabled {
  transition: none;
  box-shadow: none;
  background-image: none;
}

popover.menu check:not(:checked):not(:indeterminate):not(:disabled):hover,
popover.menu radio:not(:checked):not(:indeterminate):not(:disabled):hover {
  border-color: rgba(0, 0, 0, 0.87);
  background-color: transparent;
}

popover.menu check:active,
popover.menu check:checked,
popover.menu check:indeterminate,
popover.menu radio:active,
popover.menu radio:checked,
popover.menu radio:indeterminate {
  border-color: transparent;
  background-color: #${config.colorScheme.palette.base0F};
  color: rgba(0, 0, 0, 0.87);
}

popover.menu check:active:hover,
popover.menu check:checked:hover,
popover.menu check:indeterminate:hover,
popover.menu radio:active:hover,
popover.menu radio:checked:hover,
popover.menu radio:indeterminate:hover {
  border-color: transparent;
  background-color: rgba(0, 0, 0, 0.87);
  color: #${config.colorScheme.palette.base0F};
}

popover.menu check:active:disabled,
popover.menu check:checked:disabled,
popover.menu check:indeterminate:disabled,
popover.menu radio:active:disabled,
popover.menu radio:checked:disabled,
popover.menu radio:indeterminate:disabled {
  border-color: transparent;
  background-color: rgba(242, 213, 207, 0.3);
  color: #${config.colorScheme.palette.base00};
}

popover.menu check,
popover.menu check:hover,
popover.menu check:active,
popover.menu check:disabled,
popover.menu radio,
popover.menu radio:hover,
popover.menu radio:active,
popover.menu radio:disabled {
  box-shadow: none;
  color: inherit;
}

popover.menu check:dir(ltr),
popover.menu radio:dir(ltr) {
  margin-right: 6px;
}

popover.menu check:dir(rtl),
popover.menu radio:dir(rtl) {
  margin-left: 6px;
}

check:checked {
  -gtk-icon-source: -gtk-scaled(
    -gtk-recolor(url('assets/scalable/check-symbolic.svg')),
    -gtk-recolor(url('assets/scalable/check-symbolic@2.svg'))
  );
}

radio:checked {
  -gtk-icon-source: -gtk-scaled(
    -gtk-recolor(url('assets/scalable/dot-symbolic.svg')),
    -gtk-recolor(url('assets/scalable/dot-symbolic@2.svg'))
  );
}

check:indeterminate,
radio:indeterminate {
  -gtk-icon-source: -gtk-scaled(
    -gtk-recolor(url('assets/scalable/line-symbolic.svg')),
    -gtk-recolor(url('assets/scalable/line-symbolic@2.svg'))
  );
}

check:not(:checked):active {
  -gtk-icon-transform: rotate(90deg);
}

check:not(:checked):indeterminate:active {
  -gtk-icon-transform: scaleX(-1);
}

checkbutton.theme-selector radio,
checkbutton.theme-selector radio:hover,
checkbutton.theme-selector radio:disabled {
  border-color: transparent;
  background-color: transparent;
}

checkbutton.theme-selector
  radio:not(:checked):not(:indeterminate):not(:disabled):hover {
  border-color: transparent;
  background-color: transparent;
}

checkbutton.theme-selector radio:checked,
checkbutton.theme-selector radio:active,
checkbutton.theme-selector radio:active:hover {
  border-color: transparent;
  background-color: #${config.colorScheme.palette.base0F};
  color: rgba(0, 0, 0, 0.87);
  -gtk-icon-source: -gtk-scaled(
    -gtk-recolor(url('assets/scalable/check-symbolic.svg')),
    -gtk-recolor(url('assets/scalable/check-symbolic@2.svg'))
  );
}

checkbutton.theme-selector radio:checked:hover {
  background-color: #9399b2;
  color: rgba(0, 0, 0, 0.87);
}

themeswitcher {
  padding: 6px;
}

themeswitcher .check {
  min-height: 16px;
  min-width: 16px;
  background-color: #${config.colorScheme.palette.base0F};
  color: rgba(0, 0, 0, 0.87);
  padding: 2px;
  border-radius: 9999px;
  margin: 3px;
  -gtk-icon-size: 20px;
  -gtk-icon-source: -gtk-scaled(
    -gtk-recolor(url('assets/scalable/check-symbolic.svg')),
    -gtk-recolor(url('assets/scalable/check-symbolic@2.svg'))
  );
}

themeswitcher .check:hover {
  background-color: #9399b2;
  color: rgba(0, 0, 0, 0.87);
}

themeswitcher checkbutton radio {
  padding: 0;
  margin: 2px;
  min-height: 48px;
  min-width: 48px;
}

themeswitcher checkbutton radio,
themeswitcher checkbutton radio:hover {
  outline-color: rgba(242, 213, 207, 0.12);
  outline-width: 1px;
  outline-offset: -1px;
  outline-style: solid;
  box-shadow: none;
}

themeswitcher checkbutton radio,
themeswitcher checkbutton radio:hover,
themeswitcher checkbutton radio:checked,
themeswitcher checkbutton radio:checked:hover {
  -gtk-icon-source: none;
  transition: none;
  border: none;
}

themeswitcher checkbutton radio:checked,
themeswitcher checkbutton radio:checked:hover {
  box-shadow: inset 0 0 0 2px #${config.colorScheme.palette.base0F};
  outline: none;
}

themeswitcher checkbutton.system radio,
themeswitcher checkbutton.system radio:hover,
themeswitcher checkbutton.system radio:checked,
themeswitcher checkbutton.system radio:checked:hover {
  background-image: linear-gradient(-45deg, #${config.colorScheme.palette.base01} 49.99%, #${config.colorScheme.palette.base06} 50.01%);
  background-color: transparent;
}

themeswitcher checkbutton.light radio,
themeswitcher checkbutton.light radio:hover,
themeswitcher checkbutton.light radio:checked,
themeswitcher checkbutton.light radio:checked:hover {
  color: rgba(0, 0, 0, 0.8);
  background-color: #${config.colorScheme.palette.base06};
}

themeswitcher checkbutton.dark radio,
themeswitcher checkbutton.dark radio:hover,
themeswitcher checkbutton.dark radio:checked,
themeswitcher checkbutton.dark radio:checked:hover {
  color: #${config.colorScheme.palette.base06};
  background-image: image(#${config.colorScheme.palette.base01});
  background-color: transparent;
}

/************
 * GtkScale *
 ************/
scale {
  min-height: 2px;
  min-width: 2px;
}

scale.horizontal {
  padding: 17px 12px;
}

scale.vertical {
  padding: 12px 17px;
}

scale slider {
  min-height: 18px;
  min-width: 18px;
  margin: -8px;
}

scale.fine-tune.horizontal {
  min-height: 4px;
  padding-top: 16px;
  padding-bottom: 16px;
}

scale.fine-tune.vertical {
  min-width: 4px;
  padding-left: 16px;
  padding-right: 16px;
}

scale.fine-tune slider {
  margin: -7px;
}

scale trough {
  transition: background-color 75ms cubic-bezier(0, 0, 0.2, 1);
  outline: none;
  background-color: rgba(242, 213, 207, 0.3);
}

scale trough:disabled {
  background-color: rgba(242, 213, 207, 0.12);
}

scale highlight {
  transition: background-image 75ms cubic-bezier(0, 0, 0.2, 1);
  background-image: image(#${config.colorScheme.palette.base0F});
}

scale highlight:disabled {
  background-color: #${config.colorScheme.palette.base00};
  background-image: image(rgba(242, 213, 207, 0.3));
}

scale fill {
  transition: background-color 75ms cubic-bezier(0, 0, 0.2, 1);
  background-color: rgba(242, 213, 207, 0.3);
}

scale fill:disabled {
  background-color: transparent;
}

scale slider {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
  border-radius: 9999px;
  color: #${config.colorScheme.palette.base0F};
  background-color: #${config.colorScheme.palette.base00};
  box-shadow: inset 0 0 0 2px #${config.colorScheme.palette.base0F};
}

scale slider:hover {
  box-shadow: inset 0 0 0 2px #${config.colorScheme.palette.base0F}, 0 0 0 8px rgba(242, 213, 207, 0.12);
}

scale slider:active {
  box-shadow: inset 0 0 0 4px #${config.colorScheme.palette.base0F}, 0 0 0 8px rgba(242, 213, 207, 0.12);
}

scale slider:disabled {
  box-shadow: inset 0 0 0 2px rgba(242, 213, 207, 0.3);
}

scale marks,
scale value {
  color: rgba(242, 213, 207, 0.7);
}

scale indicator {
  background-color: rgba(242, 213, 207, 0.3);
  color: transparent;
}

scale.horizontal > marks.top {
  margin-bottom: 7px;
  margin-top: -15px;
}

scale.horizontal.fine-tune > marks.top {
  margin-bottom: 6px;
  margin-top: -14px;
}

scale.horizontal > marks.bottom {
  margin-top: 7px;
  margin-bottom: -15px;
}

scale.horizontal.fine-tune > marks.bottom {
  margin-top: 6px;
  margin-bottom: -14px;
}

scale.vertical > marks.top {
  margin-right: 7px;
  margin-left: -15px;
}

scale.vertical.fine-tune > marks.top {
  margin-right: 6px;
  margin-left: -14px;
}

scale.vertical > marks.bottom {
  margin-left: 7px;
  margin-right: -15px;
}

scale.vertical.fine-tune > marks.bottom {
  margin-left: 6px;
  margin-right: -14px;
}

scale.horizontal indicator {
  min-height: 8px;
  min-width: 1px;
}

scale.vertical indicator {
  min-height: 1px;
  min-width: 8px;
}

scale.horizontal.marks-before:not(.marks-after) slider {
  transition: background-color 75ms cubic-bezier(0, 0, 0.2, 1),
    background-size 300ms cubic-bezier(0, 0, 0.2, 1),
    background-image 1200ms cubic-bezier(0, 0, 0.2, 1);
  min-height: 32px;
  min-width: 32px;
  margin: -15px;
  border-radius: 50%;
  background-size: auto, 1000% 1000%;
  background-repeat: no-repeat;
  background-position: center center;
  background-color: transparent;
}

scale.horizontal.marks-before:not(.marks-after) slider,
scale.horizontal.marks-before:not(.marks-after) slider:hover,
scale.horizontal.marks-before:not(.marks-after) slider:active,
scale.horizontal.marks-before:not(.marks-after) slider:disabled {
  box-shadow: none;
}

scale.horizontal.marks-before:not(.marks-after) slider:focus {
  background-color: alpha(currentColor, 0.08);
}

scale.horizontal.marks-before:not(.marks-after) slider:hover {
  background-color: alpha(currentColor, 0.08);
}

scale.horizontal.marks-before:not(.marks-after) slider:focus:hover {
  background-color: alpha(currentColor, 0.16);
}

scale.horizontal.marks-before:not(.marks-after) slider:active {
  background-size: auto, 0% 0%;
  background-color: alpha(currentColor, 0.08);
}

scale.horizontal.marks-before:not(.marks-after) slider {
  background-image: -gtk-scaled(
    url('assets/scale-horz-marks-before-slider-dark.png'),
    url('assets/scale-horz-marks-before-slider-dark@2.png')
  );
}

scale.horizontal.marks-before:not(.marks-after) slider:disabled {
  background-image: -gtk-scaled(
    url('assets/scale-horz-marks-before-slider-disabled-dark.png'),
    url('assets/scale-horz-marks-before-slider-disabled-dark@2.png')
  );
}

scale.horizontal.marks-before:not(.marks-after) slider:active {
  background-image: -gtk-scaled(
    url('assets/scale-horz-marks-before-slider-dark.png'),
    url('assets/scale-horz-marks-before-slider-dark@2.png')
  );
}

scale.horizontal.marks-after:not(.marks-before) slider {
  transition: background-color 75ms cubic-bezier(0, 0, 0.2, 1),
    background-size 300ms cubic-bezier(0, 0, 0.2, 1),
    background-image 1200ms cubic-bezier(0, 0, 0.2, 1);
  min-height: 32px;
  min-width: 32px;
  margin: -15px;
  border-radius: 50%;
  background-size: auto, 1000% 1000%;
  background-repeat: no-repeat;
  background-position: center center;
  background-color: transparent;
}

scale.horizontal.marks-after:not(.marks-before) slider,
scale.horizontal.marks-after:not(.marks-before) slider:hover,
scale.horizontal.marks-after:not(.marks-before) slider:active,
scale.horizontal.marks-after:not(.marks-before) slider:disabled {
  box-shadow: none;
}

scale.horizontal.marks-after:not(.marks-before) slider:focus {
  background-color: alpha(currentColor, 0.08);
}

scale.horizontal.marks-after:not(.marks-before) slider:hover {
  background-color: alpha(currentColor, 0.08);
}

scale.horizontal.marks-after:not(.marks-before) slider:focus:hover {
  background-color: alpha(currentColor, 0.16);
}

scale.horizontal.marks-after:not(.marks-before) slider:active {
  background-size: auto, 0% 0%;
  background-color: alpha(currentColor, 0.08);
}

scale.horizontal.marks-after:not(.marks-before) slider {
  background-image: -gtk-scaled(
    url('assets/scale-horz-marks-after-slider-dark.png'),
    url('assets/scale-horz-marks-after-slider-dark@2.png')
  );
}

scale.horizontal.marks-after:not(.marks-before) slider:disabled {
  background-image: -gtk-scaled(
    url('assets/scale-horz-marks-after-slider-disabled-dark.png'),
    url('assets/scale-horz-marks-after-slider-disabled-dark@2.png')
  );
}

scale.horizontal.marks-after:not(.marks-before) slider:active {
  background-image: -gtk-scaled(
    url('assets/scale-horz-marks-after-slider-dark.png'),
    url('assets/scale-horz-marks-after-slider-dark@2.png')
  );
}

scale.vertical.marks-before:not(.marks-after) slider {
  transition: background-color 75ms cubic-bezier(0, 0, 0.2, 1),
    background-size 300ms cubic-bezier(0, 0, 0.2, 1),
    background-image 1200ms cubic-bezier(0, 0, 0.2, 1);
  min-height: 32px;
  min-width: 32px;
  margin: -15px;
  border-radius: 50%;
  background-size: auto, 1000% 1000%;
  background-repeat: no-repeat;
  background-position: center center;
  background-color: transparent;
}

scale.vertical.marks-before:not(.marks-after) slider,
scale.vertical.marks-before:not(.marks-after) slider:hover,
scale.vertical.marks-before:not(.marks-after) slider:active,
scale.vertical.marks-before:not(.marks-after) slider:disabled {
  box-shadow: none;
}

scale.vertical.marks-before:not(.marks-after) slider:focus {
  background-color: alpha(currentColor, 0.08);
}

scale.vertical.marks-before:not(.marks-after) slider:hover {
  background-color: alpha(currentColor, 0.08);
}

scale.vertical.marks-before:not(.marks-after) slider:focus:hover {
  background-color: alpha(currentColor, 0.16);
}

scale.vertical.marks-before:not(.marks-after) slider:active {
  background-size: auto, 0% 0%;
  background-color: alpha(currentColor, 0.08);
}

scale.vertical.marks-before:not(.marks-after) slider {
  background-image: -gtk-scaled(
    url('assets/scale-vert-marks-before-slider-dark.png'),
    url('assets/scale-vert-marks-before-slider-dark@2.png')
  );
}

scale.vertical.marks-before:not(.marks-after) slider:disabled {
  background-image: -gtk-scaled(
    url('assets/scale-vert-marks-before-slider-disabled-dark.png'),
    url('assets/scale-vert-marks-before-slider-disabled-dark@2.png')
  );
}

scale.vertical.marks-before:not(.marks-after) slider:active {
  background-image: -gtk-scaled(
    url('assets/scale-vert-marks-before-slider-dark.png'),
    url('assets/scale-vert-marks-before-slider-dark@2.png')
  );
}

scale.vertical.marks-after:not(.marks-before) slider {
  transition: background-color 75ms cubic-bezier(0, 0, 0.2, 1),
    background-size 300ms cubic-bezier(0, 0, 0.2, 1),
    background-image 1200ms cubic-bezier(0, 0, 0.2, 1);
  min-height: 32px;
  min-width: 32px;
  margin: -15px;
  border-radius: 50%;
  background-size: auto, 1000% 1000%;
  background-repeat: no-repeat;
  background-position: center center;
  background-color: transparent;
}

scale.vertical.marks-after:not(.marks-before) slider,
scale.vertical.marks-after:not(.marks-before) slider:hover,
scale.vertical.marks-after:not(.marks-before) slider:active,
scale.vertical.marks-after:not(.marks-before) slider:disabled {
  box-shadow: none;
}

scale.vertical.marks-after:not(.marks-before) slider:focus {
  background-color: alpha(currentColor, 0.08);
}

scale.vertical.marks-after:not(.marks-before) slider:hover {
  background-color: alpha(currentColor, 0.08);
}

scale.vertical.marks-after:not(.marks-before) slider:focus:hover {
  background-color: alpha(currentColor, 0.16);
}

scale.vertical.marks-after:not(.marks-before) slider:active {
  background-size: auto, 0% 0%;
  background-color: alpha(currentColor, 0.08);
}

scale.vertical.marks-after:not(.marks-before) slider {
  background-image: -gtk-scaled(
    url('assets/scale-vert-marks-after-slider-dark.png'),
    url('assets/scale-vert-marks-after-slider-dark@2.png')
  );
}

scale.vertical.marks-after:not(.marks-before) slider:disabled {
  background-image: -gtk-scaled(
    url('assets/scale-vert-marks-after-slider-disabled-dark.png'),
    url('assets/scale-vert-marks-after-slider-disabled-dark@2.png')
  );
}

scale.vertical.marks-after:not(.marks-before) slider:active {
  background-image: -gtk-scaled(
    url('assets/scale-vert-marks-after-slider-dark.png'),
    url('assets/scale-vert-marks-after-slider-dark@2.png')
  );
}

scale.color {
  min-height: 0;
  min-width: 0;
}

scale.color.horizontal {
  padding: 0 0 12px 0;
}

scale.color.horizontal slider:dir(ltr),
scale.color.horizontal slider:dir(rtl) {
  margin-bottom: -13.5px;
  margin-top: 11.5px;
}

scale.color.vertical:dir(ltr) {
  padding: 0 0 0 12px;
}

scale.color.vertical:dir(ltr) slider {
  margin-left: -13.5px;
  margin-right: 11.5px;
}

scale.color.vertical:dir(rtl) {
  padding: 0 12px 0 0;
}

scale.color.vertical:dir(rtl) slider {
  margin-right: -13.5px;
  margin-left: 11.5px;
}

/*****************
 * Progress bars *
 *****************/
progressbar {
  color: rgba(242, 213, 207, 0.7);
  font-size: smaller;
}

progressbar.horizontal trough,
progressbar.horizontal progress {
  min-height: 6px;
}

progressbar.vertical trough,
progressbar.vertical progress {
  min-width: 6px;
}

progressbar trough {
  border-radius: 6px;
  background-color: rgba(242, 213, 207, 0.12);
}

progressbar progress {
  border-radius: 6px;
  background-color: #${config.colorScheme.palette.base0F};
}

progressbar.osd {
  min-width: 6px;
  min-height: 6px;
  background-color: transparent;
  box-shadow: none;
  margin: 0;
  padding: 0;
}

progressbar.osd trough {
  background-color: transparent;
}

progressbar.osd progress {
  background-color: #${config.colorScheme.palette.base0F};
}

progressbar trough.empty progress {
  all: unset;
}

/*************
 * Level Bar *
 *************/
levelbar.horizontal block {
  min-height: 6px;
}

levelbar.horizontal.discrete block {
  min-width: 36px;
}

levelbar.horizontal.discrete block:not(:last-child) {
  margin-right: 2px;
}

levelbar.vertical block {
  min-width: 6px;
}

levelbar.vertical.discrete block {
  min-height: 36px;
}

levelbar.vertical.discrete block:not(:last-child) {
  margin-bottom: 2px;
}

levelbar trough {
  border-radius: 6px;
}

levelbar block.low {
  background-color: #fdd633;
}

levelbar block.high,
levelbar block:not(.empty) {
  background-color: #${config.colorScheme.palette.base0F};
}

levelbar block.full {
  background-color: #81c995;
}

levelbar block.empty {
  background-color: rgba(242, 213, 207, 0.12);
}

/****************
 * Print dialog *
*****************/
window.dialog.print drawing {
  color: #${config.colorScheme.palette.base06};
  background: none;
  border: none;
  padding: 0;
}

window.dialog.print drawing paper {
  padding: 0;
  border: 1px solid rgba(242, 213, 207, 0.12);
  background-color: #${config.colorScheme.palette.base00};
  color: #${config.colorScheme.palette.base06};
}

window.dialog.print .dialog-action-box {
  margin: 12px;
}

/**********
 * Frames *
 **********/
frame,
.frame {
  border: 1px solid rgba(242, 213, 207, 0.12);
}

frame > list,
.frame > list {
  border: none;
}

frame.view,
.frame.view {
  border-radius: 6px;
}

frame.flat,
.frame.flat {
  border-style: none;
}

frame {
  border-radius: 6px;
}

frame > label {
  margin: 4px;
}

frame.flat > border,
statusbar frame > border {
  border: none;
}

actionbar > revealer > box {
  padding: 6px;
  border-spacing: 6px;
  border-top: 1px solid rgba(242, 213, 207, 0.12);
  background-color: #${config.colorScheme.palette.base00};
  background-clip: border-box;
  box-shadow: none;
}

statusbar {
  padding: 6px 18px;
}

scrolledwindow viewport.frame {
  border: none;
}

stack scrolledwindow.frame viewport.frame list {
  border: none;
}

overshoot.top {
  background-size: 200% 70%;
  background-image: radial-gradient(
    farthest-side at top,
    rgba(238, 190, 190, 0.24) 99%,
    rgba(238, 190, 190, 0) 100%
  );
  background-repeat: no-repeat;
  background-position: center top;
  background-color: transparent;
  border: none;
  box-shadow: none;
}

overshoot.bottom {
  background-size: 200% 70%;
  background-image: radial-gradient(
    farthest-side at bottom,
    rgba(238, 190, 190, 0.24) 99%,
    rgba(238, 190, 190, 0) 100%
  );
  background-repeat: no-repeat;
  background-position: center bottom;
  background-color: transparent;
  border: none;
  box-shadow: none;
}

overshoot.left {
  background-size: 200% 70%;
  background-image: radial-gradient(
    farthest-side at left,
    rgba(238, 190, 190, 0.24) 99%,
    rgba(238, 190, 190, 0) 100%
  );
  background-repeat: no-repeat;
  background-position: left center;
  background-color: transparent;
  border: none;
  box-shadow: none;
}

overshoot.right {
  background-size: 200% 70%;
  background-image: radial-gradient(
    farthest-side at right,
    rgba(238, 190, 190, 0.24) 99%,
    rgba(238, 190, 190, 0) 100%
  );
  background-repeat: no-repeat;
  background-position: right center;
  background-color: transparent;
  border: none;
  box-shadow: none;
}

junction {
  border-style: solid none none solid;
  border-width: 1px;
  border-color: rgba(242, 213, 207, 0.12);
  background-color: #${config.colorScheme.palette.base00};
}

junction:dir(rtl) {
  border-style: solid solid none none;
}

separator:not(.spacer) {
  min-width: 1px;
  min-height: 1px;
  background-color: rgba(242, 213, 207, 0.12);
}

stacksidebar + separator.vertical,
stacksidebar separator.horizontal,
button.font separator,
button.file separator {
  min-width: 0;
  min-height: 0;
  background-color: transparent;
}

/*********
 * Lists *
 *********/
listview.boxed-list,
list.boxed-list,
listview.content:not(.conversation-listbox),
list.content:not(.conversation-listbox) {
  border-radius: 7px;
  box-shadow: none;
  border: 1px solid rgba(242, 213, 207, 0.12);
}

listview.boxed-list > row.expander list > row,
list.boxed-list > row.expander list > row,
listview.boxed-list > row,
list.boxed-list > row,
listview.content:not(.conversation-listbox) > row,
list.content:not(.conversation-listbox) > row {
  border-radius: 0;
}

listview.boxed-list > row.expander list > row:first-child,
list.boxed-list > row.expander list > row:first-child,
listview.boxed-list > row:first-child,
list.boxed-list > row:first-child,
listview.content:not(.conversation-listbox) > row:first-child,
list.content:not(.conversation-listbox) > row:first-child {
  border-top-left-radius: 6px;
  border-top-right-radius: 6px;
}

listview.boxed-list > row.expander list > row:last-child,
list.boxed-list > row.expander list > row:last-child,
listview.boxed-list > row:last-child,
list.boxed-list > row:last-child,
listview.content:not(.conversation-listbox) > row:last-child,
list.content:not(.conversation-listbox) > row:last-child {
  border-bottom-left-radius: 6px;
  border-bottom-right-radius: 6px;
}

listview.boxed-list > row.expander list > row:only-child,
list.boxed-list > row.expander list > row:only-child,
listview.boxed-list > row:only-child,
list.boxed-list > row:only-child,
listview.content:not(.conversation-listbox) > row:only-child,
list.content:not(.conversation-listbox) > row:only-child {
  border-radius: 6px;
}

listview.boxed-list > row.expander list > row:not(:last-child),
list.boxed-list > row.expander list > row:not(:last-child),
listview.boxed-list > row:not(:last-child),
list.boxed-list > row:not(:last-child),
listview.content:not(.conversation-listbox) > row:not(:last-child),
list.content:not(.conversation-listbox) > row:not(:last-child) {
  border-bottom: 1px solid rgba(242, 213, 207, 0.12);
}

listview.boxed-list > row.expander list > row:focus,
list.boxed-list > row.expander list > row:focus,
listview.boxed-list > row:focus,
list.boxed-list > row:focus,
listview.content:not(.conversation-listbox) > row:focus,
list.content:not(.conversation-listbox) > row:focus {
  box-shadow: inset 0 0 0 1000px alpha(currentColor, 0.08);
}

listview,
list {
  border-color: rgba(242, 213, 207, 0.12);
  background-color: #${config.colorScheme.palette.base00};
  color: rgba(242, 213, 207, 0.7);
}

listview row,
list row {
  padding: 2px;
  color: rgba(242, 213, 207, 0.7);
}

listview > row.expander,
list > row.expander {
  padding: 0px;
}

listview > row.expander .row-header,
list > row.expander .row-header {
  padding: 2px;
}

listview.boxed-list > row.expander list,
list.boxed-list > row.expander list {
  background-color: transparent;
  box-shadow: none;
  border: none;
}

list.frame {
  border-radius: 6px;
}

listview.view {
  color: #${config.colorScheme.palette.base06};
  background-color: transparent;
}

popover.menu listview.view {
  padding: 0;
}

popover.menu listview.view > row {
  margin-left: 0;
  margin-right: 0;
}

popover.menu listview.view > row:first-child,
popover.menu listview.view > row:last-child,
popover.menu listview.view > row {
  border-radius: 6px;
}

row {
  color: rgba(242, 213, 207, 0.7);
  background-clip: padding-box;
}

row label.subtitle {
  font-size: smaller;
}

row > box.header {
  margin-left: 12px;
  margin-right: 12px;
  min-height: 48px;
}

row > box.header > .icon:disabled {
  filter: opacity(0.35);
}

row > box.header > box.title {
  margin-top: 6px;
  margin-bottom: 6px;
  border-spacing: 3px;
}

columnview.view > header > button,
treeview.view > header > button,
row.activatable {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
  outline: none;
  box-shadow: inset 0 0 0 9999px transparent;
}

columnview.view > header > button:focus,
treeview.view > header > button:focus,
row.activatable:focus {
  box-shadow: inset 0 0 0 9999px alpha(currentColor, 0.08);
}

columnview.view > header > button:hover,
treeview.view > header > button:hover,
row.activatable:hover {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1), box-shadow 0ms;
  box-shadow: inset 0 0 0 9999px alpha(currentColor, 0.08);
}

columnview.view > header > button.has-open-popup,
treeview.view > header > button.has-open-popup,
columnview.view > header > button:active,
treeview.view > header > button:active,
row.activatable.has-open-popup,
row.activatable:active {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
  box-shadow: inset 0 0 0 9999px alpha(currentColor, 0.12);
}

button row.activatable:focus,
button row.activatable:hover,
button row.activatable:active {
  box-shadow: none;
}

button:checked row.activatable {
  color: rgba(0, 0, 0, 0.87);
}

row:selected image,
row:selected label {
  color: #${config.colorScheme.palette.base06};
}

row:selected button image,
row:selected button label {
  color: inherit;
}

row:selected:disabled image,
row:selected:disabled label {
  color: rgba(242, 213, 207, 0.5);
}

treeexpander {
  border-spacing: 4px;
}

columnview row:not(:selected) cell editablelabel:not(.editing):focus-within {
  outline: 2px solid alpha(currentColor, 0.06);
}

columnview row:not(:selected) cell editablelabel.editing:focus-within {
  outline: 2px solid #${config.colorScheme.palette.base0F};
}

columnview row:not(:selected) cell editablelabel.editing text selection {
  color: rgba(0, 0, 0, 0.87);
  background-color: #${config.colorScheme.palette.base0F};
}

.rich-list {
  /* rich lists usually containing other widgets than just labels/text */
}

.rich-list > row {
  padding: 9px 12px;
  min-height: 32px;
  /* should be tall even when only containing a label */
}

.rich-list > row > box {
  border-spacing: 12px;
}

/*********************
 * App Notifications *
 *********************/
.app-notification {
  margin: 8px;
  border-spacing: 9px;
  padding: 9px;
  border: none;
}

.app-notification button.text-button:not(:disabled) {
  color: #${config.colorScheme.palette.base0F};
}

.app-notification.frame,
.app-notification border {
  border-style: none;
}

/*************
 * Expanders *
 *************/
expander {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
  min-width: 16px;
  min-height: 16px;
  color: rgba(242, 213, 207, 0.7);
  -gtk-icon-source: -gtk-icontheme('pan-end-symbolic');
}

expander:dir(rtl) {
  -gtk-icon-source: -gtk-icontheme('pan-end-symbolic-rtl');
}

expander:hover,
expander:active {
  color: #${config.colorScheme.palette.base06};
}

expander:disabled {
  color: rgba(242, 213, 207, 0.3);
}

expander-widget > box > title {
  border-radius: 6px;
}

expander-widget > box > title:hover > expander {
  color: rgba(242, 213, 207, 0.7);
}

.navigation-sidebar:not(decoration):not(window):drop(active):focus,
.navigation-sidebar:not(decoration):not(window):drop(active),
placessidebar:not(decoration):not(window):drop(active):focus,
placessidebar:not(decoration):not(window):drop(active),
stackswitcher:not(decoration):not(window):drop(active):focus,
stackswitcher:not(decoration):not(window):drop(active),
expander-widget:not(decoration):not(window):drop(active):focus,
expander-widget:not(decoration):not(window):drop(active) {
  box-shadow: none;
}

/************
 * Calendar *
 ************/
calendar {
  padding: 0;
  border: 1px solid rgba(242, 213, 207, 0.12);
  border-radius: 6px;
  color: #${config.colorScheme.palette.base06};
}

calendar:disabled {
  color: rgba(242, 213, 207, 0.5);
}

calendar:selected {
  border-radius: 6px;
}

calendar > header {
  padding: 3px;
  border-bottom: 1px solid rgba(242, 213, 207, 0.12);
}

calendar > header > button {
  min-height: 24px;
}

calendar > grid {
  margin: 3px;
}

calendar > grid > label {
  border-radius: 9999px;
  margin: 0;
}

calendar > grid > label.today {
  box-shadow: none;
}

calendar > grid > label.today:selected {
  box-shadow: none;
}

calendar > grid > label:focus {
  outline-style: none;
}

calendar > grid > label.day-number {
  padding: 9px;
}

calendar > grid > label.day-number:selected {
  color: #${config.colorScheme.palette.base06};
  background-color: alpha(currentColor, 0.06);
}

calendar > grid > label.day-number.other-month {
  color: alpha(currentColor, 0.3);
}

/***********
 * Dialogs *
 ***********/
window.dialog.message.background {
  background-color: #${config.colorScheme.palette.base02};
}

window.dialog.message box.dialog-vbox.vertical {
  border-spacing: 10px;
}

window.dialog.message .titlebar {
  min-height: 24px;
  border-style: none;
  box-shadow: inset 0 1px rgba(242, 213, 207, 0.1);
  background-color: #${config.colorScheme.palette.base02};
  color: #${config.colorScheme.palette.base06};
}

window.dialog.message .titlebar:backdrop {
  background-color: #${config.colorScheme.palette.base02};
  color: rgba(242, 213, 207, 0.7);
}

window.dialog.message.csd .dialog-action-area {
  margin-top: -6px;
  padding: 6px;
}

window.dialog.message.csd .dialog-action-area > button,
window.dialog.message.csd .dialog-action-area > button:first-child,
window.dialog.message.csd .dialog-action-area > button:last-child {
  border-radius: 6px;
}

window.dialog.message.csd .dialog-action-area > button:not(:last-child) {
  margin-right: 6px;
}

window.dialog.message.csd .dialog-action-area > button:not(:disabled) {
  color: #${config.colorScheme.palette.base0F};
}

window.dialog.message.csd
  .dialog-action-area
  > button.destructive-action:not(:disabled) {
  color: #${config.colorScheme.palette.base08};
}

window.background.csd.dialog > headerbar.titlebar {
  box-shadow: inset 0 -1px rgba(242, 213, 207, 0.12);
}

window.aboutdialog.background.csd scrolledwindow.frame,
window.aboutdialog.background.csd scrolledwindow.frame > viewport.view,
window.aboutdialog.background.csd scrolledwindow.frame > textview.view,
window.aboutdialog.background.csd scrolledwindow.frame > textview.view > text {
  border-radius: 6px;
}

filechooser .dialog-action-box {
  border-top: 1px solid rgba(242, 213, 207, 0.12);
}

filechooser #pathbarbox {
  border-bottom: 1px solid rgba(242, 213, 207, 0.12);
  background-color: #${config.colorScheme.palette.base00};
}

filechooser stack.view frame > border {
  border: none;
}

filechooserbutton > button > box {
  border-spacing: 6px;
}

filechooserbutton:drop(active) {
  box-shadow: none;
  border-color: transparent;
}

/***********
 * Sidebar *
 ***********/
.sidebar {
  border-style: none;
}

.sidebar:not(separator):dir(ltr),
.sidebar.left:not(separator),
.sidebar.left:not(separator):dir(rtl) {
  border-right: 1px solid rgba(242, 213, 207, 0.12);
  border-left-style: none;
}

.sidebar:not(separator):dir(rtl),
.sidebar.right:not(separator) {
  border-left: 1px solid rgba(242, 213, 207, 0.12);
  border-right-style: none;
}

separator + .sidebar:not(separator):dir(ltr),
separator + .sidebar.left:not(separator),
separator + .sidebar.left:not(separator):dir(rtl),
separator + box > .sidebar:not(separator):dir(ltr),
separator + box > .sidebar.left:not(separator),
separator + box > .sidebar.left:not(separator):dir(rtl) {
  border-right: none;
}

separator + .sidebar:not(separator):dir(rtl),
separator + .sidebar.right:not(separator),
separator + box > .sidebar:not(separator):dir(rtl),
separator + box > .sidebar.right:not(separator) {
  border-left: none;
}

.sidebar listview.view,
.sidebar list {
  background-color: transparent;
}

paned .sidebar.left,
paned .sidebar.right,
paned .sidebar.left:dir(rtl),
paned .sidebar:dir(rtl),
paned .sidebar:dir(ltr),
paned .sidebar {
  border-style: none;
}

leaflet.unfolded > box > stacksidebar.sidebar {
  border: none;
}

stacksidebar list {
  padding: 4px 0;
}

stacksidebar row {
  min-height: 24px;
  padding: 6px 9px;
  border-radius: 6px;
  margin: 2px 6px;
}

stacksidebar row:selected {
  font-weight: 500;
}

stacksidebar row > label {
  padding-left: 6px;
  padding-right: 6px;
  color: inherit;
}

separator.sidebar {
  background-color: rgba(242, 213, 207, 0.12);
  border-right: none;
}

separator.sidebar.selection-mode,
.selection-mode separator.sidebar {
  background-color: rgba(242, 213, 207, 0.15);
}

/**********************
 * Navigation Sidebar *
 **********************/
.navigation-sidebar {
  border-right: none;
  margin: 0 4px;
}

.navigation-sidebar > row {
  min-height: 32px;
  padding: 2px 4px;
  margin: 1px 0;
  border-radius: 6px;
}

.navigation-sidebar > row:hover,
.navigation-sidebar > row:focus-visible:focus-within {
  background-color: alpha(currentColor, 0.16);
}

.navigation-sidebar > row:selected label,
.navigation-sidebar > row:selected image {
  color: #${config.colorScheme.palette.base0E};
  font-weight: 500;
}

.navigation-sidebar > row:selected:hover {
  background-color: #${config.colorScheme.palette.base02};
}

.navigation-sidebar > row:selected:focus-visible:focus-within {
  outline: none;
  background-color: alpha(currentColor, 0.08);
}

.navigation-sidebar > row:selected:focus-visible:focus-within:hover {
  background-color: alpha(currentColor, 0.16);
}

.navigation-sidebar > row:disabled {
  color: rgba(242, 213, 207, 0.5);
}

.navigation-sidebar > separator {
  margin: 3px 0;
}

/****************
 * File chooser *
 ****************/
row image.sidebar-icon {
  transition: color 75ms cubic-bezier(0, 0, 0.2, 1);
  color: rgba(242, 213, 207, 0.7);
}

row image.sidebar-icon:disabled {
  color: rgba(242, 213, 207, 0.3);
}

placessidebar > viewport.frame {
  border-style: none;
}

placessidebar .navigation-sidebar > row:selected {
  font-weight: 500;
}

placessidebar .navigation-sidebar > row image.sidebar-icon:dir(ltr) {
  padding-right: 8px;
}

placessidebar .navigation-sidebar > row image.sidebar-icon:dir(rtl) {
  padding-left: 8px;
}

placessidebar .navigation-sidebar > row label.sidebar-label {
  color: inherit;
}

placessidebar .navigation-sidebar > row label.sidebar-label:dir(ltr) {
  padding-right: 2px;
}

placessidebar .navigation-sidebar > row label.sidebar-label:dir(rtl) {
  padding-left: 2px;
}

placessidebar .navigation-sidebar > row.sidebar-placeholder-row {
  background-color: alpha(currentColor, 0.08);
}

placessidebar .navigation-sidebar > row.sidebar-new-bookmark-row {
  color: #${config.colorScheme.palette.base0F};
}

placessidebar
  .navigation-sidebar
  > row.sidebar-new-bookmark-row
  image.sidebar-icon {
  color: #${config.colorScheme.palette.base0F};
}

placessidebar .navigation-sidebar > row:drop(active) {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1), box-shadow 0ms;
  box-shadow: inset 0 0 0 9999px alpha(currentColor, 0.08);
}

placesview .server-list-button > image {
  transition: 200ms cubic-bezier(0, 0, 0.2, 1);
  -gtk-icon-transform: rotate(0turn);
}

placesview .server-list-button:checked > image {
  transition: 200ms cubic-bezier(0, 0, 0.2, 1);
  -gtk-icon-transform: rotate(-0.5turn);
}

placesview > actionbar > revealer > box > label {
  border-spacing: 6px;
}

/*********
 * Paned *
 *********/
paned > separator {
  min-width: 1px;
  min-height: 1px;
  -gtk-icon-source: none;
  border: none;
  box-shadow: none;
  background-color: transparent;
  background-image: image(#${config.colorScheme.palette.base03});
  background-size: 1px 1px;
  background-clip: content-box;
}

paned > separator.wide {
  min-width: 6px;
  min-height: 6px;
  background-color: #${config.colorScheme.palette.base00};
  background-image: image(#${config.colorScheme.palette.base03}), image(#${config.colorScheme.palette.base03});
  background-size: 1px 1px, 1px 1px;
}

paned.horizontal > separator {
  background-repeat: repeat-y;
}

paned.horizontal > separator:dir(ltr) {
  margin: 0 -8px 0 0;
  padding: 0 8px 0 0;
  background-position: left;
}

paned.horizontal > separator:dir(rtl) {
  margin: 0 0 0 -8px;
  padding: 0 0 0 8px;
  background-position: right;
}

paned.horizontal > separator.wide {
  margin: 0;
  padding: 0;
  background-repeat: repeat-y, repeat-y;
  background-position: left, right;
}

paned.vertical > separator {
  margin: 0 0 -8px 0;
  padding: 0 0 8px 0;
  background-repeat: repeat-x;
  background-position: top;
}

paned.vertical > separator.wide {
  margin: 0;
  padding: 0;
  background-repeat: repeat-x, repeat-x;
  background-position: bottom, top;
}

/************
 * GtkVideo *
 ************/
video {
  background: black;
  border-radius: 6px;
}

video image.osd {
  min-width: 64px;
  min-height: 64px;
  border-radius: 9999px;
  border: none;
}

/**************
 * GtkInfoBar *
 **************/
infobar {
  border: none;
  margin-bottom: 0;
}

infobar > revealer > box {
  padding: 6px;
  border-spacing: 12px;
}

infobar.info > revealer > box button,
infobar.info > revealer > box button.text-button:not(:disabled),
infobar.info:hover > revealer > box button,
infobar.info:hover > revealer > box button.text-button:not(:disabled),
infobar.info:backdrop > revealer > box button,
infobar.info:backdrop > revealer > box button.text-button:not(:disabled) {
  color: #${config.colorScheme.palette.base0F};
}

infobar.action > revealer > box,
infobar.action:backdrop > revealer > box,
infobar.question > revealer > box,
infobar.question:backdrop > revealer > box {
  background-color: #${config.colorScheme.palette.base01};
  color: #${config.colorScheme.palette.base0F};
  border-radius: 6px;
}

infobar.action > revealer > box button,
infobar.action > revealer > box button:hover,
infobar.action > revealer > box button:focus,
infobar.action > revealer > box button:active,
infobar.action > revealer > box button:checked,
infobar.action > revealer > box button.text-button:not(:disabled),
infobar.action:backdrop > revealer > box button,
infobar.action:backdrop > revealer > box button:hover,
infobar.action:backdrop > revealer > box button:focus,
infobar.action:backdrop > revealer > box button:active,
infobar.action:backdrop > revealer > box button:checked,
infobar.action:backdrop > revealer > box button.text-button:not(:disabled),
infobar.question > revealer > box button,
infobar.question > revealer > box button:hover,
infobar.question > revealer > box button:focus,
infobar.question > revealer > box button:active,
infobar.question > revealer > box button:checked,
infobar.question > revealer > box button.text-button:not(:disabled),
infobar.question:backdrop > revealer > box button,
infobar.question:backdrop > revealer > box button:hover,
infobar.question:backdrop > revealer > box button:focus,
infobar.question:backdrop > revealer > box button:active,
infobar.question:backdrop > revealer > box button:checked,
infobar.question:backdrop > revealer > box button.text-button:not(:disabled) {
  color: #${config.colorScheme.palette.base06};
}

infobar.action > revealer > box *:link,
infobar.action:backdrop > revealer > box *:link,
infobar.question > revealer > box *:link,
infobar.question:backdrop > revealer > box *:link {
  color: rgba(0, 0, 0, 0.87);
}

infobar.action:hover > revealer > box,
infobar.question:hover > revealer > box {
  background-color: #${config.colorScheme.palette.base02};
  color: #${config.colorScheme.palette.base0F};
  border-radius: 6px;
}

infobar.warning > revealer > box,
infobar.warning:backdrop > revealer > box {
  background-color: #fdd633;
  color: rgba(0, 0, 0, 0.87);
}

infobar.warning > revealer > box button,
infobar.warning > revealer > box button:hover,
infobar.warning > revealer > box button:focus,
infobar.warning > revealer > box button:active,
infobar.warning > revealer > box button:checked,
infobar.warning > revealer > box button.text-button:not(:disabled),
infobar.warning:backdrop > revealer > box button,
infobar.warning:backdrop > revealer > box button:hover,
infobar.warning:backdrop > revealer > box button:focus,
infobar.warning:backdrop > revealer > box button:active,
infobar.warning:backdrop > revealer > box button:checked,
infobar.warning:backdrop > revealer > box button.text-button:not(:disabled) {
  color: rgba(0, 0, 0, 0.87);
}

infobar.warning > revealer > box *:link,
infobar.warning:backdrop > revealer > box *:link {
  color: rgba(0, 0, 0, 0.87);
}

infobar.warning:hover > revealer > box {
  background-color: #${config.colorScheme.palette.base0A};
}

infobar.error > revealer > box,
infobar.error:backdrop > revealer > box {
  background-color: #${config.colorScheme.palette.base08};
  color: rgba(0, 0, 0, 0.87);
}

infobar.error > revealer > box button,
infobar.error > revealer > box button:hover,
infobar.error > revealer > box button:focus,
infobar.error > revealer > box button:active,
infobar.error > revealer > box button:checked,
infobar.error > revealer > box button.text-button:not(:disabled),
infobar.error:backdrop > revealer > box button,
infobar.error:backdrop > revealer > box button:hover,
infobar.error:backdrop > revealer > box button:focus,
infobar.error:backdrop > revealer > box button:active,
infobar.error:backdrop > revealer > box button:checked,
infobar.error:backdrop > revealer > box button.text-button:not(:disabled) {
  color: rgba(0, 0, 0, 0.87);
}

infobar.error > revealer > box *:link,
infobar.error:backdrop > revealer > box *:link {
  color: rgba(0, 0, 0, 0.87);
}

infobar.error:hover > revealer > box {
  background-color: #f0766b;
}

/************
 * Tooltips *
 ************/
tooltip {
  border: none;
  background-clip: padding-box;
  padding: 6px 12px;
  box-shadow: none;
}

tooltip.background {
  background-color: rgba(24, 24, 37, 0.9);
  color: #${config.colorScheme.palette.base06};
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2),
    0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12);
  border-radius: 6px;
  margin: 2px 6px 8px 6px;
}

tooltip > box {
  border-spacing: 6px;
}

/*****************
 * Color Chooser *
 *****************/
colorswatch.top {
  border-top-left-radius: 12px;
  border-top-right-radius: 12px;
}

colorswatch.top overlay {
  border-top-left-radius: 12px;
  border-top-right-radius: 12px;
}

colorswatch.bottom {
  border-bottom-left-radius: 12px;
  border-bottom-right-radius: 12px;
}

colorswatch.bottom overlay {
  border-bottom-left-radius: 12px;
  border-bottom-right-radius: 12px;
}

colorswatch.left,
colorswatch:first-child:not(.top) {
  border-top-left-radius: 12px;
  border-bottom-left-radius: 12px;
}

colorswatch.left overlay,
colorswatch:first-child:not(.top) overlay {
  border-top-left-radius: 12px;
  border-bottom-left-radius: 12px;
}

colorswatch.right,
colorswatch:last-child:not(.bottom) {
  border-top-right-radius: 12px;
  border-bottom-right-radius: 12px;
}

colorswatch.right overlay,
colorswatch:last-child:not(.bottom) overlay {
  border-top-right-radius: 12px;
  border-bottom-right-radius: 12px;
}

colorswatch.dark {
  color: #${config.colorScheme.palette.base06};
}

colorswatch.light {
  color: rgba(0, 0, 0, 0.87);
}

colorswatch#add-color-button {
  border-radius: 12px 12px 0 0;
  color: #${config.colorScheme.palette.base06};
}

colorswatch#add-color-button:only-child {
  border-radius: 12px;
}

colorswatch#add-color-button overlay {
  background-color: #${config.colorScheme.palette.base02};
}

colorswatch:disabled {
  opacity: 0.5;
}

colorswatch:disabled overlay {
  box-shadow: none;
}

colorswatch#editor-color-sample {
  border-radius: 12px;
}

colorswatch#editor-color-sample overlay {
  border-radius: 12px;
}

colorchooser .popover.osd {
  transition: box-shadow 75ms cubic-bezier(0, 0, 0.2, 1);
  border-radius: 6px;
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2),
    0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12),
    inset 0 1px rgba(242, 213, 207, 0.1);
  background-color: #${config.colorScheme.palette.base02};
}

colorchooser .popover.osd:backdrop {
  box-shadow: 0 3px 2px -3px rgba(0, 0, 0, 0.3),
    0 2px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 3px 0 rgba(0, 0, 0, 0.12),
    inset 0 1px rgba(242, 213, 207, 0.1);
}

/********
 * Misc *
 ********/
.content-view {
  background-color: #${config.colorScheme.palette.base00};
}

/**********************
 * Window Decorations *
 **********************/
window {
  transition: box-shadow 75ms cubic-bezier(0, 0, 0.2, 1);
  border-radius: 12px;
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2),
    0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12),
    0 0 0 2px #${config.colorScheme.palette.base0D}, 0 0 16px transparent;
}

window.csd {
  border-radius: 12px;
}

window:backdrop {
  box-shadow: 0 2px 2px -2px rgba(0, 0, 0, 0.3),
    0 1px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 2px -0.6px rgba(0, 0, 0, 0.17),
    0 0 0 2px #${config.colorScheme.palette.base04}, 0 0 16px transparent;
}

window.popup {
  border-radius: 12px;
  box-shadow: none;
}

window.dialog.message {
  border-radius: 12px;
}

window.solid-csd {
  margin: 0;
  padding: 2px;
  border-radius: 0;
  background-color: #${config.colorScheme.palette.base00};
  border: 2px solid #${config.colorScheme.palette.base0F};
}

window.solid-csd:backdrop {
  background-color: #${config.colorScheme.palette.base00};
}

window.maximized,
window.fullscreen,
window.tiled,
window.tiled-top,
window.tiled-right,
window.tiled-bottom,
window.tiled-left {
  border-radius: 0;
  outline-width: 0;
}

windowcontrols {
  border-spacing: 6px;
}

windowcontrols.start:not(.empty):dir(ltr),
windowcontrols.end:not(.empty):dir(rtl) {
  margin-left: 15px;
  margin-right: 15px;
}

windowcontrols.start:not(.empty):dir(rtl),
windowcontrols.end:not(.empty):dir(ltr) {
  margin-left: 15px;
  margin-right: 15px;
}

windowcontrols button:not(.suggested-action):not(.destructive-action) {
  min-height: 12px;
  min-width: 12px;
  padding: 0;
  margin: 0 2px;
  border-radius: 9999px;
}

windowcontrols button.minimize:not(.suggested-action):not(.destructive-action),
windowcontrols button.maximize:not(.suggested-action):not(.destructive-action),
windowcontrols button.close:not(.suggested-action):not(.destructive-action) {
  color: transparent;
}

windowcontrols
  button.minimize:not(.suggested-action):not(.destructive-action)
  image,
windowcontrols
  button.maximize:not(.suggested-action):not(.destructive-action)
  image,
windowcontrols
  button.close:not(.suggested-action):not(.destructive-action)
  image {
  padding: 0;
}

windowcontrols
  button.minimize:hover:not(.suggested-action):not(.destructive-action),
windowcontrols
  button.minimize:active:not(.suggested-action):not(.destructive-action) {
  background-color: shade(#ff9e64, 0.5);
}

windowcontrols
  button.maximize:hover:not(.suggested-action):not(.destructive-action),
windowcontrols
  button.maximize:active:not(.suggested-action):not(.destructive-action) {
  background-color: shade(#9ece6a, 0.5);
}

windowcontrols
  button.close:hover:not(.suggested-action):not(.destructive-action),
windowcontrols
  button.close:active:not(.suggested-action):not(.destructive-action) {
  background-color: shade(#f7768e, 0.5);
}

windowcontrols
  button.minimize:backdrop:hover:not(.suggested-action):not(
    .destructive-action
  ),
windowcontrols
  button.minimize:backdrop:active:not(.suggested-action):not(
    .destructive-action
  ),
windowcontrols
  button.maximize:backdrop:hover:not(.suggested-action):not(
    .destructive-action
  ),
windowcontrols
  button.maximize:backdrop:active:not(.suggested-action):not(
    .destructive-action
  ),
windowcontrols
  button.close:backdrop:hover:not(.suggested-action):not(.destructive-action),
windowcontrols
  button.close:backdrop:active:not(.suggested-action):not(.destructive-action) {
  color: transparent;
}

windowcontrols button.minimize:not(.suggested-action):not(.destructive-action),
windowcontrols
  button.minimize:active:not(.suggested-action):not(.destructive-action) {
  background-color: #ff9e64;
}

windowcontrols button.maximize:not(.suggested-action):not(.destructive-action),
windowcontrols
  button.maximize:active:not(.suggested-action):not(.destructive-action) {
  background-color: #9ece6a;
}

windowcontrols button.close:not(.suggested-action):not(.destructive-action),
windowcontrols
  button.close:active:not(.suggested-action):not(.destructive-action) {
  background-color: #f7768e;
}

button.titlebutton.close:backdrop,
button.titlebutton.maximize:backdrop,
button.titlebutton.minimize:backdrop,
windowcontrols > button.close:backdrop,
windowcontrols > button.maximize:backdrop,
windowcontrols > button.minimize:backdrop {
  background-color: #${config.colorScheme.palette.base04};
}

gridview > child:selected,
row:selected,
calendar:selected {
  background-color: alpha(currentColor, 0.06);
}

.view:selected,
iconview:selected,
flowbox > flowboxchild:selected,
calendar > grid > label.today {
  color: #${config.colorScheme.palette.base0F};
  background-color: rgba(238, 190, 190, 0.2);
}

text > selection,
label > selection,
calendar > grid > label.today:selected,
stacksidebar row:selected,
.navigation-sidebar > row:selected {
  color: #${config.colorScheme.palette.base0E};
  background-color: #${config.colorScheme.palette.base03};
}

.monospace {
  font-family: monospace;
}

/**********************
 * Touch Copy & Paste *
 **********************/
cursor-handle {
  color: #${config.colorScheme.palette.base0F};
  -gtk-icon-source: -gtk-recolor(
    url('assets/scalable/cursor-handle-symbolic.svg')
  );
}

cursor-handle.insertion-cursor:dir(ltr),
cursor-handle.insertion-cursor:dir(rtl) {
  padding-top: 6px;
}

shortcuts-section {
  margin: 20px;
}

.shortcuts-search-results {
  margin: 20px;
  border-spacing: 24px;
}

shortcut {
  border-spacing: 6px;
}

shortcut > .keycap {
  min-width: 12px;
  min-height: 26px;
  margin-top: 2px;
  padding-bottom: 2px;
  padding-left: 8px;
  padding-right: 8px;
  border: solid 1px rgba(242, 213, 207, 0.12);
  border-radius: 7px;
  box-shadow: inset 0 -2px rgba(242, 213, 207, 0.12);
  background-color: #${config.colorScheme.palette.base02};
  color: #${config.colorScheme.palette.base06};
  font-size: smaller;
}

:not(decoration):not(window):drop(active) {
  caret-color: #${config.colorScheme.palette.base0F};
}

stackswitcher {
  min-height: 0;
  border-radius: 9999px;
  padding: 2px;
  margin: 6px 0;
  background-color: transparent;
  border: 2px solid #${config.colorScheme.palette.base0F};
}

stackswitcher.linked:not(.vertical)
  > button:not(.suggested-action):not(.destructive-action) {
  margin: 0 0;
  min-height: 20px;
  padding: 5px 10px;
}

stackswitcher.linked:not(.vertical)
  > button:not(.suggested-action):not(.destructive-action):not(:hover):not(
    :active
  ):not(:checked) {
  background-color: transparent;
}

stackswitcher.linked:not(.vertical)
  > button:not(.suggested-action):not(.destructive-action):first-child,
stackswitcher.linked:not(.vertical)
  > button:not(.suggested-action):not(.destructive-action):last-child,
stackswitcher.linked:not(.vertical)
  > button:not(.suggested-action):not(.destructive-action) {
  border-radius: 9999px;
}

stackswitcher.linked:not(.vertical)
  > button.text-button:not(.suggested-action):not(.destructive-action) {
  min-width: 100px;
}

stackswitcher button.text-button {
  min-width: 100px;
}

stackswitcher.circular {
  border-spacing: 12px;
}

stackswitcher.circular button.circular,
stackswitcher.circular button.text-button.circular {
  min-width: 36px;
  min-height: 36px;
  padding: 0;
}

/*************
 * App Icons *
 *************/
.lowres-icon {
  -gtk-icon-shadow: none;
}

.icon-dropshadow {
  -gtk-icon-shadow: none;
}

/*********
 * Emoji *
 *********/
popover.emoji-picker {
  padding: 0;
}

popover.emoji-picker > contents {
  padding: 0;
}

.emoji-searchbar {
  padding: 6px;
  border-spacing: 6px;
  border-bottom: 1px solid rgba(242, 213, 207, 0.12);
  background: none;
}

.emoji-searchbar entry text {
  background: none;
  box-shadow: none;
}

.emoji-toolbar {
  padding: 0;
  border-spacing: 3px;
  border-top: 1px solid rgba(242, 213, 207, 0.12);
  background: none;
}

button.emoji-section {
  margin: 0;
  padding: 6px;
  border-radius: 6px;
}

button.emoji-section:checked {
  color: #${config.colorScheme.palette.base0F};
}

popover.emoji-picker emoji {
  font-size: x-large;
  padding: 6px;
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
  border-radius: 6px;
}

popover.emoji-picker emoji:focus,
popover.emoji-picker emoji:hover {
  background: alpha(currentColor, 0.08);
}

emoji-completion-row {
  min-height: 28px;
  padding: 0 12px;
}

emoji-completion-row > box {
  border-spacing: 6px;
  padding: 2px 6px;
}

emoji-completion-row:focus,
emoji-completion-row:hover,
emoji-completion-row emoji:hover,
emoji-completion-row emoji:focus {
  background-color: alpha(currentColor, 0.08);
  color: #${config.colorScheme.palette.base06};
}

popover.entry-completion > contents {
  padding: 0;
}

.nautilus-window {
  background-color: #${config.colorScheme.palette.base00};
}

.nautilus-window:backdrop {
  background-color: #${config.colorScheme.palette.base00};
}

.nautilus-window headerbar {
  box-shadow: none;
}

.nautilus-window separator.spacer {
  padding-right: 2em;
}

.nautilus-window flap.unfolded > placessidebar {
  background-color: transparent;
  color: rgba(242, 213, 207, 0.7);
  padding: 0 0 0 2px;
  margin: 0 0 0 2px;
}

.nautilus-window
  flap.unfolded
  > placessidebar
  > scrolledwindow
  > viewport
  > list.navigation-sidebar {
  background: none;
  padding: 0 0 0 2px;
  margin: 0 0 0 2px;
}

.nautilus-window
  flap.unfolded
  > placessidebar
  > scrolledwindow
  > viewport
  > list.navigation-sidebar
  > separator {
  background: rgba(242, 213, 207, 0.1);
}

.nautilus-window .vertical separator {
  background: none;
}

.nautilus-window
  flap.unfolded
  > placessidebar
  > scrolledwindow
  > viewport
  > list.navigation-sidebar
  > row.activatable {
  border-radius: 6px;
}

.nautilus-window
  flap.unfolded
  > placessidebar
  > scrolledwindow
  > viewport
  > list.navigation-sidebar
  > row.activatable,
.nautilus-window
  flap.unfolded
  > placessidebar
  > scrolledwindow
  > viewport
  > list.navigation-sidebar
  > row.activatable
  image.sidebar-icon,
.nautilus-window
  flap.unfolded
  > placessidebar
  > scrolledwindow
  > viewport
  > list.navigation-sidebar
  > row.activatable
  label.sidebar-label,
.nautilus-window
  flap.unfolded
  > placessidebar
  > scrolledwindow
  > viewport
  > list.navigation-sidebar
  > row.activatable
  button.sidebar-button {
  color: #${config.colorScheme.palette.base06};
}

.nautilus-window
  flap.unfolded
  > placessidebar
  > scrolledwindow
  > viewport
  > list.navigation-sidebar
  > row.activatable:hover {
  background-color: rgba(242, 213, 207, 0.12);
  color: #${config.colorScheme.palette.base06};
}

.nautilus-window
  flap.unfolded
  > placessidebar
  > scrolledwindow
  > viewport
  > list.navigation-sidebar
  > row.activatable:selected {
  background-color: #${config.colorScheme.palette.base01};
  font-weight: 700;
  border-left: 3px solid #f7768e;
}

.nautilus-window
  flap.unfolded
  > placessidebar
  > scrolledwindow
  > viewport
  > list.navigation-sidebar
  > row.activatable:selected,
.nautilus-window
  flap.unfolded
  > placessidebar
  > scrolledwindow
  > viewport
  > list.navigation-sidebar
  > row.activatable:selected
  image.sidebar-icon,
.nautilus-window
  flap.unfolded
  > placessidebar
  > scrolledwindow
  > viewport
  > list.navigation-sidebar
  > row.activatable:selected
  label.sidebar-label,
.nautilus-window
  flap.unfolded
  > placessidebar
  > scrolledwindow
  > viewport
  > list.navigation-sidebar
  > row.activatable:selected
  button.sidebar-button {
  color: #${config.colorScheme.palette.base0E};
}

.nautilus-window
  flap.unfolded
  > placessidebar
  > scrolledwindow
  > viewport
  > list.navigation-sidebar
  > row.activatable:disabled,
.nautilus-window
  flap.unfolded
  > placessidebar
  > scrolledwindow
  > viewport
  > list.navigation-sidebar
  > row.activatable:disabled
  image.sidebar-icon,
.nautilus-window
  flap.unfolded
  > placessidebar
  > scrolledwindow
  > viewport
  > list.navigation-sidebar
  > row.activatable:disabled
  label.sidebar-label {
  color: rgba(242, 213, 207, 0.3);
}

.nautilus-window
  flap.unfolded
  > placessidebar
  > scrolledwindow
  > scrollbar
  > range
  > though {
  background: none;
}

.nautilus-window
  flap.unfolded
  > placessidebar
  > scrolledwindow
  > scrollbar
  > range
  > though
  > slider {
  border: none;
}

.nautilus-window .nautilus-grid-view.view {
  margin: 0 6px 6px;
}

.nautilus-window .unfolded {
  background-color: #${config.colorScheme.palette.base00};
}

.nautilus-window .nautilus-grid-view.view,
.nautilus-window .nautilus-grid-view.view gridview.view {
  background-color: #${config.colorScheme.palette.base01};
  border-radius: 12px;
}

.nautilus-window flap > separator {
  background: none;
}

.nautilus-window placesview label {
  color: rgba(242, 213, 207, 0.7);
}

.nautilus-window infobar {
  margin: 3px;
}

.nautilus-window infobar > revealer > box {
  border-radius: 12px;
}

.nautilus-window label.search-information {
  margin: 3px;
  border-radius: 6px;
}

.nautilus-window .floating-bar {
  min-height: 32px;
  padding: 0;
  margin: 6px;
  border-style: none;
  border-radius: 6px;
  background-color: #${config.colorScheme.palette.base0F};
  color: rgba(0, 0, 0, 0.87);
  box-shadow: 0 3px 2px -2px rgba(0, 0, 0, 0.2),
    0 3px 2.4px 0 rgba(0, 0, 0, 0.14), 0 1px 4.8px 0 rgba(0, 0, 0, 0.12);
}

.nautilus-window .floating-bar button {
  margin: 4px;
  color: rgba(0, 0, 0, 0.87);
}

#NautilusViewCell clamp box {
  margin: 0;
  border-spacing: 0;
}

#NautilusQueryEditor > menubutton > button {
  min-width: 16px;
  min-height: 16px;
  margin: 0;
}

#NautilusQueryEditor > text {
  margin: 0;
}

#NautilusPathBar {
  background-color: #${config.colorScheme.palette.base01};
  border-radius: 6px;
  margin: 6px 0;
}

#NautilusPathBar #NautilusPathButton {
  margin: 0 3px;
  border-radius: 6px;
}

#NautilusPathBar #NautilusPathButton.current-dir {
  color: #${config.colorScheme.palette.base0E};
}

#NautilusPathBar #NautilusPathButton.current-dir:hover,
#NautilusPathBar #NautilusPathButton.current-dir:active {
  background: none;
  box-shadow: none;
}

#NautilusPathBar #NautilusPathButton:first-child {
  margin-left: 0;
}

#NautilusPathBar > menubutton {
  margin: 0;
}

#NautilusPathBar > menubutton > button {
  border-radius: 9999px;
}

#NautilusQueryEditorTag {
  border-radius: 9999px;
}

#NautilusQueryEditorTag > button {
  margin: 3px;
  padding: 0;
  min-height: 22px;
  min-width: 22px;
}

window.dialog > box > stack > box > box > notebook.frame {
  border-width: 0 0 0 1px;
  border-radius: 0;
}

.history-view {
  background-color: #${config.colorScheme.palette.base00};
}

#displayitem {
  border-top: 1px solid rgba(242, 213, 207, 0.12);
}

.small .card {
  border-radius: 0;
  box-shadow: none;
}

.small .card.forecast-card {
  border-width: 1px 0;
}

.small .card.display-container {
  border-width: 0 0 1px 0;
}

leaflet button.number-button {
  background-color: rgba(242, 213, 207, 0.1);
}

leaflet button.number-button:hover {
  background-color: rgba(242, 213, 207, 0.2);
}

leaflet button.number-button:active {
  background-color: rgba(242, 213, 207, 0.3);
}

leaflet button.clear-button.image-button {
  border-radius: 6px;
}

datechooser.view button.flat.pill,
datechooser.view button.circular.day {
  min-height: 24px;
  min-width: 24px;
  padding: 6px;
}

.contacts-contact-list list.navigation-sidebar {
  background: none;
}

flowboxchild > button.card.category-tile {
  padding: 21px;
  border: none;
  border-radius: 6px;
}

flowboxchild > button.card.category-tile-iconless {
  padding: 9px 15px;
}

app-context-bar > box:not(:first-child) > button.flat {
  border-radius: 0;
}

app-context-bar > box:not(:first-child) > button.flat:last-child {
  border-radius: 0 6px 6px 0;
}

app-context-bar > box:first-child > button.flat {
  border-radius: 0;
}

app-context-bar > box:first-child > button.flat:first-child {
  border-radius: 6px 0 0 6px;
}

app-context-bar > box > button.flat {
  border-left-color: rgba(242, 213, 207, 0.12);
}

carousel.card {
  border: none;
}

.context-tile-lozenge {
  min-height: 28px;
  min-width: 28px;
  padding: 6px;
}

.context-tile-lozenge.grey {
  color: #${config.colorScheme.palette.base06};
  background-color: rgba(242, 213, 207, 0.12);
}

.context-tile-lozenge.green,
.context-tile-lozenge.details-rating-0 {
  color: #4cb168;
  background-color: rgba(129, 201, 149, 0.15);
}

.context-tile-lozenge.blue,
.context-tile-lozenge.details-rating-5 {
  color: #85c1dc;
  background-color: rgba(33, 150, 243, 0.15);
}

.context-tile-lozenge.yellow,
.context-tile-lozenge.details-rating-12 {
  color: #e1b602;
  background-color: rgba(253, 214, 51, 0.15);
}

.context-tile-lozenge.details-rating-15 {
  color: #ff9800;
  background-color: rgba(255, 152, 0, 0.15);
}

.context-tile-lozenge.red,
.context-tile-lozenge.details-rating-18 {
  color: #eb4b3d;
  background-color: rgba(242, 139, 130, 0.15);
}

screenshot-carousel box.frame.view {
  border-width: 1px 0;
  border-radius: 0;
}

/* Styling for specific category buttons. */
.category-tile.category-create {
  background: linear-gradient(180deg, #ce8cd7 0%, #2861c6 100%);
  color: #${config.colorScheme.palette.base06};
}

.category-tile.category-create:hover {
  background: linear-gradient(
    180deg,
    shade(#ce8cd7, 1.07) 0%,
    shade(#2861c6, 1.1) 100%
  );
}

.category-tile.category-create:active {
  background: linear-gradient(
    180deg,
    shade(#ce8cd7, 0.95) 0%,
    shade(#2861c6, 0.95) 100%
  );
}

.category-tile.category-develop {
  background: #5e5c64;
  color: #${config.colorScheme.palette.base06};
}

.category-tile.category-develop:hover {
  background: shade(#5e5c64, 1.2);
}

.category-tile.category-develop:active {
  background-color: shade(#5e5c64, 0.95);
}

.category-tile.category-learn {
  background: linear-gradient(180deg, #2ec27e 30%, #27a66c 100%);
  color: #${config.colorScheme.palette.base06};
}

.category-tile.category-learn:hover {
  background: linear-gradient(
    180deg,
    shade(#2ec27e, 1.06) 30%,
    shade(#27a66c, 1.06) 100%
  );
}

.category-tile.category-learn:active {
  background: linear-gradient(
    180deg,
    shade(#2ec27e, 0.95) 30%,
    shade(#27a66c, 0.95) 100%
  );
}

.category-tile.category-play {
  background: linear-gradient(75deg, #f9e2a7 0%, #eb5ec3 50%, #6d53e0 100%);
  color: #393484;
}

.category-tile.category-play:hover {
  background: linear-gradient(
    75deg,
    shade(#f9e2a7, 1.07) 0%,
    shade(#eb5ec3, 1.07) 50%,
    shade(#6d53e0, 1.07) 100%
  );
}

.category-tile.category-play:active {
  background: linear-gradient(
    75deg,
    shade(#f9e2a7, 0.97) 0%,
    shade(#eb5ec3, 0.95) 50%,
    shade(#6d53e0, 1.07) 100%
  );
}

.category-tile.category-socialize {
  background: linear-gradient(90deg, #ef4e9b 0%, #f77466 100%);
  color: rgba(242, 213, 207, 0.7);
}

.category-tile.category-socialize:hover {
  background: linear-gradient(
    90deg,
    shade(#ef4e9b, 1.08) 0%,
    shade(#f77466, 1.08) 100%
  );
}

.category-tile.category-socialize:active {
  background: linear-gradient(
    90deg,
    shade(#ef4e9b, 0.95) 0%,
    shade(#f77466, 0.95) 100%
  );
}

.category-tile.category-work {
  padding: 1px;
  /* FIXME: work around https://gitlab.gnome.org/GNOME/gtk/-/issues/4324 */
  color: #1c71d8;
  background-color: #fdf8d7;
  background-image: linear-gradient(
      rgba(242, 213, 207, 0.12) 1px,
      transparent 1px
    ),
    linear-gradient(90deg, rgba(242, 213, 207, 0.12) 1px, transparent 1px);
  background-size: 10px 10px, 10px 10px;
  background-position: -1px -4px, center -1px;
}

.category-tile.category-work:hover {
  background-color: #fefcef;
  background-image: linear-gradient(
      rgba(242, 213, 207, 0.12) 1px,
      transparent 1px
    ),
    linear-gradient(90deg, rgba(242, 213, 207, 0.12) 1px, transparent 1px);
}

.category-tile.category-work:active {
  background-color: #fcf4bf;
  background-image: linear-gradient(
      rgba(242, 213, 207, 0.12) 1px,
      transparent 1px
    ),
    linear-gradient(90deg, rgba(242, 213, 207, 0.12) 1px, transparent 1px);
}

.polari-room-list .sidebar {
  background: none;
}

.polari-room-list .sidebar > row.activatable:selected {
  background-color: #${config.colorScheme.palette.base0F};
  color: rgba(0, 0, 0, 0.87);
}

.polari-room-list popover.background > arrow,
.polari-room-list popover.background > contents {
  padding: 0;
}

window.org-gnome-Builder headerbar {
  box-shadow: inset 0 -1px rgba(242, 213, 207, 0.12);
}

window.org-gnome-Builder headerbar splitbutton button {
  border-radius: 6px;
}

window.org-gnome-Builder headerbar splitbutton notification button {
  margin: 0;
  min-height: 24px;
  min-width: 24px;
  padding: 0;
}

window.org-gnome-Builder headerbar menubutton > button {
  border-radius: 6px;
  padding: 6px 9px;
}

window.org-gnome-Builder headerbar paneltogglebutton button {
  border-radius: 6px;
}

popover.background.global-search > arrow,
popover.background.global-search > contents {
  padding: 0;
}

panelframeswitcher {
  padding: 6px;
}

.frameheader.header {
  min-height: 24px;
  background-color: rgba(242, 213, 207, 0.04);
}

.frameheader.header > button {
  border: none;
  margin: 0;
  padding: 3px;
}

.frameheader.header tabbar.inline > revealer > box {
  min-height: 24px;
}

.frameheader.header tabbar.inline > revealer > box .start-action {
  padding: 0;
  border: none;
}

.frameheader.header tabbar.inline > revealer > box .end-action {
  padding: 0;
  border-left: 1px solid rgba(242, 213, 207, 0.12);
}

.frameheader.header
  tabbar.inline
  > revealer
  > box
  .end-action
  menubutton
  > button {
  margin: 6px;
  min-height: 24px;
  min-width: 24px;
  padding: 3px;
  border-radius: 6px;
}

.frameheader.header tabbar.inline > revealer > box tabbox {
  border: none;
  background: none;
}

panelstatusbar {
  background-color: #${config.colorScheme.palette.base00};
}

panelstatusbar > menubutton > button,
panelstatusbar > paneltogglebutton button.image-button {
  border-radius: 0;
}

.style-variant {
  padding: 0 12px;
}

.style-variant button.toggle {
  padding: 0;
}

.style-variant button.toggle,
.style-variant button.toggle:hover,
.style-variant button.toggle:focus,
.style-variant button.toggle:active,
.style-variant button.toggle:checked {
  background: none;
  outline: none;
  border: none;
  box-shadow: none;
}

.style-variant button.toggle > stylevariantpreview > .wallpaper {
  border-radius: 6px;
  outline-color: transparent;
  outline-width: 3px;
  outline-offset: 3px;
  outline-style: solid;
  box-shadow: none;
}

.style-variant button.toggle:hover > stylevariantpreview > .wallpaper {
  outline-color: rgba(242, 213, 207, 0.04);
}

.style-variant button.toggle:active > stylevariantpreview > .wallpaper {
  outline-color: rgba(242, 213, 207, 0.3);
}

.style-variant button.toggle:checked > stylevariantpreview > .wallpaper {
  outline-color: #${config.colorScheme.palette.base0F};
}

window.dialog
  > .dialog-vbox
  > box
  > scrolledwindow
  > viewport
  > widget
  > list.boxed-list {
  border: none;
  border-radius: 0;
}

window.dialog
  > .dialog-vbox
  > box
  > scrolledwindow
  > viewport
  > widget
  > list.boxed-list
  > row:first-child,
window.dialog
  > .dialog-vbox
  > box
  > scrolledwindow
  > viewport
  > widget
  > list.boxed-list
  > row:last-child {
  border-radius: 0;
}

avatar {
  border-radius: 9999px;
  font-weight: bold;
}

avatar.color1 {
  background-image: linear-gradient(#83b6ec, #337fdc);
  color: #cfe1f5;
}

avatar.color2 {
  background-image: linear-gradient(#7ad9f1, #0f9ac8);
  color: #caeaf2;
}

avatar.color3 {
  background-image: linear-gradient(#8de6b1, #29ae74);
  color: #cef8d8;
}

avatar.color4 {
  background-image: linear-gradient(#b5e98a, #6ab85b);
  color: #e6f9d7;
}

avatar.color5 {
  background-image: linear-gradient(#f8e359, #d29d09);
  color: #f9f4e1;
}

avatar.color6 {
  background-image: linear-gradient(#ffcb62, #d68400);
  color: #ffead1;
}

avatar.color7 {
  background-image: linear-gradient(#ffa95a, #ed5b00);
  color: #ffe5c5;
}

avatar.color8 {
  background-image: linear-gradient(#f78773, #e62d42);
  color: #f8d2ce;
}

avatar.color9 {
  background-image: linear-gradient(#e973ab, #e33b6a);
  color: #fac7de;
}

avatar.color10 {
  background-image: linear-gradient(#cb78d4, #9945b5);
  color: #e7c2e8;
}

avatar.color11 {
  background-image: linear-gradient(#9e91e8, #7a59ca);
  color: #d5d2f5;
}

avatar.color12 {
  background-image: linear-gradient(#e3cf9c, #b08952);
  color: #f2eade;
}

avatar.color13 {
  background-image: linear-gradient(#be916d, #785336);
  color: #e5d6ca;
}

avatar.color14 {
  background-image: linear-gradient(#c0bfbc, #6e6d71);
  color: #d8d7d3;
}

avatar.contrasted {
  color: #${config.colorScheme.palette.base06};
}

avatar.image {
  background: none;
}

.card {
  border-radius: 6px;
  box-shadow: none;
  border: 1px solid rgba(242, 213, 207, 0.12);
  background-clip: border-box;
  background-color: #${config.colorScheme.palette.base00};
  color: rgba(242, 213, 207, 0.7);
}

preferencespage > scrolledwindow > viewport > clamp > box {
  margin: 24px 12px;
  border-spacing: 24px;
}

preferencesgroup > box,
preferencesgroup > box .labels {
  border-spacing: 6px;
}

preferencesgroup > box > box.header:not(.single-line) {
  margin-bottom: 6px;
}

preferencesgroup > box > box.single-line {
  min-height: 34px;
}

preferencesgroup > box button.background-preview-button.toggle {
  padding: 0;
  background: none;
  box-shadow: none;
  outline-color: transparent;
  outline-width: 3px;
  outline-offset: 3px;
  outline-style: solid;
}

preferencesgroup > box button.background-preview-button.toggle,
preferencesgroup
  > box
  button.background-preview-button.toggle
  > background-preview {
  border-radius: 6px;
}

preferencesgroup > box button.background-preview-button.toggle:hover {
  outline-color: rgba(242, 213, 207, 0.04);
}

preferencesgroup > box button.background-preview-button.toggle:active {
  outline-color: rgba(242, 213, 207, 0.3);
}

preferencesgroup > box button.background-preview-button.toggle:checked {
  outline-color: #${config.colorScheme.palette.base0F};
}

statuspage > scrolledwindow > viewport > box {
  margin: 36px 12px;
  border-spacing: 36px;
}

statuspage > scrolledwindow > viewport > box > clamp > box {
  border-spacing: 12px;
}

statuspage > scrolledwindow > viewport > box > clamp > box > .icon {
  -gtk-icon-size: 128px;
  color: alpha(currentColor, 0.55);
}

statuspage > scrolledwindow > viewport > box > clamp > box > .icon:disabled {
  opacity: 0.35;
}

statuspage
  > scrolledwindow
  > viewport
  > box
  > clamp
  > box
  > .icon:not(:last-child) {
  margin-bottom: 24px;
}

statuspage.compact > scrolledwindow > viewport > box {
  margin: 24px 12px;
  border-spacing: 24px;
}

statuspage.compact > scrolledwindow > viewport > box > clamp > box > .icon {
  -gtk-icon-size: 96px;
}

statuspage.compact
  > scrolledwindow
  > viewport
  > box
  > clamp
  > box
  > .icon:not(:last-child) {
  margin-bottom: 12px;
}

statuspage.compact > scrolledwindow > viewport > box > clamp > box > .title {
  font-size: 18pt;
}

toast {
  margin: 12px;
  margin-bottom: 24px;
  border-radius: 9999px;
  border-spacing: 6px;
  padding: 6px;
  box-shadow: 0 7px 4.8px -4px rgba(0, 0, 0, 0.2),
    0 12px 10.2px 2px rgba(0, 0, 0, 0.14), 0 5px 13.2px 4px rgba(0, 0, 0, 0.12),
    inset 0 1px rgba(242, 213, 207, 0.1);
  background-color: #${config.colorScheme.palette.base01};
  color: #${config.colorScheme.palette.base06};
  border: none;
}

toast:dir(ltr) {
  padding-left: 12px;
}

toast:dir(rtl) {
  padding-right: 12px;
}

toast > label {
  margin: 0 6px;
}

viewswitcher {
  margin: 0;
}

viewswitcher.wide {
  margin-top: 6px;
  margin-bottom: 6px;
}

viewswitcher.wide button.toggle:checked,
viewswitcher.wide button.toggle.flat:checked {
  background-color: #${config.colorScheme.palette.base02};
  color: #${config.colorScheme.palette.base0E};
}

viewswitcher.wide button.toggle:checked:backdrop,
viewswitcher.wide button.toggle.flat:checked:backdrop {
  color: rgba(0, 0, 0, 0.38);
}

viewswitcher.wide
  button.toggle:checked
  indicatorbin.needs-attention
  > indicator,
viewswitcher.wide
  button.toggle.flat:checked
  indicatorbin.needs-attention
  > indicator {
  background-color: rgba(0, 0, 0, 0.87);
}

viewswitcher.wide
  button.toggle:checked
  indicatorbin.needs-attention
  > indicator
  > label,
viewswitcher.wide
  button.toggle.flat:checked
  indicatorbin.needs-attention
  > indicator
  > label {
  color: #${config.colorScheme.palette.base0F};
}

viewswitcher.narrow button.toggle {
  border-radius: 0;
  margin: 0;
  border: none;
}

headerbar viewswitcher.narrow button.toggle {
  border-radius: 6px;
  margin: 5px 2px;
  min-width: 119px;
  padding: 0;
  background-color: transparent;
}

headerbar viewswitcher.narrow button.toggle:checked {
  background-color: #${config.colorScheme.palette.base0F};
  color: rgba(0, 0, 0, 0.87);
}

headerbar viewswitcher.narrow button.toggle:checked indicator {
  background: rgba(0, 0, 0, 0.87);
}

headerbar viewswitcher.narrow button.toggle:checked indicator > label {
  color: #${config.colorScheme.palette.base0F};
}

headerbar viewswitcher.narrow button.toggle:checked:backdrop {
  color: rgba(0, 0, 0, 0.38);
}

headerbar viewswitcher.narrow button.toggle:focus {
  box-shadow: none;
}

viewswitcher button.toggle {
  font-weight: bold;
  padding: 0;
  min-height: 0;
  margin: 0;
}

viewswitcher button.toggle > stack > box.narrow {
  font-size: 0.75rem;
  padding-top: 7px;
  padding-bottom: 5px;
  border-spacing: 4px;
}

viewswitcher button.toggle > stack > box.narrow > stack > label {
  padding-left: 8px;
  padding-right: 8px;
}

viewswitcher button.toggle > stack > box.wide {
  padding: 0 12px;
  border-spacing: 6px;
}

viewswitcherbar actionbar > revealer > box {
  padding: 0;
}

viewswitchertitle viewswitcher {
  margin-left: 12px;
  margin-right: 12px;
}

indicatorbin > indicator,
indicatorbin > mask {
  min-width: 6px;
  min-height: 6px;
  border-radius: 9999px;
}

indicatorbin > indicator {
  margin: 1px;
  padding: 0;
  background: alpha(currentColor, 0.4);
}

indicatorbin > indicator > label {
  font-size: 0.6rem;
  font-weight: bold;
  padding: 2px 5px;
  color: #${config.colorScheme.palette.base06};
}

indicatorbin > mask {
  padding: 1px;
  background: black;
}

indicatorbin.needs-attention > indicator {
  background-color: #${config.colorScheme.palette.base0F};
}

indicatorbin.needs-attention > indicator > label {
  color: rgba(0, 0, 0, 0.87);
}
  '';
}