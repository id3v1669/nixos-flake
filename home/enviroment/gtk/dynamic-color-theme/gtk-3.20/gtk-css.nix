{ config, lib, pkgs, uservars, ... }:
{
  home.file.".themes/dynamic-color-theme/gtk-3.20/gtk.css".text = ''
/* GTK NAMED COLORS
   ----------------
   use responsibly! */
/* widget text/foreground color */
@define-color theme_fg_color #f8f8f2;
/* text color for entries, views and content in general */
@define-color theme_text_color #f8f8f2;
/* widget base background color */
@define-color theme_bg_color #1e1f29;
/* text widgets and the like base background color */
@define-color theme_base_color #282a36;
/* base background color of selections */
@define-color theme_selected_bg_color rgba(189, 147, 249, 0.5);
/* text/foreground color of selections */
@define-color theme_selected_fg_color #f8f8f2;
/* base background color of disabled widgets */
@define-color insensitive_bg_color #22232e;
/* text foreground color of disabled widgets */
@define-color insensitive_fg_color #8b8c8e;
/* disabled text widgets and the like base background color */
@define-color insensitive_base_color #282a36;
/* widget text/foreground color on backdrop windows */
@define-color theme_unfocused_fg_color #8b8c8e;
/* text color for entries, views and content in general on backdrop windows */
@define-color theme_unfocused_text_color #f8f8f2;
/* widget base background color on backdrop windows */
@define-color theme_unfocused_bg_color #1e1f29;
/* text widgets and the like base background color on backdrop windows */
@define-color theme_unfocused_base_color #2a2c39;
/* base background color of selections on backdrop windows */
@define-color theme_unfocused_selected_bg_color rgba(189, 147, 249, 0.5);
/* text/foreground color of selections on backdrop windows */
@define-color theme_unfocused_selected_fg_color #f8f8f2;
/* widgets main borders color */
@define-color borders rgba(25, 26, 34, 0.9);
/* widgets main borders color on backdrop windows */
@define-color unfocused_borders rgba(26, 27, 35, 0.91);
/* these are pretty self explicative */
@define-color warning_color #ff9f39;
@define-color error_color #ff3c3c;
@define-color success_color #4caec3;
@define-color fg_color #f8f8f2;
@define-color text_color #f8f8f2;
@define-color bg_color #1e1f29;
@define-color base_color #282a36;
@define-color selected_bg_color rgba(189, 147, 249, 0.5);
@define-color selected_fg_color #f8f8f2;
@define-color unfocused_fg_color #8b8c8e;
@define-color unfocused_text_color #f8f8f2;
@define-color unfocused_bg_color #1e1f29;
@define-color unfocused_base_color #2a2c39;
@define-color unfocused_selected_bg_color rgba(189, 147, 249, 0.5);
@define-color unfocused_selected_fg_color #f8f8f2;
/* these colors are exported for the window manager and shouldn't be used in applications,
read if you used those and something break with a version upgrade you're on your own... */
@define-color wm_title shade(#f8f8f2, 1.8);
@define-color wm_unfocused_title #8b8c8e;
@define-color wm_highlight rgba(0, 0, 0, 0);
@define-color wm_borders_edge rgba(255, 255, 255, 0.1);
@define-color wm_bg_a shade(#1e1f29, 1.2);
@define-color wm_bg_b #1e1f29;
@define-color wm_shadow alpha(black, 0.35);
@define-color wm_border alpha(black, 0.18);
@define-color wm_button_hover_color_a shade(#1e1f29, 1.3);
@define-color wm_button_hover_color_b #1e1f29;
@define-color wm_button_active_color_a shade(#1e1f29, 0.85);
@define-color wm_button_active_color_b shade(#1e1f29, 0.89);
@define-color wm_button_active_color_c shade(#1e1f29, 0.9);
@define-color content_view_bg #282a36;
@define-color budgie_tasklist_indicator_color rgba(189, 147, 249, 0.5);
@define-color budgie_tasklist_indicator_color_active rgba(189, 147, 249, 0.5);
@define-color placeholder_text_color #cfcfcd;
@define-color STRAWBERRY_100 #ff8c82;
@define-color STRAWBERRY_300 #ed5353;
@define-color STRAWBERRY_500 #c6262e;
@define-color STRAWBERRY_700 #a10705;
@define-color STRAWBERRY_900 #7a0000;
@define-color ORANGE_100 #ffc27d;
@define-color ORANGE_300 #ffa154;
@define-color ORANGE_500 #f37329;
@define-color ORANGE_700 #cc3b02;
@define-color ORANGE_900 #a62100;
@define-color BANANA_100 #fff394;
@define-color BANANA_300 #ffe16b;
@define-color BANANA_500 #f9c440;
@define-color BANANA_700 #d48e15;
@define-color BANANA_900 #ad5f00;
@define-color LIME_100 #d1ff82;
@define-color LIME_300 #9bdb4d;
@define-color LIME_500 #68b723;
@define-color LIME_700 #3a9104;
@define-color LIME_900 #206b00;
@define-color MINT_100 #89ffdd;
@define-color MINT_300 #43d6b5;
@define-color MINT_500 #28bca3;
@define-color MINT_700 #0e9a83;
@define-color MINT_900 #007367;
@define-color BLUEBERRY_100 #8cd5ff;
@define-color BLUEBERRY_300 #64baff;
@define-color BLUEBERRY_500 #3689e6;
@define-color BLUEBERRY_700 #0d52bf;
@define-color BLUEBERRY_900 #002e99;
@define-color BUBBLEGUM_100 #fe9ab8;
@define-color BUBBLEGUM_300 #f4679d;
@define-color BUBBLEGUM_500 #de3e80;
@define-color BUBBLEGUM_700 #bc245d;
@define-color BUBBLEGUM_900 #910e38;
@define-color GRAPE_100 #e4c6fa;
@define-color GRAPE_300 #cd9ef7;
@define-color GRAPE_500 #a56de2;
@define-color GRAPE_700 #7239b3;
@define-color GRAPE_900 #452981;
@define-color COCOA_100 #a3907c;
@define-color COCOA_300 #8a715e;
@define-color COCOA_500 #715344;
@define-color COCOA_700 #57392d;
@define-color COCOA_900 #3d211b;
@define-color SILVER_100 #fafafa;
@define-color SILVER_300 #d4d4d4;
@define-color SILVER_500 #abacae;
@define-color SILVER_700 #7e8087;
@define-color SILVER_900 #555761;
@define-color SLATE_100 #95a3ab;
@define-color SLATE_300 #667885;
@define-color SLATE_500 #485a6c;
@define-color SLATE_700 #273445;
@define-color SLATE_900 #0e141f;
@define-color BLACK_100 #666;
@define-color BLACK_300 #4d4d4d;
@define-color BLACK_500 #333;
@define-color BLACK_700 #1a1a1a;
@define-color BLACK_900 #000;
/*****************
* Drawing mixins *
*****************/
/*********
* Common *
*********/
* {
  padding: 0;
  -GtkToolButton-icon-spacing: 4;
  -GtkTextView-error-underline-color: #ff3c3c;
  -GtkScrolledWindow-scrollbar-spacing: 0;
  -GtkToolItemGroup-expander-size: 11;
  -GtkWidget-text-handle-width: 20;
  -GtkWidget-text-handle-height: 24;
  -GtkDialog-button-spacing: 4;
  -GtkDialog-action-area-border: 0;
  outline-color: rgba(248, 248, 242, 0.3);
  outline-style: dashed;
  outline-offset: -3px;
  outline-width: 1px;
  -gtk-outline-radius: 2px;
  -gtk-secondary-caret-color: rgba(189, 147, 249, 0.5); }

/***********
 * Widgets *
 ***********/
/***************
* Action bars *
***************/
.action-bar {
  background-color: #08090c;
  border: solid rgba(25, 26, 34, 0.9);
  border-width: 1px 0 0 0;
  color: #f8f8f2;
  box-shadow: none; }
  .action-bar:backdrop {
    background-color: #08090c;
    box-shadow: none;
    -gtk-icon-effect: dim; }
  .action-bar:first-child {
    border-radius: 6px 6px 0px 0px;
    border-width: 1px 1px 0px 1px; }
  .action-bar:last-child {
    border-radius: 0 0 6px 6px;
    border-width: 0px 1px 1px 1px; }

/*********************
 * App Notifications *
 *********************/
.app-notification,
.app-notification.frame {
  padding: 10px;
  border-radius: 0 0 5px 5px;
  background-color: rgba(20, 23, 26, 0.8);
  background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0.2), transparent 2px);
  background-clip: padding-box; }
  .app-notification:backdrop,
  .app-notification.frame:backdrop {
    background-image: none;
    transition: 200ms ease-out; }
  .app-notification border,
  .app-notification.frame border {
    border: none; }

/***************
 * Base States *
 ***************/
.background {
  color: #f8f8f2;
  background-color: #1e1f29; }
  .background:backdrop {
    color: #8b8c8e;
    background-color: #1e1f29;
    text-shadow: none;
    -gtk-icon-shadow: none; }
  .background.chromium {
    background-color: #2f313f; }

/*
   These wildcard seems unavoidable, need to investigate.
   Wildcards are bad and troublesome, use them with care,
   or better, just don't.
   Everytime a wildcard is used a kitten dies, painfully.
*/
selection {
  background-color: rgba(189, 147, 249, 0.5);
  color: #f8f8f2; }

*:disabled {
  -gtk-icon-effect: dim; }

.gtkstyle-fallback {
  color: #f8f8f2;
  background-color: #1e1f29; }
  .gtkstyle-fallback:hover {
    color: #f8f8f2;
    background-color: #343546; }
  .gtkstyle-fallback:active {
    color: #f8f8f2;
    background-color: #08090c; }
  .gtkstyle-fallback:disabled {
    color: #8b8c8e;
    background-color: #22232e; }
  .gtkstyle-fallback:selected {
    color: #f8f8f2;
    background-color: rgba(189, 147, 249, 0.5); }

.view, iconview,
.view text,
iconview text,
textview text {
  color: #f8f8f2;
  background-color: #282a36; }
  .view:backdrop, iconview:backdrop,
  .view text:backdrop,
  iconview text:backdrop,
  textview text:backdrop {
    color: #cfcfcd;
    background-color: #2a2c39; }
  .view:selected:focus, iconview:selected:focus, .view:selected, iconview:selected,
  .view text:selected:focus,
  iconview text:selected:focus,
  textview text:selected:focus,
  .view text:selected,
  iconview text:selected,
  textview text:selected {
    border-radius: 3px; }

textview border {
  background-color: #232530; }

.rubberband,
rubberband,
flowbox rubberband,
.content-view rubberband,
treeview.view rubberband {
  border: 1px solid rgba(159, 99, 246, 0.5);
  background-color: rgba(159, 99, 246, 0.2); }

flowbox flowboxchild {
  padding: 3px;
  border-radius: 3px; }
  flowbox flowboxchild:selected {
    outline-offset: -2px; }

label {
  caret-color: currentColor; }
  label.separator {
    color: #f8f8f2; }
    label.separator:backdrop {
      color: #8b8c8e; }
  label selection {
    background-color: rgba(189, 147, 249, 0.5);
    color: #f8f8f2; }
  label:disabled {
    color: #8b8c8e; }
    label:disabled:backdrop {
      color: #3e4055; }
  label:backdrop {
    color: #8b8c8e; }

.dim-label, label.separator, .titlebar:not(headerbar) .subtitle,
headerbar .subtitle {
  opacity: 0.55;
  text-shadow: none; }

assistant .sidebar {
  background-color: #282a36;
  border-top: 1px solid rgba(25, 26, 34, 0.9); }
  assistant .sidebar:backdrop {
    background-color: #2a2c39;
    border-color: rgba(26, 27, 35, 0.91); }
assistant.csd .sidebar {
  border-top-style: none; }
assistant .sidebar label {
  padding: 6px 12px; }
assistant .sidebar label.highlight {
  background-color: #4a4a51; }

.app-notification,
.app-notification.frame, .osd .scale-popup, .csd popover.background.touch-selection, .csd popover.background.magnifier, popover.background.touch-selection, popover.background.magnifier, .csd popover.background.osd, popover.background.osd, .osd {
  color: #fefefe;
  border: none;
  background-color: rgba(20, 23, 26, 0.8);
  background-clip: padding-box;
  outline-color: rgba(254, 254, 254, 0.3);
  text-shadow: 0 1px black;
  -gtk-icon-shadow: 0 1px black; }
  .app-notification:backdrop, .osd .scale-popup:backdrop, popover.background.touch-selection:backdrop, popover.background.magnifier:backdrop, popover.background.osd:backdrop, .osd:backdrop {
    text-shadow: none;
    -gtk-icon-shadow: none; }

*:selected {
  background: rgba(189, 147, 249, 0.5);
  color: #f8f8f2; }

/***********
 * Buttons *
 ***********/
@keyframes needs_attention {
  from {
    background-image: -gtk-gradient(radial, center center, 0, center center, 0.01, to(rgba(233, 219, 253, 0.5)), to(transparent)); }
  to {
    background-image: -gtk-gradient(radial, center center, 0, center center, 0.5, to(rgba(189, 147, 249, 0.5)), to(transparent)); } }
notebook > header > tabs > arrow,
button {
  min-height: 24px;
  min-width: 16px;
  padding: 4px 8px;
  border: none;
  border-radius: 3px;
  transition: all 200ms cubic-bezier(0.25, 0.46, 0.45, 0.94);
  font-weight: normal;
  color: #f8f8f2;
  outline-color: rgba(248, 248, 242, 0.3);
  background-color: #282a36;
  text-shadow: none;
  border: 1px solid #282a36;
  box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
  notebook > header > tabs > arrow,
  button.flat {
    border-color: transparent;
    background-color: transparent;
    background-image: none;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0);
    text-shadow: none;
    -gtk-icon-shadow: none;
    transition: none; }
    notebook > header > tabs > arrow:hover,
    button.flat:hover {
      transition: all 200ms cubic-bezier(0.25, 0.46, 0.45, 0.94);
      transition-duration: 500ms; }
      notebook > header > tabs > arrow:hover:active,
      button.flat:hover:active {
        transition: all 200ms cubic-bezier(0.25, 0.46, 0.45, 0.94); }
  notebook > header > tabs > arrow:hover,
  button:hover {
    color: #f8f8f2;
    outline-color: rgba(248, 248, 242, 0.3);
    background-color: rgba(189, 147, 249, 0.5);
    text-shadow: none;
    box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1);
    -gtk-icon-effect: highlight; }
  notebook > header > tabs > arrow:active, notebook > header > tabs > arrow:checked,
  button:active,
  button:checked {
    color: #f8f8f2;
    outline-color: rgba(248, 248, 242, 0.3);
    background-color: rgba(174, 123, 248, 0.5);
    text-shadow: none;
    box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1);
    transition-duration: 50ms; }
  notebook > header > tabs > arrow:backdrop, notebook > header > tabs > arrow:backdrop,
  button:backdrop.flat,
  button:backdrop {
    color: #cfcfcd;
    outline-color: rgba(248, 248, 242, 0.3);
    background-color: #2a2c39;
    text-shadow: none;
    box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1);
    transition: 200ms ease-out;
    -gtk-icon-effect: none; }
    notebook > header > tabs > arrow:backdrop:active, notebook > header > tabs > arrow:backdrop:checked, notebook > header > tabs > arrow:backdrop:active, notebook > header > tabs > arrow:backdrop:checked,
    button:backdrop.flat:active,
    button:backdrop.flat:checked,
    button:backdrop:active,
    button:backdrop:checked {
      color: rgba(248, 248, 242, 0.7);
      outline-color: rgba(248, 248, 242, 0.3);
      background-color: rgba(189, 147, 249, 0.5);
      text-shadow: none;
      box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
      notebook > header > tabs > arrow:backdrop:active label, notebook > header > tabs > arrow:backdrop:checked label, notebook > header > tabs > arrow:backdrop:active label, notebook > header > tabs > arrow:backdrop:checked label,
      button:backdrop.flat:active label,
      button:backdrop.flat:checked label,
      button:backdrop:active label,
      button:backdrop:checked label {
        color: rgba(248, 248, 242, 0.7); }
    notebook > header > tabs > arrow:backdrop:disabled, notebook > header > tabs > arrow:backdrop:disabled,
    button:backdrop.flat:disabled,
    button:backdrop:disabled {
      color: #cfcfcd;
      outline-color: rgba(248, 248, 242, 0.3);
      background-color: #22232e;
      text-shadow: none;
      box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
      notebook > header > tabs > arrow:backdrop:disabled:active, notebook > header > tabs > arrow:backdrop:disabled:checked, notebook > header > tabs > arrow:backdrop:disabled:active, notebook > header > tabs > arrow:backdrop:disabled:checked,
      button:backdrop.flat:disabled:active,
      button:backdrop.flat:disabled:checked,
      button:backdrop:disabled:active,
      button:backdrop:disabled:checked {
        color: rgba(248, 248, 242, 0.7);
        outline-color: rgba(248, 248, 242, 0.3);
        background-color: rgba(189, 147, 249, 0.5);
        text-shadow: none;
        box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
  notebook > header > tabs > arrow:backdrop, notebook > header > tabs > arrow:disabled, notebook > header > tabs > arrow:backdrop:disabled,
  button.flat:backdrop,
  button.flat:disabled,
  button.flat:backdrop:disabled {
    border-color: transparent;
    background-color: transparent;
    background-image: none;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0);
    text-shadow: none;
    -gtk-icon-shadow: none; }
  notebook > header > tabs > arrow:disabled,
  button:disabled {
    color: #cfcfcd;
    outline-color: rgba(248, 248, 242, 0.3);
    background-color: #22232e;
    text-shadow: none;
    box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
    notebook > header > tabs > arrow:disabled:active, notebook > header > tabs > arrow:disabled:checked,
    button:disabled:active,
    button:disabled:checked {
      color: rgba(248, 248, 242, 0.7);
      outline-color: rgba(248, 248, 242, 0.3);
      background-color: rgba(189, 147, 249, 0.5);
      text-shadow: none;
      box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
      notebook > header > tabs > arrow:disabled:active label, notebook > header > tabs > arrow:disabled:checked label,
      button:disabled:active label,
      button:disabled:checked label {
        color: rgba(248, 248, 242, 0.7); }
  notebook > header > tabs > arrow.image-button,
  button.image-button {
    min-width: 24px;
    padding-left: 4px;
    padding-right: 4px; }
  notebook > header > tabs > arrow.text-button,
  button.text-button {
    padding-left: 16px;
    padding-right: 16px; }
  notebook > header > tabs > arrow.text-button.image-button,
  button.text-button.image-button {
    padding-left: 8px;
    padding-right: 8px; }
    notebook > header > tabs > arrow.text-button.image-button label,
    button.text-button.image-button label {
      padding-left: 8px;
      padding-right: 8px; }
  combobox:drop(active) button.combo, notebook > header > tabs > arrow:drop(active),
  button:drop(active) {
    color: #50fa7a;
    border-color: #50fa7a;
    box-shadow: inset 0 0 0 1px #50fa7a; }
row:selected button.flat:not(:active):not(:checked):not(:hover):not(disabled) {
  color: #f8f8f2;
  border-color: transparent; }
  row:selected button.flat:not(:active):not(:checked):not(:hover):not(disabled):backdrop {
    color: #8b8c8e; }
button.osd {
  min-width: 24px;
  min-height: 32px;
  color: #fefefe;
  border-radius: 5px;
  outline-color: rgba(254, 254, 254, 0.3);
  color: #fefefe;
  border-color: rgba(0, 0, 0, 0.7);
  background-color: rgba(20, 23, 26, 0.8);
  background-clip: padding-box;
  box-shadow: inset 0 1px rgba(255, 255, 255, 0.1);
  text-shadow: 0 1px black;
  -gtk-icon-shadow: 0 1px black;
  outline-color: rgba(254, 254, 254, 0.3);
  border: none;
  box-shadow: none; }
  button.osd.image-button {
    min-width: 32px; }
  button.osd:hover {
    color: white;
    border-color: rgba(0, 0, 0, 0.7);
    background-image: linear-gradient(to bottom, rgba(47, 54, 61, 0.8), rgba(47, 54, 61, 0.8));
    background-clip: padding-box;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1);
    text-shadow: 0 1px black;
    -gtk-icon-shadow: 0 1px black;
    outline-color: rgba(254, 254, 254, 0.3);
    border: none;
    box-shadow: none; }
  button.osd:active,
  button.osd:checked {
    color: white;
    border-color: rgba(0, 0, 0, 0.7);
    background-image: linear-gradient(to bottom, rgba(33, 38, 43, 0.8), rgba(33, 38, 43, 0.8));
    background-clip: padding-box;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1);
    text-shadow: none;
    -gtk-icon-shadow: none;
    outline-color: rgba(254, 254, 254, 0.3);
    border: none;
    box-shadow: none; }
  button.osd:disabled:backdrop,
  button.osd:disabled {
    color: #898b8c;
    border-color: rgba(0, 0, 0, 0.7);
    background-image: linear-gradient(to bottom, rgba(43, 46, 49, 0.5), rgba(43, 46, 49, 0.5));
    background-clip: padding-box;
    box-shadow: none;
    text-shadow: none;
    -gtk-icon-shadow: none;
    border: none; }
  button.osd:backdrop {
    color: #fefefe;
    border-color: rgba(0, 0, 0, 0.7);
    background-image: linear-gradient(to bottom, rgba(20, 23, 26, 0.8), rgba(20, 23, 26, 0.8));
    background-clip: padding-box;
    box-shadow: none;
    text-shadow: none;
    -gtk-icon-shadow: none;
    border: none; }
.app-notification button,
.app-notification.frame button, .csd popover.background.touch-selection button, .csd popover.background.magnifier button, popover.background.touch-selection button, popover.background.magnifier button,
.osd button {
  color: #fefefe;
  border-color: rgba(0, 0, 0, 0.7);
  background-color: rgba(20, 23, 26, 0.8);
  background-clip: padding-box;
  box-shadow: inset 0 1px rgba(255, 255, 255, 0.1);
  text-shadow: 0 1px black;
  -gtk-icon-shadow: 0 1px black;
  outline-color: rgba(254, 254, 254, 0.3); }
  .app-notification button:hover, popover.background.touch-selection button:hover, popover.background.magnifier button:hover,
  .osd button:hover {
    color: white;
    border-color: rgba(0, 0, 0, 0.7);
    background-image: linear-gradient(to bottom, rgba(47, 54, 61, 0.8), rgba(47, 54, 61, 0.8));
    background-clip: padding-box;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1);
    text-shadow: 0 1px black;
    -gtk-icon-shadow: 0 1px black;
    outline-color: rgba(254, 254, 254, 0.3); }
  .app-notification button:active:backdrop, popover.background.touch-selection button:active:backdrop, popover.background.magnifier button:active:backdrop, .app-notification button:active, popover.background.touch-selection button:active, popover.background.magnifier button:active, .app-notification button:checked:backdrop, popover.background.touch-selection button:checked:backdrop, popover.background.magnifier button:checked:backdrop, .app-notification button:checked, popover.background.touch-selection button:checked, popover.background.magnifier button:checked,
  .osd button:active:backdrop,
  .osd button:active,
  .osd button:checked:backdrop,
  .osd button:checked {
    color: white;
    border-color: rgba(0, 0, 0, 0.7);
    background-image: linear-gradient(to bottom, rgba(33, 38, 43, 0.8), rgba(33, 38, 43, 0.8));
    background-clip: padding-box;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1);
    text-shadow: none;
    -gtk-icon-shadow: none;
    outline-color: rgba(254, 254, 254, 0.3); }
  .app-notification button:disabled:backdrop, popover.background.touch-selection button:disabled:backdrop, popover.background.magnifier button:disabled:backdrop, .app-notification button:disabled, popover.background.touch-selection button:disabled, popover.background.magnifier button:disabled,
  .osd button:disabled:backdrop,
  .osd button:disabled {
    color: #898b8c;
    border-color: rgba(0, 0, 0, 0.7);
    background-image: linear-gradient(to bottom, rgba(43, 46, 49, 0.5), rgba(43, 46, 49, 0.5));
    background-clip: padding-box;
    box-shadow: none;
    text-shadow: none;
    -gtk-icon-shadow: none; }
  .app-notification button:backdrop, popover.background.touch-selection button:backdrop, popover.background.magnifier button:backdrop,
  .osd button:backdrop {
    color: #fefefe;
    border-color: rgba(0, 0, 0, 0.7);
    background-image: linear-gradient(to bottom, rgba(20, 23, 26, 0.8), rgba(20, 23, 26, 0.8));
    background-clip: padding-box;
    box-shadow: none;
    text-shadow: none;
    -gtk-icon-shadow: none; }
  .app-notification button.flat, popover.background.touch-selection button.flat, popover.background.magnifier button.flat,
  .osd button.flat {
    border-color: transparent;
    background-color: transparent;
    background-image: none;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0);
    text-shadow: none;
    -gtk-icon-shadow: none;
    box-shadow: none;
    text-shadow: 0 1px black;
    -gtk-icon-shadow: 0 1px black; }
    .app-notification button.flat:hover, popover.background.touch-selection button.flat:hover, popover.background.magnifier button.flat:hover,
    .osd button.flat:hover {
      color: white;
      border-color: rgba(0, 0, 0, 0.7);
      background-image: linear-gradient(to bottom, rgba(47, 54, 61, 0.8), rgba(47, 54, 61, 0.8));
      background-clip: padding-box;
      box-shadow: inset 0 1px rgba(255, 255, 255, 0.1);
      text-shadow: 0 1px black;
      -gtk-icon-shadow: 0 1px black;
      outline-color: rgba(254, 254, 254, 0.3); }
    .app-notification button.flat:disabled, popover.background.touch-selection button.flat:disabled, popover.background.magnifier button.flat:disabled,
    .osd button.flat:disabled {
      color: #898b8c;
      border-color: rgba(0, 0, 0, 0.7);
      background-image: linear-gradient(to bottom, rgba(43, 46, 49, 0.5), rgba(43, 46, 49, 0.5));
      background-clip: padding-box;
      box-shadow: none;
      text-shadow: none;
      -gtk-icon-shadow: none;
      background-image: none;
      border-color: transparent;
      box-shadow: none; }
    .app-notification button.flat:backdrop, popover.background.touch-selection button.flat:backdrop, popover.background.magnifier button.flat:backdrop,
    .osd button.flat:backdrop {
      border-color: transparent;
      background-color: transparent;
      background-image: none;
      box-shadow: inset 0 1px rgba(255, 255, 255, 0);
      text-shadow: none;
      -gtk-icon-shadow: none; }
    .app-notification button.flat:active, popover.background.touch-selection button.flat:active, popover.background.magnifier button.flat:active, .app-notification button.flat:checked, popover.background.touch-selection button.flat:checked, popover.background.magnifier button.flat:checked,
    .osd button.flat:active,
    .osd button.flat:checked {
      color: white;
      border-color: rgba(0, 0, 0, 0.7);
      background-image: linear-gradient(to bottom, rgba(33, 38, 43, 0.8), rgba(33, 38, 43, 0.8));
      background-clip: padding-box;
      box-shadow: inset 0 1px rgba(255, 255, 255, 0.1);
      text-shadow: none;
      -gtk-icon-shadow: none;
      outline-color: rgba(254, 254, 254, 0.3); }
button.suggested-action {
  font-weight: normal;
  color: white;
  outline-color: rgba(255, 255, 255, 0.3);
  background-color: #bd93f9;
  text-shadow: none;
  border: 1px solid #bd93f9;
  box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
  .selection-mode button.titlebutton, button.suggested-action.flat {
    border-color: transparent;
    background-color: transparent;
    background-image: none;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0);
    text-shadow: none;
    -gtk-icon-shadow: none;
    color: #bd93f9; }
  button.suggested-action:hover {
    color: white;
    outline-color: rgba(255, 255, 255, 0.3);
    background-color: #bd93f9;
    text-shadow: none;
    box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
  button.suggested-action:active, button.suggested-action:checked {
    color: white;
    outline-color: rgba(255, 255, 255, 0.3);
    background-color: #bd93f9;
    text-shadow: none;
    box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
  .selection-mode button.titlebutton:backdrop, button.suggested-action:backdrop, button.suggested-action.flat:backdrop {
    color: rgba(255, 255, 255, 0.4);
    outline-color: rgba(255, 255, 255, 0.3);
    background-color: #bd93f9;
    text-shadow: none;
    box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
    .selection-mode button.titlebutton:backdrop label, button.suggested-action:backdrop label, button.suggested-action.flat:backdrop label {
      color: rgba(255, 255, 255, 0.5); }
    .selection-mode button.titlebutton:backdrop:active, .selection-mode button.titlebutton:backdrop:checked, button.suggested-action:backdrop:active, button.suggested-action:backdrop:checked, button.suggested-action.flat:backdrop:active, button.suggested-action.flat:backdrop:checked {
      color: rgba(248, 248, 242, 0.7);
      outline-color: rgba(255, 255, 255, 0.3);
      background-color: rgba(189, 147, 249, 0.5);
      text-shadow: none;
      box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
      .selection-mode button.titlebutton:backdrop:active label, .selection-mode button.titlebutton:backdrop:checked label, button.suggested-action:backdrop:active label, button.suggested-action:backdrop:checked label, button.suggested-action.flat:backdrop:active label, button.suggested-action.flat:backdrop:checked label {
        color: rgba(248, 248, 242, 0.7); }
    .selection-mode button.titlebutton:backdrop:disabled, button.suggested-action:backdrop:disabled, button.suggested-action.flat:backdrop:disabled {
      color: white;
      outline-color: rgba(255, 255, 255, 0.3);
      background-color: #bd93f9;
      text-shadow: none;
      box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
      .selection-mode button.titlebutton:backdrop:disabled label, button.suggested-action:backdrop:disabled label, button.suggested-action.flat:backdrop:disabled label {
        color: rgba(255, 255, 255, 0.5); }
      .selection-mode button.titlebutton:backdrop:disabled:active, .selection-mode button.titlebutton:backdrop:disabled:checked, button.suggested-action:backdrop:disabled:active, button.suggested-action:backdrop:disabled:checked, button.suggested-action.flat:backdrop:disabled:active, button.suggested-action.flat:backdrop:disabled:checked {
        color: rgba(248, 248, 242, 0.7);
        outline-color: rgba(255, 255, 255, 0.3);
        background-color: rgba(189, 147, 249, 0.5);
        text-shadow: none;
        box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
  .selection-mode button.titlebutton:backdrop, .selection-mode button.titlebutton:disabled, .selection-mode button.titlebutton:backdrop:disabled, button.suggested-action.flat:backdrop, button.suggested-action.flat:disabled, button.suggested-action.flat:backdrop:disabled {
    border-color: transparent;
    background-color: transparent;
    background-image: none;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0);
    text-shadow: none;
    -gtk-icon-shadow: none;
    color: rgba(189, 147, 249, 0.8); }
  button.suggested-action:disabled {
    color: white;
    outline-color: rgba(255, 255, 255, 0.3);
    background-color: #bd93f9;
    text-shadow: none;
    box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
    button.suggested-action:disabled label {
      color: rgba(248, 248, 242, 0.8); }
    button.suggested-action:disabled:active, button.suggested-action:disabled:checked {
      color: rgba(248, 248, 242, 0.7);
      outline-color: rgba(255, 255, 255, 0.3);
      background-color: #bd93f9;
      text-shadow: none;
      box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
      button.suggested-action:disabled:active label, button.suggested-action:disabled:checked label {
        color: rgba(248, 248, 242, 0.7); }
  .osd button.suggested-action {
    color: #fefefe;
    border-color: rgba(0, 0, 0, 0.7);
    background-color: rgba(189, 147, 249, 0.5);
    background-clip: padding-box;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1);
    text-shadow: 0 1px black;
    -gtk-icon-shadow: 0 1px black;
    outline-color: rgba(254, 254, 254, 0.3); }
    .osd button.suggested-action:hover {
      color: white;
      border-color: rgba(0, 0, 0, 0.7);
      background-image: linear-gradient(to bottom, rgba(189, 147, 249, 0.7), rgba(189, 147, 249, 0.7));
      background-clip: padding-box;
      box-shadow: inset 0 1px rgba(255, 255, 255, 0.1);
      text-shadow: 0 1px black;
      -gtk-icon-shadow: 0 1px black;
      outline-color: rgba(254, 254, 254, 0.3); }
    .osd button.suggested-action:active:backdrop, .osd button.suggested-action:active, .osd button.suggested-action:checked:backdrop, .osd button.suggested-action:checked {
      color: white;
      border-color: rgba(0, 0, 0, 0.7);
      background-image: linear-gradient(to bottom, #bd93f9, #bd93f9);
      background-clip: padding-box;
      box-shadow: inset 0 1px rgba(255, 255, 255, 0.1);
      text-shadow: none;
      -gtk-icon-shadow: none;
      outline-color: rgba(254, 254, 254, 0.3); }
    .osd button.suggested-action:disabled:backdrop, .osd button.suggested-action:disabled {
      color: #898b8c;
      border-color: rgba(0, 0, 0, 0.7);
      background-image: linear-gradient(to bottom, rgba(43, 46, 49, 0.5), rgba(43, 46, 49, 0.5));
      background-clip: padding-box;
      box-shadow: none;
      text-shadow: none;
      -gtk-icon-shadow: none; }
    .osd button.suggested-action:backdrop {
      color: #fefefe;
      border-color: rgba(0, 0, 0, 0.7);
      background-image: linear-gradient(to bottom, rgba(189, 147, 249, 0.5), rgba(189, 147, 249, 0.5));
      background-clip: padding-box;
      box-shadow: none;
      text-shadow: none;
      -gtk-icon-shadow: none; }
button.destructive-action {
  font-weight: normal;
  color: white;
  outline-color: rgba(255, 255, 255, 0.3);
  background-color: #ff2222;
  text-shadow: none;
  border: 1px solid #ff2222;
  box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
  button.destructive-action.flat {
    border-color: transparent;
    background-color: transparent;
    background-image: none;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0);
    text-shadow: none;
    -gtk-icon-shadow: none;
    color: #ff2222; }
  button.destructive-action:hover {
    color: white;
    outline-color: rgba(255, 255, 255, 0.3);
    background-color: #ff2222;
    text-shadow: none;
    box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
  button.destructive-action:active, button.destructive-action:checked {
    color: white;
    outline-color: rgba(255, 255, 255, 0.3);
    background-color: #ff2222;
    text-shadow: none;
    box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
  button.destructive-action:backdrop, button.destructive-action.flat:backdrop {
    color: rgba(255, 255, 255, 0.4);
    outline-color: rgba(255, 255, 255, 0.3);
    background-color: #ff2222;
    text-shadow: none;
    box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
    button.destructive-action:backdrop label, button.destructive-action.flat:backdrop label {
      color: rgba(255, 255, 255, 0.5); }
    button.destructive-action:backdrop:active, button.destructive-action:backdrop:checked, button.destructive-action.flat:backdrop:active, button.destructive-action.flat:backdrop:checked {
      color: rgba(248, 248, 242, 0.7);
      outline-color: rgba(255, 255, 255, 0.3);
      background-color: rgba(189, 147, 249, 0.5);
      text-shadow: none;
      box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
      button.destructive-action:backdrop:active label, button.destructive-action:backdrop:checked label, button.destructive-action.flat:backdrop:active label, button.destructive-action.flat:backdrop:checked label {
        color: rgba(248, 248, 242, 0.7); }
    button.destructive-action:backdrop:disabled, button.destructive-action.flat:backdrop:disabled {
      color: white;
      outline-color: rgba(255, 255, 255, 0.3);
      background-color: #ff2222;
      text-shadow: none;
      box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
      button.destructive-action:backdrop:disabled label, button.destructive-action.flat:backdrop:disabled label {
        color: rgba(255, 255, 255, 0.5); }
      button.destructive-action:backdrop:disabled:active, button.destructive-action:backdrop:disabled:checked, button.destructive-action.flat:backdrop:disabled:active, button.destructive-action.flat:backdrop:disabled:checked {
        color: rgba(248, 248, 242, 0.7);
        outline-color: rgba(255, 255, 255, 0.3);
        background-color: rgba(189, 147, 249, 0.5);
        text-shadow: none;
        box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
  button.destructive-action.flat:backdrop, button.destructive-action.flat:disabled, button.destructive-action.flat:backdrop:disabled {
    border-color: transparent;
    background-color: transparent;
    background-image: none;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0);
    text-shadow: none;
    -gtk-icon-shadow: none;
    color: rgba(255, 34, 34, 0.8); }
  button.destructive-action:disabled {
    color: white;
    outline-color: rgba(255, 255, 255, 0.3);
    background-color: #ff2222;
    text-shadow: none;
    box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
    button.destructive-action:disabled label {
      color: rgba(248, 248, 242, 0.8); }
    button.destructive-action:disabled:active, button.destructive-action:disabled:checked {
      color: rgba(248, 248, 242, 0.7);
      outline-color: rgba(255, 255, 255, 0.3);
      background-color: #ff2222;
      text-shadow: none;
      box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
      button.destructive-action:disabled:active label, button.destructive-action:disabled:checked label {
        color: rgba(248, 248, 242, 0.7); }
  .osd button.destructive-action {
    color: #fefefe;
    border-color: rgba(0, 0, 0, 0.7);
    background-color: rgba(255, 34, 34, 0.5);
    background-clip: padding-box;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1);
    text-shadow: 0 1px black;
    -gtk-icon-shadow: 0 1px black;
    outline-color: rgba(254, 254, 254, 0.3); }
    .osd button.destructive-action:hover {
      color: white;
      border-color: rgba(0, 0, 0, 0.7);
      background-image: linear-gradient(to bottom, rgba(255, 34, 34, 0.7), rgba(255, 34, 34, 0.7));
      background-clip: padding-box;
      box-shadow: inset 0 1px rgba(255, 255, 255, 0.1);
      text-shadow: 0 1px black;
      -gtk-icon-shadow: 0 1px black;
      outline-color: rgba(254, 254, 254, 0.3); }
    .osd button.destructive-action:active:backdrop, .osd button.destructive-action:active, .osd button.destructive-action:checked:backdrop, .osd button.destructive-action:checked {
      color: white;
      border-color: rgba(0, 0, 0, 0.7);
      background-image: linear-gradient(to bottom, #ff2222, #ff2222);
      background-clip: padding-box;
      box-shadow: inset 0 1px rgba(255, 255, 255, 0.1);
      text-shadow: none;
      -gtk-icon-shadow: none;
      outline-color: rgba(254, 254, 254, 0.3); }
    .osd button.destructive-action:disabled:backdrop, .osd button.destructive-action:disabled {
      color: #898b8c;
      border-color: rgba(0, 0, 0, 0.7);
      background-image: linear-gradient(to bottom, rgba(43, 46, 49, 0.5), rgba(43, 46, 49, 0.5));
      background-clip: padding-box;
      box-shadow: none;
      text-shadow: none;
      -gtk-icon-shadow: none; }
    .osd button.destructive-action:backdrop {
      color: #fefefe;
      border-color: rgba(0, 0, 0, 0.7);
      background-image: linear-gradient(to bottom, rgba(255, 34, 34, 0.5), rgba(255, 34, 34, 0.5));
      background-clip: padding-box;
      box-shadow: none;
      text-shadow: none;
      -gtk-icon-shadow: none; }
.stack-switcher > button {
  outline-offset: -3px; }
  .stack-switcher > button > label {
    padding-left: 6px;
    padding-right: 6px; }
  .stack-switcher > button > image {
    padding-left: 6px;
    padding-right: 6px;
    padding-top: 3px;
    padding-bottom: 3px; }
  .stack-switcher > button.text-button {
    padding-left: 10px;
    padding-right: 10px; }
  .stack-switcher > button.image-button {
    padding-left: 2px;
    padding-right: 2px; }
  .stack-switcher > button.needs-attention:active > label,
  .stack-switcher > button.needs-attention:active > image, .stack-switcher > button.needs-attention:checked > label,
  .stack-switcher > button.needs-attention:checked > image {
    animation: none;
    background-image: none; }
.inline-toolbar button, .inline-toolbar button:backdrop {
  border-radius: 2px;
  border-width: 1px; }
.primary-toolbar button {
  -gtk-icon-shadow: none; }

.stack-switcher > button.needs-attention > label,
.stack-switcher > button.needs-attention > image, stacksidebar row.needs-attention > label {
  animation: needs_attention 150ms ease-in;
  background-image: -gtk-gradient(radial, center center, 0, center center, 0.5, to(rgba(233, 219, 253, 0.5)), to(transparent)), -gtk-gradient(radial, center center, 0, center center, 0.45, to(rgba(0, 0, 0, 0.888627451)), to(transparent));
  background-size: 6px 6px, 6px 6px;
  background-repeat: no-repeat;
  background-position: right 3px, right 2px; }
  .stack-switcher > button.needs-attention > label:backdrop,
  .stack-switcher > button.needs-attention > image:backdrop, stacksidebar row.needs-attention > label:backdrop {
    background-size: 6px 6px, 0 0; }
  .stack-switcher > button.needs-attention > label:dir(rtl),
  .stack-switcher > button.needs-attention > image:dir(rtl), stacksidebar row.needs-attention > label:dir(rtl) {
    background-position: left 3px, left 2px; }

toolbar button:hover {
  font-weight: normal;
  color: #f8f8f2;
  outline-color: rgba(248, 248, 242, 0.3);
  background-color: #0f0f14;
  text-shadow: none;
  border: 1px solid #0f0f14;
  box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
toolbar button:active {
  font-weight: normal;
  color: #f8f8f2;
  outline-color: rgba(248, 248, 242, 0.3);
  background-color: #040406;
  text-shadow: none;
  border: 1px solid #040406;
  box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }

.inline-toolbar toolbutton > button {
  border-color: transparent;
  background-color: transparent;
  background-image: none;
  box-shadow: inset 0 1px rgba(255, 255, 255, 0);
  text-shadow: none;
  -gtk-icon-shadow: none; }
  .inline-toolbar toolbutton > button:hover {
    color: rgba(189, 147, 249, 0.5); }
  .inline-toolbar toolbutton > button:active, .inline-toolbar toolbutton > button:checked {
    color: rgba(174, 123, 248, 0.5); }
  .inline-toolbar toolbutton > button:disabled {
    color: #cfcfcd; }
    .inline-toolbar toolbutton > button:disabled:active, .inline-toolbar toolbutton > button:disabled:checked {
      color: rgba(174, 123, 248, 0); }
  .inline-toolbar toolbutton > button:backdrop {
    color: #cfcfcd; }
    .inline-toolbar toolbutton > button:backdrop:active, .inline-toolbar toolbutton > button:backdrop:checked {
      color: rgba(174, 123, 248, 0.5); }
    .inline-toolbar toolbutton > button:backdrop:disabled {
      color: #cfcfcd; }
      .inline-toolbar toolbutton > button:backdrop:disabled:active, .inline-toolbar toolbutton > button:backdrop:disabled:checked {
        color: rgba(174, 123, 248, 0); }

toolbar.inline-toolbar toolbutton > button.flat:backdrop,
toolbar.inline-toolbar toolbutton:backdrop > button.flat:backdrop {
  border-color: transparent;
  box-shadow: none; }

.inline-toolbar button, .inline-toolbar button:backdrop, .linked > button, .linked > button:hover, .linked > button:active, .linked > button:checked, .linked > button:backdrop, .linked:not(.vertical) > spinbutton:not(.vertical), .linked:not(.vertical) >
entry, .linked > combobox > box > button.combo:dir(ltr), .linked > combobox > box > button.combo:dir(rtl) {
  border: 1px solid rgba(25, 26, 34, 0.9);
  border-radius: 0;
  border-right-style: none;
  box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1); }

.inline-toolbar button:first-child, .linked > button:first-child, combobox.linked button:nth-child(2):dir(rtl), .linked:not(.vertical) > combobox:first-child > box > button.combo, .linked:not(.vertical) > spinbutton:first-child:not(.vertical), .linked:not(.vertical) >
entry:first-child {
  border-top-left-radius: 3px;
  border-bottom-left-radius: 3px; }
.inline-toolbar button:last-child, .linked > button:last-child, combobox.linked button:nth-child(2):dir(ltr), .linked:not(.vertical) > combobox:last-child > box > button.combo, .linked:not(.vertical) > spinbutton:last-child:not(.vertical), .linked:not(.vertical) >
entry:last-child {
  border-top-right-radius: 3px;
  border-bottom-right-radius: 3px;
  border-right-style: solid; }
.inline-toolbar button:only-child, .linked > button:only-child, .linked:not(.vertical) > combobox:only-child > box > button.combo, .linked:not(.vertical) > spinbutton:only-child:not(.vertical), .linked:not(.vertical) >
entry:only-child {
  border-radius: 3px;
  border-style: solid; }

.linked.vertical > button, .linked.vertical > button:hover, .linked.vertical > button:active, .linked.vertical > button:checked, .linked.vertical > button:backdrop, .linked.vertical > spinbutton:not(.vertical), .linked.vertical >
entry, .linked.vertical > combobox > box > button.combo {
  border-style: solid solid none solid;
  border-radius: 0; }

.linked.vertical > button:first-child, .linked.vertical > combobox:first-child > box > button.combo, .linked.vertical > spinbutton:first-child:not(.vertical), .linked.vertical >
entry:first-child {
  border-top-left-radius: 3px;
  border-top-right-radius: 3px; }
.linked.vertical > button:last-child, .linked.vertical > combobox:last-child > box > button.combo, .linked.vertical > spinbutton:last-child:not(.vertical), .linked.vertical >
entry:last-child {
  border-bottom-left-radius: 3px;
  border-bottom-right-radius: 3px;
  border-style: solid; }
.linked.vertical > button:only-child, .linked.vertical > combobox:only-child > box > button.combo, .linked.vertical > spinbutton:only-child:not(.vertical), .linked.vertical >
entry:only-child {
  border-radius: 3px;
  border-style: solid; }

modelbutton.flat, popover.background checkbutton,
popover.background radiobutton,
.menuitem.button.flat, modelbutton.flat:backdrop, popover.background checkbutton:backdrop,
popover.background radiobutton:backdrop, modelbutton.flat:backdrop:hover, popover.background checkbutton:backdrop:hover,
popover.background radiobutton:backdrop:hover,
.menuitem.button.flat:backdrop,
.menuitem.button.flat:backdrop:hover, calendar.button, calendar.button:hover, calendar.button:backdrop, calendar.button:disabled, button:link,
button:visited, button:link:hover, button:link:active, button:link:checked,
button:visited:hover,
button:visited:active,
button:visited:checked, .scale-popup button:hover, .scale-popup button:backdrop:hover, .scale-popup button:backdrop:disabled, .scale-popup button:backdrop {
  background-color: transparent;
  background-image: none;
  border-color: transparent;
  box-shadow: inset 0 1px rgba(255, 255, 255, 0), 0 1px rgba(255, 255, 255, 0);
  text-shadow: none;
  -gtk-icon-shadow: none; }

/* menu buttons */
modelbutton.flat, popover.background checkbutton,
popover.background radiobutton,
.menuitem.button.flat {
  min-height: 26px;
  padding-left: 5px;
  padding-right: 5px;
  border-radius: 3px;
  outline-offset: -2px; }
  modelbutton.flat:hover, popover.background checkbutton:hover,
  popover.background radiobutton:hover,
  .menuitem.button.flat:hover {
    background-color: #383a4c; }
  modelbutton.flat check:last-child, popover.background checkbutton check:last-child,
  popover.background radiobutton check:last-child,
  modelbutton.flat radio:last-child,
  popover.background checkbutton radio:last-child,
  popover.background radiobutton radio:last-child,
  .menuitem.button.flat check:last-child,
  .menuitem.button.flat radio:last-child {
    margin-left: 8px; }
  modelbutton.flat check:first-child, popover.background checkbutton check:first-child,
  popover.background radiobutton check:first-child,
  modelbutton.flat radio:first-child,
  popover.background checkbutton radio:first-child,
  popover.background radiobutton radio:first-child,
  .menuitem.button.flat check:first-child,
  .menuitem.button.flat radio:first-child {
    margin-right: 8px; }

modelbutton.flat arrow, popover.background checkbutton arrow,
popover.background radiobutton arrow {
  background: none; }
  modelbutton.flat arrow:hover, popover.background checkbutton arrow:hover,
  popover.background radiobutton arrow:hover {
    background: none; }
  modelbutton.flat arrow.left, popover.background checkbutton arrow.left,
  popover.background radiobutton arrow.left {
    -gtk-icon-source: -gtk-icontheme("pan-start-symbolic"); }
  modelbutton.flat arrow.right, popover.background checkbutton arrow.right,
  popover.background radiobutton arrow.right {
    -gtk-icon-source: -gtk-icontheme("pan-end-symbolic"); }

button.color {
  padding: 4px; }
  button.color colorswatch:only-child, button.color colorswatch:only-child overlay {
    border-radius: 0; }

notebook button, list button, .view button, iconview button, popover button {
  box-shadow: inset 0px 0px 0px 1px rgba(25, 26, 34, 0.9); }
  notebook button:backdrop, list button:backdrop, .view button:backdrop, iconview button:backdrop, popover button:backdrop {
    box-shadow: inset 0px 0px 0px 1px rgba(25, 26, 34, 0.9); }
notebook .linked > button, list .linked > button, .view .linked > button, iconview .linked > button, popover .linked > button {
  box-shadow: none; }

/************
 * Calendar *
 ***********/
calendar {
  color: #f8f8f2;
  border: 1px solid rgba(25, 26, 34, 0.9); }
  calendar:selected {
    border-radius: 3px; }
  calendar.header {
    border-bottom: 1px solid rgba(0, 0, 0, 0.1);
    border-radius: 0; }
    calendar.header:backdrop {
      border-color: rgba(0, 0, 0, 0.1); }
  calendar.button {
    color: rgba(248, 248, 242, 0.45); }
    calendar.button:hover {
      color: #f8f8f2; }
    calendar.button:backdrop {
      color: rgba(139, 140, 142, 0.45); }
    calendar.button:disabled {
      color: rgba(139, 140, 142, 0.45); }
  calendar:indeterminate, calendar:indeterminate:backdrop {
    color: alpha(currentColor,0.55); }
  calendar.highlight, calendar.highlight:backdrop {
    font-size: smaller;
    color: #f8f8f2; }
  calendar:backdrop {
    color: #cfcfcd;
    border-color: rgba(26, 27, 35, 0.91); }

/*************************
 * Check and Radio Items *
 *************************/
check {
  -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-unchecked.png"), url("../assets/checkbox-unchecked@2.png"));
  -gtk-icon-shadow: none; }

radio {
  -gtk-icon-source: -gtk-scaled(url("../assets/radio-unchecked.png"), url("../assets/radio-unchecked@2.png"));
  -gtk-icon-shadow: none; }

check:hover {
  -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-unchecked-hover.png"), url("../assets/checkbox-unchecked-hover@2.png"));
  -gtk-icon-shadow: none; }

radio:hover {
  -gtk-icon-source: -gtk-scaled(url("../assets/radio-unchecked-hover.png"), url("../assets/radio-unchecked-hover@2.png"));
  -gtk-icon-shadow: none; }

check:active {
  -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-unchecked-active.png"), url("../assets/checkbox-unchecked-active@2.png"));
  -gtk-icon-shadow: none; }

radio:active {
  -gtk-icon-source: -gtk-scaled(url("../assets/radio-unchecked-active.png"), url("../assets/radio-unchecked-active@2.png"));
  -gtk-icon-shadow: none; }

check:backdrop {
  -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-unchecked.png"), url("../assets/checkbox-unchecked@2.png"));
  -gtk-icon-shadow: none; }

radio:backdrop {
  -gtk-icon-source: -gtk-scaled(url("../assets/radio-unchecked.png"), url("../assets/radio-unchecked@2.png"));
  -gtk-icon-shadow: none; }

check:disabled {
  -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-unchecked.png"), url("../assets/checkbox-unchecked@2.png"));
  -gtk-icon-shadow: none; }

radio:disabled {
  -gtk-icon-source: -gtk-scaled(url("../assets/radio-unchecked.png"), url("../assets/radio-unchecked@2.png"));
  -gtk-icon-shadow: none; }

check:disabled:backdrop {
  -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-unchecked.png"), url("../assets/checkbox-unchecked@2.png"));
  -gtk-icon-shadow: none; }

radio:disabled:backdrop {
  -gtk-icon-source: -gtk-scaled(url("../assets/radio-unchecked.png"), url("../assets/radio-unchecked@2.png"));
  -gtk-icon-shadow: none; }

check:checked {
  -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-checked.png"), url("../assets/checkbox-checked@2.png"));
  -gtk-icon-shadow: none; }

radio:checked {
  -gtk-icon-source: -gtk-scaled(url("../assets/radio-checked.png"), url("../assets/radio-checked@2.png"));
  -gtk-icon-shadow: none; }

check:checked:hover {
  -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-checked-hover.png"), url("../assets/checkbox-checked-hover@2.png"));
  -gtk-icon-shadow: none; }

radio:checked:hover {
  -gtk-icon-source: -gtk-scaled(url("../assets/radio-checked-hover.png"), url("../assets/radio-checked-hover@2.png"));
  -gtk-icon-shadow: none; }

check:checked:active {
  -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-checked-active.png"), url("../assets/checkbox-checked-active@2.png"));
  -gtk-icon-shadow: none; }

radio:checked:active {
  -gtk-icon-source: -gtk-scaled(url("../assets/radio-checked-active.png"), url("../assets/radio-checked-active@2.png"));
  -gtk-icon-shadow: none; }

check:checked:backdrop {
  -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-checked.png"), url("../assets/checkbox-checked@2.png"));
  -gtk-icon-shadow: none; }

radio:checked:backdrop {
  -gtk-icon-source: -gtk-scaled(url("../assets/radio-checked.png"), url("../assets/radio-checked@2.png"));
  -gtk-icon-shadow: none; }

check:checked:disabled {
  -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-checked.png"), url("../assets/checkbox-checked@2.png"));
  -gtk-icon-shadow: none; }

radio:checked:disabled {
  -gtk-icon-source: -gtk-scaled(url("../assets/radio-checked.png"), url("../assets/radio-checked@2.png"));
  -gtk-icon-shadow: none; }

check:checked:disabled:backdrop {
  -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-checked.png"), url("../assets/checkbox-checked@2.png"));
  -gtk-icon-shadow: none; }

radio:checked:disabled:backdrop {
  -gtk-icon-source: -gtk-scaled(url("../assets/radio-checked.png"), url("../assets/radio-checked@2.png"));
  -gtk-icon-shadow: none; }

check:indeterminate {
  -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-mixed.png"), url("../assets/checkbox-mixed@2.png"));
  -gtk-icon-shadow: none; }

radio:indeterminate {
  -gtk-icon-source: -gtk-scaled(url("../assets/radio-mixed.png"), url("../assets/radio-mixed@2.png"));
  -gtk-icon-shadow: none; }

check:indeterminate:hover {
  -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-mixed-hover.png"), url("../assets/checkbox-mixed-hover@2.png"));
  -gtk-icon-shadow: none; }

radio:indeterminate:hover {
  -gtk-icon-source: -gtk-scaled(url("../assets/radio-mixed-hover.png"), url("../assets/radio-mixed-hover@2.png"));
  -gtk-icon-shadow: none; }

check:indeterminate:active {
  -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-mixed-active.png"), url("../assets/checkbox-mixed-active@2.png"));
  -gtk-icon-shadow: none; }

radio:indeterminate:active {
  -gtk-icon-source: -gtk-scaled(url("../assets/radio-mixed-active.png"), url("../assets/radio-mixed-active@2.png"));
  -gtk-icon-shadow: none; }

check:indeterminate:backdrop {
  -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-mixed.png"), url("../assets/checkbox-mixed@2.png"));
  -gtk-icon-shadow: none; }

radio:indeterminate:backdrop {
  -gtk-icon-source: -gtk-scaled(url("../assets/radio-mixed.png"), url("../assets/radio-mixed@2.png"));
  -gtk-icon-shadow: none; }

check:indeterminate:disabled {
  -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-mixed-insensitive.png"), url("../assets/checkbox-mixed-insensitive@2.png"));
  -gtk-icon-shadow: none; }

radio:indeterminate:disabled {
  -gtk-icon-source: -gtk-scaled(url("../assets/radio-mixed-insensitive.png"), url("../assets/radio-mixed-insensitive@2.png"));
  -gtk-icon-shadow: none; }

check:indeterminate:disabled:backdrop {
  -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-mixed-insensitive.png"), url("../assets/checkbox-mixed-insensitive@2.png"));
  -gtk-icon-shadow: none; }

radio:indeterminate:disabled:backdrop {
  -gtk-icon-source: -gtk-scaled(url("../assets/radio-mixed-insensitive.png"), url("../assets/radio-mixed-insensitive@2.png"));
  -gtk-icon-shadow: none; }

check:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-unchecked.png"), url("../assets/checkbox-unchecked@2.png"));
  -gtk-icon-shadow: none; }

radio:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/selected-radio-unchecked.png"), url("../assets/selected-radio-unchecked@2.png"));
  -gtk-icon-shadow: none; }

check:hover:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-unchecked.png"), url("../assets/checkbox-unchecked@2.png"));
  -gtk-icon-shadow: none; }

radio:hover:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/selected-radio-unchecked.png"), url("../assets/selected-radio-unchecked@2.png"));
  -gtk-icon-shadow: none; }

check:active:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-unchecked.png"), url("../assets/checkbox-unchecked@2.png"));
  -gtk-icon-shadow: none; }

radio:active:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/selected-radio-unchecked.png"), url("../assets/selected-radio-unchecked@2.png"));
  -gtk-icon-shadow: none; }

check:backdrop:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-unchecked.png"), url("../assets/checkbox-unchecked@2.png"));
  -gtk-icon-shadow: none; }

radio:backdrop:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/selected-radio-unchecked.png"), url("../assets/selected-radio-unchecked@2.png"));
  -gtk-icon-shadow: none; }

check:disabled:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-unchecked.png"), url("../assets/checkbox-unchecked@2.png"));
  -gtk-icon-shadow: none; }

radio:disabled:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/selected-radio-unchecked.png"), url("../assets/selected-radio-unchecked@2.png"));
  -gtk-icon-shadow: none; }

check:disabled:backdrop:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-unchecked.png"), url("../assets/checkbox-unchecked@2.png"));
  -gtk-icon-shadow: none; }

radio:disabled:backdrop:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/selected-radio-unchecked.png"), url("../assets/selected-radio-unchecked@2.png"));
  -gtk-icon-shadow: none; }

check:checked:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-checked.png"), url("../assets/checkbox-checked@2.png"));
  -gtk-icon-shadow: none; }

radio:checked:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/selected-radio-checked.png"), url("../assets/selected-radio-checked@2.png"));
  -gtk-icon-shadow: none; }

check:checked:hover:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-checked.png"), url("../assets/checkbox-checked@2.png"));
  -gtk-icon-shadow: none; }

radio:checked:hover:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/selected-radio-checked.png"), url("../assets/selected-radio-checked@2.png"));
  -gtk-icon-shadow: none; }

check:checked:active:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-checked.png"), url("../assets/checkbox-checked@2.png"));
  -gtk-icon-shadow: none; }

radio:checked:active:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/selected-radio-checked.png"), url("../assets/selected-radio-checked@2.png"));
  -gtk-icon-shadow: none; }

check:checked:backdrop:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-checked.png"), url("../assets/checkbox-checked@2.png"));
  -gtk-icon-shadow: none; }

radio:checked:backdrop:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/selected-radio-checked.png"), url("../assets/selected-radio-checked@2.png"));
  -gtk-icon-shadow: none; }

check:checked:disabled:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-checked.png"), url("../assets/checkbox-checked@2.png"));
  -gtk-icon-shadow: none; }

radio:checked:disabled:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/selected-radio-checked.png"), url("../assets/selected-radio-checked@2.png"));
  -gtk-icon-shadow: none; }

check:checked:disabled:backdrop:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-checked.png"), url("../assets/checkbox-checked@2.png"));
  -gtk-icon-shadow: none; }

radio:checked:disabled:backdrop:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/selected-radio-checked.png"), url("../assets/selected-radio-checked@2.png"));
  -gtk-icon-shadow: none; }

check:indeterminate:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/selected-checkbox-mixed.png"), url("../assets/selected-checkbox-mixed@2.png"));
  -gtk-icon-shadow: none; }

radio:indeterminate:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/selected-radio-mixed.png"), url("../assets/selected-radio-mixed@2.png"));
  -gtk-icon-shadow: none; }

check:indeterminate:hover:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/selected-checkbox-mixed.png"), url("../assets/selected-checkbox-mixed@2.png"));
  -gtk-icon-shadow: none; }

radio:indeterminate:hover:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/selected-radio-mixed.png"), url("../assets/selected-radio-mixed@2.png"));
  -gtk-icon-shadow: none; }

check:indeterminate:active:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/selected-checkbox-mixed.png"), url("../assets/selected-checkbox-mixed@2.png"));
  -gtk-icon-shadow: none; }

radio:indeterminate:active:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/selected-radio-mixed.png"), url("../assets/selected-radio-mixed@2.png"));
  -gtk-icon-shadow: none; }

check:indeterminate:backdrop:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/selected-checkbox-mixed.png"), url("../assets/selected-checkbox-mixed@2.png"));
  -gtk-icon-shadow: none; }

radio:indeterminate:backdrop:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/selected-radio-mixed.png"), url("../assets/selected-radio-mixed@2.png"));
  -gtk-icon-shadow: none; }

check:indeterminate:disabled:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/selected-checkbox-mixed.png"), url("../assets/selected-checkbox-mixed@2.png"));
  -gtk-icon-shadow: none; }

radio:indeterminate:disabled:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/selected-radio-mixed.png"), url("../assets/selected-radio-mixed@2.png"));
  -gtk-icon-shadow: none; }

check:indeterminate:disabled:backdrop:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/selected-checkbox-mixed.png"), url("../assets/selected-checkbox-mixed@2.png"));
  -gtk-icon-shadow: none; }

radio:indeterminate:disabled:backdrop:selected {
  -gtk-icon-source: -gtk-scaled(url("../assets/selected-radio-mixed.png"), url("../assets/selected-radio-mixed@2.png"));
  -gtk-icon-shadow: none; }

.view.content-view check, iconview.content-view check,
.view.content-view.check,
iconview.content-view.check {
  -gtk-icon-source: -gtk-scaled(url("../assets/selection-mode-checkbox-unchecked.png"), url("../assets/checkbox-unchecked@2.png"));
  -gtk-icon-shadow: none; }

.view.content-view radio, iconview.content-view radio,
.view.content-view.radio,
iconview.content-view.radio {
  -gtk-icon-source: -gtk-scaled(url("../assets/selection-mode-radio-unchecked.png"), url("../assets/radio-unchecked@2.png"));
  -gtk-icon-shadow: none; }

.view.content-view check:hover, iconview.content-view check:hover,
.view.content-view.check:hover,
iconview.content-view.check:hover {
  -gtk-icon-source: -gtk-scaled(url("../assets/selection-mode-checkbox-unchecked-hover.png"), url("../assets/checkbox-unchecked-hover@2.png"));
  -gtk-icon-shadow: none; }

.view.content-view radio:hover, iconview.content-view radio:hover,
.view.content-view.radio:hover,
iconview.content-view.radio:hover {
  -gtk-icon-source: -gtk-scaled(url("../assets/selection-mode-radio-unchecked-hover.png"), url("../assets/radio-unchecked-hover@2.png"));
  -gtk-icon-shadow: none; }

.view.content-view check:active, iconview.content-view check:active,
.view.content-view.check:active,
iconview.content-view.check:active {
  -gtk-icon-source: -gtk-scaled(url("../assets/selection-mode-checkbox-unchecked-active.png"), url("../assets/checkbox-unchecked-active@2.png"));
  -gtk-icon-shadow: none; }

.view.content-view radio:active, iconview.content-view radio:active,
.view.content-view.radio:active,
iconview.content-view.radio:active {
  -gtk-icon-source: -gtk-scaled(url("../assets/selection-mode-radio-unchecked-active.png"), url("../assets/radio-unchecked-active@2.png"));
  -gtk-icon-shadow: none; }

.view.content-view check:backdrop, iconview.content-view check:backdrop,
.view.content-view.check:backdrop,
iconview.content-view.check:backdrop {
  -gtk-icon-source: -gtk-scaled(url("../assets/selection-mode-checkbox-unchecked-backdrop.png"), url("../assets/checkbox-unchecked-backdrop@2.png"));
  -gtk-icon-shadow: none; }

.view.content-view radio:backdrop, iconview.content-view radio:backdrop,
.view.content-view.radio:backdrop,
iconview.content-view.radio:backdrop {
  -gtk-icon-source: -gtk-scaled(url("../assets/selection-mode-radio-unchecked-backdrop.png"), url("../assets/radio-unchecked-backdrop@2.png"));
  -gtk-icon-shadow: none; }

.view.content-view check:disabled, iconview.content-view check:disabled,
.view.content-view.check:disabled,
iconview.content-view.check:disabled {
  -gtk-icon-source: -gtk-scaled(url("../assets/selection-mode-checkbox-unchecked-insensitive.png"), url("../assets/checkbox-unchecked-insensitive@2.png"));
  -gtk-icon-shadow: none; }

.view.content-view radio:disabled, iconview.content-view radio:disabled,
.view.content-view.radio:disabled,
iconview.content-view.radio:disabled {
  -gtk-icon-source: -gtk-scaled(url("../assets/selection-mode-radio-unchecked-insensitive.png"), url("../assets/radio-unchecked-insensitive@2.png"));
  -gtk-icon-shadow: none; }

.view.content-view check:disabled:backdrop, iconview.content-view check:disabled:backdrop,
.view.content-view.check:disabled:backdrop,
iconview.content-view.check:disabled:backdrop {
  -gtk-icon-source: -gtk-scaled(url("../assets/selection-mode-checkbox-unchecked-backdrop-insensitive.png"), url("../assets/checkbox-unchecked-backdrop-insensitive@2.png"));
  -gtk-icon-shadow: none; }

.view.content-view radio:disabled:backdrop, iconview.content-view radio:disabled:backdrop,
.view.content-view.radio:disabled:backdrop,
iconview.content-view.radio:disabled:backdrop {
  -gtk-icon-source: -gtk-scaled(url("../assets/selection-mode-radio-unchecked-backdrop-insensitive.png"), url("../assets/radio-unchecked-backdrop-insensitive@2.png"));
  -gtk-icon-shadow: none; }

checkbutton.text-button, radiobutton.text-button {
  padding: 2px 0;
  outline-offset: 0; }
  checkbutton.text-button label:not(:only-child):first-child, radiobutton.text-button label:not(:only-child):first-child {
    margin-left: 4px; }
  checkbutton.text-button label:not(:only-child):last-child, radiobutton.text-button label:not(:only-child):last-child {
    margin-right: 4px; }

check,
radio {
  margin: 0 4px;
  min-height: 16px;
  min-width: 16px;
  border: none; }
  menu menuitem check, menu menuitem
  radio {
    margin: 0; }
    menu menuitem check, menu menuitem check:hover, menu menuitem check:disabled, menu menuitem
    radio, menu menuitem
    radio:hover, menu menuitem
    radio:disabled {
      min-height: 14px;
      min-width: 14px;
      background-image: none;
      background-color: transparent;
      box-shadow: none;
      -gtk-icon-shadow: none;
      color: inherit;
      border-color: currentColor;
      animation: none; }

/*****************
 * Color Chooser *
 *****************/
colorswatch, colorswatch:drop(active) {
  border-style: none; }
colorswatch.top {
  border-top-left-radius: 5.5px;
  border-top-right-radius: 5.5px; }
  colorswatch.top overlay {
    border-top-left-radius: 5px;
    border-top-right-radius: 5px; }
colorswatch.bottom {
  border-bottom-left-radius: 5.5px;
  border-bottom-right-radius: 5.5px; }
  colorswatch.bottom overlay {
    border-bottom-left-radius: 5px;
    border-bottom-right-radius: 5px; }
colorswatch.left, colorswatch:first-child:not(.top) {
  border-top-left-radius: 5.5px;
  border-bottom-left-radius: 5.5px; }
  colorswatch.left overlay, colorswatch:first-child:not(.top) overlay {
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px; }
colorswatch.right, colorswatch:last-child:not(.bottom) {
  border-top-right-radius: 5.5px;
  border-bottom-right-radius: 5.5px; }
  colorswatch.right overlay, colorswatch:last-child:not(.bottom) overlay {
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px; }
colorswatch.dark overlay {
  color: #f8f8f2; }
  colorswatch.dark overlay:hover {
    border-color: rgba(25, 26, 34, 0.9); }
  colorswatch.dark overlay:backdrop {
    color: rgba(248, 248, 242, 0.5); }
colorswatch.light overlay {
  color: #f8f8f2; }
  colorswatch.light overlay:hover {
    border-color: rgba(25, 26, 34, 0.9); }
  colorswatch.light overlay:backdrop {
    color: #cfcfcd; }
colorswatch:drop(active) {
  box-shadow: none; }
  colorswatch:drop(active).light overlay {
    border-color: #50fa7a;
    box-shadow: inset 0 0 0 2px rgba(25, 26, 34, 0.9), inset 0 0 0 1px #50fa7a; }
  colorswatch:drop(active).dark overlay {
    border-color: #50fa7a;
    box-shadow: inset 0 0 0 2px rgba(25, 26, 34, 0.9), inset 0 0 0 1px #50fa7a; }
colorswatch overlay {
  box-shadow: inset 0 3px 2px -2px rgba(0, 0, 0, 0.5);
  border: 1px solid rgba(25, 26, 34, 0.9); }
  colorswatch overlay:hover {
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.3); }
  colorswatch overlay:backdrop, colorswatch overlay:backdrop:hover {
    border-color: rgba(25, 26, 34, 0.9);
    box-shadow: none; }
colorswatch#add-color-button {
  border-radius: 5px 5px 0 0; }
  colorswatch#add-color-button:only-child {
    border-radius: 5px; }
  colorswatch#add-color-button overlay {
    font-weight: normal;
    color: #f8f8f2;
    outline-color: rgba(248, 248, 242, 0.3);
    background-color: #282a36;
    text-shadow: none;
    border: 1px solid #282a36;
    box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
    colorswatch#add-color-button overlay:hover {
      color: #f8f8f2;
      outline-color: rgba(248, 248, 242, 0.3);
      background-color: #282a36;
      text-shadow: none;
      box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
    colorswatch#add-color-button overlay:backdrop {
      color: #cfcfcd;
      outline-color: rgba(248, 248, 242, 0.3);
      background-color: #2a2c39;
      text-shadow: none;
      box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
colorswatch:disabled {
  opacity: 0.5; }
  colorswatch:disabled overlay {
    border-color: rgba(0, 0, 0, 0.6);
    box-shadow: none; }
row:selected colorswatch {
  box-shadow: 0 0 0 2px #f8f8f2; }
colorswatch#editor-color-sample {
  border-radius: 4px; }
  colorswatch#editor-color-sample overlay {
    border-radius: 4.5px; }

colorchooser .popover.osd {
  border-radius: 5px; }

/**************
 * ComboBoxes *
 **************/
combobox arrow {
  -gtk-icon-source: -gtk-icontheme("pan-down-symbolic");
  min-height: 16px;
  min-width: 16px; }
combobox:drop(active) {
  box-shadow: none; }

/***********
 * Dialogs *
 ***********/
messagedialog .titlebar:not(headerbar) {
  background-color: rgba(30, 31, 41, 0.95); }
messagedialog .titlebar {
  min-height: 20px;
  background-image: none;
  background-color: rgba(30, 31, 41, 0.95);
  border-style: none;
  border-top-left-radius: 4px;
  border-top-right-radius: 4px; }
messagedialog.csd.background {
  background-color: rgba(30, 31, 41, 0.95);
  color: #f8f8f2;
  border-bottom-left-radius: 5px;
  border-bottom-right-radius: 5px; }
messagedialog.csd .dialog-action-area button {
  padding: 10px 14px;
  border-radius: 0;
  border-left-style: solid;
  border-right-style: none;
  border-bottom-style: none;
  background-color: transparent;
  color: #f8f8f2;
  box-shadow: none; }
  messagedialog.csd .dialog-action-area button:hover {
    background-color: rgba(189, 147, 249, 0.4); }
  messagedialog.csd .dialog-action-area button:first-child {
    border-left-style: none;
    border-bottom-left-radius: 4px; }
  messagedialog.csd .dialog-action-area button:last-child {
    border-bottom-right-radius: 4px; }

filechooser .dialog-action-box {
  border-top: 1px solid rgba(25, 26, 34, 0.9); }
  filechooser .dialog-action-box:backdrop {
    border-top-color: rgba(26, 27, 35, 0.91); }
filechooser #pathbarbox {
  border-bottom: 1px solid #1e1f29; }

filechooserbutton:drop(active) {
  box-shadow: none;
  border-color: transparent; }

/****************
 * Text Entries *
 ****************/
spinbutton:not(.vertical), entry {
  min-height: 32px;
  padding-left: 8px;
  padding-right: 8px;
  border: 1px solid;
  border-radius: 3px;
  transition: all 200ms cubic-bezier(0.25, 0.46, 0.45, 0.94);
  color: #f8f8f2;
  border-color: rgba(25, 26, 34, 0.9);
  background-color: #282a36; }
  spinbutton:not(.vertical) image.left,
  entry image.left {
    padding-left: 0;
    padding-right: 6px; }
  spinbutton:not(.vertical) image.right,
  entry image.right {
    padding-left: 6px;
    padding-right: 0; }
  spinbutton:not(.vertical) undershoot.left,
  entry undershoot.left {
    background-color: transparent;
    background-image: linear-gradient(to top, rgba(255, 255, 255, 0.2) 50%, rgba(0, 0, 0, 0.2) 50%);
    padding-left: 1px;
    background-size: 1px 10px;
    background-repeat: repeat-y;
    background-origin: content-box;
    background-position: left center;
    border: none;
    box-shadow: none; }
  spinbutton:not(.vertical) undershoot.right,
  entry undershoot.right {
    background-color: transparent;
    background-image: linear-gradient(to top, rgba(255, 255, 255, 0.2) 50%, rgba(0, 0, 0, 0.2) 50%);
    padding-right: 1px;
    background-size: 1px 10px;
    background-repeat: repeat-y;
    background-origin: content-box;
    background-position: right center;
    border: none;
    box-shadow: none; }
  spinbutton.flat:focus:not(.vertical), spinbutton.flat:not(.vertical),
  entry.flat:focus,
  entry.flat {
    min-height: 0;
    padding: 2px;
    background-image: none;
    border-color: transparent;
    box-shadow: none;
    border-radius: 0; }
  spinbutton:focus:not(.vertical),
  entry:focus {
    border-color: rgba(159, 99, 246, 0.5); }
  spinbutton:disabled:not(.vertical),
  entry:disabled {
    color: #8b8c8e;
    border-color: rgba(25, 26, 34, 0.9);
    background-color: #22232e;
    box-shadow: none; }
  spinbutton:backdrop:not(.vertical),
  entry:backdrop {
    color: #cfcfcd;
    border-color: rgba(26, 27, 35, 0.91);
    background-color: #2a2c39;
    box-shadow: none;
    transition: 200ms ease-out; }
  spinbutton:backdrop:disabled:not(.vertical),
  entry:backdrop:disabled {
    color: #3e4055;
    border-color: rgba(26, 27, 35, 0.91);
    background-color: #22232e;
    box-shadow: none; }
  spinbutton.error:not(.vertical),
  entry.error {
    color: #f8f8f2;
    border-color: rgba(25, 26, 34, 0.9);
    background-color: #282a36;
    color: #ff3c3c;
    border-color: #880000; }
    spinbutton.error:focus:not(.vertical),
    entry.error:focus {
      border-color: #880000; }
    spinbutton.error:selected:focus:not(.vertical), spinbutton.error:selected:not(.vertical),
    entry.error:selected:focus,
    entry.error:selected {
      background-color: #ff3c3c; }
  spinbutton.warning:not(.vertical),
  entry.warning {
    color: #f8f8f2;
    border-color: rgba(25, 26, 34, 0.9);
    background-color: #282a36;
    color: #ff9f39;
    border-color: #864500; }
    spinbutton.warning:focus:not(.vertical),
    entry.warning:focus {
      border-color: #864500; }
    spinbutton.warning:selected:focus:not(.vertical), spinbutton.warning:selected:not(.vertical),
    entry.warning:selected:focus,
    entry.warning:selected {
      background-color: #ff9f39; }
  spinbutton:not(.vertical) image,
  entry image {
    color: #cecfcc; }
    spinbutton:not(.vertical) image:hover,
    entry image:hover {
      color: #f8f8f2; }
    spinbutton:not(.vertical) image:active,
    entry image:active {
      color: rgba(189, 147, 249, 0.5); }
    spinbutton:not(.vertical) image:backdrop,
    entry image:backdrop {
      color: #78797d; }
  spinbutton:drop(active):focus:not(.vertical), spinbutton:drop(active):not(.vertical),
  entry:drop(active):focus,
  entry:drop(active) {
    border-color: #50fa7a;
    box-shadow: inset 0 0 0 1px #50fa7a; }
  .osd spinbutton:not(.vertical),
  .osd entry {
    color: white;
    border-color: rgba(0, 0, 0, 0.7);
    background-color: rgba(0, 0, 0, 0.5);
    box-shadow: none;
    text-shadow: 0 1px black;
    -gtk-icon-shadow: 0 1px black; }
    .osd spinbutton:focus:not(.vertical),
    .osd entry:focus {
      color: white;
      border-color: rgba(189, 147, 249, 0.5);
      background-color: rgba(0, 0, 0, 0.5);
      background-clip: padding-box;
      text-shadow: 0 1px black;
      -gtk-icon-shadow: 0 1px black; }
    .osd spinbutton:backdrop:not(.vertical),
    .osd entry:backdrop {
      color: white;
      border-color: rgba(0, 0, 0, 0.7);
      background-color: rgba(0, 0, 0, 0.5);
      background-clip: padding-box;
      box-shadow: none;
      text-shadow: none;
      -gtk-icon-shadow: none; }
    .osd spinbutton:disabled:not(.vertical),
    .osd entry:disabled {
      color: #898b8c;
      border-color: rgba(0, 0, 0, 0.7);
      background-color: rgba(43, 46, 49, 0.5);
      background-clip: padding-box;
      box-shadow: none;
      text-shadow: none;
      -gtk-icon-shadow: none; }
spinbutton:not(.vertical) progress,
entry progress {
  margin: 2px -6px;
  background-color: transparent;
  background-image: none;
  border-radius: 0;
  border-width: 0 0 2px;
  border-color: rgba(189, 147, 249, 0.5);
  border-style: solid;
  box-shadow: none; }
  spinbutton:not(.vertical) progress:backdrop,
  entry progress:backdrop {
    background-color: transparent; }
.linked:not(.vertical) > spinbutton:focus:not(.vertical) + spinbutton:not(.vertical), .linked:not(.vertical) > spinbutton:focus:not(.vertical) + button, .linked:not(.vertical) > spinbutton:focus:not(.vertical) + combobox > box > button.combo, .linked:not(.vertical) >
entry:focus + spinbutton:not(.vertical), .linked:not(.vertical) >
entry:focus + button, .linked:not(.vertical) >
entry:focus + combobox > box > button.combo, .linked:not(.vertical) > spinbutton:focus:not(.vertical) +
entry, .linked:not(.vertical) >
entry:focus +
entry {
  border-left-color: rgba(159, 99, 246, 0.5); }
.linked:not(.vertical) > spinbutton:focus:not(.vertical), .linked:not(.vertical) >
entry:focus {
  border-color: rgba(159, 99, 246, 0.5); }
.linked:not(.vertical) > spinbutton:drop(active):not(.vertical) + spinbutton:not(.vertical), .linked:not(.vertical) > spinbutton:drop(active):not(.vertical) + button, .linked:not(.vertical) > spinbutton:drop(active):not(.vertical) + combobox > box > button.combo, .linked:not(.vertical) >
entry:drop(active) + spinbutton:not(.vertical), .linked:not(.vertical) >
entry:drop(active) + button, .linked:not(.vertical) >
entry:drop(active) + combobox > box > button.combo, .linked:not(.vertical) > spinbutton:drop(active):not(.vertical) +
entry, .linked:not(.vertical) >
entry:drop(active) +
entry {
  border-left-color: #50fa7a; }
.linked.vertical > spinbutton:not(:disabled):not(.vertical) + entry:not(:disabled), .linked.vertical > spinbutton:not(:disabled):not(.vertical) + spinbutton:not(:disabled):not(.vertical), .linked.vertical >
entry:not(:disabled) + entry:not(:disabled), .linked.vertical >
entry:not(:disabled) + spinbutton:not(:disabled):not(.vertical) {
  border-top-color: rgba(36, 38, 49, 0.97);
  background-image: linear-gradient(to bottom, #282a36, #282a36); }
  .linked.vertical > spinbutton:not(:disabled):not(.vertical) + entry:not(:disabled):backdrop, .linked.vertical > spinbutton:not(:disabled):not(.vertical) + spinbutton:not(:disabled):backdrop:not(.vertical), .linked.vertical >
  entry:not(:disabled) + entry:not(:disabled):backdrop, .linked.vertical >
  entry:not(:disabled) + spinbutton:not(:disabled):backdrop:not(.vertical) {
    border-top-color: rgba(38, 40, 51, 0.973);
    background-image: linear-gradient(to bottom, #2a2c39, #2a2c39); }
.linked.vertical > spinbutton:disabled:not(.vertical) + spinbutton:disabled:not(.vertical), .linked.vertical > spinbutton:disabled:not(.vertical) + entry:disabled, .linked.vertical >
entry:disabled + spinbutton:disabled:not(.vertical), .linked.vertical >
entry:disabled + entry:disabled {
  border-top-color: rgba(36, 38, 49, 0.97); }
.linked.vertical > spinbutton:not(.vertical) + spinbutton:focus:not(:only-child):not(.vertical),
.linked.vertical > spinbutton:not(.vertical) + entry:focus:not(:only-child), .linked.vertical >
entry + spinbutton:focus:not(:only-child):not(.vertical),
.linked.vertical >
entry + entry:focus:not(:only-child) {
  border-top-color: rgba(159, 99, 246, 0.5); }
.linked.vertical > spinbutton:not(.vertical) + spinbutton:drop(active):not(:only-child):not(.vertical),
.linked.vertical > spinbutton:not(.vertical) + entry:drop(active):not(:only-child), .linked.vertical >
entry + spinbutton:drop(active):not(:only-child):not(.vertical),
.linked.vertical >
entry + entry:drop(active):not(:only-child) {
  border-top-color: #50fa7a; }
.linked.vertical > spinbutton:focus:not(:only-child):not(.vertical) + spinbutton:not(.vertical),
.linked.vertical > spinbutton:focus:not(:only-child):not(.vertical) + entry,
.linked.vertical > spinbutton:focus:not(:only-child):not(.vertical) + button,
.linked.vertical > spinbutton:focus:not(:only-child):not(.vertical) + combobox > box > button.combo, .linked.vertical >
entry:focus:not(:only-child) + spinbutton:not(.vertical),
.linked.vertical >
entry:focus:not(:only-child) + entry,
.linked.vertical >
entry:focus:not(:only-child) + button,
.linked.vertical >
entry:focus:not(:only-child) + combobox > box > button.combo {
  border-top-color: rgba(159, 99, 246, 0.5); }
.linked.vertical > spinbutton:drop(active):not(:only-child):not(.vertical) + spinbutton:not(.vertical),
.linked.vertical > spinbutton:drop(active):not(:only-child):not(.vertical) + entry,
.linked.vertical > spinbutton:drop(active):not(:only-child):not(.vertical) + button,
.linked.vertical > spinbutton:drop(active):not(:only-child):not(.vertical) + combobox > box > button.combo, .linked.vertical >
entry:drop(active):not(:only-child) + spinbutton:not(.vertical),
.linked.vertical >
entry:drop(active):not(:only-child) + entry,
.linked.vertical >
entry:drop(active):not(:only-child) + button,
.linked.vertical >
entry:drop(active):not(:only-child) + combobox > box > button.combo {
  border-top-color: #50fa7a; }

treeview entry:focus:dir(rtl), treeview entry:focus:dir(ltr) {
  background-color: #282a36;
  transition-property: color, background; }
treeview entry.flat, treeview entry {
  border-radius: 0;
  background-image: none;
  background-color: #282a36; }
  treeview entry.flat:focus, treeview entry:focus {
    border-color: rgba(189, 147, 249, 0.5); }

/*************
 * Expanders *
 *************/
expander arrow {
  min-width: 16px;
  min-height: 16px;
  -gtk-icon-source: -gtk-icontheme("pan-end-symbolic"); }
  expander arrow:dir(rtl) {
    -gtk-icon-source: -gtk-icontheme("pan-end-symbolic-rtl"); }
  expander arrow:hover {
    color: white; }
  expander arrow:checked {
    -gtk-icon-source: -gtk-icontheme("pan-down-symbolic"); }

/****************
 * Floating Bar *
 ****************/
.floating-bar {
  background-color: #1e1f29;
  border-width: 1px;
  border-style: solid solid none;
  border-color: rgba(25, 26, 34, 0.9);
  border-radius: 3px 3px 0 0;
  box-shadow: inset 0 1px rgba(255, 255, 255, 0.1); }
  .floating-bar.bottom.left {
    border-left-style: none;
    border-top-left-radius: 0; }
  .floating-bar.bottom.right {
    border-right-style: none;
    border-top-right-radius: 0; }
  .floating-bar > button {
    padding: 4px; }
  .floating-bar:backdrop {
    background-color: #1e1f29;
    border-color: rgba(26, 27, 35, 0.91); }

/**********
 * Frames *
 **********/
frame > border,
.frame {
  box-shadow: none;
  margin: 0;
  padding: 0;
  border-radius: 0;
  border: 1px solid rgba(25, 26, 34, 0.9); }
  frame > border.flat,
  .frame.flat {
    border-style: none; }
  frame > border:backdrop,
  .frame:backdrop {
    border-color: rgba(26, 27, 35, 0.91); }

actionbar > revealer > box {
  padding: 6px;
  border-top: 1px solid rgba(25, 26, 34, 0.9); }
  actionbar > revealer > box:backdrop {
    border-color: rgba(26, 27, 35, 0.91); }

scrolledwindow viewport.frame {
  border-style: none; }
scrolledwindow overshoot.top {
  background-image: -gtk-gradient(radial, center top, 0, center top, 0.5, to(rgba(3, 4, 5, 0.9)), to(rgba(3, 4, 5, 0))), -gtk-gradient(radial, center top, 0, center top, 0.6, from(rgba(248, 248, 242, 0.07)), to(rgba(248, 248, 242, 0)));
  background-size: 100% 5%, 100% 100%;
  background-repeat: no-repeat;
  background-position: center top;
  background-color: transparent;
  border: none;
  box-shadow: none; }
  scrolledwindow overshoot.top:backdrop {
    background-image: -gtk-gradient(radial, center top, 0, center top, 0.5, to(rgba(26, 27, 35, 0.91)), to(rgba(26, 27, 35, 0)));
    background-size: 100% 5%;
    background-repeat: no-repeat;
    background-position: center top;
    background-color: transparent;
    border: none;
    box-shadow: none; }
scrolledwindow overshoot.bottom {
  background-image: -gtk-gradient(radial, center bottom, 0, center bottom, 0.5, to(rgba(3, 4, 5, 0.9)), to(rgba(3, 4, 5, 0))), -gtk-gradient(radial, center bottom, 0, center bottom, 0.6, from(rgba(248, 248, 242, 0.07)), to(rgba(248, 248, 242, 0)));
  background-size: 100% 5%, 100% 100%;
  background-repeat: no-repeat;
  background-position: center bottom;
  background-color: transparent;
  border: none;
  box-shadow: none; }
  scrolledwindow overshoot.bottom:backdrop {
    background-image: -gtk-gradient(radial, center bottom, 0, center bottom, 0.5, to(rgba(26, 27, 35, 0.91)), to(rgba(26, 27, 35, 0)));
    background-size: 100% 5%;
    background-repeat: no-repeat;
    background-position: center bottom;
    background-color: transparent;
    border: none;
    box-shadow: none; }
scrolledwindow overshoot.left {
  background-image: -gtk-gradient(radial, left center, 0, left center, 0.5, to(rgba(3, 4, 5, 0.9)), to(rgba(3, 4, 5, 0))), -gtk-gradient(radial, left center, 0, left center, 0.6, from(rgba(248, 248, 242, 0.07)), to(rgba(248, 248, 242, 0)));
  background-size: 5% 100%, 100% 100%;
  background-repeat: no-repeat;
  background-position: left center;
  background-color: transparent;
  border: none;
  box-shadow: none; }
  scrolledwindow overshoot.left:backdrop {
    background-image: -gtk-gradient(radial, left center, 0, left center, 0.5, to(rgba(26, 27, 35, 0.91)), to(rgba(26, 27, 35, 0)));
    background-size: 5% 100%;
    background-repeat: no-repeat;
    background-position: left center;
    background-color: transparent;
    border: none;
    box-shadow: none; }
scrolledwindow overshoot.right {
  background-image: -gtk-gradient(radial, right center, 0, right center, 0.5, to(rgba(3, 4, 5, 0.9)), to(rgba(3, 4, 5, 0))), -gtk-gradient(radial, right center, 0, right center, 0.6, from(rgba(248, 248, 242, 0.07)), to(rgba(248, 248, 242, 0)));
  background-size: 5% 100%, 100% 100%;
  background-repeat: no-repeat;
  background-position: right center;
  background-color: transparent;
  border: none;
  box-shadow: none; }
  scrolledwindow overshoot.right:backdrop {
    background-image: -gtk-gradient(radial, right center, 0, right center, 0.5, to(rgba(26, 27, 35, 0.91)), to(rgba(26, 27, 35, 0)));
    background-size: 5% 100%;
    background-repeat: no-repeat;
    background-position: right center;
    background-color: transparent;
    border: none;
    box-shadow: none; }
scrolledwindow undershoot.top {
  background-color: transparent;
  background-image: linear-gradient(to left, rgba(255, 255, 255, 0.2) 50%, rgba(0, 0, 0, 0.2) 50%);
  padding-top: 1px;
  background-size: 10px 1px;
  background-repeat: repeat-x;
  background-origin: content-box;
  background-position: center top;
  border: none;
  box-shadow: none; }
scrolledwindow undershoot.bottom {
  background-color: transparent;
  background-image: linear-gradient(to left, rgba(255, 255, 255, 0.2) 50%, rgba(0, 0, 0, 0.2) 50%);
  padding-bottom: 1px;
  background-size: 10px 1px;
  background-repeat: repeat-x;
  background-origin: content-box;
  background-position: center bottom;
  border: none;
  box-shadow: none; }
scrolledwindow undershoot.left {
  background-color: transparent;
  background-image: linear-gradient(to top, rgba(255, 255, 255, 0.2) 50%, rgba(0, 0, 0, 0.2) 50%);
  padding-left: 1px;
  background-size: 1px 10px;
  background-repeat: repeat-y;
  background-origin: content-box;
  background-position: left center;
  border: none;
  box-shadow: none; }
scrolledwindow undershoot.right {
  background-color: transparent;
  background-image: linear-gradient(to top, rgba(255, 255, 255, 0.2) 50%, rgba(0, 0, 0, 0.2) 50%);
  padding-right: 1px;
  background-size: 1px 10px;
  background-repeat: repeat-y;
  background-origin: content-box;
  background-position: right center;
  border: none;
  box-shadow: none; }
scrolledwindow junction {
  border-color: transparent;
  border-image: linear-gradient(to bottom, rgba(25, 26, 34, 0.9) 1px, transparent 1px) 0 0 0 1/0 1px stretch;
  background-color: #232530; }
  scrolledwindow junction:dir(rtl) {
    border-image-slice: 0 1 0 0; }
  scrolledwindow junction:backdrop {
    border-image-source: linear-gradient(to bottom, rgba(26, 27, 35, 0.91) 1px, transparent 1px);
    background-color: #181820;
    transition: 200ms ease-out; }

separator {
  background: rgba(0, 0, 0, 0.1); }

/************
 * Popovers *
 ************/
GraniteWidgetsPopOver {
  -GraniteWidgetsPopOver-arrow-width: 21;
  -GraniteWidgetsPopOver-arrow-height: 10;
  -GraniteWidgetsPopOver-border-radius: 8px;
  -GraniteWidgetsPopOver-border-width: 0;
  -GraniteWidgetsPopOver-shadow-size: 12;
  border: 1px solid #282a36;
  background: #282a36;
  color: #f8f8f2; }
  GraniteWidgetsPopOver .button {
    background-image: none;
    background: none;
    border: none; }
    GraniteWidgetsPopOver .button:active, GraniteWidgetsPopOver .button:active:hover {
      color: rgba(189, 147, 249, 0.5); }
  GraniteWidgetsPopOver > .frame {
    border: none; }
  GraniteWidgetsPopOver .sidebar.view, GraniteWidgetsPopOver iconview.sidebar {
    border: none;
    background: none; }

GraniteWidgetsStaticNotebook .frame {
  border: none; }

.popover_bg {
  background-color: #282a36;
  background-image: none;
  border: 1px solid #282a36;
  color: #f8f8f2; }

/***********
 * Welcome *
 **********/
GraniteWidgetsWelcome {
  background-color: #282a36; }
  GraniteWidgetsWelcome GtkLabel {
    color: #f8f8f2; }
  GraniteWidgetsWelcome .h1, GraniteWidgetsWelcome .h3 {
    color: rgba(248, 248, 242, 0.8); }

/**************
* Source List *
***************/
.source-list {
  -GtkTreeView-horizontal-separator: 1px;
  -GtkTreeView-vertical-separator: 6px;
  background-color: #1e1f29;
  border: solid rgba(25, 26, 34, 0.9);
  color: #f8f8f2;
  border-right-width: 1px; }
  .source-list .category-expander {
    color: transparent; }
  .source-list .badge {
    background-image: none;
    background-color: rgba(0, 0, 0, 0.4);
    color: #1e1f29;
    border-radius: 10px;
    padding: 0 6px;
    margin: 0 3px;
    border-width: 0; }
    .source-list .badge:selected:backdrop, .source-list .badge:selected:hover:backdrop {
      background-color: rgba(0, 0, 0, 0.2);
      color: #13141a; }
  .source-list row,
  .source-list .list-row {
    border: none;
    padding: 0; }
    .source-list row > GtkLabel,
    .source-list row > label,
    .source-list .list-row > GtkLabel,
    .source-list .list-row > label {
      padding-left: 6px;
      padding-right: 6px; }

/**************
* Text Styles *
**************/
.h1 {
  font-size: 24px; }

.h2 {
  font-weight: 300;
  font-size: 18px; }

.h3 {
  font-size: 11px; }

.h4,
.category-label {
  font-size: 12px;
  padding: 6px;
  color: rgba(248, 248, 242, 0.3);
  font-weight: bold;
  text-shadow: 0 1px rgba(255, 255, 255, 0.2); }

/**************
* Storage Bar *
**************/
.storage-bar .trough {
  border: none;
  box-shadow: 0 1px 0 0 rgba(0, 0, 0, 0.1);
  background-image: none;
  background-color: transparent;
  padding: 8px 6px; }
.storage-bar .fill-block {
  background-color: #f1fa8c;
  border: none;
  box-shadow: inset 0 1px 0 0 rgba(0, 0, 0, 0.1), inset 0 -1px 0 0 rgba(0, 0, 0, 0.1);
  transition: all 200ms ease-in-out;
  padding: 8px 6px; }
  .storage-bar .fill-block:first-child {
    border-top-left-radius: 4px;
    border-bottom-left-radius: 4px;
    border-left-width: 1px;
    box-shadow: inset 0 1px 0 0 rgba(0, 0, 0, 0.1), inset 1px 0 0 rgba(0, 0, 0, 0.1), inset 0 -1px 0 0 rgba(0, 0, 0, 0.1); }
  .storage-bar .fill-block:last-child {
    border-top-right-radius: 4px;
    border-bottom-right-radius: 4px;
    box-shadow: inset 0 1px 0 0 rgba(0, 0, 0, 0.1), inset -1px 0 0 rgba(0, 0, 0, 0.1), inset 0 -1px 0 0 rgba(0, 0, 0, 0.1); }
  .storage-bar .fill-block.empty-block {
    background-color: #282a36; }
  .storage-bar .fill-block.app {
    background-color: #13b1d5; }
  .storage-bar .fill-block.audio {
    background-color: #ffb86c; }
  .storage-bar .fill-block.photo {
    background-color: #ff5555; }
  .storage-bar .fill-block.video {
    background-color: #bd93f9; }
  .storage-bar .fill-block .legend {
    padding: 12px;
    border-radius: 4px; }

/***************
 * Header bars *
 ***************/
.titlebar:not(headerbar), headerbar {
  padding: 0 6px;
  min-height: 34px;
  background-color: #1e1f29;
  color: #f8f8f2;
  border-radius: 0; }
  .titlebar:backdrop:not(headerbar),
  headerbar:backdrop {
    border-color: rgba(26, 27, 35, 0.91);
    background-image: none;
    transition: 200ms ease-out; }
  .titlebar:not(headerbar) .title,
  headerbar .title {
    font-weight: bold;
    padding-left: 12px;
    padding-right: 12px; }
  .titlebar:not(headerbar) .subtitle,
  headerbar .subtitle {
    font-size: smaller;
    padding-left: 12px;
    padding-right: 12px; }
  .titlebar:not(headerbar) .linked > button,
  .titlebar:not(headerbar) .linked > button:hover,
  .titlebar:not(headerbar) .linked > button:active,
  .titlebar:not(headerbar) .linked > button:checked,
  .titlebar:not(headerbar) .linked > button:backdrop,
  .titlebar:not(headerbar) headerbar .linked > button,
  headerbar .titlebar:not(headerbar) .linked > button,
  .titlebar:not(headerbar) headerbar .linked > button,
  headerbar .titlebar:not(headerbar) .linked > button:hover,
  .titlebar:not(headerbar) headerbar .linked > button:hover,
  headerbar .titlebar:not(headerbar) .linked > button:active,
  .titlebar:not(headerbar) headerbar .linked > button:active,
  headerbar .titlebar:not(headerbar) .linked > button:checked,
  .titlebar:not(headerbar) headerbar .linked > button:checked,
  headerbar .titlebar:not(headerbar) .linked > button:backdrop,
  .titlebar:not(headerbar) headerbar .linked > button:backdrop,
  headerbar .linked > button,
  headerbar .linked > button:hover,
  headerbar .linked > button:active,
  headerbar .linked > button:checked,
  headerbar .linked > button:backdrop {
    border: none;
    border-radius: 7px;
    border-right-style: none;
    box-shadow: none; }
  .titlebar:not(headerbar) entry,
  headerbar entry {
    min-height: 24px; }
  .titlebar:not(headerbar) button,
  headerbar button {
    color: #f8f8f2;
    background-color: transparent;
    border-radius: 0;
    text-shadow: none;
    box-shadow: none;
    border: none;
    min-height: 30px;
    margin-top: 5px;
    margin-bottom: 5px; }
    .titlebar:not(headerbar) button:hover,
    headerbar button:hover {
      color: #bd93f9;
      background-color: transparent;
      border-radius: 0;
      text-shadow: none;
      box-shadow: none; }
    .titlebar:not(headerbar) button:active, .titlebar:not(headerbar) button:checked,
    headerbar button:active,
    headerbar button:checked {
      color: #bd93f9;
      background-color: rgba(189, 147, 249, 0.1);
      border-radius: 7px;
      box-shadow: none;
      text-shadow: none;
      font-weight: bold; }
    .titlebar:not(headerbar) button:backdrop, .titlebar:not(headerbar) button:disabled, .titlebar:not(headerbar) button:backdrop:disabled,
    headerbar button:backdrop,
    headerbar button:disabled,
    headerbar button:backdrop:disabled {
      color: rgba(255, 255, 255, 0.3);
      background-color: transparent;
      border-radius: 0;
      text-shadow: none;
      box-shadow: none; }
    .titlebar:not(headerbar) button:backdrop:hover, .titlebar:not(headerbar) button:backdrop:active, .titlebar:not(headerbar) button:backdrop:checked,
    headerbar button:backdrop:hover,
    headerbar button:backdrop:active,
    headerbar button:backdrop:checked {
      background-color: transparent;
      color: rgba(189, 147, 249, 0.5);
      box-shadow: none; }
    .titlebar:not(headerbar) button.suggested-action,
    headerbar button.suggested-action {
      font-weight: bold;
      min-height: 24px;
      margin-top: 4px;
      margin-bottom: 4px;
      border-radius: 3px;
      font-weight: normal;
      color: white;
      outline-color: rgba(255, 255, 255, 0.3);
      background-color: #72BFD0;
      text-shadow: none;
      border: 1px solid #72BFD0;
      box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
      .titlebar:not(headerbar) button.suggested-action:hover,
      headerbar button.suggested-action:hover {
        color: white;
        outline-color: rgba(255, 255, 255, 0.3);
        background-color: #72BFD0;
        text-shadow: none;
        box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
      .titlebar:not(headerbar) button.suggested-action:active,
      headerbar button.suggested-action:active {
        color: white;
        outline-color: rgba(255, 255, 255, 0.3);
        background-color: #72BFD0;
        text-shadow: none;
        box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
      .titlebar:not(headerbar) button.suggested-action:disabled,
      headerbar button.suggested-action:disabled {
        color: white;
        outline-color: rgba(255, 255, 255, 0.3);
        background-color: #72BFD0;
        text-shadow: none;
        box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
        .titlebar:not(headerbar) button.suggested-action:disabled label,
        headerbar button.suggested-action:disabled label {
          color: rgba(255, 255, 255, 0.5); }
      .titlebar:not(headerbar) button.suggested-action:backdrop,
      headerbar button.suggested-action:backdrop {
        color: rgba(255, 255, 255, 0.4);
        outline-color: rgba(255, 255, 255, 0.3);
        background-color: #72BFD0;
        text-shadow: none;
        box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1);
        border-radius: 3px; }
      .titlebar:not(headerbar) button.suggested-action:backdrop:disabled,
      headerbar button.suggested-action:backdrop:disabled {
        color: white;
        outline-color: rgba(255, 255, 255, 0.3);
        background-color: #72BFD0;
        text-shadow: none;
        box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
    .titlebar:not(headerbar) button.destructive-action,
    headerbar button.destructive-action {
      font-weight: bold;
      min-height: 24px;
      margin-top: 4px;
      margin-bottom: 4px;
      border-radius: 3px;
      font-weight: normal;
      color: white;
      outline-color: rgba(255, 255, 255, 0.3);
      background-color: #ff2222;
      text-shadow: none;
      border: 1px solid #ff2222;
      box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
      .titlebar:not(headerbar) button.destructive-action:hover,
      headerbar button.destructive-action:hover {
        color: white;
        outline-color: rgba(255, 255, 255, 0.3);
        background-color: #ff2222;
        text-shadow: none;
        box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
      .titlebar:not(headerbar) button.destructive-action:active,
      headerbar button.destructive-action:active {
        color: white;
        outline-color: rgba(255, 255, 255, 0.3);
        background-color: #ff2222;
        text-shadow: none;
        box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
      .titlebar:not(headerbar) button.destructive-action:disabled,
      headerbar button.destructive-action:disabled {
        color: white;
        outline-color: rgba(255, 255, 255, 0.3);
        background-color: #ff2222;
        text-shadow: none;
        box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
        .titlebar:not(headerbar) button.destructive-action:disabled label,
        headerbar button.destructive-action:disabled label {
          color: rgba(255, 255, 255, 0.5); }
      .titlebar:not(headerbar) button.destructive-action:backdrop,
      headerbar button.destructive-action:backdrop {
        color: rgba(255, 255, 255, 0.4);
        outline-color: rgba(255, 255, 255, 0.3);
        background-color: #ff2222;
        text-shadow: none;
        box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1);
        border-radius: 3px; }
      .titlebar:not(headerbar) button.destructive-action:backdrop:disabled,
      headerbar button.destructive-action:backdrop:disabled {
        color: white;
        outline-color: rgba(255, 255, 255, 0.3);
        background-color: #ff2222;
        text-shadow: none;
        box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
    .titlebar:not(headerbar) button.titlebutton,
    headerbar button.titlebutton {
      color: transparent;
      box-shadow: none; }
      .titlebar:not(headerbar) button.titlebutton:hover, .titlebar:not(headerbar) button.titlebutton:active, .titlebar:not(headerbar) button.titlebutton:checked, .titlebar:not(headerbar) button.titlebutton:backdrop, .titlebar:not(headerbar) button.titlebutton:backdrop:hover, .titlebar:not(headerbar) button.titlebutton *,
      headerbar button.titlebutton:hover,
      headerbar button.titlebutton:active,
      headerbar button.titlebutton:checked,
      headerbar button.titlebutton:backdrop,
      headerbar button.titlebutton:backdrop:hover,
      headerbar button.titlebutton * {
        color: transparent;
        box-shadow: none; }
  .titlebar:not(headerbar) .linked > button:active:backdrop,
  .titlebar:not(headerbar) .linked > button:checked:backdrop,
  headerbar .linked > button:active:backdrop,
  headerbar .linked > button:checked:backdrop {
    color: rgba(189, 147, 249, 0.4); }
    .titlebar:not(headerbar) .linked > button:active:backdrop label,
    .titlebar:not(headerbar) .linked > button:checked:backdrop label,
    headerbar .linked > button:active:backdrop label,
    headerbar .linked > button:checked:backdrop label {
      color: rgba(189, 147, 249, 0.4); }
  .selection-mode.titlebar:not(headerbar),
  headerbar.selection-mode {
    color: #f8f8f2;
    text-shadow: 0 -1px rgba(0, 0, 0, 0.5);
    border-color: rgba(159, 99, 246, 0.5);
    background: rgba(189, 147, 249, 0.5) linear-gradient(to top, rgba(180, 133, 248, 0.5), rgba(186, 142, 249, 0.5) 2px, rgba(189, 147, 249, 0.5) 3px);
    box-shadow: inset 0 1px rgba(209, 179, 251, 0.3); }
    .selection-mode.titlebar:backdrop:not(headerbar),
    headerbar.selection-mode:backdrop {
      background-color: rgba(189, 147, 249, 0.5);
      background-image: none;
      box-shadow: inset 0 1px rgba(215, 189, 251, 0.26); }
    .selection-mode.titlebar:not(headerbar) button,
    headerbar.selection-mode button {
      font-weight: normal;
      color: #f8f8f2;
      outline-color: rgba(248, 248, 242, 0.3);
      background-color: rgba(189, 147, 249, 0.5);
      text-shadow: none;
      border: 1px solid rgba(189, 147, 249, 0.5);
      box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
      .selection-mode.titlebar:not(headerbar) button.flat,
      headerbar.selection-mode button.flat {
        border-color: transparent;
        background-color: transparent;
        background-image: none;
        box-shadow: inset 0 1px rgba(255, 255, 255, 0);
        text-shadow: none;
        -gtk-icon-shadow: none; }
      .selection-mode.titlebar:not(headerbar) button:hover,
      headerbar.selection-mode button:hover {
        color: #f8f8f2;
        outline-color: rgba(248, 248, 242, 0.3);
        background-color: rgba(189, 147, 249, 0.5);
        text-shadow: none;
        box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
      .selection-mode.titlebar:not(headerbar) button:active, .selection-mode.titlebar:not(headerbar) button:checked,
      headerbar.selection-mode button:active,
      headerbar.selection-mode button:checked {
        color: #f8f8f2;
        outline-color: rgba(248, 248, 242, 0.3);
        background-color: rgba(189, 147, 249, 0.5);
        text-shadow: none;
        box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
      .selection-mode.titlebar:not(headerbar) button:backdrop.flat, .selection-mode.titlebar:not(headerbar) button:backdrop,
      headerbar.selection-mode button:backdrop.flat,
      headerbar.selection-mode button:backdrop {
        color: #cfcfcd;
        outline-color: rgba(248, 248, 242, 0.3);
        background-color: rgba(189, 147, 249, 0.5);
        text-shadow: none;
        box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1);
        -gtk-icon-effect: none;
        border-color: rgba(159, 99, 246, 0.5); }
        .selection-mode.titlebar:not(headerbar) button:backdrop.flat:active, .selection-mode.titlebar:not(headerbar) button:backdrop.flat:checked, .selection-mode.titlebar:not(headerbar) button:backdrop:active, .selection-mode.titlebar:not(headerbar) button:backdrop:checked,
        headerbar.selection-mode button:backdrop.flat:active,
        headerbar.selection-mode button:backdrop.flat:checked,
        headerbar.selection-mode button:backdrop:active,
        headerbar.selection-mode button:backdrop:checked {
          color: rgba(248, 248, 242, 0.7);
          outline-color: rgba(248, 248, 242, 0.3);
          background-color: rgba(189, 147, 249, 0.5);
          text-shadow: none;
          box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1);
          border-color: rgba(159, 99, 246, 0.5); }
          .selection-mode.titlebar:not(headerbar) button:backdrop.flat:active label, .selection-mode.titlebar:not(headerbar) button:backdrop.flat:checked label, .selection-mode.titlebar:not(headerbar) button:backdrop:active label, .selection-mode.titlebar:not(headerbar) button:backdrop:checked label,
          headerbar.selection-mode button:backdrop.flat:active label,
          headerbar.selection-mode button:backdrop.flat:checked label,
          headerbar.selection-mode button:backdrop:active label,
          headerbar.selection-mode button:backdrop:checked label {
            color: rgba(248, 248, 242, 0.7); }
        .selection-mode.titlebar:not(headerbar) button:backdrop.flat:disabled, .selection-mode.titlebar:not(headerbar) button:backdrop:disabled,
        headerbar.selection-mode button:backdrop.flat:disabled,
        headerbar.selection-mode button:backdrop:disabled {
          color: #cfcfcd;
          outline-color: rgba(248, 248, 242, 0.3);
          background-color: rgba(189, 147, 249, 0.5);
          text-shadow: none;
          box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1);
          border-color: rgba(159, 99, 246, 0.5); }
          .selection-mode.titlebar:not(headerbar) button:backdrop.flat:disabled:active, .selection-mode.titlebar:not(headerbar) button:backdrop.flat:disabled:checked, .selection-mode.titlebar:not(headerbar) button:backdrop:disabled:active, .selection-mode.titlebar:not(headerbar) button:backdrop:disabled:checked,
          headerbar.selection-mode button:backdrop.flat:disabled:active,
          headerbar.selection-mode button:backdrop.flat:disabled:checked,
          headerbar.selection-mode button:backdrop:disabled:active,
          headerbar.selection-mode button:backdrop:disabled:checked {
            color: rgba(248, 248, 242, 0.7);
            outline-color: rgba(248, 248, 242, 0.3);
            background-color: rgba(189, 147, 249, 0.5);
            text-shadow: none;
            box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1);
            border-color: rgba(159, 99, 246, 0.5); }
      .selection-mode.titlebar:not(headerbar) button.flat:backdrop, .selection-mode.titlebar:not(headerbar) button.flat:disabled, .selection-mode.titlebar:not(headerbar) button.flat:backdrop:disabled,
      headerbar.selection-mode button.flat:backdrop,
      headerbar.selection-mode button.flat:disabled,
      headerbar.selection-mode button.flat:backdrop:disabled {
        border-color: transparent;
        background-color: transparent;
        background-image: none;
        box-shadow: inset 0 1px rgba(255, 255, 255, 0);
        text-shadow: none;
        -gtk-icon-shadow: none; }
      .selection-mode.titlebar:not(headerbar) button:disabled,
      headerbar.selection-mode button:disabled {
        color: #cfcfcd;
        outline-color: rgba(248, 248, 242, 0.3);
        background-color: rgba(189, 147, 249, 0.5);
        text-shadow: none;
        box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
        .selection-mode.titlebar:not(headerbar) button:disabled:active, .selection-mode.titlebar:not(headerbar) button:disabled:checked,
        headerbar.selection-mode button:disabled:active,
        headerbar.selection-mode button:disabled:checked {
          color: rgba(248, 248, 242, 0.7);
          outline-color: rgba(248, 248, 242, 0.3);
          background-color: rgba(189, 147, 249, 0.5);
          text-shadow: none;
          box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
          .selection-mode.titlebar:not(headerbar) button:disabled:active label, .selection-mode.titlebar:not(headerbar) button:disabled:checked label,
          headerbar.selection-mode button:disabled:active label,
          headerbar.selection-mode button:disabled:checked label {
            color: rgba(248, 248, 242, 0.7); }
      .selection-mode.titlebar:not(headerbar) button.suggested-action,
      headerbar.selection-mode button.suggested-action {
        font-weight: normal;
        color: white;
        outline-color: rgba(255, 255, 255, 0.3);
        background-color: #72BFD0;
        text-shadow: none;
        border: 1px solid #72BFD0;
        box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
        .selection-mode.titlebar:not(headerbar) button.suggested-action:hover,
        headerbar.selection-mode button.suggested-action:hover {
          color: white;
          outline-color: rgba(255, 255, 255, 0.3);
          background-color: #72BFD0;
          text-shadow: none;
          box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
        .selection-mode.titlebar:not(headerbar) button.suggested-action:active,
        headerbar.selection-mode button.suggested-action:active {
          color: white;
          outline-color: rgba(255, 255, 255, 0.3);
          background-color: #72BFD0;
          text-shadow: none;
          box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
        .selection-mode.titlebar:not(headerbar) button.suggested-action:disabled,
        headerbar.selection-mode button.suggested-action:disabled {
          color: white;
          outline-color: rgba(255, 255, 255, 0.3);
          background-color: #72BFD0;
          text-shadow: none;
          box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
        .selection-mode.titlebar:not(headerbar) button.suggested-action:backdrop,
        headerbar.selection-mode button.suggested-action:backdrop {
          color: rgba(255, 255, 255, 0.4);
          outline-color: rgba(255, 255, 255, 0.3);
          background-color: #72BFD0;
          text-shadow: none;
          box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
        .selection-mode.titlebar:not(headerbar) button.suggested-action:backdrop:disabled,
        headerbar.selection-mode button.suggested-action:backdrop:disabled {
          color: white;
          outline-color: rgba(255, 255, 255, 0.3);
          background-color: #72BFD0;
          text-shadow: none;
          box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
    .selection-mode.titlebar:not(headerbar) .selection-menu:backdrop, .selection-mode.titlebar:not(headerbar) .selection-menu,
    headerbar.selection-mode .selection-menu:backdrop,
    headerbar.selection-mode .selection-menu {
      border-color: rgba(189, 147, 249, 0);
      background-image: linear-gradient(to bottom, rgba(189, 147, 249, 0), rgba(189, 147, 249, 0));
      box-shadow: none;
      padding-left: 10px;
      padding-right: 10px; }
      .selection-mode.titlebar:not(headerbar) .selection-menu:backdrop GtkArrow, .selection-mode.titlebar:not(headerbar) .selection-menu GtkArrow,
      headerbar.selection-mode .selection-menu:backdrop GtkArrow,
      headerbar.selection-mode .selection-menu GtkArrow {
        -GtkArrow-arrow-scaling: 1; }
      .selection-mode.titlebar:not(headerbar) .selection-menu:backdrop .arrow, .selection-mode.titlebar:not(headerbar) .selection-menu .arrow,
      headerbar.selection-mode .selection-menu:backdrop .arrow,
      headerbar.selection-mode .selection-menu .arrow {
        -gtk-icon-source: -gtk-icontheme("pan-down-symbolic");
        color: rgba(248, 248, 242, 0.5);
        -gtk-icon-shadow: none; }
  .tiled .titlebar:not(headerbar), .maximized .titlebar:not(headerbar),
  .tiled headerbar.titlebar, .maximized headerbar.titlebar {
    box-shadow: inset 0 -1px rgba(0, 0, 0, 0.1); }
  .tiled .titlebar:backdrop:not(headerbar), .tiled .titlebar:not(headerbar), .maximized .titlebar:backdrop:not(headerbar), .maximized .titlebar:not(headerbar),
  .tiled headerbar:backdrop,
  .tiled headerbar, .maximized headerbar:backdrop, .maximized headerbar {
    border-radius: 0; }
  .default-decoration.titlebar:not(headerbar), headerbar.default-decoration {
    padding: 4px;
    min-height: 28px; }
    .default-decoration.titlebar:not(headerbar) button.titlebutton, headerbar.default-decoration button.titlebutton {
      min-height: 26px;
      min-width: 26px;
      margin: 0;
      padding: 0; }

headerbar entry,
headerbar spinbutton,
headerbar separator {
  margin-top: 5px;
  margin-bottom: 5px; }
headerbar switch {
  margin-top: 10px;
  margin-bottom: 10px; }
headerbar separator {
  background: transparent; }
headerbar viewswitcher > box.horizontal > button.radio, headerbar switcher > box.horizontal > button.radio {
  margin: 0;
  padding: 0;
  border-radius: 0; }
  headerbar viewswitcher > box.horizontal > button.radio image, headerbar switcher > box.horizontal > button.radio image {
    margin-left: 7px; }
  headerbar viewswitcher > box.horizontal > button.radio label, headerbar switcher > box.horizontal > button.radio label {
    margin-right: 7px; }

.background:not(.tiled):not(.maximized) .titlebar {
  box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), inset 0 -1px rgba(0, 0, 0, 0.1); }
  .background:not(.tiled):not(.maximized) .titlebar:backdrop, .background:not(.tiled):not(.maximized) .titlebar {
    border-top-left-radius: 4px;
    border-top-right-radius: 4px; }

window:not(.tiled):not(.maximized) separator:first-child + headerbar:backdrop, window:not(.tiled):not(.maximized) separator:first-child + headerbar, window:not(.tiled):not(.maximized) headerbar:first-child:backdrop, window:not(.tiled):not(.maximized) headerbar:first-child {
  border-top-left-radius: 4px; }
window:not(.tiled):not(.maximized) headerbar:last-child:backdrop, window:not(.tiled):not(.maximized) headerbar:last-child {
  border-top-right-radius: 4px; }

window {
  border-radius: 6px; }

window.csd > .titlebar:not(headerbar) {
  padding: 0;
  background-color: transparent;
  background-image: none;
  border-style: none;
  border-color: transparent;
  box-shadow: none; }
.titlebar:not(headerbar) > separator, .titlebar:not(headerbar) > separator:backdrop {
  background: #1e1f29; }

/**************
 * GtkInfoBar *
 **************/
.info, .warning, .question, .error,
infobar {
  text-shadow: none;
  color: #f8f8f2;
  background-color: #1e1f29;
  border-bottom: 1px solid #08090c;
  box-shadow: 0 1px 0 0 rgba(0, 0, 0, 0.05), 0 1px 2px 0 rgba(0, 0, 0, 0.15); }

.info, .warning, .question, .error {
  text-shadow: none;
  color: #f8f8f2;
  border: none; }
  .info .label, .warning .label, .question .label, .error .label {
    color: #f8f8f2; }
    .info .label:backdrop, .warning .label:backdrop, .question .label:backdrop, .error .label:backdrop {
      color: rgba(248, 248, 242, 0.5); }
  .info button, .warning button, .question button, .error button {
    border-radius: 2px;
    border: none;
    background: rgba(40, 42, 54, 0.98);
    color: #f8f8f2;
    box-shadow: 0 1px 0 0 rgba(0, 0, 0, 0.2); }
    .info button .label, .warning button .label, .question button .label, .error button .label {
      color: #f8f8f2; }
    .info button:active, .warning button:active, .question button:active, .error button:active {
      background: #282a36;
      color: #f8f8f2;
      box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.4); }
      .info button:active:backdrop, .warning button:active:backdrop, .question button:active:backdrop, .error button:active:backdrop {
        background: rgba(40, 42, 54, 0.8);
        color: rgba(248, 248, 242, 0.5);
        box-shadow: none; }
    .info button:hover, .warning button:hover, .question button:hover, .error button:hover, .info button:focus, .warning button:focus, .question button:focus, .error button:focus {
      box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.4); }
    .info button:disabled, .warning button:disabled, .question button:disabled, .error button:disabled {
      background: rgba(40, 42, 54, 0.6);
      color: rgba(248, 248, 242, 0.5);
      box-shadow: none; }
      .info button:disabled:backdrop, .warning button:disabled:backdrop, .question button:disabled:backdrop, .error button:disabled:backdrop {
        background: rgba(40, 42, 54, 0.5);
        color: rgba(248, 248, 242, 0.5);
        box-shadow: none; }
    .info button:backdrop, .warning button:backdrop, .question button:backdrop, .error button:backdrop {
      background: rgba(40, 42, 54, 0.8);
      color: rgba(248, 248, 242, 0.5);
      box-shadow: none; }

.info {
  background-color: #50fa7a; }
  .info:backdrop {
    background-color: #82fba0;
    color: rgba(248, 248, 242, 0.5); }

.warning {
  background-color: #ff9f39; }
  .warning:backdrop {
    background-color: #ffb86c;
    color: rgba(248, 248, 242, 0.5); }

.question {
  background-color: #72BFD0; }
  .question:backdrop {
    background-color: #98d0dd;
    color: rgba(248, 248, 242, 0.5); }

.error {
  background-color: #ff3c3c; }
  .error:backdrop {
    background-color: #ff6f6f;
    color: rgba(248, 248, 242, 0.5); }

/*************
 * Level Bar *
 *************/
levelbar block {
  min-width: 32px;
  min-height: 6px; }
levelbar.vertical block {
  min-width: 6px;
  min-height: 32px; }
levelbar:backdrop {
  transition: 200ms ease-out; }
levelbar trough {
  padding: 3px;
  border-radius: 3px;
  background-color: rgba(0, 0, 0, 0.14);
  box-shadow: 0px 0px 1px 1px rgba(0, 0, 0, 0.1); }
  levelbar trough:backdrop {
    background-color: rgba(0, 0, 0, 0.06);
    box-shadow: 0px 0px 1px 1px rgba(0, 0, 0, 0.1); }
levelbar.horizontal.discrete block {
  margin: 0 1px; }
levelbar.vertical.discrete block {
  margin: 1px 0; }
levelbar block {
  border-radius: 2px; }
  levelbar block:backdrop {
    box-shadow: none; }
  levelbar block.low {
    background-color: #ff9f39; }
    levelbar block.low:backdrop {
      border-color: #ff9f39; }
  levelbar block.high, levelbar block:not(.empty) {
    background-color: #72BFD0; }
    levelbar block.high:backdrop, levelbar block:not(.empty):backdrop {
      border-color: #72BFD0; }
  levelbar block.full {
    background-color: #4caec3; }
    levelbar block.full:backdrop {
      border-color: #4caec3; }
  levelbar block.empty {
    background-color: rgba(0, 0, 0, 0.14);
    box-shadow: none; }

/*********
 * Links *
 *********/
*:link, button:link,
button:visited {
  color: #13b1d5; }
  *:link:visited,
  button:visited {
    color: rgba(19, 177, 213, 0.5); }
    *:selected *:link:visited, *:selected button:visited:link,
    *:selected button:visited {
      color: rgba(237, 230, 243, 0.8); }
  *:link:hover, button:hover:link,
  button:hover:visited {
    color: #2fc9ec; }
    *:selected *:link:hover, *:selected button:hover:link,
    *:selected button:hover:visited {
      color: rgba(246, 244, 242, 0.95); }
  *:link:active, button:active:link,
  button:active:visited {
    color: #13b1d5; }
    *:selected *:link:active, *:selected button:active:link,
    *:selected button:active:visited {
      color: rgba(243, 240, 243, 0.9); }
  *:link:backdrop:backdrop:hover, button:backdrop:backdrop:hover:link,
  button:backdrop:backdrop:hover:visited, *:link:backdrop:backdrop:hover:selected, .selection-mode.titlebar:not(headerbar) .subtitle:backdrop:backdrop:hover:link,
  headerbar.selection-mode .subtitle:backdrop:backdrop:hover:link, button:backdrop:backdrop:hover:selected:link,
  button:backdrop:backdrop:hover:selected:visited, *:link:backdrop, button:backdrop:link,
  button:backdrop:visited {
    color: rgba(189, 147, 249, 0.5); }
  *:link:selected, .selection-mode.titlebar:not(headerbar) .subtitle:link,
  headerbar.selection-mode .subtitle:link, button:selected:link,
  button:selected:visited, *:selected *:link, *:selected button:link,
  *:selected button:visited {
    color: rgba(243, 240, 243, 0.9); }

button:link,
button:visited {
  text-shadow: none; }
  button:link:hover, button:link:active, button:link:checked,
  button:visited:hover,
  button:visited:active,
  button:visited:checked {
    text-shadow: none; }
  button:link > label,
  button:visited > label {
    text-decoration-line: underline; }

/*********
 * Lists *
 *********/
list {
  color: #f8f8f2;
  background-color: #282a36;
  border-color: rgba(25, 26, 34, 0.9); }
  list:backdrop {
    background-color: #2a2c39;
    border-color: rgba(26, 27, 35, 0.91); }

row {
  padding: 8px 14px;
  transition: all 150ms cubic-bezier(0.25, 0.46, 0.45, 0.94); }
  row label {
    padding-left: 8px; }
  row:hover {
    transition: none; }
  row:backdrop {
    transition: 200ms ease-out; }
  row.activatable.has-open-popup, row.activatable:hover {
    background-color: rgba(248, 248, 242, 0.05); }
  row.activatable:active {
    box-shadow: inset 0 2px 2px -2px rgba(0, 0, 0, 0.2); }
  row.activatable:backdrop:hover {
    background-color: transparent; }
  row.activatable:selected:active {
    box-shadow: inset 0 2px 3px -1px rgba(0, 0, 0, 0.5); }
  row.activatable:selected.has-open-popup, row.activatable:selected:hover {
    background-color: rgba(189, 147, 249, 0.3); }
  row.activatable:selected:backdrop {
    background-color: rgba(189, 147, 249, 0.4); }

/*********
 * Menus *
 *********/
menubar,
.menubar {
  background-color: #1e1f29;
  color: #f8f8f2;
  -GtkWidget-window-dragging: true;
  padding: 0px;
  box-shadow: inset 0 -1px rgba(0, 0, 0, 0.1); }
  menubar > menuitem,
  .menubar > menuitem {
    min-height: 16px;
    padding: 4px 8px; }
    menubar > menuitem:hover,
    .menubar > menuitem:hover {
      box-shadow: inset 0 -3px rgba(189, 147, 249, 0.5); }
    menubar > menuitem:disabled,
    .menubar > menuitem:disabled {
      color: #8b8c8e;
      box-shadow: none; }

menu, .menu, .context-menu {
  margin: 4px;
  padding: 2px 0px;
  background-color: #242530;
  border: 1px solid rgba(25, 26, 34, 0.9);
  font: initial; }
  .csd menu,
  .csd .menu,
  .csd .context-menu {
    border: none; }
  menu:backdrop, .menu:backdrop, .context-menu:backdrop {
    background-color: #282936; }
  menu menuitem, .menu menuitem, .context-menu menuitem {
    min-height: 16px;
    min-width: 40px;
    padding: 4px 6px;
    text-shadow: none; }
    menu menuitem:hover, .menu menuitem:hover, .context-menu menuitem:hover {
      color: #f8f8f2;
      background-color: rgba(189, 147, 249, 0.5); }
    menu menuitem:disabled, .menu menuitem:disabled, .context-menu menuitem:disabled {
      color: #8b8c8e; }
      menu menuitem:disabled:backdrop, .menu menuitem:disabled:backdrop, .context-menu menuitem:disabled:backdrop {
        color: #3e4055; }
    menu menuitem:backdrop, menu menuitem:backdrop:hover, .menu menuitem:backdrop, .menu menuitem:backdrop:hover, .context-menu menuitem:backdrop, .context-menu menuitem:backdrop:hover {
      color: #8b8c8e;
      background-color: transparent; }
    menu menuitem arrow, .menu menuitem arrow, .context-menu menuitem arrow {
      min-height: 16px;
      min-width: 16px; }
      menu menuitem arrow:dir(ltr), .menu menuitem arrow:dir(ltr), .context-menu menuitem arrow:dir(ltr) {
        -gtk-icon-source: -gtk-icontheme("pan-end-symbolic");
        margin-left: 10px; }
      menu menuitem arrow:dir(rtl), .menu menuitem arrow:dir(rtl), .context-menu menuitem arrow:dir(rtl) {
        -gtk-icon-source: -gtk-icontheme("pan-end-symbolic-rtl");
        margin-right: 10px; }
    menu menuitem label:dir(rtl), menu menuitem label:dir(ltr), .menu menuitem label:dir(rtl), .menu menuitem label:dir(ltr), .context-menu menuitem label:dir(rtl), .context-menu menuitem label:dir(ltr) {
      color: inherit; }
  menu > arrow, .menu > arrow, .context-menu > arrow {
    border-color: transparent;
    background-color: transparent;
    background-image: none;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0);
    text-shadow: none;
    -gtk-icon-shadow: none;
    min-height: 16px;
    min-width: 16px;
    padding: 4px;
    background-color: #242530;
    border-radius: 0; }
    menu > arrow.top, .menu > arrow.top, .context-menu > arrow.top {
      margin-top: -6px;
      border-bottom: 1px solid #3d3f49;
      -gtk-icon-source: -gtk-icontheme("pan-up-symbolic"); }
    menu > arrow.bottom, .menu > arrow.bottom, .context-menu > arrow.bottom {
      margin-bottom: -6px;
      border-top: 1px solid #3d3f49;
      -gtk-icon-source: -gtk-icontheme("pan-down-symbolic"); }
    menu > arrow:hover, .menu > arrow:hover, .context-menu > arrow:hover {
      background-color: #3d3f49; }
    menu > arrow:backdrop, .menu > arrow:backdrop, .context-menu > arrow:backdrop {
      background-color: #282936; }
    menu > arrow:disabled, .menu > arrow:disabled, .context-menu > arrow:disabled {
      color: transparent;
      background-color: transparent;
      border-color: transparent; }

menuitem accelerator {
  color: alpha(currentColor,0.55); }
menuitem check,
menuitem radio {
  min-height: 16px;
  min-width: 16px; }
  menuitem check:dir(ltr),
  menuitem radio:dir(ltr) {
    margin-right: 7px; }
  menuitem check:dir(rtl),
  menuitem radio:dir(rtl) {
    margin-left: 7px; }

/********
 * Misc *
 ********/
.content-view {
  background-color: #0f0f14; }
  .content-view:hover {
    -gtk-icon-effect: highlight; }
  .content-view:backdrop {
    background-color: #0f0f14; }

.osd .scale-popup button.flat {
  border-style: none;
  border-radius: 5px; }
.scale-popup button:hover {
  background-color: rgba(248, 248, 242, 0.1);
  border-radius: 5px; }

/************
* Assistant *
*************/
assistant {
  border-bottom-left-radius: 4px;
  border-bottom-right-radius: 4px; }
  assistant .sidebar {
    background-color: #282a36;
    border-top: 1px solid rgba(25, 26, 34, 0.9);
    border-bottom-left-radius: 4px; }
    assistant .sidebar:backdrop {
      background-color: #2a2c39;
      border-color: rgba(26, 27, 35, 0.91); }
  assistant.csd .sidebar {
    border-top-style: none; }
  assistant .sidebar GtkLabel,
  assistant .sidebar label {
    padding: 6px 12px; }
  assistant .sidebar GtkLabel.highlight,
  assistant .sidebar label.highlight {
    background-color: #4a4a51; }

/*************
 * Notebooks *
 *************/
notebook > header {
  padding: 1px;
  border-color: rgba(25, 26, 34, 0.9);
  border-width: 0px;
  background-color: #1e1f29; }
  notebook > header:backdrop {
    border-color: rgba(26, 27, 35, 0.91);
    background-color: #1e1f29; }
  notebook > header tabs {
    margin: -1px; }
  notebook > header.top {
    border-bottom-style: solid; }
    notebook > header.top > tabs {
      margin-bottom: -2px; }
      notebook > header.top > tabs > tab:backdrop {
        box-shadow: none; }
      notebook > header.top > tabs > tab:checked {
        background-color: #282a36; }
        notebook > header.top > tabs > tab:checked:hover {
          background-color: #282a36; }
  notebook > header.bottom {
    border-top-style: solid; }
    notebook > header.bottom > tabs {
      margin-top: -2px; }
      notebook > header.bottom > tabs > tab:backdrop {
        box-shadow: none; }
      notebook > header.bottom > tabs > tab:checked {
        background-color: #282a36; }
  notebook > header.left {
    border-right-style: solid; }
    notebook > header.left > tabs {
      margin-right: -2px; }
      notebook > header.left > tabs > tab:backdrop {
        box-shadow: none; }
      notebook > header.left > tabs > tab:checked {
        background-color: #282a36; }
  notebook > header.right {
    border-left-style: solid; }
    notebook > header.right > tabs {
      margin-left: -2px; }
      notebook > header.right > tabs > tab:backdrop {
        box-shadow: none; }
      notebook > header.right > tabs > tab:checked {
        background-color: #282a36; }
  notebook > header.top > tabs > arrow {
    border-top-style: none; }
  notebook > header.bottom > tabs > arrow {
    border-bottom-style: none; }
  notebook > header.top > tabs > arrow, notebook > header.bottom > tabs > arrow {
    margin-left: -5px;
    margin-right: -5px;
    padding-left: 4px;
    padding-right: 4px; }
    notebook > header.top > tabs > arrow.down, notebook > header.bottom > tabs > arrow.down {
      -gtk-icon-source: -gtk-icontheme("pan-start-symbolic"); }
    notebook > header.top > tabs > arrow.up, notebook > header.bottom > tabs > arrow.up {
      -gtk-icon-source: -gtk-icontheme("pan-end-symbolic"); }
  notebook > header.left > tabs > arrow {
    border-left-style: none; }
  notebook > header.right > tabs > arrow {
    border-right-style: none; }
  notebook > header.left > tabs > arrow, notebook > header.right > tabs > arrow {
    margin-top: -5px;
    margin-bottom: -5px;
    padding-top: 4px;
    padding-bottom: 4px; }
    notebook > header.left > tabs > arrow.down, notebook > header.right > tabs > arrow.down {
      -gtk-icon-source: -gtk-icontheme("pan-up-symbolic"); }
    notebook > header.left > tabs > arrow.up, notebook > header.right > tabs > arrow.up {
      -gtk-icon-source: -gtk-icontheme("pan-down-symbolic"); }
  notebook > header > tabs > arrow {
    min-height: 16px;
    min-width: 16px;
    border-radius: 0; }
    notebook > header > tabs > arrow:hover:not(:active):not(:backdrop) {
      background-clip: padding-box;
      background-image: none;
      background-color: rgba(255, 255, 255, 0.3);
      border-color: transparent;
      box-shadow: none; }
    notebook > header > tabs > arrow:disabled {
      border-color: transparent;
      background-color: transparent;
      background-image: none;
      box-shadow: inset 0 1px rgba(255, 255, 255, 0);
      text-shadow: none;
      -gtk-icon-shadow: none; }
  notebook > header tab {
    min-height: 30px;
    min-width: 30px;
    padding: 3px 12px;
    outline-offset: -5px;
    color: #8b8c8e;
    font-weight: bold;
    border-width: 1px;
    border-color: transparent; }
    notebook > header tab:hover {
      color: #c2c2c0; }
      notebook > header tab:hover.reorderable-page {
        border-color: rgba(25, 26, 34, 0.2);
        background-color: rgba(30, 31, 41, 0.2); }
    notebook > header tab:backdrop {
      color: #5f6066; }
      notebook > header tab:backdrop.reorderable-page {
        border-color: transparent;
        background-color: transparent; }
    notebook > header tab:checked {
      color: #f8f8f2; }
      notebook > header tab:checked.reorderable-page {
        border-color: rgba(25, 26, 34, 0.4);
        background-color: rgba(30, 31, 41, 0.5); }
        notebook > header tab:checked.reorderable-page:hover {
          background-color: rgba(30, 31, 41, 0.7); }
    notebook > header tab:backdrop:checked {
      color: #8b8c8e; }
      notebook > header tab:backdrop:checked.reorderable-page {
        border-color: rgba(26, 27, 35, 0.91);
        background-color: #2a2c39; }
    notebook > header tab button.flat {
      padding: 0;
      margin-top: 4px;
      margin-bottom: 4px;
      min-width: 20px;
      min-height: 20px; }
      notebook > header tab button.flat:hover {
        background: transparent;
        box-shadow: none;
        color: #ff5555; }
      notebook > header tab button.flat, notebook > header tab button.flat:backdrop {
        color: alpha(currentColor,0.3); }
      notebook > header tab button.flat:last-child {
        margin-left: 4px;
        margin-right: -4px; }
      notebook > header tab button.flat:first-child {
        margin-left: -4px;
        margin-right: 4px; }
  notebook > header.top tabs, notebook > header.bottom tabs {
    padding-left: 0.5px;
    padding-right: 0.5px; }
    notebook > header.top tabs:not(:only-child), notebook > header.bottom tabs:not(:only-child) {
      margin-left: 0.5px;
      margin-right: 0.5px; }
      notebook > header.top tabs:not(:only-child):first-child, notebook > header.bottom tabs:not(:only-child):first-child {
        margin-left: 0.5px; }
      notebook > header.top tabs:not(:only-child):last-child, notebook > header.bottom tabs:not(:only-child):last-child {
        margin-right: 0.5px; }
    notebook > header.top tabs tab, notebook > header.bottom tabs tab {
      margin-left: 0.5px;
      margin-right: 0.5px; }
      notebook > header.top tabs tab.reorderable-page, notebook > header.bottom tabs tab.reorderable-page {
        border-style: none solid; }
  notebook > header.left tabs, notebook > header.right tabs {
    padding-top: 4px;
    padding-bottom: 4px; }
    notebook > header.left tabs:not(:only-child), notebook > header.right tabs:not(:only-child) {
      margin-top: 3px;
      margin-bottom: 3px; }
      notebook > header.left tabs:not(:only-child):first-child, notebook > header.right tabs:not(:only-child):first-child {
        margin-top: -1px; }
      notebook > header.left tabs:not(:only-child):last-child, notebook > header.right tabs:not(:only-child):last-child {
        margin-bottom: -1px; }
    notebook > header.left tabs tab, notebook > header.right tabs tab {
      margin-top: 4px;
      margin-bottom: 4px; }
      notebook > header.left tabs tab.reorderable-page, notebook > header.right tabs tab.reorderable-page {
        border-style: solid none; }
  notebook > header.top tab {
    padding-bottom: 4px; }
  notebook > header.bottom tab {
    padding-top: 4px; }
notebook > stack:not(:only-child) {
  background-color: #282a36; }
  notebook > stack:not(:only-child):backdrop {
    background-color: #2a2c39; }

/*********
 * Paned *
 *********/
paned > separator {
  min-width: 1px;
  min-height: 1px;
  -gtk-icon-source: none;
  border-style: none;
  background-color: transparent;
  background-image: image(rgba(25, 26, 34, 0.9));
  background-size: 1px 1px; }
  paned > separator:selected {
    background-image: image(rgba(189, 147, 249, 0.5)); }
  paned > separator:backdrop {
    background-image: image(rgba(26, 27, 35, 0.91)); }
  paned > separator.wide {
    min-width: 5px;
    min-height: 5px;
    background-color: #1e1f29;
    background-image: image(rgba(25, 26, 34, 0.9)), image(rgba(25, 26, 34, 0.9));
    background-size: 1px 1px, 1px 1px; }
    paned > separator.wide:backdrop {
      background-color: #1e1f29;
      background-image: image(rgba(26, 27, 35, 0.91)), image(rgba(26, 27, 35, 0.91)); }
paned.horizontal > separator {
  background-repeat: repeat-y; }
  paned.horizontal > separator:dir(ltr) {
    margin: 0 -8px 0 0;
    padding: 0 8px 0 0;
    background-position: left; }
  paned.horizontal > separator:dir(rtl) {
    margin: 0 0 0 -8px;
    padding: 0 0 0 8px;
    background-position: right; }
  paned.horizontal > separator.wide {
    margin: 0;
    padding: 0;
    background-repeat: repeat-y, repeat-y;
    background-position: left, right; }
paned.vertical > separator {
  margin: 0 0 -8px 0;
  padding: 0 0 8px 0;
  background-repeat: repeat-x;
  background-position: top; }
  paned.vertical > separator.wide {
    margin: 0;
    padding: 0;
    background-repeat: repeat-x, repeat-x;
    background-position: bottom, top; }

/************
 * Pathbars *
 ************/
.path-bar button.text-button, .path-bar button.image-button, .path-bar button {
  padding-left: 4px;
  padding-right: 4px; }
.path-bar button.text-button.image-button label {
  padding-left: 0;
  padding-right: 0; }
.path-bar button.text-button.image-button label:last-child, .path-bar button label:last-child {
  padding-right: 8px; }
.path-bar button.text-button.image-button label:first-child, .path-bar button label:first-child {
  padding-left: 8px; }
.path-bar button image {
  padding-left: 4px;
  padding-right: 4px; }
.path-bar button.slider-button {
  padding-left: 0;
  padding-right: 0; }

/***************
 * Popovers   *
 ***************/
popover.background {
  padding: 2px;
  border-radius: 5px;
  background-color: #242530;
  box-shadow: 0 1px 6px rgba(0, 0, 0, 0.4); }
  .csd popover.background, popover.background {
    border: 1px solid rgba(25, 26, 34, 0.9); }
  popover.background:backdrop {
    background-color: #1e1f29;
    box-shadow: none; }
  popover.background > list,
  popover.background > .view,
  popover.background > iconview,
  popover.background > toolbar {
    border-style: none;
    background-color: transparent; }
  .csd popover.background.touch-selection, .csd popover.background.magnifier, popover.background.touch-selection, popover.background.magnifier {
    border: 1px solid rgba(255, 255, 255, 0.1); }
  popover.background separator {
    margin: 3px; }
  popover.background list separator {
    margin: 0px; }

/*****************
 * Progress bars *
 *****************/
progressbar {
  font-size: smaller;
  color: rgba(248, 248, 242, 0.4); }
  progressbar.horizontal trough,
  progressbar.horizontal progress {
    min-height: 6px; }
  progressbar.vertical trough,
  progressbar.vertical progress {
    min-width: 6px; }
  progressbar.horizontal progress {
    margin: 0; }
  progressbar.vertical progress {
    margin: 0; }
  progressbar:backdrop {
    box-shadow: none;
    transition: 200ms ease-out; }
  progressbar.osd {
    min-width: 3px;
    min-height: 3px;
    background-color: transparent; }
    progressbar.osd trough {
      border-style: none;
      border-radius: 0;
      background-color: transparent;
      box-shadow: none; }
    progressbar.osd progress {
      border-style: none;
      border-radius: 0; }

/************
 * GtkScale *
 ************/
progressbar trough, scale trough, scale fill {
  background-color: rgba(140, 143, 171, 0.14);
  border: none;
  border-radius: 3px;
  margin: 0; }
  progressbar trough:disabled, scale trough:disabled, scale fill:disabled {
    background-color: rgba(0, 0, 0, 0.14); }
  progressbar trough:backdrop, progressbar:backdrop trough, scale trough:backdrop, scale fill:backdrop {
    background-color: rgba(0, 0, 0, 0.14);
    transition: 200ms ease-out; }
    progressbar trough:backdrop:disabled, progressbar:backdrop trough:disabled, scale trough:backdrop:disabled, scale fill:backdrop:disabled {
      background-color: rgba(0, 0, 0, 0.14); }

progressbar progress, scale highlight {
  border: none;
  background-color: rgba(189, 147, 249, 0.5);
  border-radius: 3px;
  margin: 0; }
  progressbar progress:disabled, scale highlight:disabled {
    border: none;
    background-color: rgba(0, 0, 0, 0.14); }
  progressbar progress:backdrop, progressbar:backdrop progress, scale highlight:backdrop, progressbar progress:active:backdrop, progressbar:backdrop progress:active, scale highlight:active:backdrop {
    border-color: rgba(204, 171, 250, 0.5);
    background-color: rgba(204, 171, 250, 0.5); }
    progressbar progress:backdrop:disabled, progressbar:backdrop progress:disabled, scale highlight:backdrop:disabled, progressbar progress:active:backdrop:disabled, progressbar:backdrop progress:active:disabled, scale highlight:active:backdrop:disabled {
      background-color: rgba(0, 0, 0, 0.1); }

scale {
  min-height: 16px;
  min-width: 16px;
  padding: 8px; }
  scale.horizontal trough,
  scale.horizontal progress {
    min-height: 6px; }
  scale.vertical trough,
  scale.vertical progress {
    min-width: 6px; }
  scale slider {
    min-height: 16px;
    min-width: 16px;
    margin: -7px;
    background-color: #3e4153;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), 0px 0px 1px 1px rgba(0, 0, 0, 0.1);
    border-radius: 12px;
    transition: all 200ms cubic-bezier(0.25, 0.46, 0.45, 0.94);
    transition-property: background, border, box-shadow; }
    scale slider:active {
      background-color: #bd93f9; }
      scale slider:active:disabled {
        background-color: #22232e;
        box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), 0px 0px 1px 1px rgba(0, 0, 0, 0.05); }
  scale.fine-tune.horizontal {
    padding-top: 9px;
    padding-bottom: 9px;
    min-height: 16px; }
  scale.fine-tune.vertical {
    padding-left: 9px;
    padding-right: 9px;
    min-width: 16px; }
  scale.fine-tune slider {
    margin: -6px; }
  scale.fine-tune fill,
  scale.fine-tune highlight,
  scale.fine-tune trough {
    border-radius: 5px;
    -gtk-outline-radius: 7px; }
  scale trough {
    outline-offset: 2px;
    -gtk-outline-radius: 5px;
    outline-color: transparent; }
  scale fill:backdrop, scale fill {
    background-color: rgba(25, 26, 34, 0.9); }
  scale fill:disabled:backdrop, scale fill:disabled {
    border-color: transparent;
    background-color: transparent; }
  .osd scale fill {
    background-color: rgba(97, 97, 97, 0.775); }
    .osd scale fill:disabled:backdrop, .osd scale fill:disabled {
      border-color: transparent;
      background-color: transparent; }
  scale slider {
    border-color: #282a36;
    border: none;
    border-radius: 12px;
    background-color: #3e4153;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), 0px 0px 1px 1px rgba(0, 0, 0, 0.1); }
    scale slider:active {
      border-color: rgba(159, 99, 246, 0.5); }
    scale slider:disabled {
      background-color: #22232e;
      box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), 0px 0px 1px 1px rgba(0, 0, 0, 0.1); }
    scale slider:backdrop, scale slider:backdrop:disabled {
      transition: 200ms ease-out;
      background-color: #22232e;
      box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), 0px 0px 1px 1px rgba(0, 0, 0, 0.1); }
    row:selected scale slider:disabled, row:selected scale slider {
      border-color: rgba(159, 99, 246, 0.5); }
    .osd scale slider {
      color: #fefefe;
      border-color: rgba(0, 0, 0, 0.7);
      background-color: rgba(20, 23, 26, 0.8);
      background-clip: padding-box;
      box-shadow: inset 0 1px rgba(255, 255, 255, 0.1);
      text-shadow: 0 1px black;
      -gtk-icon-shadow: 0 1px black;
      outline-color: rgba(254, 254, 254, 0.3);
      border-color: rgba(0, 0, 0, 0.7);
      background-color: #14171a; }
      .osd scale slider:hover {
        color: white;
        border-color: rgba(0, 0, 0, 0.7);
        background-image: linear-gradient(to bottom, rgba(47, 54, 61, 0.8), rgba(47, 54, 61, 0.8));
        background-clip: padding-box;
        box-shadow: inset 0 1px rgba(255, 255, 255, 0.1);
        text-shadow: 0 1px black;
        -gtk-icon-shadow: 0 1px black;
        outline-color: rgba(254, 254, 254, 0.3);
        background-color: #14171a; }
      .osd scale slider:active {
        color: white;
        border-color: rgba(0, 0, 0, 0.7);
        background-image: linear-gradient(to bottom, rgba(33, 38, 43, 0.8), rgba(33, 38, 43, 0.8));
        background-clip: padding-box;
        box-shadow: inset 0 1px rgba(255, 255, 255, 0.1);
        text-shadow: none;
        -gtk-icon-shadow: none;
        outline-color: rgba(254, 254, 254, 0.3);
        background-color: #14171a; }
      .osd scale slider:disabled {
        color: #898b8c;
        border-color: rgba(0, 0, 0, 0.7);
        background-image: linear-gradient(to bottom, rgba(43, 46, 49, 0.5), rgba(43, 46, 49, 0.5));
        background-clip: padding-box;
        box-shadow: none;
        text-shadow: none;
        -gtk-icon-shadow: none;
        background-color: #14171a; }
      .osd scale slider:backdrop {
        color: #fefefe;
        border-color: rgba(0, 0, 0, 0.7);
        background-image: linear-gradient(to bottom, rgba(20, 23, 26, 0.8), rgba(20, 23, 26, 0.8));
        background-clip: padding-box;
        box-shadow: none;
        text-shadow: none;
        -gtk-icon-shadow: none;
        background-color: #14171a; }
        .osd scale slider:backdrop:disabled {
          background-color: #14171a; }
  scale value {
    color: alpha(currentColor,0.4); }
  scale marks {
    color: alpha(currentColor,0.4); }
    scale marks.top {
      margin-bottom: 6px;
      margin-top: -12px; }
    scale marks.bottom {
      margin-top: 6px;
      margin-bottom: -12px; }
    scale marks.top {
      margin-right: 6px;
      margin-left: -12px; }
    scale marks.bottom {
      margin-left: 6px;
      margin-right: -12px; }
  scale.fine-tune marks.top {
    margin-bottom: 6px;
    margin-top: -9px; }
  scale.fine-tune marks.bottom {
    margin-top: 6px;
    margin-bottom: -9px; }
  scale.fine-tune marks.top {
    margin-right: 6px;
    margin-left: -9px; }
  scale.fine-tune marks.bottom {
    margin-left: 6px;
    margin-right: -9px; }
  scale.horizontal indicator {
    min-height: 6px;
    min-width: 1px; }
  scale.horizontal.fine-tune indicator {
    min-height: 3px; }
  scale.vertical indicator {
    min-height: 1px;
    min-width: 6px; }
  scale.vertical.fine-tune indicator {
    min-width: 3px; }
  scale.horizontal.marks-before:not(.marks-after) slider {
    min-height: 16px;
    min-width: 16px;
    margin: -7px;
    border: none;
    border-radius: 50%;
    background-color: #3e4153;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), 0px 0px 1px 1px rgba(0, 0, 0, 0.1); }
  scale.horizontal.marks-before:not(.marks-after).fine-tune slider {
    margin: -7px; }
  scale.horizontal.marks-before:not(.marks-after) slider:hover {
    min-height: 16px;
    min-width: 16px;
    margin: -7px;
    border: none;
    border-radius: 50%;
    background-color: #3e4153;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), 0px 0px 1px 1px rgba(0, 0, 0, 0.1); }
  scale.horizontal.marks-before:not(.marks-after).fine-tune slider {
    margin: -7px; }
  scale.horizontal.marks-before:not(.marks-after) slider:active {
    min-height: 16px;
    min-width: 16px;
    margin: -7px;
    border: none;
    border-radius: 50%;
    background-color: #3e4153;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), 0px 0px 1px 1px rgba(0, 0, 0, 0.1); }
  scale.horizontal.marks-before:not(.marks-after).fine-tune slider {
    margin: -7px; }
  scale.horizontal.marks-before:not(.marks-after) slider:disabled {
    min-height: 16px;
    min-width: 16px;
    margin: -7px;
    border: none;
    border-radius: 50%;
    background-color: #3e4153;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), 0px 0px 1px 1px rgba(0, 0, 0, 0.1); }
  scale.horizontal.marks-before:not(.marks-after).fine-tune slider {
    margin: -7px; }
  scale.horizontal.marks-before:not(.marks-after) slider:backdrop {
    min-height: 16px;
    min-width: 16px;
    margin: -7px;
    border: none;
    border-radius: 50%;
    background-color: #3e4153;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), 0px 0px 1px 1px rgba(0, 0, 0, 0.1); }
  scale.horizontal.marks-before:not(.marks-after).fine-tune slider {
    margin: -7px; }
  scale.horizontal.marks-before:not(.marks-after) slider:backdrop:disabled {
    min-height: 16px;
    min-width: 16px;
    margin: -7px;
    border: none;
    border-radius: 50%;
    background-color: #3e4153;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), 0px 0px 1px 1px rgba(0, 0, 0, 0.1); }
  scale.horizontal.marks-before:not(.marks-after).fine-tune slider {
    margin: -7px; }
  scale.horizontal.marks-after:not(.marks-before) slider {
    min-height: 16px;
    min-width: 16px;
    margin: -7px;
    border: none;
    border-radius: 50%;
    background-color: #3e4153;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), 0px 0px 1px 1px rgba(0, 0, 0, 0.1); }
  scale.horizontal.marks-after:not(.marks-before).fine-tune slider {
    margin: -7px; }
  scale.horizontal.marks-after:not(.marks-before) slider:hover {
    min-height: 16px;
    min-width: 16px;
    margin: -7px;
    border: none;
    border-radius: 50%;
    background-color: #3e4153;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), 0px 0px 1px 1px rgba(0, 0, 0, 0.1); }
  scale.horizontal.marks-after:not(.marks-before).fine-tune slider {
    margin: -7px; }
  scale.horizontal.marks-after:not(.marks-before) slider:active {
    min-height: 16px;
    min-width: 16px;
    margin: -7px;
    border: none;
    border-radius: 50%;
    background-color: #3e4153;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), 0px 0px 1px 1px rgba(0, 0, 0, 0.1); }
  scale.horizontal.marks-after:not(.marks-before).fine-tune slider {
    margin: -7px; }
  scale.horizontal.marks-after:not(.marks-before) slider:disabled {
    min-height: 16px;
    min-width: 16px;
    margin: -7px;
    border: none;
    border-radius: 50%;
    background-color: #3e4153;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), 0px 0px 1px 1px rgba(0, 0, 0, 0.1); }
  scale.horizontal.marks-after:not(.marks-before).fine-tune slider {
    margin: -7px; }
  scale.horizontal.marks-after:not(.marks-before) slider:backdrop {
    min-height: 16px;
    min-width: 16px;
    margin: -7px;
    border: none;
    border-radius: 50%;
    background-color: #3e4153;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), 0px 0px 1px 1px rgba(0, 0, 0, 0.1); }
  scale.horizontal.marks-after:not(.marks-before).fine-tune slider {
    margin: -7px; }
  scale.horizontal.marks-after:not(.marks-before) slider:backdrop:disabled {
    min-height: 16px;
    min-width: 16px;
    margin: -7px;
    border: none;
    border-radius: 50%;
    background-color: #3e4153;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), 0px 0px 1px 1px rgba(0, 0, 0, 0.1); }
  scale.horizontal.marks-after:not(.marks-before).fine-tune slider {
    margin: -7px; }
  scale.vertical.marks-before:not(.marks-after) slider {
    min-height: 16px;
    min-width: 16px;
    margin: -7px;
    border: none;
    border-radius: 50%;
    background-color: #3e4153;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), 0px 0px 1px 1px rgba(0, 0, 0, 0.1); }
  scale.vertical.marks-before:not(.marks-after).fine-tune slider {
    margin: -7px; }
  scale.vertical.marks-before:not(.marks-after) slider:hover {
    min-height: 16px;
    min-width: 16px;
    margin: -7px;
    border: none;
    border-radius: 50%;
    background-color: #3e4153;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), 0px 0px 1px 1px rgba(0, 0, 0, 0.1); }
  scale.vertical.marks-before:not(.marks-after).fine-tune slider {
    margin: -7px; }
  scale.vertical.marks-before:not(.marks-after) slider:active {
    min-height: 16px;
    min-width: 16px;
    margin: -7px;
    border: none;
    border-radius: 50%;
    background-color: #3e4153;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), 0px 0px 1px 1px rgba(0, 0, 0, 0.1); }
  scale.vertical.marks-before:not(.marks-after).fine-tune slider {
    margin: -7px; }
  scale.vertical.marks-before:not(.marks-after) slider:disabled {
    min-height: 16px;
    min-width: 16px;
    margin: -7px;
    border: none;
    border-radius: 50%;
    background-color: #3e4153;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), 0px 0px 1px 1px rgba(0, 0, 0, 0.1); }
  scale.vertical.marks-before:not(.marks-after).fine-tune slider {
    margin: -7px; }
  scale.vertical.marks-before:not(.marks-after) slider:backdrop {
    min-height: 16px;
    min-width: 16px;
    margin: -7px;
    border: none;
    border-radius: 50%;
    background-color: #3e4153;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), 0px 0px 1px 1px rgba(0, 0, 0, 0.1); }
  scale.vertical.marks-before:not(.marks-after).fine-tune slider {
    margin: -7px; }
  scale.vertical.marks-before:not(.marks-after) slider:backdrop:disabled {
    min-height: 16px;
    min-width: 16px;
    margin: -7px;
    border: none;
    border-radius: 50%;
    background-color: #3e4153;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), 0px 0px 1px 1px rgba(0, 0, 0, 0.1); }
  scale.vertical.marks-before:not(.marks-after).fine-tune slider {
    margin: -7px; }
  scale.vertical.marks-after:not(.marks-before) slider {
    min-height: 16px;
    min-width: 16px;
    margin: -7px;
    border: none;
    border-radius: 50%;
    background-color: #3e4153;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), 0px 0px 1px 1px rgba(0, 0, 0, 0.1); }
  scale.vertical.marks-after:not(.marks-before).fine-tune slider {
    margin: -7px; }
  scale.vertical.marks-after:not(.marks-before) slider:hover {
    min-height: 16px;
    min-width: 16px;
    margin: -7px;
    border: none;
    border-radius: 50%;
    background-color: #3e4153;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), 0px 0px 1px 1px rgba(0, 0, 0, 0.1); }
  scale.vertical.marks-after:not(.marks-before).fine-tune slider {
    margin: -7px; }
  scale.vertical.marks-after:not(.marks-before) slider:active {
    min-height: 16px;
    min-width: 16px;
    margin: -7px;
    border: none;
    border-radius: 50%;
    background-color: #3e4153;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), 0px 0px 1px 1px rgba(0, 0, 0, 0.1); }
  scale.vertical.marks-after:not(.marks-before).fine-tune slider {
    margin: -7px; }
  scale.vertical.marks-after:not(.marks-before) slider:disabled {
    min-height: 16px;
    min-width: 16px;
    margin: -7px;
    border: none;
    border-radius: 50%;
    background-color: #3e4153;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), 0px 0px 1px 1px rgba(0, 0, 0, 0.1); }
  scale.vertical.marks-after:not(.marks-before).fine-tune slider {
    margin: -7px; }
  scale.vertical.marks-after:not(.marks-before) slider:backdrop {
    min-height: 16px;
    min-width: 16px;
    margin: -7px;
    border: none;
    border-radius: 50%;
    background-color: #3e4153;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), 0px 0px 1px 1px rgba(0, 0, 0, 0.1); }
  scale.vertical.marks-after:not(.marks-before).fine-tune slider {
    margin: -7px; }
  scale.vertical.marks-after:not(.marks-before) slider:backdrop:disabled {
    min-height: 16px;
    min-width: 16px;
    margin: -7px;
    border: none;
    border-radius: 50%;
    background-color: #3e4153;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1), 0px 0px 1px 1px rgba(0, 0, 0, 0.1); }
  scale.vertical.marks-after:not(.marks-before).fine-tune slider {
    margin: -7px; }
  scale.color {
    min-height: 0;
    min-width: 0; }
    scale.color trough {
      background-image: image(rgba(25, 26, 34, 0.9));
      background-repeat: no-repeat; }
    scale.color.horizontal {
      padding: 0 0 15px 0; }
      scale.color.horizontal trough {
        padding-bottom: 4px;
        background-position: 0 -3px;
        border-top-left-radius: 0;
        border-top-right-radius: 0; }
      scale.color.horizontal slider:dir(ltr):hover, scale.color.horizontal slider:dir(ltr):backdrop, scale.color.horizontal slider:dir(ltr):disabled, scale.color.horizontal slider:dir(ltr):backdrop:disabled, scale.color.horizontal slider:dir(ltr), scale.color.horizontal slider:dir(rtl):hover, scale.color.horizontal slider:dir(rtl):backdrop, scale.color.horizontal slider:dir(rtl):disabled, scale.color.horizontal slider:dir(rtl):backdrop:disabled, scale.color.horizontal slider:dir(rtl) {
        margin-bottom: -15px;
        margin-top: 6px; }
    scale.color.vertical:dir(ltr) {
      padding: 0 0 0 15px; }
      scale.color.vertical:dir(ltr) trough {
        padding-left: 4px;
        background-position: 3px 0;
        border-bottom-right-radius: 0;
        border-top-right-radius: 0; }
      scale.color.vertical:dir(ltr) slider:hover, scale.color.vertical:dir(ltr) slider:backdrop, scale.color.vertical:dir(ltr) slider:disabled, scale.color.vertical:dir(ltr) slider:backdrop:disabled, scale.color.vertical:dir(ltr) slider {
        margin-left: -15px;
        margin-right: 6px; }
    scale.color.vertical:dir(rtl) {
      padding: 0 15px 0 0; }
      scale.color.vertical:dir(rtl) trough {
        padding-right: 4px;
        background-position: -3px 0;
        border-bottom-left-radius: 0;
        border-top-left-radius: 0; }
      scale.color.vertical:dir(rtl) slider:hover, scale.color.vertical:dir(rtl) slider:backdrop, scale.color.vertical:dir(rtl) slider:disabled, scale.color.vertical:dir(rtl) slider:backdrop:disabled, scale.color.vertical:dir(rtl) slider {
        margin-right: -15px;
        margin-left: 6px; }
    scale.color.fine-tune.horizontal:dir(ltr), scale.color.fine-tune.horizontal:dir(rtl) {
      padding: 0 0 12px 0; }
      scale.color.fine-tune.horizontal:dir(ltr) trough, scale.color.fine-tune.horizontal:dir(rtl) trough {
        padding-bottom: 7px;
        background-position: 0 -6px; }
      scale.color.fine-tune.horizontal:dir(ltr) slider, scale.color.fine-tune.horizontal:dir(rtl) slider {
        margin-bottom: -15px;
        margin-top: 6px; }
    scale.color.fine-tune.vertical:dir(ltr) {
      padding: 0 0 0 12px; }
      scale.color.fine-tune.vertical:dir(ltr) trough {
        padding-left: 7px;
        background-position: 6px 0; }
      scale.color.fine-tune.vertical:dir(ltr) slider {
        margin-left: -15px;
        margin-right: 6px; }
    scale.color.fine-tune.vertical:dir(rtl) {
      padding: 0 12px 0 0; }
      scale.color.fine-tune.vertical:dir(rtl) trough {
        padding-right: 7px;
        background-position: -6px 0; }
      scale.color.fine-tune.vertical:dir(rtl) slider {
        margin-right: -15px;
        margin-left: 6px; }

/**************
 * Scrollbars *
 **************/
scrollbar {
  background-color: #232530;
  transition: 300ms cubic-bezier(0.25, 0.46, 0.45, 0.94); }
  * {
    -GtkScrollbar-has-backward-stepper: false;
    -GtkScrollbar-has-forward-stepper: false; }
  scrollbar.top {
    border-bottom: 1px solid rgba(25, 26, 34, 0.9); }
  scrollbar.bottom {
    border-top: 1px solid rgba(25, 26, 34, 0.9); }
  scrollbar.left {
    border-right: 1px solid rgba(25, 26, 34, 0.9); }
  scrollbar.right {
    border-left: 1px solid rgba(25, 26, 34, 0.9); }
  scrollbar:backdrop {
    background-color: #181820;
    border-color: rgba(26, 27, 35, 0.91);
    transition: 200ms ease-out; }
  scrollbar slider {
    min-width: 6px;
    min-height: 6px;
    margin: -1px;
    border: 4px solid transparent;
    border-radius: 8px;
    background-clip: padding-box;
    background-color: #a1a1a2; }
    scrollbar slider:hover {
      background-color: #cccdca; }
    scrollbar slider:hover:active {
      background-color: rgba(219, 195, 252, 0.5); }
    scrollbar slider:backdrop {
      background-color: #4a4b51; }
    scrollbar slider:disabled {
      background-color: transparent; }
  scrollbar.fine-tune slider {
    min-width: 4px;
    min-height: 4px; }
  scrollbar.fine-tune.horizontal slider {
    border-width: 5px 4px; }
  scrollbar.fine-tune.vertical slider {
    border-width: 4px 5px; }
  scrollbar.overlay-indicator:not(.dragging):not(.hovering) {
    border-color: transparent;
    opacity: 0.4;
    background-color: transparent; }
    scrollbar.overlay-indicator:not(.dragging):not(.hovering) slider {
      margin: 0;
      min-width: 3px;
      min-height: 3px;
      background-color: #f8f8f2;
      border: 1px solid black; }
    scrollbar.overlay-indicator:not(.dragging):not(.hovering) button {
      min-width: 5px;
      min-height: 5px;
      background-color: #f8f8f2;
      background-clip: padding-box;
      border-radius: 100%;
      border: 1px solid black;
      -gtk-icon-source: none; }
    scrollbar.overlay-indicator:not(.dragging):not(.hovering).horizontal slider {
      margin: 0 2px;
      min-width: 40px; }
    scrollbar.overlay-indicator:not(.dragging):not(.hovering).horizontal button {
      margin: 1px 2px;
      min-width: 5px; }
    scrollbar.overlay-indicator:not(.dragging):not(.hovering).vertical slider {
      margin: 2px 0;
      min-height: 40px; }
    scrollbar.overlay-indicator:not(.dragging):not(.hovering).vertical button {
      margin: 2px 1px;
      min-height: 5px; }
  scrollbar.overlay-indicator.dragging, scrollbar.overlay-indicator.hovering {
    opacity: 0.8; }
  scrollbar.horizontal slider {
    min-width: 40px; }
  scrollbar.vertical slider {
    min-height: 40px; }
  scrollbar button {
    padding: 0;
    min-width: 12px;
    min-height: 12px;
    border-style: none;
    border-radius: 0;
    transition-property: min-height, min-width, color;
    border-color: transparent;
    background-color: transparent;
    background-image: none;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0);
    text-shadow: none;
    -gtk-icon-shadow: none;
    color: #a1a1a2; }
    scrollbar button:hover {
      border-color: transparent;
      background-color: transparent;
      background-image: none;
      box-shadow: inset 0 1px rgba(255, 255, 255, 0);
      text-shadow: none;
      -gtk-icon-shadow: none;
      color: #cccdca; }
    scrollbar button:active, scrollbar button:checked {
      border-color: transparent;
      background-color: transparent;
      background-image: none;
      box-shadow: inset 0 1px rgba(255, 255, 255, 0);
      text-shadow: none;
      -gtk-icon-shadow: none;
      color: rgba(219, 195, 252, 0.5); }
    scrollbar button:disabled {
      border-color: transparent;
      background-color: transparent;
      background-image: none;
      box-shadow: inset 0 1px rgba(255, 255, 255, 0);
      text-shadow: none;
      -gtk-icon-shadow: none;
      color: rgba(161, 161, 162, 0.2); }
    scrollbar button:backdrop {
      border-color: transparent;
      background-color: transparent;
      background-image: none;
      box-shadow: inset 0 1px rgba(255, 255, 255, 0);
      text-shadow: none;
      -gtk-icon-shadow: none;
      color: #4a4b51; }
      scrollbar button:backdrop:disabled {
        border-color: transparent;
        background-color: transparent;
        background-image: none;
        box-shadow: inset 0 1px rgba(255, 255, 255, 0);
        text-shadow: none;
        -gtk-icon-shadow: none;
        color: rgba(74, 75, 81, 0.2); }
  scrollbar.vertical button.down {
    -gtk-icon-source: -gtk-icontheme("pan-down-symbolic"); }
  scrollbar.vertical button.up {
    -gtk-icon-source: -gtk-icontheme("pan-up-symbolic"); }
  scrollbar.horizontal button.down {
    -gtk-icon-source: -gtk-icontheme("pan-right-symbolic"); }
  scrollbar.horizontal button.up {
    -gtk-icon-source: -gtk-icontheme("pan-left-symbolic"); }

treeview ~ scrollbar.vertical {
  border-top: 1px solid rgba(25, 26, 34, 0.9);
  margin-top: -1px; }

/***********
 * Sidebar *
 ***********/
.sidebar {
  border-style: none;
  border-width: 0;
  background-color: #20212b; }
  .sidebar .frame {
    border: none; }
  stacksidebar.sidebar:dir(ltr) list, stacksidebar.sidebar.left list, stacksidebar.sidebar.left:dir(rtl) list, .sidebar:dir(ltr), .sidebar.left, .sidebar.left:dir(rtl) {
    border-right: none;
    border-left-style: none; }
  stacksidebar.sidebar:dir(rtl) list
  .sidebar:dir(rtl), stacksidebar.sidebar.right list
  .sidebar:dir(rtl), .sidebar.right {
    border-left: 1px solid rgba(25, 26, 34, 0.9);
    border-right-style: none; }
  .sidebar:backdrop {
    background-color: #242631;
    border-color: rgba(26, 27, 35, 0.91);
    transition: 200ms ease-out; }
  .sidebar list {
    background-color: #20212b; }
  .sidebar row {
    margin: 0 10px;
    padding: 10px 12px;
    border-radius: 10px; }
    .sidebar row:selected {
      background: rgba(189, 147, 249, 0.1);
      color: #bd93f9; }
      .sidebar row:selected:backdrop {
        background: rgba(189, 147, 249, 0.1); }
        .sidebar row:selected:backdrop label {
          color: rgba(189, 147, 249, 0.4); }
      .sidebar row:selected:hover {
        background-color: rgba(189, 147, 249, 0.3); }
      .sidebar row:selected label {
        color: #bd93f9; }
  .sidebar.source-list {
    background-color: #1e1f29;
    color: #F2EFEA;
    padding: 4px 0px; }
    .sidebar.source-list.view:selected:active, iconview.sidebar.source-list:selected:active {
      box-shadow: inset 0 2px 3px -1px rgba(0, 0, 0, 0.5); }
    .sidebar.source-list.view:selected.has-open-popup, iconview.sidebar.source-list:selected.has-open-popup, .sidebar.source-list.view:selected:hover, iconview.sidebar.source-list:selected:hover {
      background-color: rgba(189, 147, 249, 0.3); }
    .sidebar.source-list.view:selected:backdrop, iconview.sidebar.source-list:selected:backdrop {
      background-color: rgba(189, 147, 249, 0.4); }
    .sidebar.source-list.view:hover, iconview.sidebar.source-list:hover, .sidebar.source-list.view iconview.source-list:hover, iconview.sidebar.source-list iconview.source-list:hover {
      background-color: rgba(40, 42, 54, 0.6); }
  paned .sidebar.left, paned .sidebar.right, paned .sidebar.left:dir(rtl), paned .sidebar:dir(rtl), paned .sidebar:dir(ltr), paned .sidebar {
    border-style: none;
    border-color: rgba(25, 26, 34, 0.9); }

stacksidebar row {
  padding: 10px 4px; }
  stacksidebar row > label {
    padding-left: 6px;
    padding-right: 6px; }
  stacksidebar row.needs-attention > label {
    background-size: 6px 6px, 0 0; }

placessidebar > viewport.frame {
  border-style: none; }
placessidebar row.sidebar-new-bookmark-row {
  color: rgba(189, 147, 249, 0.5); }
placessidebar row:drop(active):not(:disabled) {
  box-shadow: inset 0 1px #50fa7a, inset 0 -1px #50fa7a; }
  placessidebar row:drop(active):not(:disabled), placessidebar row:drop(active):not(:disabled) label, placessidebar row:drop(active):not(:disabled) image {
    color: #50fa7a; }
  placessidebar row:drop(active):not(:disabled):selected {
    background-color: #50fa7a; }
    placessidebar row:drop(active):not(:disabled):selected, placessidebar row:drop(active):not(:disabled):selected label, placessidebar row:drop(active):not(:disabled):selected image {
      color: #f8f8f2; }

/*****************
 * GtkSpinButton *
 *****************/
spinbutton:not(.vertical) {
  padding: 0; }
  spinbutton:not(.vertical) entry {
    min-width: 28px;
    margin: 0;
    background: none;
    background-color: transparent;
    border: none;
    border-radius: 0;
    box-shadow: none; }
  spinbutton:not(.vertical) button {
    min-height: 16px;
    margin: 0;
    padding-bottom: 0;
    padding-top: 0;
    color: #e3e3df;
    background-image: none;
    border-style: none none none solid;
    border-color: rgba(25, 26, 34, 0.2);
    border-radius: 0;
    box-shadow: inset 1px 0px 0px 0px rgba(0, 0, 0, 0.07); }
    spinbutton:not(.vertical) button:dir(rtl) {
      border-style: none solid none none; }
    spinbutton:not(.vertical) button:hover {
      color: #f8f8f2;
      background-color: rgba(248, 248, 242, 0.05); }
    spinbutton:not(.vertical) button:disabled {
      color: rgba(139, 140, 142, 0.3); }
    spinbutton:not(.vertical) button:active {
      background-color: rgba(0, 0, 0, 0.1);
      box-shadow: inset 0 2px 3px -1px rgba(0, 0, 0, 0.2); }
    spinbutton:not(.vertical) button:backdrop {
      color: #818286;
      background-color: transparent;
      border-color: rgba(26, 27, 35, 0.21);
      transition: 200ms ease-out; }
    spinbutton:not(.vertical) button:backdrop:disabled {
      color: rgba(62, 64, 85, 0.3);
      background-image: none;
      border-style: none none none solid;
      box-shadow: inset 1px 0px 0px 0px rgba(0, 0, 0, 0.07); }
      spinbutton:not(.vertical) button:backdrop:disabled:dir(rtl) {
        border-style: none solid none none; }
    spinbutton:not(.vertical) button:last-child {
      border-top-right-radius: 2px;
      border-bottom-right-radius: 2px; }
.osd spinbutton:not(.vertical) button {
  border-color: transparent;
  background-color: transparent;
  background-image: none;
  box-shadow: inset 0 1px rgba(255, 255, 255, 0);
  text-shadow: none;
  -gtk-icon-shadow: none;
  color: #fefefe;
  border-style: none none none solid;
  border-color: rgba(0, 0, 0, 0.4);
  border-radius: 0;
  box-shadow: none;
  -gtk-icon-shadow: 0 1px black; }
  .osd spinbutton:not(.vertical) button:dir(rtl) {
    border-style: none solid none none; }
  .osd spinbutton:not(.vertical) button:hover {
    border-color: transparent;
    background-color: transparent;
    background-image: none;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0);
    text-shadow: none;
    -gtk-icon-shadow: none;
    color: #fefefe;
    border-color: rgba(0, 0, 0, 0.5);
    background-color: rgba(254, 254, 254, 0.1);
    -gtk-icon-shadow: 0 1px black;
    box-shadow: none; }
  .osd spinbutton:not(.vertical) button:backdrop {
    border-color: transparent;
    background-color: transparent;
    background-image: none;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0);
    text-shadow: none;
    -gtk-icon-shadow: none;
    color: #fefefe;
    border-color: rgba(0, 0, 0, 0.5);
    -gtk-icon-shadow: none;
    box-shadow: none; }
  .osd spinbutton:not(.vertical) button:disabled {
    border-color: transparent;
    background-color: transparent;
    background-image: none;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0);
    text-shadow: none;
    -gtk-icon-shadow: none;
    color: #898b8c;
    border-color: rgba(0, 0, 0, 0.5);
    -gtk-icon-shadow: none;
    box-shadow: none; }
  .osd spinbutton:not(.vertical) button:last-child {
    border-radius: 0 3px 3px 0; }
  .osd spinbutton:not(.vertical) button:dir(rtl):first-child {
    border-radius: 3px 0 0 3px; }
spinbutton.vertical:disabled {
  color: #8b8c8e; }
spinbutton.vertical:backdrop:disabled {
  color: #3e4055; }
spinbutton.vertical:drop(active) {
  border-color: transparent;
  box-shadow: none; }
spinbutton.vertical entry {
  min-height: 32px;
  min-width: 32px;
  padding: 0;
  border-radius: 0; }
spinbutton.vertical button {
  min-height: 32px;
  min-width: 32px;
  padding: 0;
  border-width: 1px;
  border-color: rgba(25, 26, 34, 0.9);
  box-shadow: 0 1px rgba(255, 255, 255, 0.1); }
spinbutton.vertical button.up {
  border-radius: 3px 3px 0 0;
  border-style: solid solid none solid; }
spinbutton.vertical button.down {
  border-radius: 0 0 3px 3px;
  border-style: none solid solid solid; }
.osd spinbutton.vertical button:first-child {
  color: #fefefe;
  border-color: rgba(0, 0, 0, 0.7);
  background-color: rgba(20, 23, 26, 0.8);
  background-clip: padding-box;
  box-shadow: inset 0 1px rgba(255, 255, 255, 0.1);
  text-shadow: 0 1px black;
  -gtk-icon-shadow: 0 1px black;
  outline-color: rgba(254, 254, 254, 0.3); }
  .osd spinbutton.vertical button:first-child:hover {
    color: white;
    border-color: rgba(0, 0, 0, 0.7);
    background-image: linear-gradient(to bottom, rgba(47, 54, 61, 0.8), rgba(47, 54, 61, 0.8));
    background-clip: padding-box;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1);
    text-shadow: 0 1px black;
    -gtk-icon-shadow: 0 1px black;
    outline-color: rgba(254, 254, 254, 0.3); }
  .osd spinbutton.vertical button:first-child:active {
    color: white;
    border-color: rgba(0, 0, 0, 0.7);
    background-image: linear-gradient(to bottom, rgba(33, 38, 43, 0.8), rgba(33, 38, 43, 0.8));
    background-clip: padding-box;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1);
    text-shadow: none;
    -gtk-icon-shadow: none;
    outline-color: rgba(254, 254, 254, 0.3); }
  .osd spinbutton.vertical button:first-child:disabled {
    color: #898b8c;
    border-color: rgba(0, 0, 0, 0.7);
    background-image: linear-gradient(to bottom, rgba(43, 46, 49, 0.5), rgba(43, 46, 49, 0.5));
    background-clip: padding-box;
    box-shadow: none;
    text-shadow: none;
    -gtk-icon-shadow: none; }
  .osd spinbutton.vertical button:first-child:backdrop {
    color: #fefefe;
    border-color: rgba(0, 0, 0, 0.7);
    background-image: linear-gradient(to bottom, rgba(20, 23, 26, 0.8), rgba(20, 23, 26, 0.8));
    background-clip: padding-box;
    box-shadow: none;
    text-shadow: none;
    -gtk-icon-shadow: none; }
treeview spinbutton:not(.vertical) {
  min-height: 0;
  border-style: none;
  border-radius: 0; }
  treeview spinbutton:not(.vertical) entry {
    min-height: 0;
    padding: 1px 2px; }

/***********
 * Spinner *
 ***********/
menu spinner {
  color: rgba(189, 147, 249, 0.5); }

/*********************
 * Spinner Animation *
 *********************/
@keyframes spin {
  to {
    -gtk-icon-transform: rotate(1turn); } }
spinner {
  background: none;
  opacity: 0;
  -gtk-icon-source: -gtk-icontheme("process-working-symbolic"); }
  spinner:checked {
    opacity: 1;
    animation: spin 1s linear infinite; }
    spinner:checked:disabled {
      opacity: 0.5; }

/**********
 * Switch *
 **********/
switch {
  font-size: 1px;
  font-weight: bold;
  outline-offset: -4px;
  transition: all 200ms ease-in;
  border: none;
  border-radius: 14px;
  color: transparent;
  padding: 2px;
  background-color: #3e4153;
  box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.05), 0px 1px rgba(0, 0, 0, 0.1); }
  switch:disabled {
    background-color: #22232e; }
  switch:backdrop {
    background-color: #2f313f;
    transition: 200ms ease-out; }
    switch:backdrop:disabled {
      background-color: #22232e; }
  switch:active, switch:checked {
    background-color: #50fa7a; }
    switch:active:backdrop, switch:checked:backdrop {
      background-color: #50fa7a; }
      switch:active:backdrop slider:backdrop, switch:checked:backdrop slider:backdrop {
        box-shadow: none;
        background-color: rgba(40, 42, 54, 0.9);
        border: none; }
  switch slider {
    padding: 2px;
    min-width: 16px;
    min-height: 16px;
    border-radius: 100%;
    transition: all 200ms cubic-bezier(0.25, 0.46, 0.45, 0.94);
    background-color: #282a36;
    box-shadow: 0 2px 2px rgba(0, 0, 0, 0.2), 0 1px 2px rgba(0, 0, 0, 0.2); }
    switch slider:backdrop {
      padding: 2px;
      box-shadow: none;
      background-color: #282a36; }
  switch trough:active, switch trough:checked {
    background-color: rgba(189, 147, 249, 0.5); }
    switch trough:active:backdrop, switch trough:checked:backdrop {
      background-color: rgba(189, 147, 249, 0.4); }

/************
 * Toolbars *
 ************/
toolbar, .inline-toolbar, searchbar,
.location-bar {
  -GtkWidget-window-dragging: true;
  padding: 4px;
  background-color: #1e1f29; }

toolbar {
  padding: 4px 3px 3px 4px; }
  .osd toolbar {
    background-color: transparent; }
  toolbar.osd {
    padding: 13px;
    border: none;
    border-radius: 5px;
    background-color: rgba(20, 23, 26, 0.8); }
    toolbar.osd.left, toolbar.osd.right, toolbar.osd.top, toolbar.osd.bottom {
      border-radius: 0; }
  toolbar.horizontal separator {
    margin: 0 7px 1px 6px; }
  toolbar.vertical separator {
    margin: 6px 1px 7px 0; }
  toolbar:not(.inline-toolbar):not(.osd) switch,
  toolbar:not(.inline-toolbar):not(.osd) scale,
  toolbar:not(.inline-toolbar):not(.osd) entry,
  toolbar:not(.inline-toolbar):not(.osd) spinbutton,
  toolbar:not(.inline-toolbar):not(.osd) button {
    margin-right: 1px;
    margin-bottom: 1px; }

.inline-toolbar {
  padding: 3px;
  border-width: 0 1px 1px;
  border-radius: 0  0 5px 5px; }

searchbar,
.location-bar {
  border-width: 0 0 1px;
  padding: 3px; }

.inline-toolbar, searchbar,
.location-bar {
  border-style: solid;
  border-color: rgba(25, 26, 34, 0.9);
  background-color: rgba(29, 30, 39, 0.97); }
  .inline-toolbar:backdrop, searchbar:backdrop,
  .location-bar:backdrop {
    border-color: rgba(26, 27, 35, 0.91);
    background-color: rgba(29, 30, 39, 0.9685);
    box-shadow: none;
    transition: 200ms ease-out; }

searchbar {
  background: #282a36; }

/************
 * Tooltips *
 ************/
tooltip {
  padding: 4px;
  /* not working */
  border-radius: 5px;
  box-shadow: none;
  text-shadow: 0 1px black; }
  tooltip.background {
    background-color: rgba(0, 0, 0, 0.8);
    background-clip: padding-box;
    border: 1px solid rgba(255, 255, 255, 0.1); }
  tooltip decoration {
    background-color: transparent; }
  tooltip * {
    padding: 4px;
    background-color: transparent;
    color: white; }

/**************
 * Tree Views *
 **************/
treeview.view {
  border-left-color: #909194;
  border-top-color: #1e1f29; }
  * {
    -GtkTreeView-horizontal-separator: 4;
    -GtkTreeView-grid-line-width: 1;
    -GtkTreeView-tree-line-width: 1;
    -GtkTreeView-expander-size: 16; }
  treeview.view:selected:focus, treeview.view:selected {
    border-radius: 0; }
  treeview.view:selected:backdrop, treeview.view:selected {
    border-left-color: rgba(233, 223, 244, 0.75);
    border-top-color: rgba(248, 248, 242, 0.1); }
  treeview.view:disabled {
    color: #8b8c8e; }
    treeview.view:disabled:selected {
      color: rgba(228, 214, 244, 0.7); }
      treeview.view:disabled:selected:backdrop {
        color: rgba(207, 177, 247, 0.5); }
    treeview.view:disabled:backdrop {
      color: #3e4055; }
  treeview.view.separator {
    min-height: 2px;
    color: #1e1f29; }
    treeview.view.separator:backdrop {
      color: rgba(30, 31, 41, 0.1); }
  treeview.view:backdrop {
    border-left-color: #55565c;
    border-top: #1e1f29; }
  treeview.view:drop(active) {
    border-style: solid none;
    border-width: 1px;
    border-color: rgba(159, 99, 246, 0.5); }
    treeview.view:drop(active).after {
      border-top-style: none; }
    treeview.view:drop(active).before {
      border-bottom-style: none; }
  treeview.view.expander {
    -gtk-icon-source: -gtk-icontheme("pan-end-symbolic");
    color: #bababa; }
    treeview.view.expander:dir(rtl) {
      -gtk-icon-source: -gtk-icontheme("pan-end-symbolic-rtl"); }
    treeview.view.expander:hover {
      color: #f8f8f2; }
    treeview.view.expander:selected {
      color: rgba(241, 235, 243, 0.85); }
      treeview.view.expander:selected:hover {
        color: #f8f8f2; }
      treeview.view.expander:selected:backdrop {
        color: rgba(230, 218, 244, 0.5); }
    treeview.view.expander:checked {
      -gtk-icon-source: -gtk-icontheme("pan-down-symbolic"); }
    treeview.view.expander:backdrop {
      color: #6e6f75; }
  treeview.view.progressbar {
    border: 1px solid rgba(159, 99, 246, 0.5);
    border-radius: 4px;
    background-color: rgba(189, 147, 249, 0.5);
    background-image: linear-gradient(to bottom, rgba(189, 147, 249, 0.5), rgba(159, 99, 246, 0.5));
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.15), 0 1px rgba(0, 0, 0, 0.1); }
    treeview.view.progressbar:selected:focus, treeview.view.progressbar:selected {
      border-radius: 4px;
      box-shadow: inset 0 1px rgba(255, 255, 255, 0.05);
      background-image: linear-gradient(to bottom, #282a36, #121319); }
      treeview.view.progressbar:selected:focus:backdrop, treeview.view.progressbar:selected:backdrop {
        border-color: #2a2c39;
        background-color: #2a2c39; }
    treeview.view.progressbar:backdrop {
      border-color: #2a2c39;
      background-image: none;
      box-shadow: none; }
  treeview.view.trough {
    background-color: rgba(248, 248, 242, 0.1);
    border-radius: 4px; }
    treeview.view.trough:selected:focus, treeview.view.trough:selected {
      background-color: rgba(159, 99, 246, 0.5);
      border-radius: 4px; }
  treeview.view header button {
    color: #909194;
    background-color: #282a36;
    font-weight: bold;
    text-shadow: none;
    box-shadow: none; }
    treeview.view header button:hover {
      color: #c4c5c3;
      box-shadow: none;
      transition: none; }
    treeview.view header button:active {
      color: #f8f8f2;
      transition: none; }
  treeview.view header button:last-child:backdrop, treeview.view header button:last-child {
    border-right-style: none; }
  treeview.view button.dnd:active, treeview.view button.dnd:selected, treeview.view button.dnd:hover, treeview.view button.dnd,
  treeview.view header.button.dnd:active,
  treeview.view header.button.dnd:selected,
  treeview.view header.button.dnd:hover,
  treeview.view header.button.dnd {
    padding: 0 6px;
    transition: none;
    background-image: none;
    background-color: rgba(189, 147, 249, 0.5);
    color: #282a36;
    border-radius: 0;
    border-style: none;
    box-shadow: inset 0 0 0 1px #282a36;
    text-shadow: none; }
  treeview.view acceleditor > label {
    background-color: rgba(189, 147, 249, 0.5); }

treeview.view header button, treeview.view header button:hover, treeview.view header button:active {
  padding: 0 6px;
  border-radius: 0;
  background-image: none;
  text-shadow: none;
  border-width: 1px;
  border-style: none solid solid none;
  border-color: #1e1f29; }
  treeview.view header button:disabled {
    border-color: #1e1f29;
    background-image: none; }
  treeview.view header button:backdrop {
    border-color: #1e1f29;
    border-style: none solid solid none;
    color: #55565c;
    background-image: none;
    background-color: #2a2c39; }
    treeview.view header button:backdrop:disabled {
      border-color: #1e1f29;
      background-image: none; }

/**********************
 * Window Decorations *
 *********************/
decoration {
  border-radius: 4px 4px 0 0;
  border-width: 0px;
  border-width: 0px;
  box-shadow: 0 2px 4px 2px rgba(0, 0, 0, 0.2);
  margin: 10px; }
  decoration:backdrop {
    box-shadow: 0 2px 4px 2px rgba(0, 0, 0, 0.15);
    transition: 200ms ease-out; }
  .maximized decoration, .fullscreen decoration, .tiled decoration {
    border-radius: 0; }
  .popup decoration {
    box-shadow: none; }
  .csd.popup decoration {
    border-radius: 0;
    box-shadow: 0 1px 6px rgba(0, 0, 0, 0.4), 0 0 0 1px rgba(25, 26, 34, 0.7); }
  tooltip.csd decoration {
    border-radius: 5px;
    box-shadow: none; }
  messagedialog.csd decoration {
    border-radius: 7px;
    box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2), 0 0 0 1px rgba(25, 26, 34, 0.7); }
  .solid-csd decoration {
    border-radius: 0;
    margin: 0px;
    background-color: #1e1f29;
    border: solid 1px rgba(26, 27, 35, 0.91);
    box-shadow: none; }

button.titlebutton {
  background-repeat: no-repeat;
  background-position: center;
  min-height: 32px;
  padding: 0 3px;
  box-shadow: none; }
  button.titlebutton.close {
    background-image: -gtk-scaled(url("../assets/close.png"), url("../assets/close@2.png")); }
    button.titlebutton.close:hover, button.titlebutton.close:active {
      background-image: -gtk-scaled(url("../assets/close_prelight.png"), url("../assets/close_prelight@2.png")); }
  button.titlebutton.maximize {
    background-image: -gtk-scaled(url("../assets/maximize.png"), url("../assets/maximize@2.png")); }
    button.titlebutton.maximize:hover, button.titlebutton.maximize:active {
      background-image: -gtk-scaled(url("../assets/maximize_prelight.png"), url("../assets/maximize_prelight@2.png")); }
  button.titlebutton.minimize {
    background-image: -gtk-scaled(url("../assets/min.png"), url("../assets/min@2.png")); }
    button.titlebutton.minimize:hover, button.titlebutton.minimize:active {
      background-image: -gtk-scaled(url("../assets/min_prelight.png"), url("../assets/min_prelight@2.png")); }
  button.titlebutton.close:backdrop, button.titlebutton.minimize:backdrop, button.titlebutton.maximize:backdrop {
    background-image: -gtk-scaled(url("../assets/close_unfocused.png"), url("../assets/close_unfocused@2.png")); }
  button.titlebutton:backdrop {
    -gtk-icon-shadow: none; }

headerbar.selection-mode button.titlebutton,
.titlebar.selection-mode button.titlebutton {
  text-shadow: 0 -1px rgba(0, 0, 0, 0.3788235294);
  -gtk-icon-shadow: 0 -1px rgba(0, 0, 0, 0.3788235294); }
  headerbar.selection-mode button.titlebutton:backdrop,
  .titlebar.selection-mode button.titlebutton:backdrop {
    -gtk-icon-shadow: none; }

.view:selected:focus, iconview:selected:focus, .view:selected, iconview:selected,
.view text:selected:focus,
iconview text:selected:focus,
textview text:selected:focus,
.view text:selected,
iconview text:selected,
textview text:selected, .view text selection:focus, iconview text selection:focus, .view text selection, iconview text selection,
textview text selection:focus,
textview text selection, flowbox flowboxchild:selected, modelbutton.flat:selected, popover.background checkbutton:selected,
popover.background radiobutton:selected,
.menuitem.button.flat:selected, calendar:selected, spinbutton:not(.vertical) selection:focus, spinbutton:not(.vertical) selection,
entry selection:focus,
entry selection, row:selected, treeview.view:selected:focus, treeview.view:selected {
  background-color: rgba(189, 147, 249, 0.5); }
  row:selected label, label:selected, .selection-mode button.titlebutton, .view:selected:focus, iconview:selected:focus, .view:selected, iconview:selected,
  .view text:selected:focus,
  iconview text:selected:focus,
  textview text:selected:focus,
  .view text:selected,
  iconview text:selected,
  textview text:selected, .view text selection:focus, iconview text selection:focus, .view text selection, iconview text selection,
  textview text selection:focus,
  textview text selection, flowbox flowboxchild:selected, modelbutton.flat:selected, popover.background checkbutton:selected,
  popover.background radiobutton:selected,
  .menuitem.button.flat:selected, calendar:selected, spinbutton:not(.vertical) selection:focus, spinbutton:not(.vertical) selection,
  entry selection:focus,
  entry selection, row:selected, treeview.view:selected:focus, treeview.view:selected {
    color: #f8f8f2;
    font-weight: bold; }
    row:selected label:disabled, label:disabled:selected, .selection-mode button.titlebutton:disabled, iconview:disabled:selected:focus, .view:disabled:selected, iconview:disabled:selected,
    iconview text:disabled:selected:focus,
    textview text:disabled:selected:focus,
    .view text:disabled:selected,
    iconview text:disabled:selected,
    textview text:disabled:selected, iconview text selection:disabled:focus, .view text selection:disabled, iconview text selection:disabled,
    textview text selection:disabled, flowbox flowboxchild:disabled:selected, label:disabled selection, modelbutton.flat:disabled:selected, popover.background checkbutton:disabled:selected,
    popover.background radiobutton:disabled:selected,
    .menuitem.button.flat:disabled:selected, calendar:disabled:selected, spinbutton:not(.vertical) selection:disabled,
    entry selection:disabled, row:disabled:selected {
      color: rgba(233, 223, 244, 0.75); }
    row:selected label:backdrop, label:backdrop:selected, .selection-mode button.titlebutton:backdrop, iconview:backdrop:selected:focus, .view:backdrop:selected, iconview:backdrop:selected,
    iconview text:backdrop:selected:focus,
    textview text:backdrop:selected:focus,
    .view text:backdrop:selected,
    iconview text:backdrop:selected,
    textview text:backdrop:selected, iconview text selection:backdrop:focus, .view text selection:backdrop, iconview text selection:backdrop,
    textview text selection:backdrop, flowbox flowboxchild:backdrop:selected, label:backdrop selection, modelbutton.flat:backdrop:selected, popover.background checkbutton:backdrop:selected,
    popover.background radiobutton:backdrop:selected,
    .menuitem.button.flat:backdrop:selected, calendar:backdrop:selected, spinbutton:not(.vertical) selection:backdrop,
    entry selection:backdrop, row:backdrop:selected {
      color: rgba(248, 248, 242, 0.5); }
      row:selected label:backdrop:disabled, label:backdrop:disabled:selected, .selection-mode button.titlebutton:backdrop:disabled, .view:backdrop:disabled:selected, iconview:backdrop:disabled:selected,
      .view text:backdrop:disabled:selected,
      iconview text:backdrop:disabled:selected,
      textview text:backdrop:disabled:selected, .view text selection:backdrop:disabled, iconview text selection:backdrop:disabled,
      textview text selection:backdrop:disabled, flowbox flowboxchild:backdrop:disabled:selected, label:disabled selection:backdrop, label:backdrop selection:disabled, modelbutton.flat:backdrop:disabled:selected, popover.background checkbutton:backdrop:disabled:selected,
      popover.background radiobutton:backdrop:disabled:selected,
      .menuitem.button.flat:backdrop:disabled:selected, calendar:backdrop:disabled:selected, spinbutton:not(.vertical) selection:backdrop:disabled,
      entry selection:backdrop:disabled, row:backdrop:disabled:selected {
        color: rgba(207, 177, 247, 0.5); }

.monospace {
  font-family: Monospace; }

/**********************
 * DE-Specific Styles *
 **********************/
/*********
* Budgie *
*********/
.budgie-container {
  background-color: transparent; }
  .budgie-container:backdrop {
    background-color: transparent; }
  .budgie-container popover list,
  .budgie-container popover row {
    border: none;
    background: none;
    padding: 0;
    margin: 0; }

.budgie-popover .container,
.budgie-popover border,
.budgie-popover list,
.budgie-popover row {
  padding: 0;
  margin: 0;
  background: none;
  border: none;
  box-shadow: none;
  text-shadow: none;
  -gtk-icon-shadow: none;
  opacity: 1;
  min-width: 0;
  min-height: 0; }

.budgie-popover,
.budgie-popover.background {
  border-radius: 2px;
  padding: 0;
  background-color: rgba(30, 31, 41, 0.98);
  background-clip: border-box;
  box-shadow: 0 2px 3px 1px rgba(0, 0, 0, 0.35);
  border: 1px solid @borders; }
  .budgie-popover list:hover,
  .budgie-popover row:hover,
  .budgie-popover.background list:hover,
  .budgie-popover.background row:hover {
    background: none; }
  .budgie-popover > frame.container,
  .budgie-popover.background > frame.container {
    margin: 0 -1px -1px;
    padding: 2px 0 0; }

.budgie-popover > .container {
  padding: 2px; }

.budgie-menu .container {
  padding: 0; }
.budgie-menu button:hover {
  -gtk-icon-effect: none; }
.budgie-menu entry.search {
  border: none;
  background: none;
  padding: 5px 2px;
  border-bottom: 1px solid @borders;
  border-radius: 0;
  font-size: 120%;
  box-shadow: none; }
  .budgie-menu entry.search image:dir(ltr) {
    padding-left: 8px;
    padding-right: 12px; }
  .budgie-menu entry.search image:dir(rtl) {
    padding-left: 12px;
    padding-right: 8px; }
.budgie-menu .categories {
  border-width: 0;
  margin-left: 3px;
  background-color: transparent; }
  .budgie-menu .categories:dir(ltr) {
    border-right: 1px solid @borders; }
  .budgie-menu .categories:dir(rtl) {
    border-left: 1px solid @borders; }
.budgie-menu .category-button {
  padding: 8px;
  border-radius: 2px 0 0 2px; }
  .budgie-menu .category-button:hover {
    background-color: rgba(248, 248, 242, 0.05);
    color: #f8f8f2; }
  .budgie-menu .category-button:active {
    box-shadow: inset 0 2px 2px -2px rgba(0, 0, 0, 0.2); }
  .budgie-menu .category-button:checked {
    color: #f8f8f2;
    background-color: rgba(174, 123, 248, 0.3); }
  .budgie-menu .category-button:checked:disabled {
    opacity: 0.5; }
    .budgie-menu .category-button:checked:disabled label {
      color: rgba(248, 248, 242, 0.7); }
.budgie-menu scrollbar {
  background-color: transparent;
  border-color: transparent; }
.budgie-menu button:not(.category-button) {
  padding-top: 5px;
  padding-bottom: 5px;
  border-radius: 0;
  box-shadow: none; }
.budgie-menu undershoot, .budgie-menu overshoot {
  background: none; }

button.budgie-menu-launcher {
  padding: 0 2px;
  color: #f8f8f2;
  box-shadow: none;
  background-color: transparent; }
  button.budgie-menu-launcher:hover {
    color: #f8f8f2; }
  button.budgie-menu-launcher:active, button.budgie-menu-launcher:checked {
    color: #f8f8f2; }
  button.budgie-menu-launcher:backdrop {
    color: #f8f8f2;
    background-color: transparent; }
    button.budgie-menu-launcher:backdrop:hover {
      color: #f8f8f2; }
    button.budgie-menu-launcher:backdrop:active, button.budgie-menu-launcher:backdrop:checked {
      color: rgba(189, 147, 249, 0.5);
      box-shadow: none;
      background-color: transparent; }

.user-menu .content-box separator {
  margin-left: 6px;
  margin-right: 6px;
  background-color: rgba(248, 248, 242, 0.1); }
.user-menu button {
  margin: 5px; }
.user-menu > box.vertical row.activatable:first-child .indicator-item,
.user-menu > frame.container > box.vertical row.activatable:first-child .indicator-item {
  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.06), 0 1px 2px rgba(0, 0, 0, 0.2), inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1);
  background-color: #72BFD0;
  transition-duration: 0.2s; }
  .user-menu > box.vertical row.activatable:first-child .indicator-item:dir(ltr),
  .user-menu > frame.container > box.vertical row.activatable:first-child .indicator-item:dir(ltr) {
    padding-left: 7px;
    background-position: left center;
    background-repeat: no-repeat;
    background-size: 38px auto; }
  .user-menu > box.vertical row.activatable:first-child .indicator-item:dir(rtl),
  .user-menu > frame.container > box.vertical row.activatable:first-child .indicator-item:dir(rtl) {
    padding-right: 7px;
    background-position: right center;
    background-repeat: no-repeat;
    background-size: 38px auto; }
  .user-menu > box.vertical row.activatable:first-child .indicator-item label,
  .user-menu > frame.container > box.vertical row.activatable:first-child .indicator-item label {
    color: #f8f8f2; }
    .user-menu > box.vertical row.activatable:first-child .indicator-item label:dir(ltr),
    .user-menu > frame.container > box.vertical row.activatable:first-child .indicator-item label:dir(ltr) {
      padding-left: 5px; }
    .user-menu > box.vertical row.activatable:first-child .indicator-item label:dir(rtl),
    .user-menu > frame.container > box.vertical row.activatable:first-child .indicator-item label:dir(rtl) {
      padding-right: 5px; }
  .user-menu > box.vertical row.activatable:first-child .indicator-item image,
  .user-menu > frame.container > box.vertical row.activatable:first-child .indicator-item image {
    color: #f8f8f2; }
    .user-menu > box.vertical row.activatable:first-child .indicator-item image:first-child,
    .user-menu > frame.container > box.vertical row.activatable:first-child .indicator-item image:first-child {
      min-width: 24px;
      min-height: 20px; }

button.raven-trigger {
  padding-left: 2px;
  padding-right: 2px;
  color: #f8f8f2;
  box-shadow: none; }
  button.raven-trigger:hover {
    color: #f8f8f2;
    background-color: transparent; }
  button.raven-trigger:active, button.raven-trigger:checked {
    box-shadow: none;
    background-color: transparent;
    color: rgba(189, 147, 249, 0.5); }
  button.raven-trigger:backdrop {
    color: #f8f8f2; }
    button.raven-trigger:backdrop:hover {
      color: #f8f8f2; }
    button.raven-trigger:backdrop:active, button.raven-trigger:backdrop:checked {
      box-shadow: none;
      color: rgba(189, 147, 249, 0.5);
      background-color: transparent; }

.places-menu .container {
  padding: 0; }
.places-menu .message-bar {
  border-top-left-radius: 3px;
  border-top-right-radius: 3px; }
.places-menu .name-button {
  border: 0;
  border-radius: 0;
  padding: 4px 6px; }
.places-menu .unmount-button {
  padding: 4px 4px;
  border: 0;
  border-radius: 0; }
.places-menu .places-section-header {
  padding: 0px;
  border-bottom: 1px solid rgba(25, 26, 34, 0.85);
  box-shadow: 0px 1px 1px alpha(@theme_fg_color, 0.03); }
.places-menu .places-section-header > button {
  padding: 8px;
  border: none;
  border-bottom-left-radius: 0px;
  border-bottom-right-radius: 0px; }
.places-menu .places-list {
  background: rgba(248, 248, 242, 0.04);
  border-bottom: 1px solid rgba(25, 26, 34, 0.85); }
.places-menu .unlock-area {
  border-top: 1px solid rgba(25, 26, 34, 0.75);
  border-bottom: 1px solid rgba(25, 26, 34, 0.75); }
.places-menu .unlock-area entry {
  border-radius: 0;
  border: 0; }
.places-menu .unlock-area button {
  border-radius: 0;
  border: 0;
  border-left: 1px solid rgba(25, 26, 34, 0.75); }
.places-menu .alternative-label {
  font-size: 15px;
  padding: 3px; }
.places-menu .always-expand {
  background: transparent;
  border-bottom: none; }

.night-light-indicator .container {
  padding: 0; }
.night-light-indicator .view-header {
  font-size: 14px;
  padding: 10px;
  border-bottom: 1px solid mix(@theme_base_color, #000000, 0.35);;
  box-shadow: 0px 1px 1px alpha(@theme_fg_color, 0.04);; }
.night-light-indicator .display-settings-button {
  border-top-left-radius: 0px;
  border-top-right-radius: 0px;
  border: none;
  padding: 3px;
  border-top: 1px solid mix(@theme_base_color, #000000, 0.35);;
  box-shadow: inset 0px 1px 1px alpha(@theme_fg_color, 0.04);; }

.budgie-panel {
  color: #f8f8f2;
  background-color: rgba(8, 9, 12, 0.95);
  background-image: none;
  box-shadow: none;
  border: none;
  transition: all 150ms ease-in; }
  .budgie-panel .alert {
    color: #ff5555; }
  .budgie-panel:backdrop {
    color: #f8f8f2;
    background-color: rgba(8, 9, 12, 0.95); }
  .budgie-panel button {
    border-top-width: 0;
    border-bottom-width: 0;
    border-radius: 0; }
  .budgie-panel popover list,
  .budgie-panel popover row {
    padding: 0;
    margin: 0; }
  .budgie-panel label {
    color: #f8f8f2;
    font-weight: 700; }
  .budgie-panel.transparent {
    background-color: rgba(8, 9, 12, 0.2); }
    .top .budgie-panel.transparent {
      border-bottom-color: transparent; }
    .bottom .budgie-panel.transparent {
      border-top-color: transparent; }
    .left .budgie-panel.transparent {
      border-right-color: transparent; }
    .right .budgie-panel.transparent {
      border-left-color: transparent; }
  .budgie-panel .end-region {
    border-radius: 0px; }
    .budgie-panel .end-region separator {
      background-color: rgba(248, 248, 242, 0.15); }
    .budgie-panel .end-region label {
      font-weight: 700;
      color: #f8f8f2; }

.budgie-panel #tasklist-button,
.budgie-panel #tasklist-button:backdrop {
  outline-color: transparent;
  transition: all 100ms cubic-bezier(0.25, 0.46, 0.45, 0.94);
  border-color: rgba(8, 9, 12, 0);
  border-radius: 0;
  background-color: transparent;
  box-shadow: none;
  background-clip: padding-box; }

.budgie-panel button.flat.launcher {
  outline-color: transparent;
  transition: all 100ms cubic-bezier(0.25, 0.46, 0.45, 0.94);
  border-color: rgba(8, 9, 12, 0);
  border-radius: 0;
  padding: 0;
  background-clip: padding-box;
  background-color: transparent; }
  .budgie-panel button.flat.launcher {
    box-shadow: none; }

.budgie-panel #tasklist-button:hover, .budgie-panel .unpinned button.flat.launcher:hover,
.budgie-panel .pinned button.flat.launcher.running:hover {
  box-shadow: none; }
.budgie-panel #tasklist-button:active, .budgie-panel .unpinned button.flat.launcher:active,
.budgie-panel .pinned button.flat.launcher.running:active, .budgie-panel #tasklist-button:checked, .budgie-panel .unpinned button.flat.launcher:checked,
.budgie-panel .pinned button.flat.launcher.running:checked {
  box-shadow: none; }
.top .budgie-panel #tasklist-button, .budgie-panel .top #tasklist-button, .top .budgie-panel .unpinned button.flat.launcher, .budgie-panel .unpinned .top button.flat.launcher,
.top .budgie-panel .pinned button.flat.launcher.running,
.budgie-panel .pinned .top button.flat.launcher.running {
  padding-bottom: 2px;
  border-top: 2px solid transparent; }
  .top .budgie-panel .pinned button.flat.launcher:not(.running) {
    border-top: 2px solid transparent; }

  .top .budgie-panel .pinned button.flat.launcher:not(.running):hover {
    border-top: 2px solid rgba(255, 255, 255, 0.1); }

  .top .budgie-panel .unpinned button.flat.launcher,
  .top .budgie-panel .pinned button.flat.launcher.running {
    border-top: 2px solid rgba(255, 255, 255, 0.1); }
  .top .budgie-panel #tasklist-button:hover, .budgie-panel .top #tasklist-button:hover, .top .budgie-panel .unpinned button.flat.launcher:hover, .budgie-panel .unpinned .top button.flat.launcher:hover,
  .top .budgie-panel .pinned button.flat.launcher.running:hover,
  .budgie-panel .pinned .top button.flat.launcher.running:hover {
    border-top: 2px solid rgba(255, 255, 255, 0.25); }
  .top .budgie-panel #tasklist-button:active, .budgie-panel .top #tasklist-button:active, .top .budgie-panel .unpinned button.flat.launcher:active, .budgie-panel .unpinned .top button.flat.launcher:active,
  .top .budgie-panel .pinned button.flat.launcher.running:active,
  .budgie-panel .pinned .top button.flat.launcher.running:active, .top .budgie-panel #tasklist-button:checked, .budgie-panel .top #tasklist-button:checked, .top .budgie-panel .unpinned button.flat.launcher:checked, .budgie-panel .unpinned .top button.flat.launcher:checked,
  .top .budgie-panel .pinned button.flat.launcher.running:checked,
  .budgie-panel .pinned .top button.flat.launcher.running:checked {
    border-top: 2px solid rgba(189, 147, 249, 0.5); }
.bottom .budgie-panel #tasklist-button, .budgie-panel .bottom #tasklist-button, .bottom .budgie-panel .unpinned button.flat.launcher, .budgie-panel .unpinned .bottom button.flat.launcher,
.bottom .budgie-panel .pinned button.flat.launcher.running,
.budgie-panel .pinned .bottom button.flat.launcher.running {
  padding-top: 2px;
  border-bottom: 2px solid transparent; }
  .bottom .budgie-panel .pinned button.flat.launcher:not(.running) {
    border-bottom: 2px solid transparent; }

  .bottom .budgie-panel .pinned button.flat.launcher:not(.running):hover {
    border-bottom: 2px solid rgba(255, 255, 255, 0.1); }

  .bottom .budgie-panel .unpinned button.flat.launcher,
  .bottom .budgie-panel .pinned button.flat.launcher.running {
    border-bottom: 2px solid rgba(255, 255, 255, 0.1); }
  .bottom .budgie-panel #tasklist-button:hover, .budgie-panel .bottom #tasklist-button:hover, .bottom .budgie-panel .unpinned button.flat.launcher:hover, .budgie-panel .unpinned .bottom button.flat.launcher:hover,
  .bottom .budgie-panel .pinned button.flat.launcher.running:hover,
  .budgie-panel .pinned .bottom button.flat.launcher.running:hover {
    border-bottom: 2px solid rgba(255, 255, 255, 0.25); }
  .bottom .budgie-panel #tasklist-button:active, .budgie-panel .bottom #tasklist-button:active, .bottom .budgie-panel .unpinned button.flat.launcher:active, .budgie-panel .unpinned .bottom button.flat.launcher:active,
  .bottom .budgie-panel .pinned button.flat.launcher.running:active,
  .budgie-panel .pinned .bottom button.flat.launcher.running:active, .bottom .budgie-panel #tasklist-button:checked, .budgie-panel .bottom #tasklist-button:checked, .bottom .budgie-panel .unpinned button.flat.launcher:checked, .budgie-panel .unpinned .bottom button.flat.launcher:checked,
  .bottom .budgie-panel .pinned button.flat.launcher.running:checked,
  .budgie-panel .pinned .bottom button.flat.launcher.running:checked {
    border-bottom: 2px solid rgba(189, 147, 249, 0.5); }
.left .budgie-panel #tasklist-button, .budgie-panel .left #tasklist-button, .left .budgie-panel .unpinned button.flat.launcher, .budgie-panel .unpinned .left button.flat.launcher,
.left .budgie-panel .pinned button.flat.launcher.running,
.budgie-panel .pinned .left button.flat.launcher.running {
  padding-right: 2px;
  border-left: 2px solid transparent; }
  .left .budgie-panel .pinned button.flat.launcher:not(.running) {
    border-left: 2px solid transparent; }

  .left .budgie-panel .pinned button.flat.launcher:not(.running):hover {
    border-left: 2px solid rgba(255, 255, 255, 0.1); }

  .left .budgie-panel .unpinned button.flat.launcher,
  .left .budgie-panel .pinned button.flat.launcher.running {
    border-left: 2px solid rgba(255, 255, 255, 0.1); }
  .left .budgie-panel #tasklist-button:hover, .budgie-panel .left #tasklist-button:hover, .left .budgie-panel .unpinned button.flat.launcher:hover, .budgie-panel .unpinned .left button.flat.launcher:hover,
  .left .budgie-panel .pinned button.flat.launcher.running:hover,
  .budgie-panel .pinned .left button.flat.launcher.running:hover {
    border-left: 2px solid rgba(255, 255, 255, 0.25); }
  .left .budgie-panel #tasklist-button:active, .budgie-panel .left #tasklist-button:active, .left .budgie-panel .unpinned button.flat.launcher:active, .budgie-panel .unpinned .left button.flat.launcher:active,
  .left .budgie-panel .pinned button.flat.launcher.running:active,
  .budgie-panel .pinned .left button.flat.launcher.running:active, .left .budgie-panel #tasklist-button:checked, .budgie-panel .left #tasklist-button:checked, .left .budgie-panel .unpinned button.flat.launcher:checked, .budgie-panel .unpinned .left button.flat.launcher:checked,
  .left .budgie-panel .pinned button.flat.launcher.running:checked,
  .budgie-panel .pinned .left button.flat.launcher.running:checked {
    border-left: 2px solid rgba(189, 147, 249, 0.5); }
.right .budgie-panel #tasklist-button, .budgie-panel .right #tasklist-button, .right .budgie-panel .unpinned button.flat.launcher, .budgie-panel .unpinned .right button.flat.launcher,
.right .budgie-panel .pinned button.flat.launcher.running,
.budgie-panel .pinned .right button.flat.launcher.running {
  padding-left: 2px;
  border-right: 2px solid transparent; }
  .right .budgie-panel .pinned button.flat.launcher:not(.running) {
    border-right: 2px solid transparent; }

  .right .budgie-panel .pinned button.flat.launcher:not(.running):hover {
    border-right: 2px solid rgba(255, 255, 255, 0.1); }

  .right .budgie-panel .unpinned button.flat.launcher,
  .right .budgie-panel .pinned button.flat.launcher.running {
    border-right: 2px solid rgba(255, 255, 255, 0.1); }
  .right .budgie-panel #tasklist-button:hover, .budgie-panel .right #tasklist-button:hover, .right .budgie-panel .unpinned button.flat.launcher:hover, .budgie-panel .unpinned .right button.flat.launcher:hover,
  .right .budgie-panel .pinned button.flat.launcher.running:hover,
  .budgie-panel .pinned .right button.flat.launcher.running:hover {
    border-right: 2px solid rgba(255, 255, 255, 0.25); }
  .right .budgie-panel #tasklist-button:active, .budgie-panel .right #tasklist-button:active, .right .budgie-panel .unpinned button.flat.launcher:active, .budgie-panel .unpinned .right button.flat.launcher:active,
  .right .budgie-panel .pinned button.flat.launcher.running:active,
  .budgie-panel .pinned .right button.flat.launcher.running:active, .right .budgie-panel #tasklist-button:checked, .budgie-panel .right #tasklist-button:checked, .right .budgie-panel .unpinned button.flat.launcher:checked, .budgie-panel .unpinned .right button.flat.launcher:checked,
  .right .budgie-panel .pinned button.flat.launcher.running:checked,
  .budgie-panel .pinned .right button.flat.launcher.running:checked {
    border-right: 2px solid rgba(189, 147, 249, 0.5); }

.top .budgie-panel {
  border-bottom: 1px solid rgba(15, 15, 20, 0.92); }

.top .raven-frame {
  padding: 0;
  background: none; }
  .top .raven-frame border {
    border: none;
    border-bottom: 1px solid rgba(30, 31, 41, 0.92); }

.top .shadow-block {
  background-color: transparent;
  background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0.3), transparent); }

.bottom .budgie-panel {
  border-top: 1px solid rgba(15, 15, 20, 0.92); }

.bottom .raven-frame {
  padding: 0;
  background: none; }
  .bottom .raven-frame border {
    border: none;
    border-top: 1px solid rgba(30, 31, 41, 0.92); }

.bottom .shadow-block {
  background-color: transparent;
  background-image: linear-gradient(to top, rgba(0, 0, 0, 0.3), transparent); }

.left .budgie-panel {
  border-right: 1px solid rgba(15, 15, 20, 0.92); }

.left .raven-frame {
  padding: 0;
  background: none; }
  .left .raven-frame border {
    border: none;
    border-right: 1px solid rgba(30, 31, 41, 0.92); }

.left .shadow-block {
  background-color: transparent;
  background-image: linear-gradient(to right, rgba(0, 0, 0, 0.3), transparent); }

.right .budgie-panel {
  border-left: 1px solid rgba(15, 15, 20, 0.92); }

.right .raven-frame {
  padding: 0;
  background: none; }
  .right .raven-frame border {
    border: none;
    border-left: 1px solid rgba(30, 31, 41, 0.92); }

.right .shadow-block {
  background-color: transparent;
  background-image: linear-gradient(to left, rgba(0, 0, 0, 0.3), transparent); }

.raven {
  padding: 0;
  color: #f8f8f2;
  background-color: rgba(30, 31, 41, 0.92);
  transition: 170ms ease-out; }
  .raven .raven-header {
    min-height: 32px;
    color: #f8f8f2;
    border: solid rgba(25, 26, 34, 0.85);
    border-width: 1px 0;
    background-color: rgba(30, 31, 41, 0.2); }
    .raven .raven-header * {
      padding-top: 0;
      padding-bottom: 0; }
    .raven .raven-header.top {
      border-top-style: none;
      border-color: transparent;
      margin-top: 3px;
      min-height: 32px; }
      .raven .raven-header.top button.image-button:hover {
        color: rgba(174, 123, 248, 0.5);
        box-shadow: none; }
    .raven .raven-header > button.text-button {
      border-radius: 2px;
      color: #f8f8f2;
      background-color: rgba(255, 60, 60, 0.9);
      box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
      .raven .raven-header > button.text-button:hover {
        border-radius: 2px;
        color: #f8f8f2;
        background-color: rgba(255, 85, 85, 0.9);
        box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
      .raven .raven-header > button.text-button:active {
        color: #f8f8f2;
        background-color: rgba(255, 111, 111, 0.9);
        box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
    .raven .raven-header.bottom {
      border-bottom-style: none; }
    .raven .raven-header button {
      background-color: transparent;
      color: #f8f8f2;
      border-radius: 0;
      border: none;
      box-shadow: none;
      margin-top: -4px;
      margin-bottom: -4px;
      min-height: 32px; }
      .raven .raven-header button:hover {
        border-radius: 0;
        background-color: transparent;
        color: rgba(189, 147, 249, 0.5); }
      .raven .raven-header button:active, .raven .raven-header button:checked {
        color: rgba(189, 147, 249, 0.5);
        border-radius: 0;
        background-color: transparent; }
      .raven .raven-header button:disabled {
        color: #8b8c8e; }
  .raven list {
    background-color: transparent; }
    .raven list:selected {
      background-color: rgba(189, 147, 249, 0.4); }
    .raven list row,
    .raven list row.activatable {
      background-color: transparent; }
      .raven list row:selected,
      .raven list row.activatable:selected {
        background-color: rgba(189, 147, 249, 0.4); }
  .raven .raven-background {
    color: #f8f8f2;
    background-color: transparent;
    border-color: transparent; }
    .raven .raven-background.middle {
      border-bottom-style: none; }
  .raven .powerstrip {
    background-color: transparent;
    border-top-color: transparent; }
  .raven .powerstrip button.image-button {
    border-radius: 50%;
    padding: 5px;
    min-width: 32px;
    margin-bottom: 3px;
    background: rgba(68, 71, 90, 0.7);
    color: #f8f8f2;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.06), 0 1px 2px rgba(0, 0, 0, 0.2), inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1);
    border: none;
    font-size: 100%; }
    .raven .powerstrip button.image-button:hover {
      transition: 170ms ease all;
      background: rgba(68, 71, 90, 0.85);
      color: #f8f8f2; }
    .raven .powerstrip button.image-button:active {
      transition: 170ms ease all;
      background: #44475a;
      color: #f8f8f2; }
    .raven .powerstrip button.image-button:first-child {
      background: rgba(114, 191, 208, 0.7); }
      .raven .powerstrip button.image-button:first-child:hover {
        background: rgba(114, 191, 208, 0.85); }
      .raven .powerstrip button.image-button:first-child:active {
        background: #72BFD0; }
    .raven .powerstrip button.image-button:last-child {
      background: rgba(255, 85, 85, 0.7); }
      .raven .powerstrip button.image-button:last-child:hover {
        background: rgba(255, 85, 85, 0.85); }
      .raven .powerstrip button.image-button:last-child:active {
        background: #ff5555; }
  .raven .option-subtitle {
    font-size: 13px; }

calendar.raven-calendar {
  padding: 4px;
  color: #f8f8f2;
  background-color: rgba(30, 31, 41, 0.2);
  border-color: transparent; }
  calendar.raven-calendar:indeterminate {
    color: alpha(currentColor,0.3); }
  calendar.raven-calendar:selected {
    background: transparent;
    color: rgba(189, 147, 249, 0.5);
    font-weight: bold; }
  calendar.raven-calendar:backdrop {
    background-color: transparent; }
  calendar.raven-calendar.header {
    color: #f8f8f2;
    border: none;
    border-radius: 0;
    background-color: transparent; }
  calendar.raven-calendar button, calendar.raven-calendar button:focus {
    color: alpha(currentColor,0.5);
    background-color: transparent; }
    calendar.raven-calendar button:hover, calendar.raven-calendar button:focus:hover {
      color: #f8f8f2;
      background-color: transparent; }

.raven-mpris {
  color: #f8f8f2;
  background-color: rgba(8, 9, 12, 0.9);
  border: solid rgba(255, 255, 255, 0.1);
  border-width: 1px 0;
  border-bottom-color: rgba(0, 0, 0, 0.1); }
  .raven-mpris button.image-button {
    padding: 10px;
    background-color: #282a36;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.06), 0 1px 2px rgba(0, 0, 0, 0.2), inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1); }
    .raven-mpris button.image-button:hover {
      background-color: rgba(189, 147, 249, 0.5); }
    .raven-mpris button.image-button:active {
      background-color: rgba(174, 123, 248, 0.5); }
    .raven-mpris button.image-button:first-child {
      margin-right: 4px; }
    .raven-mpris button.image-button:last-child {
      margin-left: 4px; }
    .raven-mpris button.image-button:last-child, .raven-mpris button.image-button:first-child {
      padding: 4px;
      margin-top: 6px;
      margin-bottom: 6px; }

.budgie-notification-window, .budgie-osd-window, .budgie-switcher-window {
  background: none;
  border-radius: 1px; }
  .budgie-notification-window button, .budgie-osd-window button, .budgie-switcher-window button {
    background-color: #72BFD0;
    color: #464626;
    border: none;
    margin: 0 3px; }
    .budgie-notification-window button:hover, .budgie-osd-window button:hover, .budgie-switcher-window button:hover {
      background-color: #5fb6ca;
      border: none; }
    .budgie-notification-window button:active, .budgie-osd-window button:active, .budgie-switcher-window button:active, .budgie-notification-window button:checked, .budgie-osd-window button:checked, .budgie-switcher-window button:checked {
      background-color: #5fb6ca; }

.budgie-notification.background, .background.budgie-osd, .background.budgie-switcher {
  border-radius: 1px; }
.budgie-notification .notification-title, .budgie-osd .notification-title, .budgie-switcher .notification-title {
  font-size: 110%;
  color: #f8f8f2; }
.budgie-notification .notification-body, .budgie-osd .notification-body, .budgie-switcher .notification-body {
  color: rgba(248, 248, 242, 0.7); }
.budgie-notification button, .budgie-osd button, .budgie-switcher button {
  background-color: transparent;
  color: #f8f8f2; }
  .budgie-notification button:hover, .budgie-osd button:hover, .budgie-switcher button:hover {
    background-color: transparent;
    color: #ff5555;
    box-shadow: none; }
  .budgie-notification button:active, .budgie-osd button:active, .budgie-switcher button:active, .budgie-notification button:checked, .budgie-osd button:checked, .budgie-switcher button:checked {
    background-color: transparent;
    color: #ff3c3c; }

.drop-shadow, .budgie-session-dialog.background, .background.budgie-polkit-dialog, .background.budgie-run-dialog {
  color: #f8f8f2;
  background-color: rgba(30, 31, 41, 0.95);
  box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.2);
  border-radius: 2px; }

.budgie-switcher-window flowbox {
  color: #f8f8f2; }
.budgie-switcher-window flowboxchild {
  padding: 3px;
  margin: 3px;
  color: #f8f8f2; }
  .budgie-switcher-window flowboxchild:hover {
    background-color: transparent; }
  .budgie-switcher-window flowboxchild:active {
    color: #f8f8f2; }
  .budgie-switcher-window flowboxchild:selected {
    color: #f8f8f2;
    background-color: rgba(189, 147, 249, 0.5); }
    .budgie-switcher-window flowboxchild:selected:active {
      color: #f8f8f2; }
    .budgie-switcher-window flowboxchild:selected:hover {
      background-color: rgba(142, 110, 187, 0.55); }
    .budgie-switcher-window flowboxchild:selected:disabled {
      color: rgba(248, 248, 242, 0.7);
      background-color: rgba(189, 147, 249, 0.3); }
      .budgie-switcher-window flowboxchild:selected:disabled label {
        color: rgba(248, 248, 242, 0.8); }

.budgie-session-dialog, .budgie-polkit-dialog, .budgie-run-dialog {
  color: #f8f8f2;
  background-color: rgba(8, 9, 12, 0.95); }
  .budgie-session-dialog label:backdrop, .budgie-polkit-dialog label:backdrop, .budgie-run-dialog label:backdrop {
    color: rgba(248, 248, 242, 0.8); }
  .budgie-session-dialog .dialog-title, .budgie-polkit-dialog .dialog-title, .budgie-run-dialog .dialog-title {
    font-size: 120%; }
  .budgie-session-dialog .linked.horizontal > button, .budgie-polkit-dialog .linked.horizontal > button, .budgie-run-dialog .linked.horizontal > button {
    margin-bottom: 0;
    min-height: 32px;
    border-bottom: none;
    border-radius: 0;
    color: #f8f8f2;
    background-color: transparent;
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.06), inset 0 1px 2px rgba(0, 0, 0, 0.2); }
    .budgie-session-dialog .linked.horizontal > button label, .budgie-polkit-dialog .linked.horizontal > button label, .budgie-run-dialog .linked.horizontal > button label {
      font-weight: 700; }
    .budgie-session-dialog .linked.horizontal > button:first-child, .budgie-polkit-dialog .linked.horizontal > button:first-child, .budgie-run-dialog .linked.horizontal > button:first-child {
      border-left: none;
      border-bottom-left-radius: 2px; }
    .budgie-session-dialog .linked.horizontal > button:last-child, .budgie-polkit-dialog .linked.horizontal > button:last-child, .budgie-run-dialog .linked.horizontal > button:last-child {
      border-right: none;
      border-bottom-right-radius: 2px; }
    .budgie-session-dialog .linked.horizontal > button:hover, .budgie-polkit-dialog .linked.horizontal > button:hover, .budgie-run-dialog .linked.horizontal > button:hover {
      background-color: rgba(189, 147, 249, 0.4); }
      .budgie-session-dialog .linked.horizontal > button:hover:backdrop label, .budgie-polkit-dialog .linked.horizontal > button:hover:backdrop label, .budgie-run-dialog .linked.horizontal > button:hover:backdrop label {
        color: rgba(255, 255, 255, 0.5); }
    .budgie-session-dialog .linked.horizontal > button.suggested-action, .budgie-polkit-dialog .linked.horizontal > button.suggested-action, .budgie-run-dialog .linked.horizontal > button.suggested-action {
      background-color: rgba(114, 191, 208, 0.9); }
      .budgie-session-dialog .linked.horizontal > button.suggested-action:hover, .budgie-polkit-dialog .linked.horizontal > button.suggested-action:hover, .budgie-run-dialog .linked.horizontal > button.suggested-action:hover {
        background-color: rgba(133, 200, 214, 0.9); }
      .budgie-session-dialog .linked.horizontal > button.suggested-action:active, .budgie-polkit-dialog .linked.horizontal > button.suggested-action:active, .budgie-run-dialog .linked.horizontal > button.suggested-action:active, .budgie-session-dialog .linked.horizontal > button.suggested-action:checked, .budgie-polkit-dialog .linked.horizontal > button.suggested-action:checked, .budgie-run-dialog .linked.horizontal > button.suggested-action:checked {
        background-color: rgba(133, 200, 214, 0.9); }
    .budgie-session-dialog .linked.horizontal > button.destructive-action, .budgie-polkit-dialog .linked.horizontal > button.destructive-action, .budgie-run-dialog .linked.horizontal > button.destructive-action {
      background-color: rgba(255, 34, 34, 0.9); }
      .budgie-session-dialog .linked.horizontal > button.destructive-action:hover, .budgie-polkit-dialog .linked.horizontal > button.destructive-action:hover, .budgie-run-dialog .linked.horizontal > button.destructive-action:hover {
        background-color: rgba(255, 60, 60, 0.9); }
      .budgie-session-dialog .linked.horizontal > button.destructive-action:active, .budgie-polkit-dialog .linked.horizontal > button.destructive-action:active, .budgie-run-dialog .linked.horizontal > button.destructive-action:active, .budgie-session-dialog .linked.horizontal > button.destructive-action:checked, .budgie-polkit-dialog .linked.horizontal > button.destructive-action:checked, .budgie-run-dialog .linked.horizontal > button.destructive-action:checked {
        background-color: rgba(255, 60, 60, 0.9); }
  .budgie-session-dialog entry, .budgie-polkit-dialog entry, .budgie-run-dialog entry {
    background-color: #505359;
    color: #f8f8f2; }
    .budgie-session-dialog entry:focus, .budgie-polkit-dialog entry:focus, .budgie-run-dialog entry:focus {
      background-color: #505359; }
    .budgie-session-dialog entry:backdrop, .budgie-polkit-dialog entry:backdrop, .budgie-run-dialog entry:backdrop {
      background-color: #505359; }

.budgie-polkit-dialog .message {
  color: rgba(248, 248, 242, 0.7); }
.budgie-polkit-dialog .failure {
  color: #ff5555; }

.budgie-run-dialog entry.search, .budgie-run-dialog entry.search:focus {
  font-size: 120%;
  padding: 8px 5px;
  border: none;
  box-shadow: none; }
  .budgie-run-dialog entry.search image, .budgie-run-dialog entry.search:focus image {
    color: #f8f8f2; }
    .budgie-run-dialog entry.search image:dir(ltr), .budgie-run-dialog entry.search:focus image:dir(ltr) {
      padding-left: 8px;
      padding-right: 12px; }
    .budgie-run-dialog entry.search image:dir(rtl), .budgie-run-dialog entry.search:focus image:dir(rtl) {
      padding-left: 12px;
      padding-right: 8px; }
.budgie-run-dialog list row:selected .dim-label, .budgie-run-dialog list row:selected label.separator, .budgie-run-dialog list row:selected .titlebar:not(headerbar) .subtitle, .titlebar:not(headerbar) .budgie-run-dialog list row:selected .subtitle,
.budgie-run-dialog list row:selected headerbar .subtitle,
headerbar .budgie-run-dialog list row:selected .subtitle {
  opacity: 1; }
.budgie-run-dialog scrolledwindow {
  border-top: 1px solid rgba(0, 0, 0, 0); }

.budgie-menubar menu {
  margin: 4px;
  padding: 5px;
  border-radius: 0;
  background-color: rgba(8, 9, 12, 0.95); }
  .budgie-menubar menu menuitem:hover {
    background-color: rgba(189, 147, 249, 0.5);
    color: #f8f8f2; }
.budgie-menubar arrow {
  border: none;
  min-width: 16px;
  min-height: 16px; }
  .budgie-menubar arrow.top {
    -gtk-icon-source: -gtk-icontheme("pan-up-symbolic");
    border-bottom: 1px solid rgba(55, 56, 64, 0.928); }
  .budgie-menubar arrow.bottom {
    -gtk-icon-source: -gtk-icontheme("pan-down-symbolic");
    border-top: 1px solid rgba(55, 56, 64, 0.928); }
.budgie-menubar menuitem accelerator {
  color: rgba(248, 248, 242, 0.35); }
.budgie-menubar menuitem check, .budgie-menubar menuitem radio {
  min-height: 16px;
  min-width: 16px; }

window.background.budgie-settings-window.csd > box.horizontal > stack > scrolledwindow buttonbox.inline-toolbar {
  border-style: none none solid; }

.workspace-switcher .workspace-layout {
  border: 0 solid rgba(8, 9, 12, 0.95); }
  .top .workspace-switcher .workspace-layout:dir(ltr), .bottom .workspace-switcher .workspace-layout:dir(ltr) {
    border-left-width: 1px; }
  .top .workspace-switcher .workspace-layout:dir(rtl), .bottom .workspace-switcher .workspace-layout:dir(rtl) {
    border-right-width: 1px; }
  .left .workspace-switcher .workspace-layout, .right .workspace-switcher .workspace-layout {
    border-top-width: 1px; }
.workspace-switcher .workspace-item, .workspace-switcher .workspace-add-button {
  border: 0 solid rgba(30, 31, 41, 0.95); }
  .top .workspace-switcher .workspace-item:dir(ltr), .bottom .workspace-switcher .workspace-item:dir(ltr),
  .top .workspace-switcher .workspace-add-button:dir(ltr), .bottom .workspace-switcher .workspace-add-button:dir(ltr) {
    border-right-width: 1px; }
  .top .workspace-switcher .workspace-item:dir(rtl), .bottom .workspace-switcher .workspace-item:dir(rtl),
  .top .workspace-switcher .workspace-add-button:dir(rtl), .bottom .workspace-switcher .workspace-add-button:dir(rtl) {
    border-left-width: 1px; }
  .left .workspace-switcher .workspace-item, .right .workspace-switcher .workspace-item, .left .workspace-switcher .workspace-add-button, .right .workspace-switcher .workspace-add-button {
    border-bottom-width: 1px; }
.workspace-switcher .workspace-item.current-workspace {
  background-color: rgba(0, 0, 0, 0.95); }
.workspace-switcher .workspace-add-button {
  border: none;
  background: transparent;
  box-shadow: none; }
  .workspace-switcher .workspace-add-button:hover {
    box-shadow: none; }
  .workspace-switcher .workspace-add-button:active {
    background-image: none; }
  .workspace-switcher .workspace-add-button:active image {
    margin: 1px 0 -1px; }
.budgie-panel .workspace-switcher .workspace-icon-button {
  min-height: 24px;
  min-width: 24px;
  padding: 0;
  border-radius: 2px; }

/************
 * Nautilus *
 ************/
.nautilus-window paned > separator {
  background-image: none; }
.nautilus-window .sidebar {
  background-color: transparent;
  background-image: none; }
  .nautilus-window .sidebar:backdrop {
    background-color: transparent;
    background-image: none; }
  .nautilus-window .sidebar .list-row button {
    border: none;
    background-color: rgba(33, 35, 45, 0.95); }
    .nautilus-window .sidebar .list-row button:active {
      background-color: rgba(189, 147, 249, 0.25); }
  .nautilus-window .sidebar .list-row:selected {
    background-color: rgba(189, 147, 249, 0.25); }
    .nautilus-window .sidebar .list-row:selected:hover {
      background-color: rgba(189, 147, 249, 0.4); }
  .nautilus-window .sidebar .list-row:hover {
    background-color: rgba(40, 42, 54, 0.5); }
    .nautilus-window .sidebar .list-row:hover:active {
      background-color: rgba(189, 147, 249, 0.4); }
.nautilus-window.background {
  background-color: rgba(33, 35, 45, 0.95); }
  .nautilus-window.background:backdrop {
    background-color: rgba(33, 35, 45, 0.95); }
.nautilus-window notebook > stack:only-child {
  background-color: #282a36; }
  .nautilus-window notebook > stack:only-child:backdrop {
    background-color: #2a2c39; }
.nautilus-window searchbar {
  border-top: 1px solid rgba(0, 0, 0, 0.12); }
.nautilus-window .searchbar-container {
  margin-top: -1px; }
.nautilus-window .titlebar .search {
  border: 1px solid rgba(25, 26, 34, 0.9);
  border-radius: 3px; }
.nautilus-window .path-bar-box .dim-label, .nautilus-window .path-bar-box label.separator, .nautilus-window .path-bar-box .titlebar:not(headerbar) .subtitle, .titlebar:not(headerbar) .nautilus-window .path-bar-box .subtitle,
.nautilus-window .path-bar-box headerbar .subtitle,
headerbar .nautilus-window .path-bar-box .subtitle {
  color: transparent; }
.nautilus-window .path-bar-box widget > .text-button:last-child {
  color: #bd93f9;
  background-color: rgba(189, 147, 249, 0.1);
  border-radius: 7px;
  box-shadow: none;
  text-shadow: none;
  font-weight: bold; }
  .nautilus-window .path-bar-box widget > .text-button:last-child:backdrop label {
    color: rgba(189, 147, 249, 0.4); }
.nautilus-window .path-bar-box button {
  transition: all 100ms ease-in;
  margin-left: -5px; }
  .nautilus-window .path-bar-box button:backdrop:hover, .nautilus-window .path-bar-box button:backdrop:active, .nautilus-window .path-bar-box button:backdrop:checked {
    color: rgba(189, 147, 249, 0.5);
    background-color: rgba(189, 147, 249, 0.1);
    border-radius: 7px;
    box-shadow: none;
    text-shadow: none;
    font-weight: bold; }
    .nautilus-window .path-bar-box button:backdrop:hover label, .nautilus-window .path-bar-box button:backdrop:active label, .nautilus-window .path-bar-box button:backdrop:checked label {
      color: rgba(189, 147, 249, 0.4); }
.nautilus-window .path-buttons-box .dim-label, .nautilus-window .path-buttons-box label.separator, .nautilus-window .path-buttons-box .titlebar:not(headerbar) .subtitle, .titlebar:not(headerbar) .nautilus-window .path-buttons-box .subtitle,
.nautilus-window .path-buttons-box headerbar .subtitle,
headerbar .nautilus-window .path-buttons-box .subtitle {
  color: transparent; }
.nautilus-window .path-buttons-box button .horizontal .dim-label, .nautilus-window .path-buttons-box button .horizontal label.separator, .nautilus-window .path-buttons-box button .horizontal .titlebar:not(headerbar) .subtitle, .titlebar:not(headerbar) .nautilus-window .path-buttons-box button .horizontal .subtitle,
.nautilus-window .path-buttons-box button .horizontal headerbar .subtitle,
headerbar .nautilus-window .path-buttons-box button .horizontal .subtitle {
  color: #f8f8f2; }
.nautilus-window .path-buttons-box button:hover .dim-label, .nautilus-window .path-buttons-box button:hover label.separator, .nautilus-window .path-buttons-box button:hover .titlebar:not(headerbar) .subtitle, .titlebar:not(headerbar) .nautilus-window .path-buttons-box button:hover .subtitle,
.nautilus-window .path-buttons-box button:hover headerbar .subtitle,
headerbar .nautilus-window .path-buttons-box button:hover .subtitle, .nautilus-window .path-buttons-box button:focus .dim-label, .nautilus-window .path-buttons-box button:focus label.separator, .nautilus-window .path-buttons-box button:focus .titlebar:not(headerbar) .subtitle, .titlebar:not(headerbar) .nautilus-window .path-buttons-box button:focus .subtitle,
.nautilus-window .path-buttons-box button:focus headerbar .subtitle,
headerbar .nautilus-window .path-buttons-box button:focus .subtitle {
  color: #bd93f9; }
.nautilus-window .path-buttons-box .current-dir label {
  padding: 0px 12px;
  color: #bd93f9;
  background-color: rgba(189, 147, 249, 0.1);
  border-radius: 7px;
  box-shadow: none;
  text-shadow: none;
  font-weight: bold; }
  .nautilus-window .path-buttons-box .current-dir label:backdrop {
    color: rgba(189, 147, 249, 0.4); }

.nautilus-circular-button {
  border-radius: 20px;
  -gtk-outline-radius: 20px; }

.disk-space-display {
  border: 2px solid; }
  .disk-space-display .unknown {
    background-color: #888a85;
    border-color: #555653; }
  .disk-space-display .used {
    background-color: #9FB0B9;
    border-color: #667f8c; }
  .disk-space-display .free {
    background-color: #D8D8D8;
    border-color: #a5a5a5; }

.nautilus-desktop {
  color: #f8f8f2; }
  .nautilus-desktop .nautilus-canvas-item {
    border-radius: 5px;
    color: #f8f8f2;
    text-shadow: 1px 1px rgba(0, 0, 0, 0.6); }
    .nautilus-desktop .nautilus-canvas-item:active {
      color: #f8f8f2;
      text-shadow: none; }
    .nautilus-desktop .nautilus-canvas-item:hover {
      color: #f8f8f2;
      text-shadow: none; }
    .nautilus-desktop .nautilus-canvas-item:selected {
      color: #f8f8f2;
      text-shadow: none; }
    .nautilus-desktop .nautilus-canvas-item .dim-label:selected, .nautilus-desktop .nautilus-canvas-item label.separator:selected, .nautilus-desktop .nautilus-canvas-item .titlebar:not(headerbar) .subtitle:selected, .titlebar:not(headerbar) .nautilus-desktop .nautilus-canvas-item .subtitle:selected,
    .nautilus-desktop .nautilus-canvas-item headerbar .subtitle:selected,
    headerbar .nautilus-desktop .nautilus-canvas-item .subtitle:selected {
      color: #f8f8f2; }
  .nautilus-desktop .nautilus-list .dim-label:selected, .nautilus-desktop .nautilus-list label.separator:selected, .nautilus-desktop .nautilus-list .titlebar:not(headerbar) .subtitle:selected, .titlebar:not(headerbar) .nautilus-desktop .nautilus-list .subtitle:selected,
  .nautilus-desktop .nautilus-list headerbar .subtitle:selected,
  headerbar .nautilus-desktop .nautilus-list .subtitle:selected {
    color: #f8f8f2; }

/*********
 * Gedit *
 *********/
.gedit-search-slider {
  padding: 4px;
  border-radius: 0 0 3px 3px;
  border: 0;
  background-color: #1e1f29; }

/*********
 * Gnucash *
*********/
#gnc-id-main-window entry.gnc-class-register-foreground {
  background: transparent;
  border: none;
  box-shadow: none; }
#gnc-id-main-window .arrow.button.toggle {
  transition: none;
  box-shadow: none; }
  #gnc-id-main-window .arrow.button.toggle:hover {
    border-color: rgba(189, 147, 249, 0.5); }

/********
 * Gala *
 *******/
.gala-notification {
  border-width: 0;
  border-radius: 2px;
  color: white;
  border: 1px solid #282a36;
  background-color: #282a36; }
  .gala-notification .title,
  .gala-notification .label {
    color: #f8f8f2; }

.gala-button {
  padding: 3px;
  color: #282a36;
  border: none;
  border-radius: 50%;
  background-image: linear-gradient(to bottom, #7e7e7e, #3e3e3e);
  box-shadow: inset 0 0 0 1px rgba(255, 255, 255, 0.98), inset 0 1px 0 0 rgba(255, 255, 255, 0.93), inset 0 -1px 0 0 rgba(255, 255, 255, 0.99), 0 0 0 1px rgba(0, 0, 0, 0.6), 0 3px 6px rgba(0, 0, 0, 0.84), 0 3px 6px rgba(0, 0, 0, 0.77);
  text-shadow: 0 1px 1px rgba(0, 0, 0, 0.4); }

/**********
 * Notify *
 *********/
.notify {
  /*-notify-shadow: 0px 2px 18px transparentize(black, 0.60);*/
  border-radius: 5px;
  border: 1px solid rgba(0, 0, 0, 0.7);
  background-color: rgba(40, 42, 54, 0.05); }

/***************
 * SwitchBoard *
 ***************/
.category-label {
  font-weight: bold;
  color: #f8f8f2; }

/*************
 * Slingshot *
 ************/
.button.app {
  border: none;
  border-radius: 0;
  box-shadow: none;
  background-image: none; }
  .button.app .app:hover {
    border-radius: 8px;
    border: none;
    background-color: rgba(189, 147, 249, 0);
    color: white; }
  .button.app .app:focus {
    /*background-color: transparentize(black, 0.20);*/ }

.search-item {
  border-radius: 0;
  border: none;
  color: #f8f8f2;
  background: none; }
  .search-item:hover, .search-item:focus {
    border-radius: 0;
    background-color: rgba(189, 147, 249, 0);
    color: #f8f8f2; }

.search-entry-large,
.search-entry-large:focus {
  border: none;
  font-size: 18px;
  font-weight: 300;
  background-image: none;
  background: none;
  box-shadow: none;
  border-radius: 0; }

.search-category-header {
  font-weight: bold;
  color: #f8f8f2; }

/*********
 * Panel *
 ********/
.panel {
  background-color: transparent;
  transition: all 100ms ease-in-out;
  color: #fff; }
  .panel.maximized {
    background-color: #000; }
  .panel.translucent {
    background-color: rgba(0, 0, 0, 0.5); }
  .panel.color-light.translucent {
    background-color: rgba(255, 255, 255, 0.85); }

menubar.panel,
.panel menubar {
  box-shadow: none;
  border: none; }

.composited-indicator > revealer,
.composited-indicator > revealer image,
.composited-indicator > revealer label,
.composited-indicator > revealer spinner {
  color: #fff;
  font-weight: bold;
  text-shadow: 0 1px 2px rgba(0, 0, 0, 0.3), 0 1px 2px rgba(0, 0, 0, 0.5);
  transition: all 200ms ease-in-out;
  -gtk-icon-shadow: 0 1px 2px rgba(0, 0, 0, 0.3), 0 1px 2px rgba(0, 0, 0, 0.5); }
.composited-indicator > revealer image:first-child + label {
  margin-left: 5px; }

.panel.color-light .composited-indicator > revealer,
.panel.color-light .composited-indicator > revealer image,
.panel.color-light .composited-indicator > revealer label,
.panel.color-light .composited-indicator > revealer spinner {
  color: rgba(0, 0, 0, 0.6);
  text-shadow: 0 1px rgba(255, 255, 255, 0.1);
  -gtk-icon-shadow: 0 1px rgba(255, 255, 255, 0.1); }

/**************
 * Calculator *
 **************/
PantheonCalculatorMainWindow {
  border-radius: 0 0 4px 4px; }
  PantheonCalculatorMainWindow .window-frame {
    border-radius: 3px; }

/*********
 * Cards *
 *********/
.deck {
  background-color: #0d0d11; }

.card {
  background-color: #282a36;
  border: none;
  box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.05), 0 3px 3px rgba(0, 0, 0, 0.2);
  transition: all 150ms ease-in-out; }

.card.collapsed {
  background-color: #1d1f27;
  box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.05), 0 1px 2px rgba(0, 0, 0, 0.2); }

/*********
 * Noise *
 *********/
NoiseLibraryWindow {
  border-radius: 0 0 4px 4px; }
  NoiseLibraryWindow .action-bar {
    border-radius: 0 0 4px 4px; }
  NoiseLibraryWindow .window-frame {
    border-radius: 3px; }

/********
 * Snap *
 ********/
SnapMainWindow .take-button,
SnapSnapWindow .take-button {
  border-radius: 0; }

/*******************
 * Photos/Shotwell *
 *******************/
DirectWindow .the-button-in-the-combobox,
LibraryWindow .the-button-in-the-combobox {
  background: none; }

.checkerboard-layout {
  background-color: #1e1f29;
  background-image: linear-gradient(45deg, rgba(0, 0, 0, 0.1) 25%, transparent 25%, transparent 75%, rgba(0, 0, 0, 0.1) 75%, rgba(0, 0, 0, 0.1)), linear-gradient(45deg, rgba(0, 0, 0, 0.1) 25%, transparent 25%, transparent 75%, rgba(0, 0, 0, 0.1) 75%, rgba(0, 0, 0, 0.1));
  background-size: 24px 24px;
  background-position: 0 0, 12px 12px; }

.checkboard-layout .item {
  background-color: #f8f8f2; }

/*********
* Avatar *
*********/
.avatar {
  border: 1px solid rgba(0, 0, 0, 0.23);
  border-radius: 50%;
  box-shadow: inset 0 0 0 1px rgba(255, 255, 255, 0.05), inset 0 1px 0 0 rgba(255, 255, 255, 0.45), inset 0 -1px 0 0 rgba(255, 255, 255, 0.15), 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.23); }

/**level bars**/
.sidebar.source-list.view.level-bar, iconview.sidebar.source-list.level-bar, .sidebar.source-list.view.level-bar:selected, iconview.sidebar.source-list.level-bar:selected, .sidebar.source-list.view.level-bar:selected:focus, iconview.sidebar.source-list.level-bar:selected:focus {
  background: linear-gradient(rgba(255, 255, 255, 0.14), rgba(255, 255, 255, 0.14));
  border: 1px solid rgba(0, 0, 0, 0.14);
  box-shadow: 0 1px 0 rgba(0, 0, 0, 0.25);
  border-radius: 2px; }
.sidebar.source-list.view.fill-block, iconview.sidebar.source-list.fill-block {
  border: none; }
  .sidebar.source-list.view.fill-block, iconview.sidebar.source-list.fill-block, .sidebar.source-list.view.fill-block:hover, iconview.sidebar.source-list.fill-block:hover, .sidebar.source-list.view.fill-block:selected, iconview.sidebar.source-list.fill-block:selected, .sidebar.source-list.view.fill-block:selected:focus, iconview.sidebar.source-list.fill-block:selected:focus {
    background: linear-gradient(rgba(189, 147, 249, 0.5), rgba(189, 147, 249, 0.5)); }

/**************************
 * Colors in context menu *
**************************/
checkbutton.color-button {
  border: 1px solid rgba(25, 26, 34, 0.9);
  border-radius: 100px;
  background-clip: border-box;
  padding: 0;
  margin: 2px 1px; }
  checkbutton.color-button > check {
    -gtk-icon-source: none;
    background: none;
    margin-right: 0;
    padding: 2px; }
  checkbutton.color-button.none > check {
    background-color: transparent;
    border-radius: 100px;
    -gtk-icon-source: -gtk-icontheme("close-symbolic"); }

radiobutton.color-button > radio {
  -gtk-icon-source: none;
  margin-right: 0;
  border: 1px solid rgba(0, 0, 0, 0.15);
  border-radius: 100px;
  background-clip: border-box; }
radiobutton.color-button:active > radio {
  border: 1px solid rgba(0, 0, 0, 0.35); }

.color-button check,
.color-button check:checked,
.color-button radio,
.color-button radio:checked {
  background-image: none;
  border: 1px solid rgba(0, 0, 0, 0.2);
  border-radius: 50%;
  color: #282a36;
  -gtk-icon-source: -gtk-icontheme("check-active-symbolic"); }
.color-button.red check, .color-button.red radio, .color-button.strawberry check, .color-button.strawberry radio {
  background-color: @STRAWBERRY_300;
  -gtk-icon-shadow: 0 1px 1px @STRAWBERRY_500; }
.color-button.orange check, .color-button.orange radio {
  background-color: @ORANGE_300;
  -gtk-icon-shadow: 0 1px 1px @ORANGE_500; }
.color-button.yellow check, .color-button.yellow radio, .color-button.banana check, .color-button.banana radio {
  background-color: @BANANA_500;
  -gtk-icon-shadow: 0 1px 1px @BANANA_700; }
.color-button.green check, .color-button.green radio, .color-button.lime check, .color-button.lime radio {
  background-color: @LIME_500;
  -gtk-icon-shadow: 0 1px 1px @LIME_700; }
.color-button.blue check, .color-button.blue radio, .color-button.blueberry check, .color-button.blueberry radio {
  background-color: @BLUEBERRY_500;
  -gtk-icon-shadow: 0 1px 1px @BLUEBERRY_700; }
.color-button.purple check, .color-button.purple radio, .color-button.grape check, .color-button.grape radio {
  background-color: @GRAPE_500;
  -gtk-icon-shadow: 0 1px 1px @GRAPE_700; }
.color-button.brown check, .color-button.brown radio, .color-button.cocoa check, .color-button.cocoa radio {
  background-color: @COCOA_300;
  -gtk-icon-shadow: 0 1px 1px @COCOA_500; }
.color-button.mint check, .color-button.mint radio {
  background-color: @MINT_500;
  -gtk-icon-shadow: 0 1px 1px @MINT_700; }
.color-button.pink check, .color-button.pink radio, .color-button.bubblegum check, .color-button.bubblegum radio {
  background-color: @BUBBLEGUM_500;
  -gtk-icon-shadow: 0 1px 1px @BUBBLEGUM_700; }
.color-button.slate check, .color-button.slate radio {
  background-color: @SLATE_300;
  -gtk-icon-shadow: 0 1px 1px @SLATE_500; }
.color-button.auto radio {
  background-image: url("assets/color-button-auto.png");
  background-position: -1px -1px;
  background-repeat: no-repeat;
  background-size: calc(100% + 2px); }

.xfce4-panel.background {
  background-color: #1e1f29;
  color: #f8f8f2;
  text-shadow: none;
  -gtk-icon-shadow: none; }
.xfce4-panel#XfcePanelWindow, .xfce4-panel#XfcePanelWindow.marching-ants {
  transition: none; }

#tasklist-button {
  color: rgba(255, 255, 255, 0.8);
  border-radius: 0;
  border: none;
  background-color: #1e1f29; }
  #tasklist-button:hover {
    color: white;
    background-color: rgba(0, 0, 0, 0.17); }
  #tasklist-button:checked {
    color: white;
    background-color: rgba(0, 0, 0, 0.25);
    box-shadow: inset 0 -2px rgba(189, 147, 249, 0.5); }

.xfce4-panel.background button.flat {
  color: white;
  border-radius: 0;
  border: none;
  background-color: #1e1f29;
  font-weight: normal; }
  .xfce4-panel.background button.flat:hover {
    border: none;
    background-color: #343546; }
  .xfce4-panel.background button.flat:active, .xfce4-panel.background button.flat:checked {
    color: white;
    border-bottom: 2px solid #bd93f9;
    background-color: #1a1b23; }
    .xfce4-panel.background button.flat:active label, .xfce4-panel.background button.flat:active image, .xfce4-panel.background button.flat:checked label, .xfce4-panel.background button.flat:checked image {
      color: inherit; }

/********
* Unity *
*********/
/* Unity window border color */
/* Unity window text color */
/* Backdrop Unity window text color */
/* Unity panel color #454D50 */
UnityDecoration {
  /* Border properties (top, right, bottom, left) */
  -UnityDecoration-extents: 28px 1px 1px 1px;
  /* the size of the decorations  */
  -UnityDecoration-input-extents: 10px;
  /* the extra size of the input areas */
  /* Shadows settings */
  -UnityDecoration-shadow-offset-x: 1px;
  /* Size property, the shadow x offset */
  -UnityDecoration-shadow-offset-y: 1px;
  /* Size property, the shadow y offset */
  -UnityDecoration-active-shadow-color: rgba 0, 0, 0, 0.647;
  /* Color property, active window shadow color */
  -UnityDecoration-active-shadow-radius: 8px;
  /* Size property, active window shadow radius */
  -UnityDecoration-inactive-shadow-color: rgba 0, 0, 0, 0.647;
  /* Color property, inactive windows shadow color */
  -UnityDecoration-inactive-shadow-radius: 5px;
  /* Size property, inactive windows shadow radius */
  /* Glow applied to the selected scaled window */
  -UnityDecoration-glow-size: 8px;
  /* Size property, size of glow */
  -UnityDecoration-glow-color: rgba(189, 147, 249, 0.5);
  /* Color property of the glow */
  /* Title settings */
  -UnityDecoration-title-indent: 10px;
  /* Size property, left indent of the title */
  -UnityDecoration-title-fade: 35px;
  /* Size property, space of the title that can be faded */
  -UnityDecoration-title-alignment: 0.0;
  /* Float from 0.0 to 1.0, to align the title */
  background-color: #31363D;
  color: #fefefe; }
  UnityDecoration .top {
    padding: 0 5px 0 5px;
    border-radius: 4px 4px 0px 0px;
    box-shadow: none;
    border: 1px solid #31363D;
    border-bottom-width: 0;
    background-color: #31363D;
    color: #fefefe;
    border-top: 1px solid rgba(255, 255, 255, 0.1); }
    UnityDecoration .top:backdrop {
      border-bottom-width: 0;
      color: #e5e5e5;
      border-top: 1px solid rgba(255, 255, 255, 0.1); }
    UnityDecoration .top .menuitem {
      color: #fefefe; }
      UnityDecoration .top .menuitem:backdrop {
        color: #e5e5e5; }

UnityDecoration.left,
UnityDecoration.right {
  background-repeat: repeat-x;
  background-color: #30343b;
  background-size: 1px 120px;
  background-clip: border-box;
  background-image: linear-gradient(to bottom, #31363D, #30343b); }

UnityDecoration.bottom {
  background-size: 1px;
  background-repeat: repeat-x;
  background-color: #30343b; }

UnityDecoration.left:backdrop,
UnityDecoration.right:backdrop,
UnityDecoration.bottom:backdrop {
  background-size: 1px;
  background-repeat: repeat-x; }

/**************
* Unity Panel *
***************/
UnityPanelWidget,
.unity-panel {
  background-color: #1a1d21;
  color: #fefefe; }

UnityPanelWidget:backdrop,
.unity-panel:backdrop {
  color: #e5e5e5; }

.unity-panel.menuitem,
.unity-panel .menuitem {
  border-width: 0 1px;
  color: #fefefe; }

.unity-panel.menubar,
.unity-panel .menubar {
  color: #fefefe; }

.unity-panel.menu.menubar,
.unity-panel .menu .menubar {
  background-color: #1a1d21;
  color: #fefefe; }

.unity-panel.menubar:backdrop,
.unity-panel .menubar *:backdrop {
  color: #8b8c8e; }

.unity-panel.menubar.menuitem,
.unity-panel.menubar .menuitem {
  padding: 3px 5px;
  border-width: 1px;
  border-style: solid;
  border: none;
  background: none;
  color: #fefefe;
  box-shadow: none; }

.unity-panel.menubar.menuitem:hover,
.unity-panel.menubar .menuitem:hover {
  border-radius: 0;
  background-color: #2f333a;
  color: #fefefe;
  box-shadow: none; }

.unity-panel.menubar .menuitem *:hover {
  color: white;
  box-shadow: none; }

.unity-panel.menubar .menuitem.separator,
.unity-panel.menubar.menuitem.separator {
  border: none;
  color: rgba(25, 26, 34, 0.9); }

/* Force Quit */
SheetStyleDialog.unity-force-quit {
  background-color: #282a36; }

@keyframes playbackmenuitem_spinner {
  to {
    -gtk-icon-transform: rotate(1turn); } }
.menu IdoPlaybackMenuItem.menuitem:active {
  -gtk-icon-source: -gtk-icontheme("process-working-symbolic");
  animation: playbackmenuitem_spinner 1s infinite linear;
  color: rgba(189, 147, 249, 0.5); }

MsdOsdWindow.background.osd {
  border-radius: 2px;
  border: 1px solid rgba(25, 26, 34, 0.9); }
  MsdOsdWindow.background.osd .progressbar {
    background-color: rgba(189, 147, 249, 0.5);
    border: none;
    border-color: rgba(189, 147, 249, 0.5);
    border-radius: 5px; }
  MsdOsdWindow.background.osd .trough {
    background-color: rgba(9, 10, 12, 0.8);
    border: none;
    border-radius: 5px; }

/***********************
 * App-Specific Styles *
 ***********************/
/*********
 * Geary *
 *********/
.geary-titlebar-left .separator,
.geary-titlebar-right .separator {
  opacity: 0; }

ConversationListView {
  -GtkTreeView-grid-line-width: 0; }
  ConversationListView .view:active, ConversationListView iconview:active, ConversationListView .view:selected, ConversationListView iconview:selected {
    background-color: rgba(189, 147, 249, 0.5);
    color: #f8f8f2; }
    ConversationListView .view:active:backdrop, ConversationListView iconview:active:backdrop, ConversationListView .view:selected:backdrop, ConversationListView iconview:selected:backdrop {
      background-color: rgba(189, 147, 249, 0.4);
      color: rgba(248, 248, 242, 0.5); }
  ConversationListView .view .cell, ConversationListView iconview .cell {
    border: solid rgba(0, 0, 0, 0.2);
    border-width: 0 0 1px 0; }
    ConversationListView .view .cell:selected, ConversationListView iconview .cell:selected {
      color: #f8f8f2;
      border: 0px solid rgba(159, 99, 246, 0.5); }

/***********
 * LightDm *
 ***********/
#panel_window {
  background-color: #1e1f29;
  color: white;
  font-weight: bold;
  box-shadow: inset 0 -1px #0f0f14; }
  #panel_window .menubar,
  #panel_window .menubar > .menuitem
  menubar,
  #panel_window menubar > menuitem {
    background-color: transparent;
    color: white;
    font-weight: bold; }
  #panel_window .menubar .menuitem:disabled,
  #panel_window menubar menuitem:disabled {
    color: rgba(255, 255, 255, 0.5); }
    #panel_window .menubar .menuitem:disabled GtkLabel,
    #panel_window menubar menuitem:disabled GtkLabel {
      color: inherit; }
    #panel_window .menubar .menuitem:disabled label,
    #panel_window menubar menuitem:disabled label {
      color: inherit; }
  #panel_window .menubar .menu > .menuitem,
  #panel_window menubar menu > menuitem {
    font-weight: normal; }

#login_window,
#shutdown_dialog,
#restart_dialog {
  font-weight: normal;
  border-style: none;
  background-color: transparent;
  color: #f8f8f2; }

#content_frame {
  padding-bottom: 14px;
  background-color: #1e1f29;
  border-top-left-radius: 2px;
  border-top-right-radius: 2px;
  border: solid rgba(0, 0, 0, 0.1);
  border-width: 1px 1px 0 1px; }

#content_frame button {
  font-weight: normal;
  color: #f8f8f2;
  outline-color: rgba(248, 248, 242, 0.3);
  background-color: #282a36;
  text-shadow: none;
  border: 1px solid #282a36;
  box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
  #content_frame button:hover {
    color: #f8f8f2;
    outline-color: rgba(248, 248, 242, 0.3);
    background-color: #282a36;
    text-shadow: none;
    box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
  #content_frame button:active, #content_frame button:checked {
    color: #f8f8f2;
    outline-color: rgba(248, 248, 242, 0.3);
    background-color: rgba(189, 147, 249, 0.5);
    text-shadow: none;
    box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }
  #content_frame button:disabled {
    color: #cfcfcd;
    outline-color: rgba(248, 248, 242, 0.3);
    background-color: #22232e;
    text-shadow: none;
    box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.1), inset 0px -1px 0px 0px rgba(0, 0, 0, 0.1); }

#buttonbox_frame {
  padding-top: 20px;
  padding-bottom: 0px;
  border-style: none;
  background-color: #1e1f29;
  border-bottom-left-radius: 3px;
  border-bottom-right-radius: 3px;
  border: solid rgba(0, 0, 0, 0.1);
  border-width: 0 1px 1px 1px; }

#buttonbox_frame button {
  color: #fefefe;
  border-color: rgba(0, 0, 0, 0.7);
  background-color: rgba(20, 23, 26, 0.8);
  background-clip: padding-box;
  box-shadow: inset 0 1px rgba(255, 255, 255, 0.1);
  text-shadow: 0 1px black;
  -gtk-icon-shadow: 0 1px black;
  outline-color: rgba(254, 254, 254, 0.3); }
  #buttonbox_frame button:hover {
    color: white;
    border-color: rgba(0, 0, 0, 0.7);
    background-image: linear-gradient(to bottom, rgba(47, 54, 61, 0.8), rgba(47, 54, 61, 0.8));
    background-clip: padding-box;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1);
    text-shadow: 0 1px black;
    -gtk-icon-shadow: 0 1px black;
    outline-color: rgba(254, 254, 254, 0.3); }
  #buttonbox_frame button:active, #buttonbox_frame button:checked {
    color: white;
    border-color: rgba(0, 0, 0, 0.7);
    background-image: linear-gradient(to bottom, rgba(33, 38, 43, 0.8), rgba(33, 38, 43, 0.8));
    background-clip: padding-box;
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.1);
    text-shadow: none;
    -gtk-icon-shadow: none;
    outline-color: rgba(254, 254, 254, 0.3); }
  #buttonbox_frame button:disabled {
    color: #898b8c;
    border-color: rgba(0, 0, 0, 0.7);
    background-image: linear-gradient(to bottom, rgba(43, 46, 49, 0.5), rgba(43, 46, 49, 0.5));
    background-clip: padding-box;
    box-shadow: none;
    text-shadow: none;
    -gtk-icon-shadow: none; }

#login_window #user_combobox {
  color: #f8f8f2;
  font-size: 13px; }
  #login_window #user_combobox .menu,
  #login_window #user_combobox menu {
    font-weight: normal; }

#user_image {
  padding: 3px;
  border-radius: 2px; }

#greeter_infobar {
  border-bottom-width: 0;
  font-weight: bold; }

/* thunar */
.thunar toolbar {
  background-color: #1e1f29; }

/* buttons in toolbar */
.thunar toolbar.horizontal button image {
  -gtk-icon-transform: scale(0.72); }

scrolledwindow.sidebar treeview.view, scrollbar.right {
  background: #232530;
  padding: 2.5px 1.5px;
  border: none;
  box-shadow: none; }

scrolledwindow.standard-view scrollbar.right {
  background-color: #282a36; }

/* path-bar of thunar */
window.thunar toolbar > toolitem > widget > widget.linked.path-bar > button.toggle.path-bar-button:hover, window.thunar toolbar > toolitem > widget > widget.linked.path-bar > button.toggle.path-bar-button:checked, window.thunar toolbar > toolitem > widget > widget.linked.path-bar > button.toggle.path-bar-button:selected, .thunar scrolledwindow.sidebar treeview.view:hover, .thunar scrolledwindow.sidebar treeview.view:checked, .thunar scrolledwindow.sidebar treeview.view:selected, .thunar toolbar.horizontal button:hover, .thunar toolbar.horizontal button:checked, .thunar toolbar.horizontal button:selected {
  color: #bd93f9;
  background-color: rgba(189, 147, 249, 0.1);
  border-radius: 7px;
  box-shadow: none;
  text-shadow: none;
  font-weight: bold;
  font-weight: normal; }
window.thunar toolbar > toolitem > widget > widget.linked.path-bar > button.toggle.path-bar-button:checked:backdrop label, window.thunar toolbar > toolitem > widget > widget.linked.path-bar > button.toggle.path-bar-button:selected:backdrop label, .thunar scrolledwindow.sidebar treeview.view:checked:backdrop label, .thunar scrolledwindow.sidebar treeview.view:selected:backdrop label, .thunar toolbar.horizontal button:checked:backdrop label, .thunar toolbar.horizontal button:selected:backdrop label {
  color: rgba(189, 147, 249, 0.4); }

window.thunar toolbar > toolitem > widget > widget.linked.path-bar > button.path-bar-button {
  background: none;
  outline: none;
  border: none;
  box-shadow: none; }

.nemo-window .places-treeview {
  -NemoPlacesTreeView-disk-full-bg-color: #07080a;
  -NemoPlacesTreeView-disk-full-fg-color: #f1fa8c;
  -GtkTreeView-vertical-separator: 7; }
  .nemo-window .places-treeview .view.cell:hover, .nemo-window .places-treeview iconview.cell:hover, .nemo-window .places-treeview .view.cell:selected, .nemo-window .places-treeview iconview.cell:selected,
  .nemo-window .places-treeview iconview.cell:hover,
  .nemo-window .places-treeview iconview.cell:selected {
    color: #bd93f9;
    background-color: rgba(189, 147, 249, 0.1);
    border-radius: 7px;
    box-shadow: none;
    text-shadow: none;
    font-weight: bold;
    border-radius: 0; }
.nemo-window .sidebar {
  color: #f8f8f2;
  background-color: #232530; }
  .nemo-window .sidebar .view, .nemo-window .sidebar iconview, .nemo-window .sidebar .iconview, .nemo-window .sidebar row {
    background-color: transparent; }
.nemo-window .nemo-window-pane widget.entry {
  background-clip: padding-box;
  min-height: 28px;
  padding: 5px;
  color: #f8f8f2;
  border: 1px solid rgba(25, 26, 34, 0.9);
  border-radius: 3px;
  box-shadow: inset 0 1px rgba(0, 0, 0, 0.9), inset 1px 0 rgba(0, 0, 0, 0.96), inset -1px 0 rgba(0, 0, 0, 0.96), inset 0 -1px rgba(0, 0, 0, 0.98), 0 1px rgba(255, 255, 255, 0.6); }
  .nemo-window .nemo-window-pane widget.entry:selected {
    background-color: rgba(189, 147, 249, 0.5);
    color: #f8f8f2; }
.nemo-window toolbar.primary-toolbar {
  margin-bottom: -1px;
  background: #1e1f29; }
  .nemo-window toolbar.primary-toolbar button {
    color: #f8f8f2;
    background-color: transparent;
    border-radius: 0;
    text-shadow: none;
    box-shadow: none;
    border: none;
    min-height: 24px;
    padding: 3px; }
    .nemo-window toolbar.primary-toolbar button:hover {
      color: #bd93f9;
      background-color: transparent;
      border-radius: 0;
      text-shadow: none;
      box-shadow: none; }
    .nemo-window toolbar.primary-toolbar button:selected, .nemo-window toolbar.primary-toolbar button:active, .nemo-window toolbar.primary-toolbar button:checked {
      color: #bd93f9;
      background-color: rgba(189, 147, 249, 0.1);
      border-radius: 7px;
      box-shadow: none;
      text-shadow: none;
      font-weight: bold; }
      .nemo-window toolbar.primary-toolbar button:selected:backdrop, .nemo-window toolbar.primary-toolbar button:selected:backdrop label, .nemo-window toolbar.primary-toolbar button:active:backdrop, .nemo-window toolbar.primary-toolbar button:active:backdrop label, .nemo-window toolbar.primary-toolbar button:checked:backdrop, .nemo-window toolbar.primary-toolbar button:checked:backdrop label {
        color: rgba(189, 147, 249, 0.4); }
.nemo-window .nemo-inactive-pane .view, .nemo-window .nemo-inactive-pane iconview,
.nemo-window .nemo-inactive-pane iconview {
  background-color: #242530; }

.caja-notebook .frame {
  border-width: 0 0 1px; }
.caja-notebook .entry {
  background: #1e1f29;
  color: #f8f8f2;
  border-color: rgba(25, 26, 34, 0.9); }
  .caja-notebook .entry:selected {
    background: rgba(189, 147, 249, 0.5);
    color: #f8f8f2; }

/**************
* Caja sidebar *
**************/
.caja-side-pane {
  background: #1e1f29; }
  .caja-side-pane .frame {
    border-width: 1px 0 0; }
  .caja-side-pane treeview.view,
  .caja-side-pane textview.view text,
  .caja-side-pane viewport.frame,
  .caja-side-pane widget .vertical {
    background: #1e1f29;
    padding: 3px 2px; }
    .caja-side-pane treeview.view:hover,
    .caja-side-pane textview.view text:hover,
    .caja-side-pane viewport.frame:hover,
    .caja-side-pane widget .vertical:hover {
      background-color: rgba(40, 42, 54, 0.6); }
    .caja-side-pane treeview.view:selected,
    .caja-side-pane textview.view text:selected,
    .caja-side-pane viewport.frame:selected,
    .caja-side-pane widget .vertical:selected {
      color: #bd93f9;
      background: #1e1f29; }
      .caja-side-pane treeview.view:selected:hover,
      .caja-side-pane textview.view text:selected:hover,
      .caja-side-pane viewport.frame:selected:hover,
      .caja-side-pane widget .vertical:selected:hover {
        background-color: rgba(189, 147, 249, 0); }

/**************
* Caja pathbar *
**************/
.caja-navigation-window paned {
  background: #282a36; }

.caja-navigation-window .primary-toolbar {
  background: #1e1f29; }
  .caja-navigation-window .primary-toolbar button, .caja-navigation-window .primary-toolbar button:backdrop {
    color: #f8f8f2;
    background-color: transparent;
    border-radius: 0;
    text-shadow: none;
    box-shadow: none;
    border: none; }
  .caja-navigation-window .primary-toolbar button:hover, .caja-navigation-window .primary-toolbar button:active, .caja-navigation-window .primary-toolbar button:backdrop:active, .caja-navigation-window .primary-toolbar button:backdrop:checked {
    background: rgba(189, 147, 249, 0.5);
    box-shadow: none; }
    .caja-navigation-window .primary-toolbar button:hover, .caja-navigation-window .primary-toolbar button:hover label, .caja-navigation-window .primary-toolbar button:active, .caja-navigation-window .primary-toolbar button:active label, .caja-navigation-window .primary-toolbar button:backdrop:active, .caja-navigation-window .primary-toolbar button:backdrop:active label, .caja-navigation-window .primary-toolbar button:backdrop:checked, .caja-navigation-window .primary-toolbar button:backdrop:checked label {
      color: #f8f8f2; }

.caja-pathbar button, .caja-pathbar button:backdrop {
  color: #f8f8f2;
  background-color: transparent;
  border-radius: 0;
  text-shadow: none;
  box-shadow: none;
  border: none; }
.caja-pathbar button:hover, .caja-pathbar button:active, .caja-pathbar button:checked, .caja-pathbar button:backdrop:active, .caja-pathbar button:backdrop:checked {
  background: transparent;
  box-shadow: none; }
  .caja-pathbar button:hover, .caja-pathbar button:hover label, .caja-pathbar button:active, .caja-pathbar button:active label, .caja-pathbar button:checked, .caja-pathbar button:checked label, .caja-pathbar button:backdrop:active, .caja-pathbar button:backdrop:active label, .caja-pathbar button:backdrop:checked, .caja-pathbar button:backdrop:checked label {
    color: #bd93f9; }

/*# sourceMappingURL=gtk.css.map */
  '';
}