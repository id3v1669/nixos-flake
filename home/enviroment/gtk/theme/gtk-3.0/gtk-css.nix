{config, lib, pkgs, ...}:
let
    inherit (import ./../../../../../lib/h2rgba.nix { inherit lib; }) hexToRgba;
in
{
  home.file.".themes/dynamic-color-theme/gtk-3.0/gtk.css".text = ''
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

@keyframes ripple {
  to {
    background-size: 1000% 1000%;
  }
}

@keyframes ripple-on-slider {
  to {
    background-size: auto, 1000% 1000%;
  }
}

@keyframes ripple-on-headerbar {
  from {
    background-image: radial-gradient(circle, #${config.colorScheme.palette.base0F} 0%, transparent 0%);
  }
  to {
    background-image: radial-gradient(circle, #${config.colorScheme.palette.base0F} 100%, transparent 0%);
  }
}

* {
  background-clip: padding-box;
  -gtktoolbutton-icon-spacing: 0;
  -gtktextview-error-underline-color: #${config.colorScheme.palette.base08};
  -gtkscrolledwindow-scrollbar-spacing: 0;
  -gtktoolitemgroup-expander-size: 11;
  -gtkwidget-text-handle-width: 24;
  -gtkwidget-text-handle-height: 24;
  -gtkdialog-button-spacing: 6;
  -gtkdialog-action-area-border: 6;
  outline-style: solid;
  outline-width: 2px;
  outline-color: transparent;
  outline-offset: -4px;
  -gtk-outline-radius: 6px;
  -gtk-secondary-caret-color: #${config.colorScheme.palette.base0F};
}

*:focus {
  outline-color: alpha(currentColor, 0.1);
}

XfdesktopIconView.view:active,
calendar.raven-calendar:selected,
.budgie-popover.budgie-menu
  button.flat:not(.image-button):not(.indicator-item):checked,
box.vertical > widget > widget:selected,
calendar:selected,
row:selected,
treeview.view:selected:not(.progressbar):not(.trough),
modelbutton.flat:selected,
.menuitem.button.flat:selected {
  color: #${config.colorScheme.palette.base06};
  background-color: #${config.colorScheme.palette.base03};
}

.nemo-window .view selection,
.nemo-window .view:selected,
.nautilus-window notebook .view:not(treeview) selection,
.nautilus-window notebook .view:not(treeview):selected,
.nautilus-window flowboxchild:selected .icon-item-background,
flowbox flowboxchild:selected,
.background.csd .view:selected {
  color: #${config.colorScheme.palette.base0F};
  background-color: rgba(238, 190, 190, 0.2);
}

.nemo-window .nemo-window-pane widget.entry:selected,
window.background.csd evview.view.content-view:selected,
window.background.csd evview.view.content-view:selected:backdrop,
spinbutton.vertical selection,
spinbutton:not(.vertical) selection,
entry selection,
label selection,
textview text selection:focus,
textview text selection,
widget.view:selected,
.view:selected {
  color: rgba(0, 0, 0, 0.87);
  background-color: #${config.colorScheme.palette.base0F};
}

.linked:not(.vertical) > button,
.linked:not(.vertical) > spinbutton.vertical,
.linked:not(.vertical) > spinbutton:not(.vertical),
.linked:not(.vertical) > entry {
  border-radius: 0;
}

.linked:not(.vertical) > button:first-child,
.linked:not(.vertical) > spinbutton.vertical:first-child,
.linked:not(.vertical) > spinbutton:first-child:not(.vertical),
.linked:not(.vertical) > entry:first-child {
  border-top-left-radius: 6px;
  border-bottom-left-radius: 6px;
}

.linked:not(.vertical) > button:last-child,
.linked:not(.vertical) > spinbutton.vertical:last-child,
.linked:not(.vertical) > spinbutton:last-child:not(.vertical),
.linked:not(.vertical) > entry:last-child {
  border-top-right-radius: 6px;
  border-bottom-right-radius: 6px;
}

.linked:not(.vertical) > button:only-child,
.linked:not(.vertical) > spinbutton.vertical:only-child,
.linked:not(.vertical) > spinbutton:only-child:not(.vertical),
.linked:not(.vertical) > entry:only-child {
  border-radius: 6px;
}

.linked.vertical > button,
.linked.vertical > spinbutton.vertical,
.linked.vertical > spinbutton:not(.vertical),
.linked.vertical > entry {
  border-radius: 0;
}

.linked.vertical > button:first-child,
.linked.vertical > spinbutton.vertical:first-child,
.linked.vertical > spinbutton:first-child:not(.vertical),
.linked.vertical > entry:first-child {
  border-top-left-radius: 6px;
  border-top-right-radius: 6px;
}

.linked.vertical > button:last-child,
.linked.vertical > spinbutton.vertical:last-child,
.linked.vertical > spinbutton:last-child:not(.vertical),
.linked.vertical > entry:last-child {
  border-bottom-left-radius: 6px;
  border-bottom-right-radius: 6px;
}

.linked.vertical > button:only-child,
.linked.vertical > spinbutton.vertical:only-child,
.linked.vertical > spinbutton:only-child:not(.vertical),
.linked.vertical > entry:only-child {
  border-radius: 6px;
}

/***************
 * Base States *
 ***************/
.background {
  background-color: #${config.colorScheme.palette.base00};
  color: #${config.colorScheme.palette.base06};
}

.background.csd {
  border-radius: 0 0 12px 12px;
}

.background.tiled .background.maximized,
.background.solid-csd {
  border-radius: 0;
}

*:disabled {
  -gtk-icon-effect: dim;
}

.gtkstyle-fallback {
  background-color: #${config.colorScheme.palette.base01};
  color: #${config.colorScheme.palette.base06};
}

.gtkstyle-fallback:hover {
  background-color: #${config.colorScheme.palette.base01};
  color: #${config.colorScheme.palette.base06};
}

.gtkstyle-fallback:active {
  background-color: #${config.colorScheme.palette.base01};
  color: #${config.colorScheme.palette.base06};
}

.gtkstyle-fallback:disabled {
  background-color: #${config.colorScheme.palette.base00};
  color: rgba(242, 213, 207, 0.5);
}

.gtkstyle-fallback:selected {
  background-color: #${config.colorScheme.palette.base0F};
  color: rgba(0, 0, 0, 0.87);
}

.view {
  background-color: #${config.colorScheme.palette.base00};
  color: #${config.colorScheme.palette.base06};
}

.view:hover {
  box-shadow: inset 0 0 0 9999px alpha(currentColor, 0.08);
}

.view:disabled {
  color: rgba(242, 213, 207, 0.5);
}

.view:selected:hover {
  box-shadow: none;
}

window.background.csd > stack.view {
  border-radius: 0 0 12px 12px;
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
  border-radius: 6px;
}

.rubberband,
rubberband,
XfdesktopIconView.view .rubberband,
.content-view rubberband,
.content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view .rubberband,
.content-view treeview.view rubberband,
.content-view treeview.view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view treeview.view .rubberband,
treeview.view .content-view rubberband,
treeview.view .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view treeview.view .content-view .rubberband,
.content-view treeview.view flowbox rubberband,
.content-view treeview.view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view treeview.view flowbox .rubberband,
treeview.view flowbox .content-view rubberband,
treeview.view flowbox .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view treeview.view flowbox .content-view .rubberband,
.content-view flowbox treeview.view rubberband,
.content-view flowbox treeview.view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view flowbox treeview.view .rubberband,
flowbox treeview.view .content-view rubberband,
flowbox treeview.view .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox treeview.view .content-view .rubberband,
.content-view treeview.view flowbox treeview.view rubberband,
.content-view
  treeview.view
  flowbox
  treeview.view
  XfdesktopIconView.view
  .rubberband,
XfdesktopIconView.view
  .content-view
  treeview.view
  flowbox
  treeview.view
  .rubberband,
treeview.view flowbox treeview.view .content-view rubberband,
treeview.view
  flowbox
  treeview.view
  .content-view
  XfdesktopIconView.view
  .rubberband,
XfdesktopIconView.view
  treeview.view
  flowbox
  treeview.view
  .content-view
  .rubberband,
.content-view flowbox treeview.view flowbox rubberband,
.content-view flowbox treeview.view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view flowbox treeview.view flowbox .rubberband,
flowbox treeview.view flowbox .content-view rubberband,
flowbox treeview.view flowbox .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox treeview.view flowbox .content-view .rubberband,
.content-view .rubberband,
treeview.view rubberband,
treeview.view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view treeview.view .rubberband,
treeview.view .content-view rubberband,
treeview.view .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view treeview.view .content-view .rubberband,
.content-view treeview.view rubberband,
.content-view treeview.view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view treeview.view .rubberband,
.content-view treeview.view rubberband,
.content-view treeview.view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view treeview.view .rubberband,
treeview.view .content-view rubberband,
treeview.view .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view treeview.view .content-view .rubberband,
.content-view treeview.view flowbox rubberband,
.content-view treeview.view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view treeview.view flowbox .rubberband,
treeview.view flowbox .content-view rubberband,
treeview.view flowbox .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view treeview.view flowbox .content-view .rubberband,
.content-view flowbox treeview.view rubberband,
.content-view flowbox treeview.view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view flowbox treeview.view .rubberband,
flowbox treeview.view .content-view rubberband,
flowbox treeview.view .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox treeview.view .content-view .rubberband,
.content-view treeview.view flowbox treeview.view rubberband,
.content-view
  treeview.view
  flowbox
  treeview.view
  XfdesktopIconView.view
  .rubberband,
XfdesktopIconView.view
  .content-view
  treeview.view
  flowbox
  treeview.view
  .rubberband,
treeview.view flowbox treeview.view .content-view rubberband,
treeview.view
  flowbox
  treeview.view
  .content-view
  XfdesktopIconView.view
  .rubberband,
XfdesktopIconView.view
  treeview.view
  flowbox
  treeview.view
  .content-view
  .rubberband,
.content-view flowbox treeview.view flowbox rubberband,
.content-view flowbox treeview.view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view flowbox treeview.view flowbox .rubberband,
flowbox treeview.view flowbox .content-view rubberband,
flowbox treeview.view flowbox .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox treeview.view flowbox .content-view .rubberband,
treeview.view .content-view .rubberband,
.content-view treeview.view .rubberband,
treeview.view flowbox rubberband,
treeview.view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view treeview.view flowbox .rubberband,
treeview.view flowbox .content-view rubberband,
treeview.view flowbox .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view treeview.view flowbox .content-view .rubberband,
.content-view treeview.view flowbox rubberband,
.content-view treeview.view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view treeview.view flowbox .rubberband,
.content-view treeview.view flowbox rubberband,
.content-view treeview.view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view treeview.view flowbox .rubberband,
treeview.view flowbox .content-view rubberband,
treeview.view flowbox .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view treeview.view flowbox .content-view .rubberband,
treeview.view .content-view flowbox rubberband,
treeview.view .content-view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view treeview.view .content-view flowbox .rubberband,
.content-view treeview.view flowbox rubberband,
.content-view treeview.view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view treeview.view flowbox .rubberband,
treeview.view flowbox .content-view rubberband,
treeview.view flowbox .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view treeview.view flowbox .content-view .rubberband,
treeview.view .content-view flowbox treeview.view rubberband,
treeview.view
  .content-view
  flowbox
  treeview.view
  XfdesktopIconView.view
  .rubberband,
XfdesktopIconView.view
  treeview.view
  .content-view
  flowbox
  treeview.view
  .rubberband,
.content-view treeview.view flowbox treeview.view rubberband,
.content-view
  treeview.view
  flowbox
  treeview.view
  XfdesktopIconView.view
  .rubberband,
XfdesktopIconView.view
  .content-view
  treeview.view
  flowbox
  treeview.view
  .rubberband,
treeview.view flowbox treeview.view .content-view rubberband,
treeview.view
  flowbox
  treeview.view
  .content-view
  XfdesktopIconView.view
  .rubberband,
XfdesktopIconView.view
  treeview.view
  flowbox
  treeview.view
  .content-view
  .rubberband,
.content-view treeview.view flowbox treeview.view rubberband,
.content-view
  treeview.view
  flowbox
  treeview.view
  XfdesktopIconView.view
  .rubberband,
XfdesktopIconView.view
  .content-view
  treeview.view
  flowbox
  treeview.view
  .rubberband,
treeview.view flowbox treeview.view .content-view rubberband,
treeview.view
  flowbox
  treeview.view
  .content-view
  XfdesktopIconView.view
  .rubberband,
XfdesktopIconView.view
  treeview.view
  flowbox
  treeview.view
  .content-view
  .rubberband,
.content-view flowbox treeview.view flowbox rubberband,
.content-view flowbox treeview.view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view flowbox treeview.view flowbox .rubberband,
flowbox treeview.view flowbox .content-view rubberband,
flowbox treeview.view flowbox .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox treeview.view flowbox .content-view .rubberband,
treeview.view flowbox .content-view .rubberband,
.content-view treeview.view flowbox .rubberband,
flowbox treeview.view rubberband,
flowbox treeview.view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox treeview.view .rubberband,
flowbox treeview.view .content-view rubberband,
flowbox treeview.view .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox treeview.view .content-view .rubberband,
.content-view flowbox treeview.view rubberband,
.content-view flowbox treeview.view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view flowbox treeview.view .rubberband,
flowbox .content-view treeview.view rubberband,
flowbox .content-view treeview.view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox .content-view treeview.view .rubberband,
.content-view flowbox treeview.view rubberband,
.content-view flowbox treeview.view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view flowbox treeview.view .rubberband,
flowbox treeview.view .content-view rubberband,
flowbox treeview.view .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox treeview.view .content-view .rubberband,
flowbox .content-view treeview.view flowbox rubberband,
flowbox .content-view treeview.view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox .content-view treeview.view flowbox .rubberband,
.content-view flowbox treeview.view flowbox rubberband,
.content-view flowbox treeview.view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view flowbox treeview.view flowbox .rubberband,
flowbox treeview.view flowbox .content-view rubberband,
flowbox treeview.view flowbox .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox treeview.view flowbox .content-view .rubberband,
.content-view flowbox treeview.view rubberband,
.content-view flowbox treeview.view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view flowbox treeview.view .rubberband,
flowbox treeview.view .content-view rubberband,
flowbox treeview.view .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox treeview.view .content-view .rubberband,
.content-view treeview.view flowbox treeview.view rubberband,
.content-view
  treeview.view
  flowbox
  treeview.view
  XfdesktopIconView.view
  .rubberband,
XfdesktopIconView.view
  .content-view
  treeview.view
  flowbox
  treeview.view
  .rubberband,
treeview.view flowbox treeview.view .content-view rubberband,
treeview.view
  flowbox
  treeview.view
  .content-view
  XfdesktopIconView.view
  .rubberband,
XfdesktopIconView.view
  treeview.view
  flowbox
  treeview.view
  .content-view
  .rubberband,
.content-view flowbox treeview.view flowbox rubberband,
.content-view flowbox treeview.view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view flowbox treeview.view flowbox .rubberband,
flowbox treeview.view flowbox .content-view rubberband,
flowbox treeview.view flowbox .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox treeview.view flowbox .content-view .rubberband,
flowbox treeview.view .content-view .rubberband,
.content-view flowbox treeview.view .rubberband,
flowbox rubberband,
flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox .rubberband,
flowbox .content-view rubberband,
flowbox .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox .content-view .rubberband,
.content-view flowbox rubberband,
.content-view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view flowbox .rubberband,
flowbox .content-view treeview.view rubberband,
flowbox .content-view treeview.view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox .content-view treeview.view .rubberband,
.content-view treeview.view flowbox rubberband,
.content-view treeview.view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view treeview.view flowbox .rubberband,
flowbox treeview.view .content-view rubberband,
flowbox treeview.view .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox treeview.view .content-view .rubberband,
treeview.view .content-view flowbox rubberband,
treeview.view .content-view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view treeview.view .content-view flowbox .rubberband,
.content-view treeview.view flowbox rubberband,
.content-view treeview.view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view treeview.view flowbox .rubberband,
treeview.view flowbox .content-view rubberband,
treeview.view flowbox .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view treeview.view flowbox .content-view .rubberband,
.content-view flowbox treeview.view rubberband,
.content-view flowbox treeview.view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view flowbox treeview.view .rubberband,
flowbox treeview.view .content-view rubberband,
flowbox treeview.view .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox treeview.view .content-view .rubberband,
.content-view treeview.view flowbox treeview.view rubberband,
.content-view
  treeview.view
  flowbox
  treeview.view
  XfdesktopIconView.view
  .rubberband,
XfdesktopIconView.view
  .content-view
  treeview.view
  flowbox
  treeview.view
  .rubberband,
treeview.view flowbox treeview.view .content-view rubberband,
treeview.view
  flowbox
  treeview.view
  .content-view
  XfdesktopIconView.view
  .rubberband,
XfdesktopIconView.view
  treeview.view
  flowbox
  treeview.view
  .content-view
  .rubberband,
.content-view flowbox treeview.view flowbox rubberband,
.content-view flowbox treeview.view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view flowbox treeview.view flowbox .rubberband,
flowbox treeview.view flowbox .content-view rubberband,
flowbox treeview.view flowbox .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox treeview.view flowbox .content-view .rubberband,
flowbox .content-view .rubberband,
.content-view flowbox .rubberband,
flowbox treeview.view rubberband,
flowbox treeview.view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox treeview.view .rubberband,
flowbox treeview.view .content-view rubberband,
flowbox treeview.view .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox treeview.view .content-view .rubberband,
.content-view flowbox treeview.view rubberband,
.content-view flowbox treeview.view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view flowbox treeview.view .rubberband,
flowbox .content-view treeview.view rubberband,
flowbox .content-view treeview.view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox .content-view treeview.view .rubberband,
.content-view flowbox treeview.view rubberband,
.content-view flowbox treeview.view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view flowbox treeview.view .rubberband,
flowbox treeview.view .content-view rubberband,
flowbox treeview.view .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox treeview.view .content-view .rubberband,
flowbox .content-view treeview.view flowbox rubberband,
flowbox .content-view treeview.view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox .content-view treeview.view flowbox .rubberband,
.content-view flowbox treeview.view flowbox rubberband,
.content-view flowbox treeview.view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view flowbox treeview.view flowbox .rubberband,
flowbox treeview.view flowbox .content-view rubberband,
flowbox treeview.view flowbox .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox treeview.view flowbox .content-view .rubberband,
.content-view flowbox treeview.view rubberband,
.content-view flowbox treeview.view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view flowbox treeview.view .rubberband,
flowbox treeview.view .content-view rubberband,
flowbox treeview.view .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox treeview.view .content-view .rubberband,
.content-view treeview.view flowbox treeview.view rubberband,
.content-view
  treeview.view
  flowbox
  treeview.view
  XfdesktopIconView.view
  .rubberband,
XfdesktopIconView.view
  .content-view
  treeview.view
  flowbox
  treeview.view
  .rubberband,
treeview.view flowbox treeview.view .content-view rubberband,
treeview.view
  flowbox
  treeview.view
  .content-view
  XfdesktopIconView.view
  .rubberband,
XfdesktopIconView.view
  treeview.view
  flowbox
  treeview.view
  .content-view
  .rubberband,
.content-view flowbox treeview.view flowbox rubberband,
.content-view flowbox treeview.view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view flowbox treeview.view flowbox .rubberband,
flowbox treeview.view flowbox .content-view rubberband,
flowbox treeview.view flowbox .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox treeview.view flowbox .content-view .rubberband,
flowbox treeview.view .content-view .rubberband,
.content-view flowbox treeview.view .rubberband,
treeview.view flowbox rubberband,
treeview.view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view treeview.view flowbox .rubberband,
treeview.view flowbox .content-view rubberband,
treeview.view flowbox .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view treeview.view flowbox .content-view .rubberband,
.content-view treeview.view flowbox rubberband,
.content-view treeview.view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view treeview.view flowbox .rubberband,
.content-view treeview.view flowbox rubberband,
.content-view treeview.view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view treeview.view flowbox .rubberband,
treeview.view flowbox .content-view rubberband,
treeview.view flowbox .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view treeview.view flowbox .content-view .rubberband,
treeview.view .content-view flowbox rubberband,
treeview.view .content-view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view treeview.view .content-view flowbox .rubberband,
.content-view treeview.view flowbox rubberband,
.content-view treeview.view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view treeview.view flowbox .rubberband,
treeview.view flowbox .content-view rubberband,
treeview.view flowbox .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view treeview.view flowbox .content-view .rubberband,
treeview.view .content-view flowbox treeview.view rubberband,
treeview.view
  .content-view
  flowbox
  treeview.view
  XfdesktopIconView.view
  .rubberband,
XfdesktopIconView.view
  treeview.view
  .content-view
  flowbox
  treeview.view
  .rubberband,
.content-view treeview.view flowbox treeview.view rubberband,
.content-view
  treeview.view
  flowbox
  treeview.view
  XfdesktopIconView.view
  .rubberband,
XfdesktopIconView.view
  .content-view
  treeview.view
  flowbox
  treeview.view
  .rubberband,
treeview.view flowbox treeview.view .content-view rubberband,
treeview.view
  flowbox
  treeview.view
  .content-view
  XfdesktopIconView.view
  .rubberband,
XfdesktopIconView.view
  treeview.view
  flowbox
  treeview.view
  .content-view
  .rubberband,
.content-view treeview.view flowbox treeview.view rubberband,
.content-view
  treeview.view
  flowbox
  treeview.view
  XfdesktopIconView.view
  .rubberband,
XfdesktopIconView.view
  .content-view
  treeview.view
  flowbox
  treeview.view
  .rubberband,
treeview.view flowbox treeview.view .content-view rubberband,
treeview.view
  flowbox
  treeview.view
  .content-view
  XfdesktopIconView.view
  .rubberband,
XfdesktopIconView.view
  treeview.view
  flowbox
  treeview.view
  .content-view
  .rubberband,
.content-view flowbox treeview.view flowbox rubberband,
.content-view flowbox treeview.view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view flowbox treeview.view flowbox .rubberband,
flowbox treeview.view flowbox .content-view rubberband,
flowbox treeview.view flowbox .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox treeview.view flowbox .content-view .rubberband,
treeview.view flowbox .content-view .rubberband,
.content-view treeview.view flowbox .rubberband,
treeview.view flowbox rubberband,
treeview.view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view treeview.view flowbox .rubberband,
treeview.view flowbox .content-view rubberband,
treeview.view flowbox .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view treeview.view flowbox .content-view .rubberband,
.content-view treeview.view flowbox rubberband,
.content-view treeview.view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view treeview.view flowbox .rubberband,
.content-view treeview.view flowbox rubberband,
.content-view treeview.view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view treeview.view flowbox .rubberband,
treeview.view flowbox .content-view rubberband,
treeview.view flowbox .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view treeview.view flowbox .content-view .rubberband,
treeview.view .content-view flowbox rubberband,
treeview.view .content-view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view treeview.view .content-view flowbox .rubberband,
.content-view treeview.view flowbox rubberband,
.content-view treeview.view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view treeview.view flowbox .rubberband,
treeview.view flowbox .content-view rubberband,
treeview.view flowbox .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view treeview.view flowbox .content-view .rubberband,
treeview.view .content-view flowbox treeview.view rubberband,
treeview.view
  .content-view
  flowbox
  treeview.view
  XfdesktopIconView.view
  .rubberband,
XfdesktopIconView.view
  treeview.view
  .content-view
  flowbox
  treeview.view
  .rubberband,
.content-view treeview.view flowbox treeview.view rubberband,
.content-view
  treeview.view
  flowbox
  treeview.view
  XfdesktopIconView.view
  .rubberband,
XfdesktopIconView.view
  .content-view
  treeview.view
  flowbox
  treeview.view
  .rubberband,
treeview.view flowbox treeview.view .content-view rubberband,
treeview.view
  flowbox
  treeview.view
  .content-view
  XfdesktopIconView.view
  .rubberband,
XfdesktopIconView.view
  treeview.view
  flowbox
  treeview.view
  .content-view
  .rubberband,
.content-view treeview.view flowbox treeview.view rubberband,
.content-view
  treeview.view
  flowbox
  treeview.view
  XfdesktopIconView.view
  .rubberband,
XfdesktopIconView.view
  .content-view
  treeview.view
  flowbox
  treeview.view
  .rubberband,
treeview.view flowbox treeview.view .content-view rubberband,
treeview.view
  flowbox
  treeview.view
  .content-view
  XfdesktopIconView.view
  .rubberband,
XfdesktopIconView.view
  treeview.view
  flowbox
  treeview.view
  .content-view
  .rubberband,
.content-view flowbox treeview.view flowbox rubberband,
.content-view flowbox treeview.view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view flowbox treeview.view flowbox .rubberband,
flowbox treeview.view flowbox .content-view rubberband,
flowbox treeview.view flowbox .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox treeview.view flowbox .content-view .rubberband,
treeview.view flowbox .content-view .rubberband,
.content-view treeview.view flowbox .rubberband,
flowbox treeview.view rubberband,
flowbox treeview.view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox treeview.view .rubberband,
flowbox treeview.view .content-view rubberband,
flowbox treeview.view .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox treeview.view .content-view .rubberband,
.content-view flowbox treeview.view rubberband,
.content-view flowbox treeview.view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view flowbox treeview.view .rubberband,
flowbox .content-view treeview.view rubberband,
flowbox .content-view treeview.view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox .content-view treeview.view .rubberband,
.content-view flowbox treeview.view rubberband,
.content-view flowbox treeview.view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view flowbox treeview.view .rubberband,
flowbox treeview.view .content-view rubberband,
flowbox treeview.view .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox treeview.view .content-view .rubberband,
flowbox .content-view treeview.view flowbox rubberband,
flowbox .content-view treeview.view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox .content-view treeview.view flowbox .rubberband,
.content-view flowbox treeview.view flowbox rubberband,
.content-view flowbox treeview.view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view flowbox treeview.view flowbox .rubberband,
flowbox treeview.view flowbox .content-view rubberband,
flowbox treeview.view flowbox .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox treeview.view flowbox .content-view .rubberband,
.content-view flowbox treeview.view rubberband,
.content-view flowbox treeview.view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view flowbox treeview.view .rubberband,
flowbox treeview.view .content-view rubberband,
flowbox treeview.view .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox treeview.view .content-view .rubberband,
.content-view treeview.view flowbox treeview.view rubberband,
.content-view
  treeview.view
  flowbox
  treeview.view
  XfdesktopIconView.view
  .rubberband,
XfdesktopIconView.view
  .content-view
  treeview.view
  flowbox
  treeview.view
  .rubberband,
treeview.view flowbox treeview.view .content-view rubberband,
treeview.view
  flowbox
  treeview.view
  .content-view
  XfdesktopIconView.view
  .rubberband,
XfdesktopIconView.view
  treeview.view
  flowbox
  treeview.view
  .content-view
  .rubberband,
.content-view flowbox treeview.view flowbox rubberband,
.content-view flowbox treeview.view flowbox XfdesktopIconView.view .rubberband,
XfdesktopIconView.view .content-view flowbox treeview.view flowbox .rubberband,
flowbox treeview.view flowbox .content-view rubberband,
flowbox treeview.view flowbox .content-view XfdesktopIconView.view .rubberband,
XfdesktopIconView.view flowbox treeview.view flowbox .content-view .rubberband,
flowbox treeview.view .content-view .rubberband,
.content-view flowbox treeview.view .rubberband {
  border: 1px solid #${config.colorScheme.palette.base0F};
  background-color: rgba(238, 190, 190, 0.3);
}

flowbox flowboxchild {
  padding: 4px;
  border-radius: 6px;
}

.content-view .tile:selected {
  background-color: transparent;
}

label {
  caret-color: currentColor;
}

label.separator {
  color: rgba(242, 213, 207, 0.7);
}

label:disabled {
  color: rgba(242, 213, 207, 0.5);
}

headerbar label:disabled,
tab label:disabled,
button label:disabled {
  color: inherit;
}

label.osd {
  border-radius: 6px;
  background-color: rgba(48, 52, 70, 0.9);
  color: #${config.colorScheme.palette.base06};
}

.dim-label {
  color: rgba(242, 213, 207, 0.7);
}

assistant .sidebar {
  padding: 4px 0;
}

assistant .sidebar label {
  min-height: 36px;
  padding: 0 12px;
  color: rgba(242, 213, 207, 0.5);
  font-weight: 500;
}

assistant .sidebar label.highlight {
  color: #${config.colorScheme.palette.base06};
}

/*********************
 * Spinner Animation *
 *********************/
@keyframes spin {
  to {
    -gtk-icon-transform: rotate(1turn);
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

/****************
 * Text Entries *
 ****************/
spinbutton.vertical,
spinbutton:not(.vertical),
entry {
  min-height: 36px;
  padding: 0 8px;
  border-radius: 6px;
  caret-color: currentColor;
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1),
    box-shadow 300ms cubic-bezier(0, 0, 0.2, 1);
  box-shadow: inset 0 0 0 2px transparent;
  background-color: rgba(242, 213, 207, 0.08);
  color: #${config.colorScheme.palette.base06};
}

spinbutton.vertical:focus,
spinbutton:focus:not(.vertical),
entry:focus {
  background-color: rgba(242, 213, 207, 0.08);
  box-shadow: inset 0 0 0 2px #${config.colorScheme.palette.base0F};
}

spinbutton.vertical:drop(active),
spinbutton:drop(active):not(.vertical),
entry:drop(active) {
  background-color: alpha(currentColor, 0.08);
  box-shadow: inset 0 0 0 2px alpha(currentColor, 0.08);
}

spinbutton.vertical:disabled,
spinbutton:disabled:not(.vertical),
entry:disabled {
  box-shadow: inset 0 0 0 2px transparent;
  background-color: rgba(242, 213, 207, 0.08);
  color: rgba(242, 213, 207, 0.5);
}

spinbutton.flat.vertical,
spinbutton.flat:not(.vertical),
entry.flat {
  min-height: 0;
  padding: 2px;
  border-radius: 0;
  background-color: transparent;
}

spinbutton.vertical image,
spinbutton:not(.vertical) image,
entry image {
  color: rgba(242, 213, 207, 0.7);
}

spinbutton.vertical image:hover,
spinbutton:not(.vertical) image:hover,
spinbutton.vertical image:active,
spinbutton:not(.vertical) image:active,
entry image:hover,
entry image:active {
  color: #${config.colorScheme.palette.base06};
}

spinbutton.vertical image:disabled,
spinbutton:not(.vertical) image:disabled,
entry image:disabled {
  color: rgba(242, 213, 207, 0.5);
}

spinbutton.vertical image.left,
spinbutton:not(.vertical) image.left,
entry image.left {
  margin-left: 2px;
  margin-right: 6px;
}

spinbutton.vertical image.right,
spinbutton:not(.vertical) image.right,
entry image.right {
  margin-left: 6px;
  margin-right: 2px;
}

spinbutton.vertical undershoot.left,
spinbutton:not(.vertical) undershoot.left,
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

spinbutton.vertical undershoot.right,
spinbutton:not(.vertical) undershoot.right,
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

spinbutton.error.vertical,
spinbutton.error:not(.vertical),
entry.error {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1),
    box-shadow 300ms cubic-bezier(0, 0, 0.2, 1);
  box-shadow: inset 0 0 0 2px transparent;
  background-color: rgba(242, 213, 207, 0.08);
  color: #${config.colorScheme.palette.base06};
}

spinbutton.error.vertical:focus,
spinbutton.error:focus:not(.vertical),
entry.error:focus {
  background-color: rgba(242, 213, 207, 0.08);
  box-shadow: inset 0 0 0 2px #${config.colorScheme.palette.base08};
}

spinbutton.error.vertical:disabled,
spinbutton.error:disabled:not(.vertical),
entry.error:disabled {
  box-shadow: inset 0 0 0 2px transparent;
  background-color: rgba(242, 213, 207, 0.08);
  color: rgba(242, 213, 207, 0.5);
}

spinbutton.warning.vertical,
spinbutton.warning:not(.vertical),
entry.warning {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1),
    box-shadow 300ms cubic-bezier(0, 0, 0.2, 1);
  box-shadow: inset 0 0 0 2px transparent;
  background-color: rgba(242, 213, 207, 0.08);
  color: #${config.colorScheme.palette.base06};
}

spinbutton.warning.vertical:focus,
spinbutton.warning:focus:not(.vertical),
entry.warning:focus {
  background-color: rgba(242, 213, 207, 0.08);
  box-shadow: inset 0 0 0 2px #${config.colorScheme.palette.base0A};
}

spinbutton.warning.vertical:disabled,
spinbutton.warning:disabled:not(.vertical),
entry.warning:disabled {
  box-shadow: inset 0 0 0 2px transparent;
  background-color: rgba(242, 213, 207, 0.08);
  color: rgba(242, 213, 207, 0.5);
}

spinbutton.vertical progress,
spinbutton:not(.vertical) progress,
entry progress {
  margin: 2px -8px;
  border-bottom: 2px solid #${config.colorScheme.palette.base0F};
  background-color: transparent;
}

.gedit-search-slider .linked:not(.vertical) > entry {
  border-radius: 6px;
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1),
    box-shadow 300ms cubic-bezier(0, 0, 0.2, 1);
  border-image: none;
  box-shadow: inset 0 0 0 2px transparent;
  background-color: #${config.colorScheme.palette.base02};
  color: #${config.colorScheme.palette.base06};
}

.gedit-search-slider .linked:not(.vertical) > entry:focus {
  border-image: none;
  box-shadow: inset 0 0 0 2px #${config.colorScheme.palette.base0F};
}

.gedit-search-slider .linked:not(.vertical) > entry:drop(active) {
  box-shadow: inset 0 0 0 2px alpha(currentColor, 0.08);
}

.gedit-search-slider .linked:not(.vertical) > entry:disabled {
  box-shadow: inset 0 0 0 2px transparent;
  background-color: #${config.colorScheme.palette.base01};
  color: rgba(242, 213, 207, 0.5);
}

.gedit-search-slider .linked:not(.vertical) > entry.error {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1),
    box-shadow 300ms cubic-bezier(0, 0, 0.2, 1);
  border-image: none;
  box-shadow: inset 0 0 0 2px transparent;
  background-color: #${config.colorScheme.palette.base08};
  color: rgba(0, 0, 0, 0.87);
}

.gedit-search-slider .linked:not(.vertical) > entry.error:focus {
  border-image: none;
  box-shadow: inset 0 0 0 2px #${config.colorScheme.palette.base08};
}

.gedit-search-slider .linked:not(.vertical) > entry.error:disabled {
  box-shadow: inset 0 0 0 2px transparent;
  background-color: #${config.colorScheme.palette.base01};
  color: rgba(242, 213, 207, 0.5);
}

.gedit-search-slider .linked:not(.vertical) > entry.error image {
  color: rgba(0, 0, 0, 0.6);
}

.gedit-search-slider .linked:not(.vertical) > entry.error image:hover,
.gedit-search-slider .linked:not(.vertical) > entry.error image:active {
  color: rgba(0, 0, 0, 0.87);
}

.gedit-search-slider .linked:not(.vertical) > entry.error image:disabled {
  color: rgba(0, 0, 0, 0.38);
}

.gedit-search-slider .linked:not(.vertical) > entry.warning {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1),
    box-shadow 300ms cubic-bezier(0, 0, 0.2, 1);
  border-image: none;
  box-shadow: inset 0 0 0 2px transparent;
  background-color: #${config.colorScheme.palette.base0A};
  color: rgba(0, 0, 0, 0.87);
}

.gedit-search-slider .linked:not(.vertical) > entry.warning:focus {
  border-image: none;
  box-shadow: inset 0 0 0 2px #${config.colorScheme.palette.base0A};
}

.gedit-search-slider .linked:not(.vertical) > entry.warning:disabled {
  box-shadow: inset 0 0 0 2px transparent;
  background-color: #${config.colorScheme.palette.base01};
  color: rgba(242, 213, 207, 0.5);
}

.gedit-search-slider .linked:not(.vertical) > entry.warning image {
  color: rgba(0, 0, 0, 0.6);
}

.gedit-search-slider .linked:not(.vertical) > entry.warning image:hover,
.gedit-search-slider .linked:not(.vertical) > entry.warning image:active {
  color: rgba(0, 0, 0, 0.87);
}

.gedit-search-slider .linked:not(.vertical) > entry.warning image:disabled {
  color: rgba(0, 0, 0, 0.38);
}

treeview entry.flat,
treeview entry {
  background-color: #${config.colorScheme.palette.base00};
}

treeview entry.flat,
treeview entry.flat:focus,
treeview entry,
treeview entry:focus {
  border-image: none;
  box-shadow: none;
}

.entry-tag,
.photos-entry-tag,
.documents-entry-tag {
  margin: 2px;
  border-radius: 9999px;
  box-shadow: none;
  background-color: rgba(242, 213, 207, 0.12);
  color: #${config.colorScheme.palette.base06};
}

.entry-tag:hover,
.photos-entry-tag:hover,
.documents-entry-tag:hover {
  background-image: image(alpha(currentColor, 0.08));
}

:dir(ltr) .entry-tag,
:dir(ltr) .photos-entry-tag,
:dir(ltr) .documents-entry-tag {
  margin-left: 4px;
  margin-right: 0;
  padding-left: 12px;
  padding-right: 8px;
}

:dir(rtl) .entry-tag,
:dir(rtl) .photos-entry-tag,
:dir(rtl) .documents-entry-tag {
  margin-left: 0;
  margin-right: 4px;
  padding-left: 8px;
  padding-right: 12px;
}

.entry-tag.button,
.button.photos-entry-tag,
.button.documents-entry-tag {
  box-shadow: none;
  background-color: transparent;
}

.entry-tag.button:not(:hover):not(:active),
.button.photos-entry-tag:not(:hover):not(:active),
.button.documents-entry-tag:not(:hover):not(:active) {
  color: rgba(242, 213, 207, 0.7);
}

/***********
 * Buttons *
 ***********/
@keyframes needs-attention {
  from {
    background-image: -gtk-gradient(
      radial,
      center center,
      0,
      center center,
      0.001,
      to(#${config.colorScheme.palette.base0F}),
      to(transparent)
    );
  }
  to {
    background-image: -gtk-gradient(
      radial,
      center center,
      0,
      center center,
      0.5,
      to(#${config.colorScheme.palette.base0F}),
      to(transparent)
    );
  }
}

.xfce4-panel.background button,
.raven-mpris button.image-button,
.mate-panel-menu-bar button,
infobar.warning > revealer > box button,
infobar.warning:backdrop > revealer > box button {
  color: rgba(242, 213, 207, 0.7);
}

.xfce4-panel.background button:focus,
.raven-mpris button.image-button:focus,
.mate-panel-menu-bar button:focus,
infobar.warning > revealer > box button:focus,
.xfce4-panel.background button:hover,
.raven-mpris button.image-button:hover,
.mate-panel-menu-bar button:hover,
infobar.warning > revealer > box button:hover,
.xfce4-panel.background button:active,
.raven-mpris button.image-button:active,
.mate-panel-menu-bar button:active,
infobar.warning > revealer > box button:active,
.xfce4-panel.background button:checked,
.raven-mpris button.image-button:checked,
.mate-panel-menu-bar button:checked,
infobar.warning > revealer > box button:checked {
  color: #${config.colorScheme.palette.base06};
}

.xfce4-panel.background button:disabled,
.raven-mpris button.image-button:disabled,
.mate-panel-menu-bar button:disabled,
infobar.warning > revealer > box button:disabled {
  color: rgba(242, 213, 207, 0.3);
}

.xfce4-panel.background button:checked:disabled,
.raven-mpris button.image-button:checked:disabled,
.mate-panel-menu-bar button:checked:disabled,
infobar.warning > revealer > box button:checked:disabled {
  color: rgba(242, 213, 207, 0.5);
}

actionbar
  > revealer
  > box
  .linked
  > button:not(.suggested-action):not(.destructive-action),
button {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1),
    background-size 300ms cubic-bezier(0, 0, 0.2, 1),
    background-image 1200ms cubic-bezier(0, 0, 0.2, 1);
  outline: none;
  box-shadow: inset 0 0 0 9999px transparent;
  background-color: rgba(242, 213, 207, 0.08);
  background-image: radial-gradient(circle, transparent 10%, transparent 0%);
  background-repeat: no-repeat;
  background-position: center;
  background-size: 1000% 1000%;
  color: #${config.colorScheme.palette.base06};
}

actionbar
  > revealer
  > box
  .linked
  > button:focus:not(.suggested-action):not(.destructive-action),
button:focus {
  box-shadow: inset 0 0 0 2px alpha(currentColor, 0.08);
}

actionbar
  > revealer
  > box
  .linked
  > button:hover:not(.suggested-action):not(.destructive-action),
button:hover {
  box-shadow: inset 0 0 0 9999px alpha(currentColor, 0.08);
}

actionbar
  > revealer
  > box
  .linked
  > button:active:not(.suggested-action):not(.destructive-action),
button:active {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1), background-size 0ms,
    background-image 0ms, border 0ms;
  animation: ripple 225ms cubic-bezier(0, 0, 0.2, 1) forwards;
  box-shadow: inset 0 0 0 9999px alpha(currentColor, 0.08);
  background-image: radial-gradient(
    circle,
    alpha(currentColor, 0.12) 10%,
    transparent 0%
  );
  background-size: 0% 0%;
}

actionbar
  > revealer
  > box
  .linked
  > button:disabled:not(.suggested-action):not(.destructive-action),
button:disabled {
  box-shadow: none;
  background-color: rgba(242, 213, 207, 0.04);
  color: rgba(242, 213, 207, 0.5);
}

actionbar
  > revealer
  > box
  .linked
  > button:checked:not(.suggested-action):not(.destructive-action),
button:checked {
  box-shadow: none;
  background-color: #${config.colorScheme.palette.base0F};
  color: rgba(0, 0, 0, 0.87);
}

actionbar
  > revealer
  > box
  .linked
  > button:checked:hover:not(.suggested-action):not(.destructive-action),
button:checked:hover {
  box-shadow: inset 0 0 0 9999px transparent;
}

actionbar
  > revealer
  > box
  .linked
  > button:checked:disabled:not(.suggested-action):not(.destructive-action),
button:checked:disabled {
  box-shadow: inset 0 0 0 9999px alpha(currentColor, 0.1);
  background-color: rgba(242, 213, 207, 0.04);
  color: rgba(242, 213, 207, 0.5);
}

.raven .expander-button,
window.background
  > box.vertical
  > toolbar.primary-toolbar
  > toolitem
  > box.horizontal:not(.linked)
  > button.toggle,
window.background
  > box.vertical
  > toolbar.primary-toolbar
  > toolitem
  > .linked
  > button:not(.toggle):not(.raised):not(.flat),
window.background
  > box.vertical
  > toolbar.primary-toolbar
  > toolitem
  button.flat.scale,
window.background
  > box.vertical
  > toolbar.primary-toolbar
  > toolitem
  > .linked
  > button.image-button.raised,
window.csd
  > box.vertical
  > box.vertical
  > toolbar.horizontal
  > toolitem
  > .linked
  > button,
window.csd
  > box.vertical
  > box.vertical
  > toolbar.horizontal
  > toolitem
  > box.horizontal
  > button,
window.solid-csd
  > box.vertical
  > box.vertical
  > toolbar.horizontal
  > toolitem
  > .linked
  > button,
window.solid-csd
  > box.vertical
  > box.vertical
  > toolbar.horizontal
  > toolitem
  > box.horizontal
  > button,
.nautilus-window headerbar revealer > button,
button.titlebutton:not(.suggested-action):not(.destructive-action),
filechooser #pathbarbox > stack > box > button,
check,
radio,
button.close,
button.circular,
.inline-toolbar button:not(.text-button),
button.image-button {
  border-radius: 9999px;
}

.raven .expander-button label,
window.background
  > box.vertical
  > toolbar.primary-toolbar
  > toolitem
  > box.horizontal:not(.linked)
  > button.toggle
  label,
window.background
  > box.vertical
  > toolbar.primary-toolbar
  > toolitem
  > .linked
  > button:not(.toggle):not(.raised):not(.flat)
  label,
window.background
  > box.vertical
  > toolbar.primary-toolbar
  > toolitem
  button.flat.scale
  label,
window.background
  > box.vertical
  > toolbar.primary-toolbar
  > toolitem
  > .linked
  > button.image-button.raised
  label,
window.csd
  > box.vertical
  > box.vertical
  > toolbar.horizontal
  > toolitem
  > .linked
  > button
  label,
window.csd
  > box.vertical
  > box.vertical
  > toolbar.horizontal
  > toolitem
  > box.horizontal
  > button
  label,
window.solid-csd
  > box.vertical
  > box.vertical
  > toolbar.horizontal
  > toolitem
  > .linked
  > button
  label,
window.solid-csd
  > box.vertical
  > box.vertical
  > toolbar.horizontal
  > toolitem
  > box.horizontal
  > button
  label,
.nautilus-window headerbar revealer > button label,
button.titlebutton:not(.suggested-action):not(.destructive-action) label,
filechooser #pathbarbox > stack > box > button label,
check label,
radio label,
button.close label,
button.circular label,
.inline-toolbar button:not(.text-button) label,
button.image-button label {
  padding: 0;
}

.pluma-window paned.horizontal box.vertical box.horizontal button.flat,
.gedit-search-slider .linked > button,
.gedit-document-panel row button.flat,
.nautilus-window .floating-bar button,
placessidebar.sidebar row button.sidebar-button,
notebook > header tab button.flat,
spinbutton.vertical button,
spinbutton:not(.vertical) button {
  min-height: 24px;
  min-width: 24px;
  padding: 0;
  border-radius: 9999px;
}

button {
  min-height: 24px;
  min-width: 16px;
  padding: 6px 10px;
  border-radius: 6px;
  font-weight: 500;
}

button:drop(active) {
  box-shadow: inset 0 0 0 9999px alpha(currentColor, 0.08);
}

.budgie-session-dialog .linked.horizontal > button,
.budgie-polkit-dialog .linked.horizontal > button,
.budgie-run-dialog .linked.horizontal > button,
.drop-shadow button,
.budgie-panel button,
.budgie-popover row button,
.budgie-settings-window buttonbox.inline-toolbar button,
#mate-menu button,
#MatePanelPopupWindow button,
popover.messagepopover .popover-action-area button,
tabbox > tab button,
.gedit-search-slider .linked > button,
placessidebar.sidebar row button.sidebar-button,
calendar.button,
.budgie-popover.budgie-menu
  button.flat:not(.image-button):not(.indicator-item)
  button.circular,
.budgie-popover
  scrolledwindow.sidebar:not(.categories)
  list
  > row.activatable
  button.circular,
treeview.view header button button.circular,
row.activatable button.circular,
check,
radio,
scrollbar button,
notebook > header > tabs > arrow,
spinbutton.vertical button,
spinbutton:not(.vertical) button,
modelbutton.flat,
.menuitem.button.flat,
.nemo-window .toolbar button,
#buttonbox_frame button,
.xfce4-panel.background button,
.raven stackswitcher.linked > button,
.lock-dialog button,
.mate-panel-menu-bar button,
window.background.csd.geary-main-window
  stack#conversation_viewer
  .geary-expanded
  > .geary-composer-embed
  headerbar
  button,
window#GearyMainWindow.background.csd
  stack#conversation_viewer
  .geary-expanded
  > .geary-composer-embed
  headerbar
  button,
layouttabbar button,
filechooser #pathbarbox > stack > box > button,
messagedialog.csd .dialog-action-box button,
.app-notification button,
actionbar
  > revealer
  > box
  button:not(.suggested-action):not(.destructive-action),
popover.background.menu button,
popover.background button.model,
.caja-pathbar button,
.path-bar.linked:not(.vertical) > button,
.nemo-window .primary-toolbar button:not(.text-button),
headerbar button:not(.suggested-action):not(.destructive-action),
toolbar button,
combobox > .linked:not(.vertical) > button:not(:only-child),
button.flat {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1),
    border-image 225ms cubic-bezier(0, 0, 0.2, 1),
    background-size 300ms cubic-bezier(0, 0, 0.2, 1),
    background-image 1200ms cubic-bezier(0, 0, 0.2, 1);
  outline: none;
  box-shadow: inset 0 0 0 9999px transparent;
  background-color: transparent;
  background-image: radial-gradient(circle, transparent 10%, transparent 0%);
  background-repeat: no-repeat;
  background-position: center;
  background-size: 1000% 1000%;
  color: rgba(242, 213, 207, 0.7);
}

.budgie-session-dialog .linked.horizontal > button:focus,
.budgie-polkit-dialog .linked.horizontal > button:focus,
.budgie-run-dialog .linked.horizontal > button:focus,
.drop-shadow button:focus,
.budgie-panel button:focus,
.budgie-popover row button:focus,
.budgie-settings-window buttonbox.inline-toolbar button:focus,
#mate-menu button:focus,
#MatePanelPopupWindow button:focus,
popover.messagepopover .popover-action-area button:focus,
tabbox > tab button:focus,
.gedit-search-slider .linked > button:focus,
placessidebar.sidebar row button.sidebar-button:focus,
calendar.button:focus,
.budgie-popover.budgie-menu
  button.flat:not(.image-button):not(.indicator-item)
  button.circular:focus,
.budgie-popover
  scrolledwindow.sidebar:not(.categories)
  list
  > row.activatable
  button.circular:focus,
treeview.view header button button.circular:focus,
row.activatable button.circular:focus,
check:focus,
radio:focus,
scrollbar button:focus,
notebook > header > tabs > arrow:focus,
spinbutton.vertical button:focus,
spinbutton:not(.vertical) button:focus,
modelbutton.flat:focus,
.menuitem.button.flat:focus,
.nemo-window .toolbar button:focus,
#buttonbox_frame button:focus,
.xfce4-panel.background button:focus,
.raven stackswitcher.linked > button:focus,
.lock-dialog button:focus,
.mate-panel-menu-bar button:focus,
window.background.csd.geary-main-window
  stack#conversation_viewer
  .geary-expanded
  > .geary-composer-embed
  headerbar
  button:focus,
window#GearyMainWindow.background.csd
  stack#conversation_viewer
  .geary-expanded
  > .geary-composer-embed
  headerbar
  button:focus,
layouttabbar button:focus,
filechooser #pathbarbox > stack > box > button:focus,
messagedialog.csd .dialog-action-box button:focus,
.app-notification button:focus,
actionbar
  > revealer
  > box
  button:focus:not(.suggested-action):not(.destructive-action),
popover.background.menu button:focus,
popover.background button.model:focus,
.caja-pathbar button:focus,
.path-bar.linked:not(.vertical) > button:focus,
.nemo-window .primary-toolbar button:focus:not(.text-button),
headerbar button:focus:not(.suggested-action):not(.destructive-action),
toolbar button:focus,
combobox > .linked:not(.vertical) > button:focus:not(:only-child),
button.flat:focus {
  box-shadow: inset 0 0 0 2px alpha(currentColor, 0.08);
  color: #${config.colorScheme.palette.base06};
}

.budgie-session-dialog .linked.horizontal > button:hover,
.budgie-polkit-dialog .linked.horizontal > button:hover,
.budgie-run-dialog .linked.horizontal > button:hover,
.drop-shadow button:hover,
.budgie-panel button:hover,
.budgie-popover row button:hover,
.budgie-settings-window buttonbox.inline-toolbar button:hover,
#mate-menu button:hover,
#MatePanelPopupWindow button:hover,
popover.messagepopover .popover-action-area button:hover,
tabbox > tab button:hover,
.gedit-search-slider .linked > button:hover,
placessidebar.sidebar row button.sidebar-button:hover,
calendar.button:hover,
.budgie-popover.budgie-menu
  button.flat:not(.image-button):not(.indicator-item)
  button.circular:hover,
.budgie-popover
  scrolledwindow.sidebar:not(.categories)
  list
  > row.activatable
  button.circular:hover,
treeview.view header button button.circular:hover,
row.activatable button.circular:hover,
check:hover,
radio:hover,
scrollbar button:hover,
notebook > header > tabs > arrow:hover,
spinbutton.vertical button:hover,
spinbutton:not(.vertical) button:hover,
modelbutton.flat:hover,
.menuitem.button.flat:hover,
.nemo-window .toolbar button:hover,
#buttonbox_frame button:hover,
.xfce4-panel.background button:hover,
.raven stackswitcher.linked > button:hover,
.lock-dialog button:hover,
.mate-panel-menu-bar button:hover,
window.background.csd.geary-main-window
  stack#conversation_viewer
  .geary-expanded
  > .geary-composer-embed
  headerbar
  button:hover,
window#GearyMainWindow.background.csd
  stack#conversation_viewer
  .geary-expanded
  > .geary-composer-embed
  headerbar
  button:hover,
layouttabbar button:hover,
filechooser #pathbarbox > stack > box > button:hover,
messagedialog.csd .dialog-action-box button:hover,
.app-notification button:hover,
actionbar
  > revealer
  > box
  button:hover:not(.suggested-action):not(.destructive-action),
popover.background.menu button:hover,
popover.background button.model:hover,
.caja-pathbar button:hover,
.path-bar.linked:not(.vertical) > button:hover,
.nemo-window .primary-toolbar button:hover:not(.text-button),
headerbar button:hover:not(.suggested-action):not(.destructive-action),
toolbar button:hover,
combobox > .linked:not(.vertical) > button:hover:not(:only-child),
button.flat:hover {
  box-shadow: inset 0 0 0 9999px alpha(currentColor, 0.08);
  color: #${config.colorScheme.palette.base06};
}

.budgie-session-dialog .linked.horizontal > button:active,
.budgie-polkit-dialog .linked.horizontal > button:active,
.budgie-run-dialog .linked.horizontal > button:active,
.drop-shadow button:active,
.budgie-panel button:active,
.budgie-popover row button:active,
.budgie-settings-window buttonbox.inline-toolbar button:active,
#mate-menu button:active,
#MatePanelPopupWindow button:active,
popover.messagepopover .popover-action-area button:active,
tabbox > tab button:active,
.gedit-search-slider .linked > button:active,
placessidebar.sidebar row button.sidebar-button:active,
calendar.button:active,
.budgie-popover.budgie-menu
  button.flat:not(.image-button):not(.indicator-item)
  button.circular:active,
.budgie-popover
  scrolledwindow.sidebar:not(.categories)
  list
  > row.activatable
  button.circular:active,
treeview.view header button button.circular:active,
row.activatable button.circular:active,
check:active,
radio:active,
scrollbar button:active,
notebook > header > tabs > arrow:active,
spinbutton.vertical button:active,
spinbutton:not(.vertical) button:active,
modelbutton.flat:active,
.menuitem.button.flat:active,
.nemo-window .toolbar button:active,
#buttonbox_frame button:active,
.xfce4-panel.background button:active,
.raven stackswitcher.linked > button:active,
.lock-dialog button:active,
.mate-panel-menu-bar button:active,
window.background.csd.geary-main-window
  stack#conversation_viewer
  .geary-expanded
  > .geary-composer-embed
  headerbar
  button:active,
window#GearyMainWindow.background.csd
  stack#conversation_viewer
  .geary-expanded
  > .geary-composer-embed
  headerbar
  button:active,
layouttabbar button:active,
filechooser #pathbarbox > stack > box > button:active,
messagedialog.csd .dialog-action-box button:active,
.app-notification button:active,
actionbar
  > revealer
  > box
  button:active:not(.suggested-action):not(.destructive-action),
popover.background.menu button:active,
popover.background button.model:active,
.caja-pathbar button:active,
.path-bar.linked:not(.vertical) > button:active,
.nemo-window .primary-toolbar button:active:not(.text-button),
headerbar button:active:not(.suggested-action):not(.destructive-action),
toolbar button:active,
combobox > .linked:not(.vertical) > button:active:not(:only-child),
button.flat:active {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1),
    border-image 225ms cubic-bezier(0, 0, 0.2, 1), background-size 0ms,
    background-image 0ms;
  animation: ripple 225ms cubic-bezier(0, 0, 0.2, 1) forwards;
  box-shadow: inset 0 0 0 9999px alpha(currentColor, 0.08);
  background-image: radial-gradient(
    circle,
    alpha(currentColor, 0.12) 10%,
    transparent 0%
  );
  background-size: 0% 0%;
  color: #${config.colorScheme.palette.base06};
}

.budgie-session-dialog .linked.horizontal > button:disabled,
.budgie-polkit-dialog .linked.horizontal > button:disabled,
.budgie-run-dialog .linked.horizontal > button:disabled,
.drop-shadow button:disabled,
.budgie-panel button:disabled,
.budgie-popover row button:disabled,
.budgie-settings-window buttonbox.inline-toolbar button:disabled,
#mate-menu button:disabled,
#MatePanelPopupWindow button:disabled,
popover.messagepopover .popover-action-area button:disabled,
tabbox > tab button:disabled,
.gedit-search-slider .linked > button:disabled,
placessidebar.sidebar row button.sidebar-button:disabled,
calendar.button:disabled,
.budgie-popover.budgie-menu
  button.flat:not(.image-button):not(.indicator-item)
  button.circular:disabled,
.budgie-popover
  scrolledwindow.sidebar:not(.categories)
  list
  > row.activatable
  button.circular:disabled,
treeview.view header button button.circular:disabled,
row.activatable button.circular:disabled,
check:disabled,
radio:disabled,
scrollbar button:disabled,
notebook > header > tabs > arrow:disabled,
spinbutton.vertical button:disabled,
spinbutton:not(.vertical) button:disabled,
modelbutton.flat:disabled,
.menuitem.button.flat:disabled,
.nemo-window .toolbar button:disabled,
#buttonbox_frame button:disabled,
.xfce4-panel.background button:disabled,
.raven stackswitcher.linked > button:disabled,
.lock-dialog button:disabled,
.mate-panel-menu-bar button:disabled,
window.background.csd.geary-main-window
  stack#conversation_viewer
  .geary-expanded
  > .geary-composer-embed
  headerbar
  button:disabled,
window#GearyMainWindow.background.csd
  stack#conversation_viewer
  .geary-expanded
  > .geary-composer-embed
  headerbar
  button:disabled,
layouttabbar button:disabled,
filechooser #pathbarbox > stack > box > button:disabled,
messagedialog.csd .dialog-action-box button:disabled,
.app-notification button:disabled,
actionbar
  > revealer
  > box
  button:disabled:not(.suggested-action):not(.destructive-action),
popover.background.menu button:disabled,
popover.background button.model:disabled,
.caja-pathbar button:disabled,
.path-bar.linked:not(.vertical) > button:disabled,
.nemo-window .primary-toolbar button:disabled:not(.text-button),
headerbar button:disabled:not(.suggested-action):not(.destructive-action),
toolbar button:disabled,
combobox > .linked:not(.vertical) > button:disabled:not(:only-child),
button.flat:disabled {
  box-shadow: none;
  background-color: transparent;
  color: rgba(242, 213, 207, 0.3);
}

.nemo-window .toolbar button:checked,
#buttonbox_frame button:checked,
.xfce4-panel.background button:checked,
.raven stackswitcher.linked > button:checked,
.lock-dialog button:checked,
.mate-panel-menu-bar button:checked,
window.background.csd.geary-main-window
  stack#conversation_viewer
  .geary-expanded
  > .geary-composer-embed
  headerbar
  button:checked,
window#GearyMainWindow.background.csd
  stack#conversation_viewer
  .geary-expanded
  > .geary-composer-embed
  headerbar
  button:checked,
layouttabbar button:checked,
filechooser #pathbarbox > stack > box > button:checked,
messagedialog.csd .dialog-action-box button:checked,
.app-notification button:checked,
actionbar
  > revealer
  > box
  button:checked:not(.suggested-action):not(.destructive-action),
popover.background.menu button:checked,
popover.background button.model:checked,
.caja-pathbar button:checked,
.path-bar.linked:not(.vertical) > button:checked,
.nemo-window .primary-toolbar button:checked:not(.text-button),
headerbar button:checked:not(.suggested-action):not(.destructive-action),
toolbar button:checked,
combobox > .linked:not(.vertical) > button:checked:not(:only-child),
button.flat:checked,
button.flat:checked:hover {
  background-color: alpha(currentColor, 0.1);
  color: #${config.colorScheme.palette.base06};
}

.nemo-window .toolbar button:checked:disabled,
#buttonbox_frame button:checked:disabled,
.xfce4-panel.background button:checked:disabled,
.raven stackswitcher.linked > button:checked:disabled,
.lock-dialog button:checked:disabled,
.mate-panel-menu-bar button:checked:disabled,
window.background.csd.geary-main-window
  stack#conversation_viewer
  .geary-expanded
  > .geary-composer-embed
  headerbar
  button:checked:disabled,
window#GearyMainWindow.background.csd
  stack#conversation_viewer
  .geary-expanded
  > .geary-composer-embed
  headerbar
  button:checked:disabled,
layouttabbar button:checked:disabled,
filechooser #pathbarbox > stack > box > button:checked:disabled,
messagedialog.csd .dialog-action-box button:checked:disabled,
.app-notification button:checked:disabled,
actionbar
  > revealer
  > box
  button:checked:disabled:not(.suggested-action):not(.destructive-action),
popover.background.menu button:checked:disabled,
popover.background button.model:checked:disabled,
.caja-pathbar button:checked:disabled,
.path-bar.linked:not(.vertical) > button:checked:disabled,
.nemo-window .primary-toolbar button:checked:disabled:not(.text-button),
headerbar
  button:checked:disabled:not(.suggested-action):not(.destructive-action),
toolbar button:checked:disabled,
combobox > .linked:not(.vertical) > button:checked:disabled:not(:only-child),
button.flat:checked:disabled {
  background-color: alpha(currentColor, 0.1);
  color: rgba(242, 213, 207, 0.5);
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
}

button.image-button.destructive-action {
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

.linked:not(.vertical)
  > button.flat.image-button:not(:only-child):not(.text-button),
.linked.vertical > button.flat.image-button:not(:only-child):not(.text-button) {
  border-radius: 9999px;
}

.linked:not(.vertical) > button.flat:focus,
.linked.vertical > button.flat:focus {
  box-shadow: inset 0 0 0 9999px alpha(currentColor, 0.08);
}

button.osd {
  min-width: 24px;
  min-width: 24px;
  padding: 12px 16px;
  background-color: #${config.colorScheme.palette.base0F};
  color: rgba(0, 0, 0, 0.87);
}

button.osd:hover {
  background-color: rgba(147, 153, 178, 0.9844);
  color: rgba(0, 0, 0, 0.87);
}

button.osd:active {
  background-color: rgba(147, 153, 178, 0.7844);
  color: rgba(0, 0, 0, 0.87);
}

button.osd.image-button,
button.osd.circular {
  padding: 12px;
}

button.osd.image-button > image,
button.osd.circular > image {
  padding: 0;
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
}

button.suggested-action:hover {
  box-shadow: inset 0 0 0 9999px transparent,
    0 2px 2.4px -1px rgba(238, 190, 190, 0.2),
    0 4px 3px 0 rgba(238, 190, 190, 0.14), 0 1px 6px 0 rgba(238, 190, 190, 0.12);
}

button.suggested-action:checked {
  background-color: rgba(238, 190, 190, 0.5);
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
}

button.destructive-action.flat:checked {
  background-color: rgba(242, 139, 130, 0.3);
}

.stack-switcher > button > label {
  margin: 0 -6px;
  padding: 0 6px;
}

.stack-switcher > button > image {
  margin: -3px -6px;
  padding: 3px 6px;
}

.stack-switcher > button.needs-attention:checked > label,
.stack-switcher > button.needs-attention:checked > image {
  animation: none;
  background-image: none;
}

.primary-toolbar button {
  -gtk-icon-shadow: none;
}

button.close,
button.circular {
  min-width: 24px;
  padding: 6px;
}

stacksidebar.sidebar row.needs-attention > label,
.stack-switcher > button.needs-attention > label,
.stack-switcher > button.needs-attention > image {
  animation: needs-attention 225ms cubic-bezier(0, 0, 0.2, 1) forwards;
  background-repeat: no-repeat;
  background-position: right 3px;
  background-size: 6px 6px;
}

stacksidebar.sidebar row.needs-attention > label:dir(rtl),
.stack-switcher > button.needs-attention > label:dir(rtl),
.stack-switcher > button.needs-attention > image:dir(rtl) {
  background-position: left 3px;
}

modelbutton.flat,
.menuitem.button.flat {
  min-height: 28px;
  padding: 0 8px;
  border-radius: 6px;
  color: #${config.colorScheme.palette.base06};
}

modelbutton.flat arrow.left {
  -gtk-icon-source: -gtk-icontheme('pan-start-symbolic');
}

modelbutton.flat arrow.right {
  -gtk-icon-source: -gtk-icontheme('pan-end-symbolic');
}

button.color {
  min-height: 24px;
  min-width: 24px;
  padding: 6px;
}

/*********
 * Links *
 *********/
*:link {
  color: #85c1dc;
}

*:visited {
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
spinbutton:not(.vertical) {
  padding: 0;
}

spinbutton:not(.vertical) entry {
  min-width: 32px;
  margin: 0;
  border-image: none;
  border-radius: 0;
  box-shadow: none;
  background-color: transparent;
}

spinbutton:not(.vertical) button {
  border: solid 6px transparent;
}

spinbutton:not(.vertical) button:focus:not(:hover):not(:active):not(:disabled) {
  box-shadow: inset 0 0 0 9999px transparent;
  color: rgba(242, 213, 207, 0.7);
}

spinbutton:not(.vertical) button.up:dir(ltr),
spinbutton:not(.vertical) button.down:dir(rtl) {
  margin-left: -3px;
}

spinbutton:not(.vertical) button.up:dir(rtl),
spinbutton:not(.vertical) button.down:dir(ltr) {
  margin-right: -3px;
}

spinbutton.vertical {
  padding: 0;
}

spinbutton.vertical:disabled {
  color: rgba(242, 213, 207, 0.5);
}

spinbutton.vertical entry {
  margin: 0;
  border-image: none;
  border-radius: 0;
  box-shadow: none;
  background-color: transparent;
  min-height: 36px;
  min-width: 42px;
  padding: 0;
}

spinbutton.vertical button {
  padding: 0;
  border: solid 6px transparent;
}

spinbutton.vertical button:focus:not(:hover):not(:active) {
  box-shadow: inset 0 0 0 9999px transparent;
  color: rgba(242, 213, 207, 0.7);
}

spinbutton.vertical button.up {
  margin: 0 3px;
}

spinbutton.vertical button.down {
  margin: 0 3px;
}

treeview spinbutton:not(.vertical) {
  min-height: 0;
  border-style: none;
  border-radius: 0;
}

treeview spinbutton:not(.vertical) entry {
  min-height: 0;
  padding: 1px 2px;
}

/**************
 * ComboBoxes *
 **************/
combobox arrow {
  -gtk-icon-source: -gtk-icontheme('pan-down-symbolic');
  min-height: 16px;
  min-width: 16px;
}

combobox decoration {
  transition: none;
}

combobox button.combo cellview:dir(ltr) {
  margin-left: -2px;
}

combobox button.combo cellview:dir(rtl) {
  margin-right: -2px;
}

combobox.linked button:nth-child(2):dir(ltr) {
  border-top-left-radius: 0;
  border-bottom-left-radius: 0;
}

combobox.linked button:nth-child(2):dir(rtl) {
  border-top-right-radius: 0;
  border-bottom-right-radius: 0;
}

combobox > .linked:not(.vertical) > entry:not(:only-child) {
  border-radius: 6px;
}

combobox > .linked:not(.vertical) > entry:not(:only-child):first-child {
  margin-right: -36px;
  padding-right: 36px;
}

combobox > .linked:not(.vertical) > entry:not(:only-child):last-child {
  margin-left: -36px;
  padding-left: 36px;
}

combobox > .linked:not(.vertical) > button:not(:only-child) {
  min-height: 16px;
  min-width: 16px;
  margin: 6px;
  padding: 4px;
  border-radius: 6px;
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
}

button.combo:only-child:focus {
  background-color: alpha(currentColor, 0.08);
  box-shadow: inset 0 0 0 2px rgba(242, 213, 207, 0.3);
}

button.combo:only-child:hover {
  background-color: alpha(currentColor, 0.08);
  box-shadow: inset 0 0 0 2px alpha(currentColor, 0.08);
}

button.combo:only-child:checked {
  background-color: rgba(242, 213, 207, 0.08);
  box-shadow: inset 0 0 0 2px #${config.colorScheme.palette.base0F};
}

button.combo:only-child:disabled {
  box-shadow: inset 0 0 0 2px transparent;
  background-color: rgba(242, 213, 207, 0.08);
  color: rgba(242, 213, 207, 0.5);
}

/************
 * Toolbars *
 ************/
toolbar {
  -gtkwidget-window-dragging: true;
  padding: 2px;
  background-color: #${config.colorScheme.palette.base00};
}

.osd toolbar {
  background-color: transparent;
}

frame.documents-dropdown,
.app-notification,
toolbar.osd {
  transition: box-shadow 75ms cubic-bezier(0, 0, 0.2, 1);
  padding: 6px;
  border-radius: 6px;
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2),
    0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12),
    inset 0 1px rgba(242, 213, 207, 0.1);
  background-color: #${config.colorScheme.palette.base02};
}

frame.documents-dropdown:backdrop,
.app-notification:backdrop,
toolbar.osd:backdrop {
  box-shadow: 0 3px 2px -3px rgba(0, 0, 0, 0.3),
    0 2px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 3px 0 rgba(0, 0, 0, 0.12),
    inset 0 1px rgba(242, 213, 207, 0.1);
}

frame.left.documents-dropdown,
.left.app-notification,
frame.right.documents-dropdown,
.right.app-notification,
frame.top.documents-dropdown,
.top.app-notification,
frame.bottom.documents-dropdown,
.bottom.app-notification,
toolbar.osd.left,
toolbar.osd.right,
toolbar.osd.top,
toolbar.osd.bottom {
  border-radius: 0;
}

frame.bottom.documents-dropdown,
.bottom.app-notification,
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

toolbar.horizontal > separator {
  margin: 2px;
}

toolbar.vertical > separator {
  margin: 2px;
}

toolbar:not(.inline-toolbar):not(.osd) scale,
toolbar:not(.inline-toolbar):not(.osd) entry,
toolbar:not(.inline-toolbar):not(.osd) spinbutton,
toolbar:not(.inline-toolbar):not(.osd) button {
  margin: 2px;
}

toolbar:not(.inline-toolbar):not(.osd) .linked entry:not(:first-child),
toolbar:not(.inline-toolbar):not(.osd) .linked spinbutton:not(:first-child),
toolbar:not(.inline-toolbar):not(.osd) .linked button:not(:first-child) {
  margin-left: 0;
}

toolbar:not(.inline-toolbar):not(.osd) .linked entry:not(:last-child),
toolbar:not(.inline-toolbar):not(.osd) .linked spinbutton:not(:last-child),
toolbar:not(.inline-toolbar):not(.osd) .linked button:not(:last-child) {
  margin-right: 0;
}

toolbar:not(.inline-toolbar):not(.osd) spinbutton entry,
toolbar:not(.inline-toolbar):not(.osd) spinbutton button {
  margin: 0;
}

toolbar:not(.inline-toolbar):not(.osd) switch {
  margin: 8px 2px;
}

.inline-toolbar {
  padding: 6px;
  border-style: solid;
  border-width: 0 1px 1px;
  border-color: rgba(242, 213, 207, 0.12);
  background-color: #${config.colorScheme.palette.base01};
}

searchbar > revealer > box,
.location-bar {
  padding: 6px;
  border-style: solid;
  border-width: 0 0 1px;
  border-color: rgba(242, 213, 207, 0.12);
  background-color: #${config.colorScheme.palette.base00};
  background-clip: border-box;
}

searchbar > revealer > box {
  margin: -6px;
}

/***************
 * Header bars *
 ***************/
.nemo-window .primary-toolbar button:not(.text-button),
headerbar button:not(.suggested-action):not(.destructive-action) {
  color: rgba(242, 213, 207, 0.7);
}

.nemo-window .primary-toolbar .linked:not(.vertical) > button:not(.text-button),
headerbar
  .linked:not(.vertical)
  > button:not(.suggested-action):not(.destructive-action) {
  border-radius: 6px;
}

.nemo-window .primary-toolbar button:focus:not(.text-button),
headerbar button:focus:not(.suggested-action):not(.destructive-action),
.nemo-window .primary-toolbar button:hover:not(.text-button),
headerbar button:hover:not(.suggested-action):not(.destructive-action),
.nemo-window .primary-toolbar button:active:not(.text-button),
headerbar button:active:not(.suggested-action):not(.destructive-action),
.nemo-window .primary-toolbar button:checked:not(.text-button),
headerbar button:checked:not(.suggested-action):not(.destructive-action) {
  color: #${config.colorScheme.palette.base06};
}

.nemo-window .primary-toolbar button:disabled:not(.text-button),
headerbar button:disabled:not(.suggested-action):not(.destructive-action) {
  color: rgba(242, 213, 207, 0.3);
}

.nemo-window .primary-toolbar button:checked:disabled:not(.text-button),
headerbar
  button:checked:disabled:not(.suggested-action):not(.destructive-action) {
  background-color: transparent;
  color: rgba(242, 213, 207, 0.5);
}

.nemo-window .primary-toolbar button:backdrop:not(.text-button),
headerbar button:backdrop:not(.suggested-action):not(.destructive-action) {
  color: rgba(242, 213, 207, 0.5);
}

.nemo-window .primary-toolbar button:backdrop:focus:not(.text-button),
headerbar button:backdrop:focus:not(.suggested-action):not(.destructive-action),
.nemo-window .primary-toolbar button:backdrop:hover:not(.text-button),
headerbar button:backdrop:hover:not(.suggested-action):not(.destructive-action),
.nemo-window .primary-toolbar button:backdrop:active:not(.text-button),
headerbar
  button:backdrop:active:not(.suggested-action):not(.destructive-action) {
  color: rgba(242, 213, 207, 0.7);
}

.nemo-window .primary-toolbar button:backdrop:disabled:not(.text-button),
headerbar
  button:backdrop:disabled:not(.suggested-action):not(.destructive-action) {
  color: rgba(242, 213, 207, 0.3);
}

.nemo-window .primary-toolbar button:backdrop:checked:not(.text-button),
headerbar
  button:backdrop:checked:not(.suggested-action):not(.destructive-action) {
  color: rgba(242, 213, 207, 0.7);
}

.nemo-window
  .primary-toolbar
  button:backdrop:checked:disabled:not(.text-button),
headerbar
  button:backdrop:checked:disabled:not(.suggested-action):not(
    .destructive-action
  ) {
  color: rgba(242, 213, 207, 0.3);
}

.nemo-window .primary-toolbar entry,
.titlebar entry {
  background-color: rgba(242, 213, 207, 0.04);
  color: #${config.colorScheme.palette.base06};
}

.nemo-window .primary-toolbar entry:disabled,
.titlebar entry:disabled {
  background-color: rgba(242, 213, 207, 0.04);
  color: rgba(242, 213, 207, 0.5);
}

.nemo-window .primary-toolbar entry image,
.titlebar entry image {
  color: rgba(242, 213, 207, 0.7);
}

.nemo-window .primary-toolbar entry image:hover,
.titlebar entry image:hover,
.nemo-window .primary-toolbar entry image:active,
.titlebar entry image:active {
  color: #${config.colorScheme.palette.base06};
}

.nemo-window .primary-toolbar entry image:disabled,
.titlebar entry image:disabled {
  color: rgba(242, 213, 207, 0.5);
}

.titlebar {
  transition: background-color 75ms cubic-bezier(0, 0, 0.2, 1),
    color 75ms cubic-bezier(0, 0, 0.2, 1);
  background-color: #${config.colorScheme.palette.base00};
  color: #${config.colorScheme.palette.base06};
  border-radius: 12px 12px 0 0;
}

.titlebar:disabled {
  color: rgba(242, 213, 207, 0.5);
}

.titlebar:backdrop {
  background-color: #${config.colorScheme.palette.base00};
  color: rgba(242, 213, 207, 0.7);
}

.titlebar:backdrop:disabled {
  color: rgba(242, 213, 207, 0.3);
}

.titlebar .title {
  padding: 0 12px;
  font-weight: bold;
}

.titlebar .subtitle {
  padding: 0 12px;
  font-size: smaller;
}

.titlebar .subtitle,
.titlebar .dim-label {
  transition: color 75ms cubic-bezier(0, 0, 0.2, 1);
  color: rgba(242, 213, 207, 0.7);
}

.titlebar .subtitle:backdrop,
.titlebar .dim-label:backdrop {
  color: rgba(242, 213, 207, 0.5);
}

.titlebar .titlebar {
  background-color: transparent;
  box-shadow: none;
}

.titlebar headerbar + separator {
  background-color: rgba(242, 213, 207, 0.12);
}

.titlebar .linked:not(.vertical) > entry {
  border-radius: 6px;
  margin-left: 3px;
  margin-right: 3px;
}

.titlebar button.suggested-action:disabled,
.titlebar button.destructive-action:disabled {
  background-color: rgba(242, 213, 207, 0.04);
  color: rgba(242, 213, 207, 0.5);
}

.titlebar stackswitcher {
  border: 2px solid #${config.colorScheme.palette.base0F};
}

.titlebar
  stackswitcher.linked:not(.vertical)
  > button.text-button:not(.suggested-action):not(.destructive-action):active {
  box-shadow: inset 0 0 0 9999px rgba(242, 213, 207, 0.08);
  background-image: radial-gradient(
    circle,
    rgba(242, 213, 207, 0.08) 10%,
    transparent 0%
  );
}

.titlebar
  stackswitcher.linked:not(.vertical)
  > button.text-button:not(.suggested-action):not(.destructive-action):checked {
  background-color: #${config.colorScheme.palette.base0F};
  color: #${config.colorScheme.palette.base00};
}

.titlebar
  .path-bar
  button.text-button:not(.suggested-action):not(.destructive-action) {
  min-width: 0;
  padding-left: 6px;
  padding-right: 6px;
}

.titlebar.selection-mode {
  transition: background-color 0.1ms 225ms,
    color 75ms cubic-bezier(0, 0, 0.2, 1);
  animation: ripple-on-headerbar 225ms cubic-bezier(0, 0, 0.2, 1);
  box-shadow: inset 0 1px rgba(242, 213, 207, 0);
  background-color: #${config.colorScheme.palette.base0F};
  color: rgba(0, 0, 0, 0.87);
}

.titlebar.selection-mode:backdrop {
  color: rgba(0, 0, 0, 0.6);
}

.titlebar.selection-mode .subtitle:link {
  color: rgba(0, 0, 0, 0.87);
}

.titlebar.selection-mode
  button:not(.suggested-action):not(.destructive-action) {
  border-image: radial-gradient(
      circle closest-corner at center calc(100% - 1px),
      currentColor 0%,
      transparent 0%
    )
    0 0 0/0 0 0px;
  color: rgba(0, 0, 0, 0.87);
}

.titlebar.selection-mode
  button:not(.suggested-action):not(.destructive-action):disabled {
  color: rgba(0, 0, 0, 0.38);
}

.titlebar.selection-mode
  button:not(.suggested-action):not(.destructive-action):checked {
  border-image: radial-gradient(
      circle closest-corner at center calc(100% - 1px),
      currentColor 100%,
      transparent 0%
    )
    0 0 2/0 0 2px;
  color: rgba(0, 0, 0, 0.87);
}

.titlebar.selection-mode
  button:not(.suggested-action):not(.destructive-action):checked:disabled {
  color: rgba(0, 0, 0, 0.38);
}

.titlebar.selection-mode
  button:not(.suggested-action):not(.destructive-action):backdrop {
  color: rgba(0, 0, 0, 0.6);
}

.titlebar.selection-mode
  button:not(.suggested-action):not(.destructive-action):backdrop:disabled {
  color: rgba(0, 0, 0, 0.26);
}

.titlebar.selection-mode
  button:not(.suggested-action):not(.destructive-action):backdrop:checked {
  color: rgba(0, 0, 0, 0.6);
}

.titlebar.selection-mode
  button:not(.suggested-action):not(
    .destructive-action
  ):backdrop:checked:disabled {
  color: rgba(0, 0, 0, 0.26);
}

.titlebar.selection-mode .selection-menu {
  padding-left: 16px;
  padding-right: 16px;
}

.titlebar.selection-mode .selection-menu arrow {
  -gtkarrow-arrow-scaling: 1;
}

.titlebar.selection-mode .selection-menu .arrow {
  -gtk-icon-source: -gtk-icontheme('pan-down-symbolic');
}

.titlebar .selection-mode {
  box-shadow: inset 0 1px rgba(242, 213, 207, 0);
  background-color: #${config.colorScheme.palette.base0F};
}

.tiled .titlebar,
.tiled-top .titlebar,
.tiled-right .titlebar,
.tiled-bottom .titlebar,
.tiled-left .titlebar,
.maximized .titlebar,
.fullscreen .titlebar {
  border-radius: 0;
}

.titlebar.default-decoration {
  min-height: 24px;
  padding: 10px 20px;
  border-radius: 12px 12px 0 0;
}

.tiled .titlebar.default-decoration,
.maximized .titlebar.default-decoration,
.fullscreen .titlebar.default-decoration {
  box-shadow: none;
  border-radius: 0;
}

.titlebar.default-decoration button.titlebutton {
  min-height: 24px;
  min-width: 24px;
  margin: 0;
  padding: 0;
}

.background:not(.csd) .titlebar.default-decoration button.titlebutton:active {
  background-size: 1000% 1000%;
}

.solid-csd .titlebar:dir(rtl),
.solid-csd .titlebar:dir(ltr) {
  border-radius: 0;
  box-shadow: none;
}

headerbar {
  min-height: 48px;
  padding: 1px 20px;
}

headerbar:not(.titlebar) {
  box-shadow: none;
}

box.vertical headerbar {
  background-color: #${config.colorScheme.palette.base00};
}

headerbar > box.left,
headerbar > box.right {
  padding: 0;
}

headerbar entry,
headerbar spinbutton,
headerbar button {
  margin-top: 6px;
  margin-bottom: 6px;
}

headerbar button,
headerbar button.image-button {
  border-radius: 6px;
}

headerbar separator.titlebutton {
  margin-top: 12px;
  margin-bottom: 12px;
  background-color: transparent;
}

headerbar switch {
  margin-top: 12px;
  margin-bottom: 12px;
}

headerbar spinbutton button {
  margin-top: 0;
  margin-bottom: 0;
}

headerbar .entry-tag,
headerbar .photos-entry-tag,
headerbar .documents-entry-tag {
  margin-top: 5px;
  margin-bottom: 5px;
}

headerbar.windowhandle
  viewswitcher
  button:not(.titlebutton):not(.suggested-action):not(.destructive-action) {
  border-radius: 6px;
  margin: 5px 2px;
  min-width: 120px;
  padding: 0;
  background-image: none;
  background-color: transparent;
}

headerbar.windowhandle
  viewswitcher
  button:not(.titlebutton):not(.suggested-action):not(.destructive-action)
  > stack
  > box {
  padding: 0 12px;
}

headerbar.windowhandle
  viewswitcher
  button:not(.titlebutton):not(.suggested-action):not(
    .destructive-action
  ):active {
  box-shadow: inset 0 0 0 9999px rgba(242, 213, 207, 0.08);
  background-image: radial-gradient(
    circle,
    rgba(242, 213, 207, 0.08) 10%,
    transparent 0%
  );
}

headerbar.windowhandle
  viewswitcher
  button:not(.titlebutton):not(.suggested-action):not(
    .destructive-action
  ):checked {
  background-color: #${config.colorScheme.palette.base02};
  color: #${config.colorScheme.palette.base0E};
  font-weight: 500;
}

headerbar.windowhandle
  viewswitcher
  button:not(.titlebutton):not(.suggested-action):not(
    .destructive-action
  ):focus {
  box-shadow: none;
}

headerbar.windowhandle > button.popup label,
headerbar.windowhandle > button.popup image {
  min-height: 0;
}

headerbar.windowhandle viewswitchertitle > squeezer {
  margin-top: 0;
  margin-bottom: 0;
  background: none;
}

headerbar.windowhandle viewswitchertitle > squeezer > viewswitcher {
  margin: 0 0;
  background: none;
}

headerbar.windowhandle
  viewswitchertitle
  > squeezer
  > viewswitcher
  > box.horizontal
  > button.radio {
  margin: 0;
  padding: 0;
  border-radius: 0;
}

/************
 * Pathbars *
 ************/
.caja-pathbar button,
.path-bar.linked:not(.vertical) > button {
  padding-left: 6px;
  padding-right: 6px;
  border-image: radial-gradient(
      circle closest-corner at center calc(100% - 1px),
      #${config.colorScheme.palette.base0F} 0%,
      transparent 0%
    )
    0 0 0/0 0 0px;
  border-radius: 6px;
}

.caja-pathbar button:checked,
.path-bar.linked:not(.vertical) > button:checked {
  border-image: radial-gradient(
      circle closest-corner at center calc(100% - 1px),
      #${config.colorScheme.palette.base0F} 100%,
      transparent 0%
    )
    0 0 2/0 0 2px;
}

.caja-pathbar button:checked,
.path-bar.linked:not(.vertical) > button:checked,
.path-bar.linked:not(.vertical) > button:checked:disabled {
  background-color: transparent;
}

.caja-pathbar button label:not(:only-child):first-child,
.path-bar.linked:not(.vertical) > button label:not(:only-child):first-child {
  margin-left: 0;
}

.caja-pathbar button label:not(:only-child):last-child,
.path-bar.linked:not(.vertical) > button label:not(:only-child):last-child {
  margin-right: 0;
}

.caja-pathbar button.text-button,
.path-bar.linked:not(.vertical) > button.text-button {
  min-width: 0;
}

.caja-pathbar button.slider-button,
.path-bar.linked:not(.vertical) > button.slider-button {
  padding-left: 4px;
  padding-right: 4px;
}

/**************
 * Tree Views *
 **************/
treeview.view {
  border-left-color: rgba(242, 213, 207, 0.3);
  border-top-color: rgba(242, 213, 207, 0.12);
  min-height: 36px;
}

* {
  -gtktreeview-horizontal-separator: 4;
  -gtktreeview-grid-line-width: 1;
  -gtktreeview-grid-line-pattern: \'\';
  -gtktreeview-tree-line-width: 1;
  -gtktreeview-tree-line-pattern: \'\';
  -gtktreeview-expander-size: 16;
}

window.background.csd
  treeview.view:not(:selected):not(:hover):not(.progressbar):not(.expander):not(
    .trough
  ):not(.separator) {
  background-color: transparent;
}

treeview.view:selected:not(.progressbar):not(.trough) {
  background-image: image(alpha(currentColor, 0.1));
}

treeview.view:hover,
treeview.view:selected {
  border-radius: 0;
}

treeview.view.separator {
  min-height: 6px;
  color: rgba(242, 213, 207, 0.12);
}

treeview.view:drop(active) {
  border-style: solid none;
  border-width: 9999px;
  border-color: alpha(currentColor, 0.08);
}

treeview.view.after:drop(active) {
  border-top-style: none;
}

treeview.view.before:drop(active) {
  border-bottom-style: none;
}

treeview.view.expander {
  -gtk-icon-source: -gtk-icontheme('pan-down-symbolic');
  -gtk-icon-transform: rotate(-90deg);
  color: rgba(242, 213, 207, 0.7);
}

treeview.view.expander:dir(rtl) {
  -gtk-icon-transform: rotate(90deg);
}

treeview.view.expander:checked {
  -gtk-icon-transform: unset;
}

treeview.view.expander:hover,
treeview.view.expander:active {
  color: #${config.colorScheme.palette.base06};
}

treeview.view.expander:disabled {
  color: rgba(242, 213, 207, 0.3);
}

treeview.view.progressbar {
  border: none;
  box-shadow: none;
  background-color: #${config.colorScheme.palette.base0F};
  background-image: none;
  border-radius: 9999px;
  color: rgba(0, 0, 0, 0.87);
}

treeview.view.progressbar:selected:hover {
  box-shadow: none;
}

treeview.view.trough {
  border: none;
  box-shadow: none;
  background-color: rgba(242, 213, 207, 0.12);
  background-image: none;
  border-radius: 9999px;
  padding: 0;
  margin: 0;
}

treeview.view.trough:selected:hover {
  box-shadow: none;
}

treeview.view header button {
  padding: 2px 6px;
  border: none;
  border-radius: 6px;
}

treeview.view header button:not(:focus):not(:hover):not(:active) {
  color: rgba(242, 213, 207, 0.7);
}

treeview.view header button,
treeview.view header button:disabled {
  background-color: #${config.colorScheme.palette.base00};
}

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

treeview.view acceleditor > label {
  background-color: #${config.colorScheme.palette.base0F};
}

/*********
 * Menus *
 *********/
menubar,
.menubar {
  -gtkwidget-window-dragging: true;
  padding: 0;
  background-color: #${config.colorScheme.palette.base00};
  color: #${config.colorScheme.palette.base06};
}

menubar:backdrop,
.menubar:backdrop {
  background-color: #${config.colorScheme.palette.base00};
  color: rgba(242, 213, 207, 0.7);
}

.csd menubar,
.csd .menubar {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
}

menubar > menuitem,
.menubar > menuitem {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
  min-height: 20px;
  padding: 4px 8px;
  color: rgba(242, 213, 207, 0.7);
  border-radius: 6px;
}

menubar > menuitem:hover,
.menubar > menuitem:hover {
  transition: none;
  background-color: alpha(currentColor, 0.1);
  color: #${config.colorScheme.palette.base06};
}

menubar > menuitem:disabled,
.menubar > menuitem:disabled {
  color: rgba(242, 213, 207, 0.3);
}

menubar > menuitem label:disabled,
.menubar > menuitem label:disabled {
  color: inherit;
}

.background.popup {
  background-color: transparent;
}

menu,
.menu,
.context-menu {
  margin: 6px;
  padding: 6px;
  background-color: #${config.colorScheme.palette.base02};
  background-clip: border-box;
  border-radius: 12px;
  border: 2px solid #${config.colorScheme.palette.base0F};
}

.csd menu,
.csd .menu,
.csd .context-menu {
  border: none;
}

menu menuitem,
.menu menuitem,
.context-menu menuitem {
  transition: background-color 75ms cubic-bezier(0, 0, 0.2, 1);
  min-height: 20px;
  min-width: 40px;
  padding: 4px 8px;
  color: #${config.colorScheme.palette.base06};
  font: initial;
  font-weight: 500;
  text-shadow: none;
  border-radius: 6px;
}

menu menuitem:hover,
.menu menuitem:hover,
.context-menu menuitem:hover {
  transition: none;
  background-color: #${config.colorScheme.palette.base03};
  color: #${config.colorScheme.palette.base0E};
  font-weight: 500;
}

menu menuitem:hover accelerator,
.menu menuitem:hover accelerator,
.context-menu menuitem:hover accelerator {
  color: #${config.colorScheme.palette.base0E};
  font-weight: 500;
}

menu menuitem:hover:disabled accelerator,
.menu menuitem:hover:disabled accelerator,
.context-menu menuitem:hover:disabled accelerator {
  color: #${config.colorScheme.palette.base0E};
  font-weight: 500;
}

menu menuitem:disabled,
.menu menuitem:disabled,
.context-menu menuitem:disabled {
  color: rgba(242, 213, 207, 0.5);
}

menu menuitem accelerator,
.menu menuitem accelerator,
.context-menu menuitem accelerator {
  color: rgba(242, 213, 207, 0.7);
}

menu menuitem:disabled accelerator,
.menu menuitem:disabled accelerator,
.context-menu menuitem:disabled accelerator {
  color: rgba(242, 213, 207, 0.3);
}

menu menuitem arrow,
.menu menuitem arrow,
.context-menu menuitem arrow {
  min-height: 16px;
  min-width: 16px;
}

menu menuitem arrow:dir(ltr),
.menu menuitem arrow:dir(ltr),
.context-menu menuitem arrow:dir(ltr) {
  -gtk-icon-source: -gtk-icontheme('pan-end-symbolic');
  margin-left: 8px;
}

menu menuitem arrow:dir(rtl),
.menu menuitem arrow:dir(rtl),
.context-menu menuitem arrow:dir(rtl) {
  -gtk-icon-source: -gtk-icontheme('pan-end-symbolic-rtl');
  margin-right: 8px;
}

menu menuitem label:dir(rtl),
menu menuitem label:dir(ltr),
.menu menuitem label:dir(rtl),
.menu menuitem label:dir(ltr),
.context-menu menuitem label:dir(rtl),
.context-menu menuitem label:dir(ltr) {
  color: inherit;
}

menu .view:selected,
.menu .view:selected,
.context-menu .view:selected {
  background-color: #${config.colorScheme.palette.base04};
}

menu > arrow,
.menu > arrow,
.context-menu > arrow {
  min-height: 16px;
  min-width: 16px;
  padding: 4px;
  background-color: #${config.colorScheme.palette.base02};
  color: rgba(242, 213, 207, 0.7);
}

menu > arrow.top,
.menu > arrow.top,
.context-menu > arrow.top {
  margin-top: 0;
  border-radius: 6px;
  -gtk-icon-source: -gtk-icontheme('pan-up-symbolic');
}

menu > arrow.bottom,
.menu > arrow.bottom,
.context-menu > arrow.bottom {
  margin-top: 8px;
  margin-bottom: -12px;
  border-radius: 6px;
  -gtk-icon-source: -gtk-icontheme('pan-down-symbolic');
}

menu > arrow:hover,
.menu > arrow:hover,
.context-menu > arrow:hover {
  background-image: image(alpha(currentColor, 0.08));
  color: #${config.colorScheme.palette.base06};
}

menu > arrow:disabled,
.menu > arrow:disabled,
.context-menu > arrow:disabled {
  border-color: transparent;
  background-color: transparent;
  color: transparent;
}

menu separator,
.menu separator,
.context-menu separator {
  margin: 4px 0;
}

/************
 * Popovers *
 ************/
popover.background {
  transition: box-shadow 75ms cubic-bezier(0, 0, 0.2, 1);
  padding: 0;
  background-color: #${config.colorScheme.palette.base02};
  border-radius: 12px;
}

popover.background,
.csd popover.background {
  border: 2px solid #${config.colorScheme.palette.base07};
  box-shadow: none;
}

popover.background > stack {
  margin: 0;
}

popover.background > toolbar {
  margin: 0;
}

popover.background > list,
popover.background > .view,
popover.background > toolbar {
  border-style: none;
  box-shadow: none;
  background-color: transparent;
}

popover.background list,
popover.background .view:not(:selected),
popover.background toolbar {
  background-color: #${config.colorScheme.palette.base02};
}

popover.background.combo viewport.frame > list {
  background-color: transparent;
}

popover.background.combo viewport.frame > list > row {
  padding: 6px 12px;
}

popover.background.combo viewport.frame > list > row:first-child {
  border-radius: 12px 12px 0 0;
}

popover.background.combo viewport.frame > list > row:last-child {
  border-radius: 0 0 12px 12px;
}

popover.background .linked > button:not(.radio) {
  border-radius: 6px;
}

popover.background .linked > button:not(.radio):first-child {
  border-radius: 6px;
}

popover.background .linked > button:not(.radio):last-child {
  border-radius: 6px;
}

popover.background .linked > button:not(.radio):only-child {
  border-radius: 6px;
}

popover.background.menu button,
popover.background button.model {
  min-height: 32px;
  padding: 0 8px;
  border-radius: 6px;
}

popover.background separator {
  margin: 4px 0;
}

popover.background list separator {
  margin: 0;
}

/*************
 * Notebooks *
 *************/
tabbox > tab,
notebook > header tab {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1), background-size 0ms,
    background-image 0ms;
  min-height: 24px;
  min-width: 24px;
  padding: 3px 12px;
  border: none;
  outline: none;
  background-clip: padding-box;
  color: rgba(242, 213, 207, 0.7);
  font-weight: 500;
  border-radius: 6px;
}

tabbox > tab:hover,
notebook > header tab:hover {
  background-color: rgba(242, 213, 207, 0.04);
  color: #${config.colorScheme.palette.base06};
}

tabbox > tab:disabled,
notebook > header tab:disabled {
  color: rgba(242, 213, 207, 0.3);
}

tabbox > tab:checked,
notebook > header tab:checked {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
  background-color: #${config.colorScheme.palette.base01};
  color: #${config.colorScheme.palette.base0E};
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.06);
}

tabbox > tab:checked:disabled,
notebook > header tab:checked:disabled {
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
  background-color: transparent;
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

notebook > stack:not(:only-child) {
  background-color: transparent;
  border-radius: 6px;
}

/**************
 * Scrollbars *
 **************/
scrollbar {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
  background-color: #${config.colorScheme.palette.base00};
}

* {
  -gtkscrollbar-has-backward-stepper: false;
  -gtkscrollbar-has-forward-stepper: false;
}

scrollbar.top {
  border-bottom: transparent;
}

scrollbar.bottom {
  border-bottom: transparent;
}

scrollbar.left {
  border-bottom: transparent;
}

scrollbar.right {
  border-bottom: transparent;
}

scrollbar slider {
  transition: background-color 75ms cubic-bezier(0, 0, 0.2, 1);
  min-width: 4px;
  min-height: 4px;
  border: 2px solid transparent;
  border-radius: 9999px;
  background-clip: padding-box;
  background-color: rgba(242, 213, 207, 0.2);
}

scrollbar slider:hover {
  background-color: rgba(242, 213, 207, 0.3);
}

scrollbar slider:active {
  background-color: rgba(242, 213, 207, 0.3);
}

scrollbar slider:disabled {
  background-color: rgba(242, 213, 207, 0.2);
}

scrollbar.fine-tune slider {
  min-width: 2px;
  min-height: 2px;
}

scrollbar.fine-tune.horizontal slider {
  margin: 2px 0;
}

scrollbar.fine-tune.vertical slider {
  margin: 0 2px;
}

scrollbar.overlay-indicator:not(.fine-tune) slider {
  transition-property: background-color, min-height, min-width;
}

scrollbar.overlay-indicator:not(.dragging):not(.hovering) {
  border-color: transparent;
  background-color: transparent;
}

scrollbar.overlay-indicator:not(.dragging):not(.hovering) slider {
  min-width: 2px;
  min-height: 2px;
  margin: 2px;
  border: 1px solid rgba(44, 44, 44, 0.3);
}

scrollbar.overlay-indicator:not(.dragging):not(.hovering) button {
  min-width: 4px;
  min-height: 4px;
  margin: 2px;
  border: 1px solid rgba(44, 44, 44, 0.3);
  border-radius: 9999px;
  background-color: transparent;
  background-clip: padding-box;
  -gtk-icon-source: none;
}

scrollbar.overlay-indicator:not(.dragging):not(.hovering) button:disabled {
  background-color: transparent;
}

scrollbar.overlay-indicator.horizontal:not(.dragging):not(.hovering) slider {
  min-width: 24px;
}

scrollbar.overlay-indicator.horizontal:not(.dragging):not(.hovering) button {
  min-width: 8px;
}

scrollbar.overlay-indicator.vertical:not(.dragging):not(.hovering) slider {
  min-height: 24px;
}

scrollbar.overlay-indicator.vertical:not(.dragging):not(.hovering) button {
  min-height: 8px;
}

scrollbar.overlay-indicator.dragging,
scrollbar.overlay-indicator.hovering {
  background-color: transparent;
}

scrollbar.horizontal slider {
  min-width: 24px;
}

scrollbar.vertical slider {
  min-height: 24px;
}

scrollbar button {
  min-width: 16px;
  min-height: 16px;
  padding: 0;
  border-radius: 0;
}

scrollbar.vertical button.down,
scrollbar.vertical button.down:hover,
scrollbar.vertical button.up,
scrollbar.vertical button.up:hover,
scrollbar.horizontal button.down,
scrollbar.horizontal button.down:hover,
scrollbar.horizontal button.up,
scrollbar.horizontal button.up:hover {
  background-color: transparent;
  color: transparent;
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
  -gtk-icon-transform: scale(0);
}

switch slider {
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

switch:focus slider,
switch:hover slider,
switch:focus:hover slider {
  box-shadow: 0 0 0 10px rgba(242, 213, 207, 0.12);
}

switch:checked slider {
  background-color: #${config.colorScheme.palette.base00};
  color: #${config.colorScheme.palette.base00};
}

/*************************
 * Check and Radio items *
 *************************/
.view.content-view.check:not(list),
.content-view .tile check:not(list) {
  min-height: 40px;
  min-width: 40px;
  margin: 0;
  padding: 0;
  box-shadow: none;
  background-color: transparent;
  background-image: none;
}

.view.content-view.check:not(list),
.content-view .tile check:not(list) {
  -gtk-icon-source: -gtk-scaled(
    url('assets/selectionmode-checkbox-unchecked-dark.png'),
    url('assets/selectionmode-checkbox-unchecked-dark@2.png')
  );
}

.view.content-view.check:not(list):checked,
.content-view .tile check:not(list):checked {
  -gtk-icon-source: -gtk-scaled(
    url('assets/selectionmode-checkbox-checked-dark.png'),
    url('assets/selectionmode-checkbox-checked-dark@2.png')
  );
}

checkbutton,
radiobutton {
  outline: none;
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
  min-height: 24px;
  min-width: 24px;
  margin: -8px;
  padding: 8px;
}

check:checked,
check:indeterminate,
radio:checked,
radio:indeterminate {
  color: #${config.colorScheme.palette.base0F};
}

check:checked:disabled,
check:indeterminate:disabled,
radio:checked:disabled,
radio:indeterminate:disabled {
  color: rgba(242, 213, 207, 0.3);
}

check:not(:hover):focus,
radio:not(:hover):focus {
  box-shadow: inset 0 0 0 9999px transparent;
}

popover modelbutton.flat check,
popover modelbutton.flat check:focus,
popover modelbutton.flat check:hover,
popover modelbutton.flat check:focus:hover,
popover modelbutton.flat check:active,
popover modelbutton.flat check:disabled,
popover modelbutton.flat radio,
popover modelbutton.flat radio:focus,
popover modelbutton.flat radio:hover,
popover modelbutton.flat radio:focus:hover,
popover modelbutton.flat radio:active,
popover modelbutton.flat radio:disabled {
  transition: none;
  box-shadow: none;
  background-image: none;
}

popover modelbutton.flat check:not(:checked):not(:indeterminate):not(:disabled),
popover
  modelbutton.flat
  radio:not(:checked):not(:indeterminate):not(:disabled) {
  color: rgba(242, 213, 207, 0.7);
}

popover modelbutton.flat check.left:dir(rtl),
popover modelbutton.flat radio.left:dir(rtl) {
  margin-left: -12px;
  margin-right: -4px;
}

popover modelbutton.flat check.right:dir(ltr),
popover modelbutton.flat radio.right:dir(ltr) {
  margin-left: -4px;
  margin-right: -12px;
}

menu menuitem check,
menu menuitem radio {
  transition: none;
  margin: 0;
  padding: 0;
}

menu menuitem check:dir(ltr),
menu menuitem radio:dir(ltr) {
  margin-right: 8px;
}

menu menuitem check:dir(rtl),
menu menuitem radio:dir(rtl) {
  margin-left: 8px;
}

menu menuitem check:not(:checked):not(:indeterminate):not(:disabled),
menu menuitem radio:not(:checked):not(:indeterminate):not(:disabled) {
  color: rgba(242, 213, 207, 0.7);
}

menu menuitem check:not(:checked):not(:indeterminate):not(:disabled):hover,
menu menuitem radio:not(:checked):not(:indeterminate):not(:disabled):hover {
  color: inherit;
}

menu menuitem check,
menu menuitem check:hover,
menu menuitem check:disabled,
menu menuitem radio,
menu menuitem radio:hover,
menu menuitem radio:disabled {
  box-shadow: none;
  color: inherit;
}

check {
  -gtk-icon-source: -gtk-recolor(
    url('assets/scalable/checkbox-unchecked-symbolic.svg')
  );
}

check:checked {
  -gtk-icon-source: -gtk-recolor(
    url('assets/scalable/checkbox-checked-symbolic.svg')
  );
}

check:indeterminate {
  -gtk-icon-source: -gtk-recolor(
    url('assets/scalable/checkbox-mixed-symbolic.svg')
  );
}

radio {
  -gtk-icon-source: -gtk-recolor(
    url('assets/scalable/radio-unchecked-symbolic.svg')
  );
}

radio:checked {
  -gtk-icon-source: -gtk-recolor(
    url('assets/scalable/radio-checked-symbolic.svg')
  );
}

radio:indeterminate {
  -gtk-icon-source: -gtk-recolor(
    url('assets/scalable/radio-mixed-symbolic.svg')
  );
}

#MozillaGtkWidget > widget > checkbutton > check,
menu menuitem check {
  min-height: 16px;
  min-width: 16px;
  border-radius: 6px;
  -gtk-icon-source: -gtk-recolor(
    url('assets/scalable/small-checkbox-unchecked-symbolic.svg')
  );
}

#MozillaGtkWidget > widget > checkbutton > check:checked,
menu menuitem check:checked {
  -gtk-icon-source: -gtk-recolor(
    url('assets/scalable/small-checkbox-checked-symbolic.svg')
  );
}

#MozillaGtkWidget > widget > checkbutton > check:indeterminate,
menu menuitem check:indeterminate {
  -gtk-icon-source: -gtk-recolor(
    url('assets/scalable/small-checkbox-mixed-symbolic.svg')
  );
}

#MozillaGtkWidget > widget > radiobutton > radio,
menu menuitem radio {
  min-height: 16px;
  min-width: 16px;
  border-image: none;
  -gtk-icon-source: -gtk-recolor(
    url('assets/scalable/small-radio-unchecked-symbolic.svg')
  );
}

#MozillaGtkWidget > widget > radiobutton > radio:checked,
menu menuitem radio:checked {
  -gtk-icon-source: -gtk-recolor(
    url('assets/scalable/small-radio-checked-symbolic.svg')
  );
}

#MozillaGtkWidget > widget > radiobutton > radio:indeterminate,
menu menuitem radio:indeterminate {
  -gtk-icon-source: -gtk-recolor(
    url('assets/scalable/small-radio-mixed-symbolic.svg')
  );
}

check:not(:checked):active {
  -gtk-icon-transform: rotate(90deg);
}

check:not(:checked):indeterminate:active,
radio:not(:checked):indeterminate:active {
  -gtk-icon-transform: scaleX(-1);
}

check:not(:checked),
radio:not(:checked) {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1),
    background-size 300ms cubic-bezier(0, 0, 0.2, 1),
    background-image 1200ms cubic-bezier(0, 0, 0.2, 1), -gtk-icon-transform 0;
}

check:not(:checked):active,
radio:not(:checked):active {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1), background-size 0,
    background-image 0, -gtk-icon-transform 0;
}

menu menuitem check:not(:checked),
menu menuitem radio:not(:checked) {
  transition: none;
}

treeview.view check,
treeview.view radio {
  padding: 0;
  color: rgba(242, 213, 207, 0.7);
}

treeview.view check:hover,
treeview.view check:active,
treeview.view radio:hover,
treeview.view radio:active {
  color: #${config.colorScheme.palette.base06};
}

treeview.view check:disabled,
treeview.view radio:disabled {
  color: rgba(242, 213, 207, 0.3);
}

treeview.view check:checked,
treeview.view check:indeterminate,
treeview.view radio:checked,
treeview.view radio:indeterminate {
  color: #${config.colorScheme.palette.base0F};
}

treeview.view check:checked:disabled,
treeview.view check:indeterminate:disabled,
treeview.view radio:checked:disabled,
treeview.view radio:indeterminate:disabled {
  color: rgba(242, 213, 207, 0.3);
}

treeview.view check:hover,
treeview.view check:selected,
treeview.view radio:hover,
treeview.view radio:selected {
  box-shadow: none;
  background-color: transparent;
}

treeview.view radio:checked {
  -gtk-icon-source: -gtk-recolor(
    url('assets/scalable/radio-checked-symbolic.svg')
  );
  border-image: none;
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

scale.horizontal marks.top {
  margin-bottom: 7px;
  margin-top: -15px;
}

scale.horizontal.fine-tune marks.top {
  margin-bottom: 6px;
  margin-top: -14px;
}

scale.horizontal marks.bottom {
  margin-top: 7px;
  margin-bottom: -15px;
}

scale.horizontal.fine-tune marks.bottom {
  margin-top: 6px;
  margin-bottom: -14px;
}

scale.vertical marks.top {
  margin-right: 7px;
  margin-left: -15px;
}

scale.vertical.fine-tune marks.top {
  margin-right: 6px;
  margin-left: -14px;
}

scale.vertical marks.bottom {
  margin-left: 7px;
  margin-right: -15px;
}

scale.vertical.fine-tune marks.bottom {
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
  transition: background-color 75ms cubic-bezier(0, 0, 0.2, 1),
    background-size 0ms, background-image 0ms;
  animation: ripple-on-slider 225ms cubic-bezier(0, 0, 0.2, 1) forwards;
  background-size: auto, 0% 0%;
  background-color: alpha(currentColor, 0.08);
}

scale.horizontal.marks-before:not(.marks-after) slider {
  background-image: -gtk-scaled(
      url('assets/scale-horz-marks-before-slider-dark.png'),
      url('assets/scale-horz-marks-before-slider-dark@2.png')
    ),
    radial-gradient(circle, transparent 10%, transparent 0%);
}

scale.horizontal.marks-before:not(.marks-after) slider:disabled {
  background-image: -gtk-scaled(
      url('assets/scale-horz-marks-before-slider-disabled-dark.png'),
      url('assets/scale-horz-marks-before-slider-disabled-dark@2.png')
    ),
    radial-gradient(circle, transparent 10%, transparent 0%);
}

scale.horizontal.marks-before:not(.marks-after) slider:active {
  background-image: -gtk-scaled(
      url('assets/scale-horz-marks-before-slider-dark.png'),
      url('assets/scale-horz-marks-before-slider-dark@2.png')
    ),
    radial-gradient(circle, alpha(currentColor, 0.12) 10%, transparent 0%);
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
  transition: background-color 75ms cubic-bezier(0, 0, 0.2, 1),
    background-size 0ms, background-image 0ms;
  animation: ripple-on-slider 225ms cubic-bezier(0, 0, 0.2, 1) forwards;
  background-size: auto, 0% 0%;
  background-color: alpha(currentColor, 0.08);
}

scale.horizontal.marks-after:not(.marks-before) slider {
  background-image: -gtk-scaled(
      url('assets/scale-horz-marks-after-slider-dark.png'),
      url('assets/scale-horz-marks-after-slider-dark@2.png')
    ),
    radial-gradient(circle, transparent 10%, transparent 0%);
}

scale.horizontal.marks-after:not(.marks-before) slider:disabled {
  background-image: -gtk-scaled(
      url('assets/scale-horz-marks-after-slider-disabled-dark.png'),
      url('assets/scale-horz-marks-after-slider-disabled-dark@2.png')
    ),
    radial-gradient(circle, transparent 10%, transparent 0%);
}

scale.horizontal.marks-after:not(.marks-before) slider:active {
  background-image: -gtk-scaled(
      url('assets/scale-horz-marks-after-slider-dark.png'),
      url('assets/scale-horz-marks-after-slider-dark@2.png')
    ),
    radial-gradient(circle, alpha(currentColor, 0.12) 10%, transparent 0%);
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
  transition: background-color 75ms cubic-bezier(0, 0, 0.2, 1),
    background-size 0ms, background-image 0ms;
  animation: ripple-on-slider 225ms cubic-bezier(0, 0, 0.2, 1) forwards;
  background-size: auto, 0% 0%;
  background-color: alpha(currentColor, 0.08);
}

scale.vertical.marks-before:not(.marks-after) slider {
  background-image: -gtk-scaled(
      url('assets/scale-vert-marks-before-slider-dark.png'),
      url('assets/scale-vert-marks-before-slider-dark@2.png')
    ),
    radial-gradient(circle, transparent 10%, transparent 0%);
}

scale.vertical.marks-before:not(.marks-after) slider:disabled {
  background-image: -gtk-scaled(
      url('assets/scale-vert-marks-before-slider-disabled-dark.png'),
      url('assets/scale-vert-marks-before-slider-disabled-dark@2.png')
    ),
    radial-gradient(circle, transparent 10%, transparent 0%);
}

scale.vertical.marks-before:not(.marks-after) slider:active {
  background-image: -gtk-scaled(
      url('assets/scale-vert-marks-before-slider-dark.png'),
      url('assets/scale-vert-marks-before-slider-dark@2.png')
    ),
    radial-gradient(circle, alpha(currentColor, 0.12) 10%, transparent 0%);
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
  transition: background-color 75ms cubic-bezier(0, 0, 0.2, 1),
    background-size 0ms, background-image 0ms;
  animation: ripple-on-slider 225ms cubic-bezier(0, 0, 0.2, 1) forwards;
  background-size: auto, 0% 0%;
  background-color: alpha(currentColor, 0.08);
}

scale.vertical.marks-after:not(.marks-before) slider {
  background-image: -gtk-scaled(
      url('assets/scale-vert-marks-after-slider-dark.png'),
      url('assets/scale-vert-marks-after-slider-dark@2.png')
    ),
    radial-gradient(circle, transparent 10%, transparent 0%);
}

scale.vertical.marks-after:not(.marks-before) slider:disabled {
  background-image: -gtk-scaled(
      url('assets/scale-vert-marks-after-slider-disabled-dark.png'),
      url('assets/scale-vert-marks-after-slider-disabled-dark@2.png')
    ),
    radial-gradient(circle, transparent 10%, transparent 0%);
}

scale.vertical.marks-after:not(.marks-before) slider:active {
  background-image: -gtk-scaled(
      url('assets/scale-vert-marks-after-slider-dark.png'),
      url('assets/scale-vert-marks-after-slider-dark@2.png')
    ),
    radial-gradient(circle, alpha(currentColor, 0.12) 10%, transparent 0%);
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
  background-color: #${config.colorScheme.palette.base0A};
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
printdialog paper {
  padding: 0;
  border: 1px solid rgba(242, 213, 207, 0.12);
  background-color: #${config.colorScheme.palette.base00};
  color: #${config.colorScheme.palette.base06};
}

printdialog .dialog-action-box {
  margin: 12px;
}

/**********
 * Frames *
 **********/
frame > border,
.frame {
  margin: 0;
  padding: 0;
  border: 1px solid rgba(242, 213, 207, 0.12);
  border-radius: 0;
  box-shadow: none;
}

frame > border.view,
.frame.view {
  border-radius: 6px;
}

frame > border.flat,
.frame.flat {
  border-style: none;
}

frame.flat > border,
statusbar frame > border {
  border: none;
}

actionbar > revealer > box {
  padding: 6px;
  border-top: 1px solid rgba(242, 213, 207, 0.12);
  background-color: #${config.colorScheme.palette.base00};
  background-clip: border-box;
}

.background.csd box.vertical > actionbar > revealer > box {
  border-radius: 0 0 12px 12px;
}

scrolledwindow viewport.frame {
  border: none;
}

stack scrolledwindow.frame viewport.frame list {
  border: none;
}

overshoot.top {
  background-image: -gtk-gradient(
    radial,
    center top,
    0,
    center top,
    0.75,
    to(rgba(238, 190, 190, 0.24)),
    to(transparent)
  );
  background-repeat: no-repeat;
  background-position: center top;
  background-color: transparent;
  border: none;
  box-shadow: none;
}

overshoot.bottom {
  background-image: -gtk-gradient(
    radial,
    center bottom,
    0,
    center bottom,
    0.75,
    to(rgba(238, 190, 190, 0.24)),
    to(transparent)
  );
  background-repeat: no-repeat;
  background-position: center bottom;
  background-color: transparent;
  border: none;
  box-shadow: none;
}

overshoot.left {
  background-image: -gtk-gradient(
    radial,
    left center,
    0,
    left center,
    0.75,
    to(rgba(238, 190, 190, 0.24)),
    to(transparent)
  );
  background-repeat: no-repeat;
  background-position: left center;
  background-color: transparent;
  border: none;
  box-shadow: none;
}

overshoot.right {
  background-image: -gtk-gradient(
    radial,
    right center,
    0,
    right center,
    0.75,
    to(rgba(238, 190, 190, 0.24)),
    to(transparent)
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

separator {
  min-width: 1px;
  min-height: 1px;
  background-color: rgba(242, 213, 207, 0.12);
}

preferences stacksidebar.sidebar list separator,
hdyleaflet
  > box.vertical
  > scrolledwindow
  > viewport.frame
  list:not(.view):not(.tweak-group)
  separator,
leaflet
  > box.vertical
  > scrolledwindow
  > viewport.frame
  list:not(.view):not(.tweak-group)
  separator,
box.horizontal
  > stack.background
  > box.vertical
  > scrolledwindow
  > viewport.frame
  list:not(.view):not(.tweak-group)
  separator,
.tweak-categories separator,
placessidebar.sidebar list > separator,
stacksidebar.sidebar + separator.vertical,
stacksidebar.sidebar separator.horizontal,
button.font separator,
button.file separator {
  min-width: 0;
  min-height: 0;
  background-color: transparent;
}

/*********
 * Lists *
 *********/
list {
  border-color: rgba(242, 213, 207, 0.12);
  background-color: #${config.colorScheme.palette.base00};
}

list row {
  padding: 3px;
}

list.navigation-sidebar {
  padding: 3px;
}

.budgie-popover.budgie-menu button.flat:not(.image-button):not(.indicator-item),
.budgie-popover scrolledwindow.sidebar:not(.categories) list > row.activatable,
treeview.view header button,
row.activatable {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1),
    background-size 300ms cubic-bezier(0, 0, 0.2, 1),
    background-image 1200ms cubic-bezier(0, 0, 0.2, 1);
  outline: none;
  box-shadow: inset 0 0 0 9999px transparent;
  background-image: radial-gradient(circle, transparent 10%, transparent 0%);
  background-repeat: no-repeat;
  background-position: center;
  background-size: 1000% 1000%;
}

.budgie-popover.budgie-menu
  button.flat:focus:not(.image-button):not(.indicator-item),
.budgie-popover
  scrolledwindow.sidebar:not(.categories)
  list
  > row.activatable:focus,
treeview.view header button:focus,
row.activatable:focus {
  box-shadow: inset 0 0 0 9999px alpha(currentColor, 0.08);
}

.budgie-popover.budgie-menu
  button.flat:hover:not(.image-button):not(.indicator-item),
.budgie-popover
  scrolledwindow.sidebar:not(.categories)
  list
  > row.activatable:hover,
treeview.view header button:hover,
row.activatable:hover {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1), box-shadow 0ms,
    background-size 300ms cubic-bezier(0, 0, 0.2, 1),
    background-image 1200ms cubic-bezier(0, 0, 0.2, 1);
  box-shadow: inset 0 0 0 9999px alpha(currentColor, 0.08);
}

.budgie-popover.budgie-menu
  button.has-open-popup.flat:not(.image-button):not(.indicator-item),
.budgie-popover
  scrolledwindow.sidebar:not(.categories)
  list
  > row.has-open-popup.activatable,
treeview.view header button.has-open-popup,
.budgie-popover.budgie-menu
  button.flat:active:not(.image-button):not(.indicator-item),
.budgie-popover
  scrolledwindow.sidebar:not(.categories)
  list
  > row.activatable:active,
treeview.view header button:active,
row.activatable.has-open-popup,
row.activatable:active {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1), background-size 0ms,
    background-image 0ms;
  animation: ripple 225ms cubic-bezier(0, 0, 0.2, 1) forwards;
  box-shadow: inset 0 0 0 9999px alpha(currentColor, 0.08);
  background-image: radial-gradient(
    circle,
    alpha(currentColor, 0.12) 10%,
    transparent 0%
  );
  background-size: 0% 0%;
}

row:selected {
  color: inherit;
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

/*********************
 * App Notifications *
 *********************/
.app-notification {
  margin: 8px;
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
expander title > arrow {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
  min-width: 16px;
  min-height: 16px;
  -gtk-icon-source: -gtk-icontheme('pan-down-symbolic');
  -gtk-icon-transform: rotate(-90deg);
  color: rgba(242, 213, 207, 0.7);
}

expander title > arrow:dir(rtl) {
  -gtk-icon-transform: rotate(90deg);
}

expander title > arrow:checked {
  -gtk-icon-transform: unset;
}

expander title > arrow:hover,
expander title > arrow:active {
  color: #${config.colorScheme.palette.base06};
}

expander title > arrow:disabled {
  color: rgba(242, 213, 207, 0.3);
}

/************
 * Calendar *
 ************/
calendar {
  padding: 3px 6px;
  border: 1px solid rgba(242, 213, 207, 0.12);
  color: #${config.colorScheme.palette.base06};
}

calendar:disabled {
  color: rgba(242, 213, 207, 0.5);
}

calendar:selected {
  border-radius: 6px;
}

calendar.header {
  border-style: none none solid;
  border-color: rgba(242, 213, 207, 0.12);
  border-radius: 0;
}

calendar.button {
  border-radius: 6px;
}

calendar.highlight {
  color: rgba(242, 213, 207, 0.7);
  font-weight: 500;
}

calendar:indeterminate {
  color: rgba(242, 213, 207, 0.3);
}

/***********
 * Dialogs *
 ***********/
messagedialog.background {
  background-color: #${config.colorScheme.palette.base02};
}

messagedialog .titlebar {
  min-height: 24px;
  border-style: none;
  box-shadow: inset 0 1px rgba(242, 213, 207, 0.1);
  background-color: #${config.colorScheme.palette.base02};
  color: #${config.colorScheme.palette.base06};
}

messagedialog .titlebar:backdrop {
  background-color: #${config.colorScheme.palette.base02};
  color: rgba(242, 213, 207, 0.7);
}

messagedialog checkbutton.text-button {
  padding: 2px 12px 2px 24px;
}

messagedialog checkbutton.text-button > check {
  margin-left: 0;
}

messagedialog.csd.background {
  border-bottom-left-radius: 12px;
  border-bottom-right-radius: 12px;
}

messagedialog.csd .dialog-action-box {
  margin-top: -6px;
}

messagedialog.csd .dialog-action-box button,
messagedialog.csd .dialog-action-box button:first-child,
messagedialog.csd .dialog-action-box button:last-child {
  border-radius: 6px;
}

messagedialog.csd .dialog-action-box button:not(:last-child) {
  margin-right: 6px;
}

messagedialog.csd .dialog-action-box button:not(:disabled) {
  color: #${config.colorScheme.palette.base0F};
}

messagedialog.csd .dialog-action-box button.suggested-action:not(:disabled) {
  color: #${config.colorScheme.palette.base0F};
}

messagedialog.csd .dialog-action-box button.destructive-action:not(:disabled) {
  color: #${config.colorScheme.palette.base08};
}

.csd filechooser {
  background-color: #${config.colorScheme.palette.base00};
  border-radius: 0 0 12px 12px;
}

filechooser .dialog-action-box {
  border-top: 1px solid rgba(242, 213, 207, 0.12);
}

filechooser #pathbarbox {
  border-bottom: 1px solid rgba(242, 213, 207, 0.12);
  background-color: #${config.colorScheme.palette.base00};
}

filechooser stack.view {
  background-color: transparent;
  padding: 0;
}

filechooser stack.view scrolledwindow {
  background-color: transparent;
  border-radius: 0 0 12px 0;
}

filechooser stack.view scrolledwindow list {
  background-color: transparent;
}

filechooser stack.view > placesview {
  background-color: transparent;
}

filechooser stack.view > placesview > actionbar,
filechooser stack.view > placesview > actionbar > revealer > box {
  background-color: transparent;
}

filechooser stack.view frame > border {
  border: none;
}

.csd filechooser placessidebar {
  background: none;
  border-bottom-left-radius: 12px;
}

filechooser actionbar,
filechooser actionbar > revealer > box {
  background-color: transparent;
}

filechooser revealer box button label {
  padding-left: 10px;
}

/***********
 * Sidebar *
 ***********/
.sidebar {
  border-style: none;
}

stacksidebar.sidebar:dir(ltr) list,
stacksidebar.sidebar.left list,
stacksidebar.sidebar.left:dir(rtl) list,
.sidebar:not(separator):dir(ltr),
.sidebar.left:not(separator) {
  border-right: 1px solid rgba(242, 213, 207, 0.12);
  border-left-style: none;
}

stacksidebar.sidebar:dir(rtl) list,
stacksidebar.sidebar.right list,
.sidebar:not(separator):dir(rtl),
.sidebar.right:not(separator) {
  border-left: 1px solid rgba(242, 213, 207, 0.12);
  border-right-style: none;
}

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

stacksidebar.sidebar list {
  padding: 3px;
  background-color: #${config.colorScheme.palette.base00};
}

stacksidebar.sidebar row {
  min-height: 32px;
  padding: 0 3px;
  border-radius: 6px;
}

stacksidebar.sidebar row:selected {
  background-color: #${config.colorScheme.palette.base0F};
  color: rgba(0, 0, 0, 0.87);
  font-weight: 500;
}

stacksidebar.sidebar row:selected label,
stacksidebar.sidebar row:selected image {
  color: rgba(0, 0, 0, 0.87);
}

stacksidebar.sidebar row + row {
  margin-top: 3px;
}

stacksidebar.sidebar row > label {
  padding-left: 6px;
  padding-right: 6px;
  color: inherit;
}

separator.sidebar {
  background-color: rgba(242, 213, 207, 0.12);
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

placessidebar.sidebar > viewport.frame {
  border-style: none;
}

placessidebar.sidebar list {
  padding: 6px;
}

placessidebar.sidebar row {
  min-height: 32px;
  margin: 0;
  padding: 0;
  border-radius: 6px;
}

placessidebar.sidebar row > revealer {
  padding: 0 8px 0 16px;
}

placessidebar.sidebar row:selected {
  background-color: #${config.colorScheme.palette.base0F};
  font-weight: 500;
}

placessidebar.sidebar row:selected,
placessidebar.sidebar row:selected image.sidebar-icon,
placessidebar.sidebar row:selected button.sidebar-button {
  color: rgba(0, 0, 0, 0.87);
}

placessidebar.sidebar row:disabled {
  color: rgba(242, 213, 207, 0.5);
}

placessidebar.sidebar row image.sidebar-icon:dir(ltr) {
  padding-right: 8px;
}

placessidebar.sidebar row image.sidebar-icon:dir(rtl) {
  padding-left: 8px;
}

placessidebar.sidebar row label.sidebar-label {
  color: inherit;
}

placessidebar.sidebar row label.sidebar-label:dir(ltr) {
  padding-right: 2px;
}

placessidebar.sidebar row label.sidebar-label:dir(rtl) {
  padding-left: 2px;
}

placessidebar.sidebar row.sidebar-placeholder-row {
  background-color: alpha(currentColor, 0.08);
}

placessidebar.sidebar row.sidebar-new-bookmark-row {
  color: #${config.colorScheme.palette.base0F};
}

placessidebar.sidebar row.sidebar-new-bookmark-row image.sidebar-icon {
  color: #${config.colorScheme.palette.base0F};
}

placessidebar.sidebar row:drop(active) {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1), box-shadow 0ms,
    background-size 300ms cubic-bezier(0, 0, 0.2, 1),
    background-image 1200ms cubic-bezier(0, 0, 0.2, 1);
  box-shadow: inset 0 0 0 9999px alpha(currentColor, 0.08);
}

placesview .server-list-button > image {
  -gtk-icon-transform: rotate(0turn);
}

placesview .server-list-button:checked > image {
  -gtk-icon-transform: rotate(-0.5turn);
}

placesview > actionbar > revealer > box > label {
  padding-left: 8px;
  padding-right: 8px;
}

/*********
 * Paned *
 *********/
paned > separator {
  min-width: 1px;
  min-height: 1px;
  -gtk-icon-source: none;
  border-style: none;
  background-color: transparent;
  background-image: image(rgba(242, 213, 207, 0.12));
  background-size: 1px 1px;
  background-clip: content-box;
}

paned > separator.wide {
  min-width: 6px;
  min-height: 6px;
  background-color: #${config.colorScheme.palette.base00};
  background-image: image(rgba(242, 213, 207, 0.12)),
    image(rgba(242, 213, 207, 0.12));
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

/**************
 * GtkInfoBar *
 **************/
infobar {
  border: none;
  margin-bottom: 0;
}

infobar.info > revealer > box,
infobar.info:hover > revealer > box,
infobar.info:backdrop > revealer > box {
  background-color: #${config.colorScheme.palette.base00};
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
  background-color: #${config.colorScheme.palette.base0F};
  color: rgba(0, 0, 0, 0.87);
  border-radius: 12px 12px 0 0;
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
  color: rgba(0, 0, 0, 0.87);
}

infobar.action > revealer > box *:link,
infobar.action:backdrop > revealer > box *:link,
infobar.question > revealer > box *:link,
infobar.question:backdrop > revealer > box *:link {
  color: rgba(0, 0, 0, 0.87);
}

infobar.action:hover > revealer > box,
infobar.question:hover > revealer > box {
  background-color: #${config.colorScheme.palette.base06};
  border-radius: 12px 12px 0 0;
}

infobar.warning > revealer > box,
infobar.warning:backdrop > revealer > box {
  background-color: #${config.colorScheme.palette.base0A};
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
  background-color: #fdd11a;
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
  border-radius: 3px;
  box-shadow: none;
}

tooltip.background {
  background-color: rgba(48, 52, 70, 0.9);
  color: #${config.colorScheme.palette.base06};
}

tooltip.background.csd {
  border-radius: 6px;
}

tooltip decoration {
  background-color: transparent;
}

tooltip > box {
  margin: -6px;
  min-height: 24px;
  padding: 4px 8px;
}

/*****************
 * Color Chooser *
 *****************/
colorswatch.top {
  border-top-left-radius: 6px;
  border-top-right-radius: 6px;
}

colorswatch.top overlay {
  border-top-left-radius: 6px;
  border-top-right-radius: 6px;
}

colorswatch.bottom {
  border-bottom-left-radius: 6px;
  border-bottom-right-radius: 6px;
}

colorswatch.bottom overlay {
  border-bottom-left-radius: 6px;
  border-bottom-right-radius: 6px;
}

colorswatch.left,
colorswatch:first-child:not(.top) {
  border-top-left-radius: 6px;
  border-bottom-left-radius: 6px;
}

colorswatch.left overlay,
colorswatch:first-child:not(.top) overlay {
  border-top-left-radius: 6px;
  border-bottom-left-radius: 6px;
}

colorswatch.right,
colorswatch:last-child:not(.bottom) {
  border-top-right-radius: 6px;
  border-bottom-right-radius: 6px;
}

colorswatch.right overlay,
colorswatch:last-child:not(.bottom) overlay {
  border-top-right-radius: 6px;
  border-bottom-right-radius: 6px;
}

colorswatch.dark {
  color: #${config.colorScheme.palette.base06};
}

colorswatch.light {
  color: rgba(0, 0, 0, 0.87);
}

colorswatch overlay {
  transition: box-shadow 75ms cubic-bezier(0, 0, 0.2, 1);
}

colorswatch overlay:hover {
  box-shadow: 0 0 0 2px #${config.colorScheme.palette.base0F};
}

colorswatch#add-color-button {
  border-radius: 6px 6px 0 0;
}

colorswatch#add-color-button:only-child {
  border-radius: 6px;
}

colorswatch#add-color-button overlay {
  background-color: rgba(242, 213, 207, 0.04);
}

colorswatch#add-color-button overlay:hover {
  background-color: rgba(242, 213, 207, 0.12);
  box-shadow: none;
}

colorswatch#add-color-button overlay:active {
  background-color: rgba(242, 213, 207, 0.3);
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
decoration {
  transition: box-shadow 75ms cubic-bezier(0, 0, 0.2, 1);
  border-radius: 14px;
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2),
    0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12),
    0 0 16px transparent;
  border: 2px solid #${config.colorScheme.palette.base0D};
  background-clip: border-box;
  margin: 8px;
}

decoration:backdrop {
  box-shadow: 0 2px 2px -2px rgba(0, 0, 0, 0.3),
    0 1px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 2px -0.6px rgba(0, 0, 0, 0.17),
    0 0 16px transparent;
  border: 2px solid #${config.colorScheme.palette.base04};
  background-clip: border-box;
}

.maximized decoration,
.fullscreen decoration,
.tiled decoration,
.tiled-top decoration,
.tiled-right decoration,
.tiled-bottom decoration,
.tiled-left decoration {
  border-radius: 0;
  border: none;
}

.popup decoration {
  box-shadow: none;
}

.ssd decoration {
  box-shadow: 0 3px 3px rgba(0, 0, 0, 0.16), 0 0 0 2px #${config.colorScheme.palette.base0D};
  border: none;
  border-radius: 12px 12px 0 0;
}

.ssd decoration:backdrop {
  box-shadow: 0 3px 3px rgba(0, 0, 0, 0.16), 0 0 0 2px #${config.colorScheme.palette.base04};
}

.csd.popup decoration {
  border-radius: 12px;
  border: 2px solid #${config.colorScheme.palette.base07};
  background-clip: border-box;
}

tooltip.csd decoration {
  border-radius: 12px;
  box-shadow: none;
  border: none;
}

messagedialog.csd decoration {
  border-radius: 12px;
  border: none;
}

.solid-csd decoration {
  margin: 0;
  padding: 2px;
  border-radius: 0;
  box-shadow: none;
  background-color: #${config.colorScheme.palette.base00};
  border: 2px solid #${config.colorScheme.palette.base0F};
}

.solid-csd decoration:backdrop {
  background-color: #${config.colorScheme.palette.base00};
}

button.titlebutton:not(.suggested-action):not(.destructive-action) {
  min-height: 12px;
  min-width: 12px;
  padding: 0;
  margin: 0 2px;
}

button.titlebutton:not(.suggested-action):not(.destructive-action).minimize,
button.titlebutton:not(.suggested-action):not(.destructive-action).maximize,
button.titlebutton:not(.suggested-action):not(.destructive-action).close {
  color: transparent;
}

button.titlebutton:not(.suggested-action):not(.destructive-action).minimize,
button.titlebutton:not(.suggested-action):not(
    .destructive-action
  ).minimize:active,
button.titlebutton:not(.suggested-action):not(
    .destructive-action
  ).minimize:backdrop:hover,
button.titlebutton:not(.suggested-action):not(
    .destructive-action
  ).minimize:backdrop:active {
  background-color: #${config.colorScheme.palette.base09};
  color: transparent;
}

button.titlebutton:not(.suggested-action):not(
    .destructive-action
  ).minimize:hover,
button.titlebutton:not(.suggested-action):not(
    .destructive-action
  ).minimize:active {
  background-color: shade(#${config.colorScheme.palette.base09}, 0.5);
  color: transparent;
}

button.titlebutton:not(.suggested-action):not(.destructive-action).maximize,
button.titlebutton:not(.suggested-action):not(
    .destructive-action
  ).maximize:active,
button.titlebutton:not(.suggested-action):not(
    .destructive-action
  ).maximize:backdrop:hover,
button.titlebutton:not(.suggested-action):not(
    .destructive-action
  ).maximize:backdrop:active {
  background-color: #${config.colorScheme.palette.base0B};
  color: transparent;
}

button.titlebutton:not(.suggested-action):not(
    .destructive-action
  ).maximize:hover,
button.titlebutton:not(.suggested-action):not(
    .destructive-action
  ).maximize:active {
  background-color: shade(#${config.colorScheme.palette.base0B}, 0.5);
  color: transparent;
}

button.titlebutton:not(.suggested-action):not(.destructive-action).close,
button.titlebutton:not(.suggested-action):not(.destructive-action).close:active,
button.titlebutton:not(.suggested-action):not(
    .destructive-action
  ).close:backdrop:hover,
button.titlebutton:not(.suggested-action):not(
    .destructive-action
  ).close:backdrop:active {
  background-color: #${config.colorScheme.palette.base08};
  color: transparent;
}

button.titlebutton:not(.suggested-action):not(.destructive-action).close:hover,
button.titlebutton:not(.suggested-action):not(
    .destructive-action
  ).close:active {
  background-color: shade(#${config.colorScheme.palette.base08}, 0.5);
  color: transparent;
}

button.titlebutton:not(.suggested-action):not(
    .destructive-action
  ).minimize:backdrop,
button.titlebutton:not(.suggested-action):not(
    .destructive-action
  ).maximize:backdrop,
button.titlebutton:not(.suggested-action):not(
    .destructive-action
  ).close:backdrop {
  background-color: #${config.colorScheme.palette.base04};
  color: transparent;
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

cursor-handle.top:dir(ltr),
cursor-handle.bottom:dir(rtl) {
  -gtk-icon-transform: rotate(90deg);
}

cursor-handle.bottom:dir(ltr),
cursor-handle.top:dir(rtl) {
  -gtk-icon-transform: unset;
}

cursor-handle.insertion-cursor:dir(ltr),
cursor-handle.insertion-cursor:dir(rtl) {
  padding-top: 6px;
  -gtk-icon-transform: rotate(45deg);
}

.context-menu {
  font: initial;
}

.keycap {
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
  border-radius: 9999px;
  background-color: transparent;
  min-height: 20px;
  padding: 5px 10px;
}

stackswitcher.linked:not(.vertical)
  > button.text-button:not(.suggested-action):not(.destructive-action) {
  min-width: 100px;
}

stackswitcher.linked:not(.vertical)
  > button:not(.suggested-action):not(.destructive-action):focus:not(:hover) {
  box-shadow: inset 0 0 0 2px alpha(currentColor, 0.08);
}

stackswitcher.linked:not(.vertical)
  > button:not(.suggested-action):not(.destructive-action):active {
  box-shadow: inset 0 0 0 9999px alpha(#${config.colorScheme.palette.base0F}, 0.08);
  background-image: radial-gradient(
    circle,
    alpha(#${config.colorScheme.palette.base0F}, 0.08) 10%,
    transparent 0%
  );
}

stackswitcher.linked:not(.vertical)
  > button:not(.suggested-action):not(.destructive-action):checked {
  background-color: #${config.colorScheme.palette.base0F};
  color: rgba(0, 0, 0, 0.87);
}

stackswitcher button.text-button {
  min-width: 100px;
}

stackswitcher button.circular,
stackswitcher button.text-button.circular {
  min-width: 36px;
  min-height: 36px;
  padding: 0;
}

/*************
 * App Icons *
 *************/
/*********
 * Emoji *
 *********/
popover.emoji-picker {
  padding: 0;
}

popover.emoji-picker entry {
  border-bottom: 1px solid rgba(242, 213, 207, 0.12);
  border-image: none;
  border-radius: 0;
  box-shadow: none;
  background-color: transparent;
}

popover.emoji-picker scrolledwindow {
  border-bottom: 1px solid rgba(242, 213, 207, 0.12);
}

button.emoji-section {
  margin: 4px;
}

button.emoji-section:checked {
  color: #${config.colorScheme.palette.base0F};
}

button.emoji-section:not(:last-child) {
  margin-right: 0;
}

popover.emoji-picker .emoji {
  min-width: 3em;
  min-height: 3em;
  padding: 0 8px;
}

popover.emoji-picker .emoji widget {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
  border-radius: 6px;
}

popover.emoji-picker .emoji widget:hover {
  background-color: alpha(currentColor, 0.08);
}

popover.emoji-completion {
  padding: 8px 0;
}

popover.emoji-completion arrow {
  border: none;
  background: none;
}

popover.emoji-completion .emoji-completion-row {
  min-height: 28px;
  padding: 0 12px;
}

popover.emoji-completion .emoji:hover {
  background-color: alpha(currentColor, 0.08);
}

/************
 * Nautilus *
 ************/
.nautilus-window.background.csd.unified headerbar {
  box-shadow: none;
}

.nautilus-window.background.csd {
  background-color: #${config.colorScheme.palette.base00};
  border-radius: 0 0 12px 12px;
}

.nautilus-window.background.csd headerbar {
  padding-left: 12px;
  box-shadow: inset 0 1px rgba(242, 213, 207, 0.1);
}

.nautilus-window.background.csd
  > grid.horizontal
  > paned.horizontal
  > separator,
.nautilus-window.background.csd
  > deck
  > box.vertical
  > paned.horizontal
  > separator {
  margin-left: 0;
}

.nautilus-window.background.csd placessidebar {
  background-color: transparent;
  color: rgba(242, 213, 207, 0.7);
}

.nautilus-window.background.csd placessidebar > viewport.frame {
  background-color: #${config.colorScheme.palette.base00};
  color: #${config.colorScheme.palette.base0F};
  margin: 0 0 6px 6px;
  border-radius: 0 12px 12px 0;
}

.nautilus-window.background.csd placessidebar > viewport.frame > list {
  background: none;
  padding: 0 0 0 4px;
}

.nautilus-window.background.csd
  placessidebar
  > viewport.frame
  > list
  > row.activatable {
  border-radius: 6px;
}

.nautilus-window.background.csd
  placessidebar
  > viewport.frame
  > list
  > row.activatable,
.nautilus-window.background.csd
  placessidebar
  > viewport.frame
  > list
  > row.activatable
  image.sidebar-icon,
.nautilus-window.background.csd
  placessidebar
  > viewport.frame
  > list
  > row.activatable
  label.sidebar-label,
.nautilus-window.background.csd
  placessidebar
  > viewport.frame
  > list
  > row.activatable
  button.sidebar-button {
  color: #${config.colorScheme.palette.base0F};
}

.nautilus-window.background.csd
  placessidebar
  > viewport.frame
  > list
  > row.activatable:hover {
  background-color: #${config.colorScheme.palette.base01};
  color: #${config.colorScheme.palette.base0F};
}

.nautilus-window.background.csd
  placessidebar
  > viewport.frame
  > list
  > row.activatable:selected {
  background-color: #${config.colorScheme.palette.base01};
  font-weight: 700;
  border-left: 3px solid #f7768e;
}

.nautilus-window.background.csd
  placessidebar
  > viewport.frame
  > list
  > row.activatable:selected,
.nautilus-window.background.csd
  placessidebar
  > viewport.frame
  > list
  > row.activatable:selected
  image.sidebar-icon,
.nautilus-window.background.csd
  placessidebar
  > viewport.frame
  > list
  > row.activatable:selected
  label.sidebar-label,
.nautilus-window.background.csd
  placessidebar
  > viewport.frame
  > list
  > row.activatable:selected
  button.sidebar-button {
  color: #${config.colorScheme.palette.base0E};
}

.nautilus-window.background.csd
  placessidebar
  > viewport.frame
  > list
  > row.activatable:disabled,
.nautilus-window.background.csd
  placessidebar
  > viewport.frame
  > list
  > row.activatable:disabled
  image.sidebar-icon,
.nautilus-window.background.csd
  placessidebar
  > viewport.frame
  > list
  > row.activatable:disabled
  label.sidebar-label {
  color: rgba(242, 213, 207, 0.3);
}

.nautilus-window.background.csd placessidebar scrollbar {
  background: none;
  border: none;
}

.nautilus-window.background.csd paned > separator {
  background: none;
}

.nautilus-window.background.csd paned > separator.wide {
  min-width: 0;
  min-height: 0;
  background: none;
}

.nautilus-window.background.csd .nautilus-list-view {
  background-color: transparent;
  border-radius: 12px;
}

.nautilus-window.background.csd notebook {
  background: none;
}

.nautilus-window.background.csd notebook > stack {
  background-color: #${config.colorScheme.palette.base01};
  border-radius: 12px;
  border: 1px solid rgba(65, 72, 104, 0.2);
  margin: 0 6px 6px;
}

.nautilus-window.background.csd
  notebook
  scrolledwindow
  > .view:not(:selected):not(:hover):not(:checked) {
  background-color: transparent;
}

.nautilus-window.background.csd notebook scrolledwindow .view:selected {
  background-color: rgba(242, 213, 207, 0.2);
}

.nautilus-window.background.csd
  notebook
  placesview
  > stack
  > frame
  > scrolledwindow
  > viewport
  > list {
  background-color: transparent;
}

.nautilus-window.background.csd notebook placesview > actionbar {
  background-color: transparent;
  border-radius: 0 0 12px 12px;
}

.nautilus-window.background.csd
  notebook
  placesview
  > actionbar
  > revealer
  > box {
  background-color: transparent;
}

.nautilus-window.maximized,
.nautilus-window.maximized placessidebar {
  border-radius: 0;
}

.nautilus-window .floating-bar {
  min-height: 32px;
  padding: 0;
  margin: 6px;
  border-style: none;
  border-radius: 6px;
  background-color: #${config.colorScheme.palette.base0F};
  color: rgba(0, 0, 0, 0.87);
}

.nautilus-window .floating-bar button {
  margin: 4px;
  color: rgba(0, 0, 0, 0.87);
}

.nautilus-canvas-item.dim-label,
.nautilus-list-dim-label {
  color: rgba(242, 213, 207, 0.7);
}

.nemo-desktop.nemo-canvas-item,
.caja-desktop.caja-canvas-item,
.nautilus-desktop.nautilus-canvas-item {
  color: #${config.colorScheme.palette.base06};
}

@keyframes nautilus-operations-button-needs-attention {
  to {
    background-color: alpha(currentColor, 0.08);
  }
}

.nautilus-operations-button-needs-attention {
  animation: nautilus-operations-button-needs-attention 300ms
    cubic-bezier(0.4, 0, 0.2, 1) 2 alternate;
}

.nautilus-operations-button-needs-attention-multiple {
  animation: nautilus-operations-button-needs-attention 300ms
    cubic-bezier(0.4, 0, 0.2, 1) 6 alternate;
}

.path-bar-box {
  transition: background-color 75ms cubic-bezier(0, 0, 0.2, 1);
  margin: 6px 0;
  border-radius: 6px;
}

.path-bar-box button {
  margin: 0;
}

.path-bar-box.width-maximized {
  background-color: rgba(242, 213, 207, 0.04);
}

.path-bar-box.background.frame {
  border-style: none;
  background-color: rgba(242, 213, 207, 0.04);
}

.path-bar-box .path-bar button label:not(:only-child):first-child {
  margin-left: 0;
}

.path-bar-box .path-bar button label:not(:only-child):last-child {
  margin-right: 0;
}

.path-bar-box
  .linked.nautilus-path-bar
  button:not(.suggested-action):not(.destructive-action) {
  padding-left: 12px;
  padding-right: 12px;
  margin-left: 1px;
  margin-right: 1px;
}

.path-bar-box
  .linked.nautilus-path-bar
  button:not(.suggested-action):not(.destructive-action)
  label:not(:only-child):first-child {
  margin-left: 0;
}

.path-bar-box
  .linked.nautilus-path-bar
  button:not(.suggested-action):not(.destructive-action)
  label:not(:only-child):last-child {
  margin-right: 0;
}

.path-bar-box
  .linked.nautilus-path-bar
  button.text-button:not(.suggested-action):not(.destructive-action) {
  min-width: 0;
}

.path-bar-box
  .linked.nautilus-path-bar
  button.text-button.image-button:not(.suggested-action):not(
    .destructive-action
  )
  image:not(:only-child) {
  margin: 0;
}

.path-bar-box
  .linked.nautilus-path-bar
  button:not(.suggested-action):not(.destructive-action):last-child:dir(ltr),
.path-bar-box
  .linked.nautilus-path-bar
  button:not(.suggested-action):not(.destructive-action):first-child:dir(rtl) {
  color: #${config.colorScheme.palette.base0E};
  background-color: #${config.colorScheme.palette.base01};
}

.path-bar-box
  .linked.nautilus-path-bar
  button:not(.suggested-action):not(.destructive-action):last-child:dir(
    ltr
  ):disabled,
.path-bar-box
  .linked.nautilus-path-bar
  button:not(.suggested-action):not(.destructive-action):first-child:dir(
    rtl
  ):disabled {
  color: #${config.colorScheme.palette.base0E};
  background-color: #${config.colorScheme.palette.base01};
}

.windowhandle .linked.nautilus-path-bar {
  background-color: #${config.colorScheme.palette.base01};
  border-radius: 6px;
  margin: 6px 0;
}

.windowhandle
  .linked.nautilus-path-bar
  button:not(.suggested-action):not(.destructive-action) {
  margin-top: 0;
  margin-bottom: 0;
}

.windowhandle
  .linked.nautilus-path-bar
  button.current-dir:not(.suggested-action):not(.destructive-action) {
  color: #${config.colorScheme.palette.base0E};
}

.windowhandle
  .linked.nautilus-path-bar
  button.current-dir:not(.suggested-action):not(.destructive-action):hover,
.windowhandle
  .linked.nautilus-path-bar
  button.current-dir:not(.suggested-action):not(.destructive-action):active {
  background: none;
  box-shadow: none;
}

.disk-space-display.unknown {
  background-color: rgba(242, 213, 207, 0.3);
  color: rgba(242, 213, 207, 0.3);
}

.disk-space-display.used {
  background-color: #${config.colorScheme.palette.base0F};
  color: #${config.colorScheme.palette.base0F};
}

.disk-space-display.free {
  background-color: rgba(242, 213, 207, 0.12);
  color: rgba(242, 213, 207, 0.12);
}

.search-information {
  padding: 2px;
  border-bottom: 1px solid rgba(242, 213, 207, 0.12);
  background-color: #${config.colorScheme.palette.base00};
  color: #${config.colorScheme.palette.base06};
}

.conflict-row:not(:selected) {
  background-color: #6b5f2e;
}

.nautilus-window flowboxchild .icon-item-background {
  padding: 4px;
  border-radius: 6px;
}

.nautilus-window flowboxchild:selected {
  background-color: transparent;
}

.nautilus-window notebook .view:not(treeview) {
  border-radius: 6px;
}

dialog.background
  > box.dialog-vbox.vertical
  > grid.horizontal
  > scrolledwindow.frame {
  border-style: none;
}

dialog.background
  > box.dialog-vbox.vertical
  > grid.horizontal
  > box.horizontal:last-child {
  margin: -6px 0 0 -6px;
  border-top: 1px solid rgba(242, 213, 207, 0.12);
}

dialog.background
  > box.dialog-vbox.vertical
  > grid.horizontal
  > box.horizontal:last-child
  > label {
  margin: 0 8px;
}

dialog.background
  > box.dialog-vbox.vertical
  > grid.horizontal
  > box.horizontal:last-child
  > box
  > button {
  border-radius: 0;
}

.nautilus-window > popover.menu:not(:last-child) {
  padding: 3px;
}

.nautilus-window > popover.menu:not(:last-child) > stack > box > box > box {
  margin-top: -6px;
}

.nautilus-window
  > popover.menu:not(:last-child)
  > stack
  > box
  > box
  > box
  > box {
  margin-bottom: -6px;
}

.nautilus-window
  > popover.menu:not(:last-child)
  > stack
  > box
  > box
  > box
  > box.linked {
  margin-top: 1px;
}

.nautilus-window > popover.menu:not(:last-child) separator {
  margin-bottom: -2px;
}

.nautilus-menu-sort-heading {
  margin: 1px 3px;
  font-weight: 500;
}

.nautilus-menu-sort-heading:disabled {
  color: rgba(242, 213, 207, 0.7);
}

.nautilus-window paned > separator {
  background-color: #${config.colorScheme.palette.base01};
}

/*********
 * gedit *
 *********/
window.org-gnome-gedit > paned.titlebar > separator {
  background-color: transparent;
}

window.org-gnome-gedit
  > overlay
  > box.vertical
  > paned.gedit-side-panel-paned
  > box.vertical
  > stack
  > grid.horizontal
  > box.horizontal {
  margin: 4px 0;
}

window.org-gnome-gedit
  > overlay
  > box.vertical
  > paned.gedit-side-panel-paned
  > box.vertical
  > stack
  > grid.horizontal
  > scrolledwindow {
  border-bottom-left-radius: 12px;
}

window.org-gnome-gedit
  > overlay
  > box.vertical
  > paned.gedit-side-panel-paned
  stack
  scrolledwindow
  viewport.frame
  list.gedit-document-panel {
  background: none;
}

.open-document-selector-path-label {
  color: rgba(242, 213, 207, 0.7);
  font-size: smaller;
}

.open-document-selector-match {
  background-color: #${config.colorScheme.palette.base0A};
  color: rgba(0, 0, 0, 0.87);
}

.gedit-document-panel {
  background-color: #${config.colorScheme.palette.base01};
}

.gedit-document-panel row button.flat {
  margin-top: 8px;
  margin-bottom: 8px;
}

.gedit-document-panel-group-row:not(:first-child) {
  border-top: 1px solid rgba(242, 213, 207, 0.12);
}

.gedit-side-panel-paned statusbar {
  border-top: 1px solid rgba(242, 213, 207, 0.12);
  border-radius: 0 0 12px 12px;
}

.gedit-search-slider {
  margin: 4px 4px 8px;
}

.gedit-search-slider .linked:not(.vertical) > entry {
  border-radius: 6px;
}

.gedit-search-slider
  .linked:not(.vertical)
  > entry
  .gedit-search-entry-occurrences-tag {
  all: unset;
  color: rgba(242, 213, 207, 0.7);
}

.gedit-search-slider .linked:not(.vertical) > entry:dir(ltr) {
  margin-right: -66px;
  padding-right: 66px;
}

.gedit-search-slider
  .linked:not(.vertical)
  > entry:dir(ltr)
  .gedit-search-entry-occurrences-tag {
  margin-left: 6px;
}

.gedit-search-slider .linked:not(.vertical) > entry:dir(ltr) image.right {
  margin-right: 0;
}

.gedit-search-slider .linked:not(.vertical) > entry:dir(rtl) {
  margin-left: -66px;
  padding-left: 66px;
}

.gedit-search-slider
  .linked:not(.vertical)
  > entry:dir(rtl)
  .gedit-search-entry-occurrences-tag {
  margin-right: 6px;
}

.gedit-search-slider .linked:not(.vertical) > entry:dir(rtl) image.left {
  margin-left: 0;
}

.gedit-search-slider .linked:not(.vertical) > entry:not(.error) {
  background-color: #${config.colorScheme.palette.base02};
}

.gedit-search-slider .linked:not(.vertical) > entry.error ~ button {
  color: rgba(0, 0, 0, 0.6);
}

.gedit-search-slider .linked:not(.vertical) > entry.error ~ button:hover,
.gedit-search-slider .linked:not(.vertical) > entry.error ~ button:active {
  color: rgba(0, 0, 0, 0.87);
}

.gedit-search-slider .linked:not(.vertical) > entry.error ~ button:disabled {
  color: rgba(0, 0, 0, 0.26);
}

.gedit-search-slider .linked > button {
  border: solid 6px transparent;
  border-radius: 9999px;
}

.gedit-search-slider .linked > button:last-child:dir(ltr),
.gedit-search-slider .linked > button:not(:first-child):dir(rtl) {
  margin-left: -3px;
}

.gedit-search-slider .linked > button:first-child:dir(rtl),
.gedit-search-slider .linked > button:not(:last-child):dir(ltr) {
  margin-right: -3px;
}

frame.gedit-map-frame > border:dir(ltr) {
  border-style: none none none solid;
}

frame.gedit-map-frame > border:dir(rtl) {
  border-style: none solid none none;
}

/**********
 * Tweaks *
 **********/
window.background.csd stack stack stack frame > list,
window.background.csd > stack > stack > box > frame > list,
window.background.csd > stack > stack > box > box > frame > list,
window.background.csd > stack > box > stack > box > frame > list,
window.background.csd
  > stack
  > box
  > stack
  > scrolledwindow
  > viewport
  frame
  > list,
window.background.csd
  > stack
  > box
  > stack
  > box
  > scrolledwindow
  > viewport
  > frame
  > list,
window.background.csd
  > stack
  > grid
  > scrolledwindow
  > viewport
  > box
  > frame
  > list,
window.background.csd > stack > list,
window.background.csd > stack > scrolledwindow > viewport > box > list,
window.background.csd > box > stack > scrolledwindow > viewport > box > list,
preferencesgroup list,
.geary-accounts-editor-pane list,
window.background.csd.unified > deck > deck > deck list,
hdyleaflet list.view,
hdyleaflet list.frame,
leaflet list.view,
leaflet list.frame,
box.horizontal > stack.background list.view,
box.horizontal > stack.background list.frame,
hdyleaflet frame.view,
leaflet frame.view,
box.horizontal > stack.background frame.view,
hdyleaflet stack.background scrolledwindow > viewport list,
hdyleaflet overlay scrolledwindow > viewport list,
leaflet stack.background scrolledwindow > viewport list,
leaflet overlay scrolledwindow > viewport list,
box.horizontal
  > stack.background
  stack.background
  scrolledwindow
  > viewport
  list,
box.horizontal > stack.background overlay scrolledwindow > viewport list,
hdyleaflet frame:not(.view) list:not(.contacts-contact-list),
leaflet frame:not(.view) list:not(.contacts-contact-list),
box.horizontal
  > stack.background
  frame:not(.view)
  list:not(.contacts-contact-list),
list.tweak-group list,
.tweak-group-startup,
list.content:not(.conversation-listbox) {
  border-radius: 7px;
  box-shadow: none;
  border: 1px solid rgba(242, 213, 207, 0.12);
}

window.background.csd
  stack
  stack
  stack
  frame
  > list
  row.activatable:first-child,
window.background.csd > stack > list row.activatable:first-child,
preferencesgroup list row.activatable:first-child,
.geary-accounts-editor-pane list row.activatable:first-child,
window.background.csd.unified
  > deck
  > deck
  > deck
  list
  row.activatable:first-child,
hdyleaflet list.view row.activatable:first-child,
hdyleaflet list.frame row.activatable:first-child,
leaflet list.view row.activatable:first-child,
leaflet list.frame row.activatable:first-child,
box.horizontal > stack.background list.view row.activatable:first-child,
box.horizontal > stack.background list.frame row.activatable:first-child,
hdyleaflet frame.view list row.activatable:first-child,
leaflet frame.view list row.activatable:first-child,
box.horizontal > stack.background frame.view list row.activatable:first-child,
hdyleaflet
  stack.background
  scrolledwindow
  > viewport
  list
  row.activatable:first-child,
hdyleaflet overlay scrolledwindow > viewport list row.activatable:first-child,
leaflet
  stack.background
  scrolledwindow
  > viewport
  list
  row.activatable:first-child,
leaflet overlay scrolledwindow > viewport list row.activatable:first-child,
box.horizontal
  > stack.background
  stack.background
  scrolledwindow
  > viewport
  list
  row.activatable:first-child,
box.horizontal
  > stack.background
  overlay
  scrolledwindow
  > viewport
  list
  row.activatable:first-child,
hdyleaflet
  frame:not(.view)
  list:not(.contacts-contact-list)
  row.activatable:first-child,
leaflet
  frame:not(.view)
  list:not(.contacts-contact-list)
  row.activatable:first-child,
box.horizontal
  > stack.background
  frame:not(.view)
  list:not(.contacts-contact-list)
  row.activatable:first-child,
list.tweak-group list row.activatable:first-child,
.tweak-group-startup row.activatable:first-child,
list.content:not(.conversation-listbox) > row:first-child {
  border-top-left-radius: 6px;
  border-top-right-radius: 6px;
}

window.background.csd stack stack stack frame > list row.activatable:last-child,
window.background.csd > stack > list row.activatable:last-child,
preferencesgroup list row.activatable:last-child,
.geary-accounts-editor-pane list row.activatable:last-child,
window.background.csd.unified
  > deck
  > deck
  > deck
  list
  row.activatable:last-child,
hdyleaflet list.view row.activatable:last-child,
hdyleaflet list.frame row.activatable:last-child,
leaflet list.view row.activatable:last-child,
leaflet list.frame row.activatable:last-child,
box.horizontal > stack.background list.view row.activatable:last-child,
box.horizontal > stack.background list.frame row.activatable:last-child,
hdyleaflet frame.view list row.activatable:last-child,
leaflet frame.view list row.activatable:last-child,
box.horizontal > stack.background frame.view list row.activatable:last-child,
hdyleaflet
  stack.background
  scrolledwindow
  > viewport
  list
  row.activatable:last-child,
hdyleaflet overlay scrolledwindow > viewport list row.activatable:last-child,
leaflet
  stack.background
  scrolledwindow
  > viewport
  list
  row.activatable:last-child,
leaflet overlay scrolledwindow > viewport list row.activatable:last-child,
box.horizontal
  > stack.background
  stack.background
  scrolledwindow
  > viewport
  list
  row.activatable:last-child,
box.horizontal
  > stack.background
  overlay
  scrolledwindow
  > viewport
  list
  row.activatable:last-child,
hdyleaflet
  frame:not(.view)
  list:not(.contacts-contact-list)
  row.activatable:last-child,
leaflet
  frame:not(.view)
  list:not(.contacts-contact-list)
  row.activatable:last-child,
box.horizontal
  > stack.background
  frame:not(.view)
  list:not(.contacts-contact-list)
  row.activatable:last-child,
list.tweak-group list row.activatable:last-child,
.tweak-group-startup row.activatable:last-child,
list.content:not(.conversation-listbox) > row:last-child {
  border-bottom-left-radius: 6px;
  border-bottom-right-radius: 6px;
}

window.background.csd stack stack stack frame > list row.activatable:only-child,
window.background.csd > stack > list row.activatable:only-child,
preferencesgroup list row.activatable:only-child,
.geary-accounts-editor-pane list row.activatable:only-child,
window.background.csd.unified
  > deck
  > deck
  > deck
  list
  row.activatable:only-child,
hdyleaflet list.view row.activatable:only-child,
hdyleaflet list.frame row.activatable:only-child,
leaflet list.view row.activatable:only-child,
leaflet list.frame row.activatable:only-child,
box.horizontal > stack.background list.view row.activatable:only-child,
box.horizontal > stack.background list.frame row.activatable:only-child,
hdyleaflet frame.view list row.activatable:only-child,
leaflet frame.view list row.activatable:only-child,
box.horizontal > stack.background frame.view list row.activatable:only-child,
hdyleaflet
  stack.background
  scrolledwindow
  > viewport
  list
  row.activatable:only-child,
hdyleaflet overlay scrolledwindow > viewport list row.activatable:only-child,
leaflet
  stack.background
  scrolledwindow
  > viewport
  list
  row.activatable:only-child,
leaflet overlay scrolledwindow > viewport list row.activatable:only-child,
box.horizontal
  > stack.background
  stack.background
  scrolledwindow
  > viewport
  list
  row.activatable:only-child,
box.horizontal
  > stack.background
  overlay
  scrolledwindow
  > viewport
  list
  row.activatable:only-child,
hdyleaflet
  frame:not(.view)
  list:not(.contacts-contact-list)
  row.activatable:only-child,
leaflet
  frame:not(.view)
  list:not(.contacts-contact-list)
  row.activatable:only-child,
box.horizontal
  > stack.background
  frame:not(.view)
  list:not(.contacts-contact-list)
  row.activatable:only-child,
list.tweak-group list row.activatable:only-child,
.tweak-group-startup row.activatable:only-child,
list.content:not(.conversation-listbox) > row:only-child {
  border-radius: 6px;
}

window.background.csd stack stack stack frame > list row.activatable:focus,
window.background.csd > stack > list row.activatable:focus,
preferencesgroup list row.activatable:focus,
.geary-accounts-editor-pane list row.activatable:focus,
window.background.csd.unified > deck > deck > deck list row.activatable:focus,
hdyleaflet list.view row.activatable:focus,
hdyleaflet list.frame row.activatable:focus,
leaflet list.view row.activatable:focus,
leaflet list.frame row.activatable:focus,
box.horizontal > stack.background list.view row.activatable:focus,
box.horizontal > stack.background list.frame row.activatable:focus,
hdyleaflet frame.view list row.activatable:focus,
leaflet frame.view list row.activatable:focus,
box.horizontal > stack.background frame.view list row.activatable:focus,
hdyleaflet
  stack.background
  scrolledwindow
  > viewport
  list
  row.activatable:focus,
hdyleaflet overlay scrolledwindow > viewport list row.activatable:focus,
leaflet stack.background scrolledwindow > viewport list row.activatable:focus,
leaflet overlay scrolledwindow > viewport list row.activatable:focus,
box.horizontal
  > stack.background
  stack.background
  scrolledwindow
  > viewport
  list
  row.activatable:focus,
box.horizontal
  > stack.background
  overlay
  scrolledwindow
  > viewport
  list
  row.activatable:focus,
hdyleaflet
  frame:not(.view)
  list:not(.contacts-contact-list)
  row.activatable:focus,
leaflet frame:not(.view) list:not(.contacts-contact-list) row.activatable:focus,
box.horizontal
  > stack.background
  frame:not(.view)
  list:not(.contacts-contact-list)
  row.activatable:focus,
list.tweak-group list row.activatable:focus,
.tweak-group-startup row.activatable:focus,
list.content:not(.conversation-listbox) > row:focus {
  box-shadow: inset 0 0 0 2px alpha(currentColor, 0.08);
}

window.background.csd
  > box.vertical
  > overlay
  > stack
  > box.vertical
  > box.horizontal
  > revealer
  > stack
  > list
  > row.activatable,
window.background.csd
  > box.vertical
  > overlay
  > stack
  > box.vertical
  > box.horizontal
  > revealer
  > stack
  > scrolledwindow
  > viewport.frame
  > list
  > row.activatable,
window.background.csd
  > box.vertical
  > overlay
  > stack
  > box.vertical
  > box.horizontal
  > revealer
  > stack
  > box.vertical
  > stack
  > scrolledwindow
  > viewport.frame
  > list
  > row.activatable,
hdyleaflet
  > box.vertical
  > scrolledwindow
  > viewport.frame
  list:not(.view):not(.tweak-group)
  row.activatable,
leaflet
  > box.vertical
  > scrolledwindow
  > viewport.frame
  list:not(.view):not(.tweak-group)
  row.activatable,
box.horizontal
  > stack.background
  > box.vertical
  > scrolledwindow
  > viewport.frame
  list:not(.view):not(.tweak-group)
  row.activatable,
list.navigation-sidebar > row {
  border-radius: 6px;
  margin: 1px 3px;
}

window.background.csd
  > box.vertical
  > overlay
  > stack
  > box.vertical
  > box.horizontal
  > revealer
  > stack
  > list
  > row.activatable:selected,
window.background.csd
  > box.vertical
  > overlay
  > stack
  > box.vertical
  > box.horizontal
  > revealer
  > stack
  > scrolledwindow
  > viewport.frame
  > list
  > row.activatable:selected,
window.background.csd
  > box.vertical
  > overlay
  > stack
  > box.vertical
  > box.horizontal
  > revealer
  > stack
  > box.vertical
  > stack
  > scrolledwindow
  > viewport.frame
  > list
  > row.activatable:selected,
hdyleaflet
  > box.vertical
  > scrolledwindow
  > viewport.frame
  list:not(.view):not(.tweak-group)
  row.activatable:selected,
leaflet
  > box.vertical
  > scrolledwindow
  > viewport.frame
  list:not(.view):not(.tweak-group)
  row.activatable:selected,
box.horizontal
  > stack.background
  > box.vertical
  > scrolledwindow
  > viewport.frame
  list:not(.view):not(.tweak-group)
  row.activatable:selected,
list.navigation-sidebar > row:selected {
  background-color: #${config.colorScheme.palette.base02};
}

window.background.csd
  > box.vertical
  > overlay
  > stack
  > box.vertical
  > box.horizontal
  > revealer
  > stack
  > list
  > row.activatable:selected,
window.background.csd
  > box.vertical
  > overlay
  > stack
  > box.vertical
  > box.horizontal
  > revealer
  > stack
  > scrolledwindow
  > viewport.frame
  > list
  > row.activatable:selected,
window.background.csd
  > box.vertical
  > overlay
  > stack
  > box.vertical
  > box.horizontal
  > revealer
  > stack
  > box.vertical
  > stack
  > scrolledwindow
  > viewport.frame
  > list
  > row.activatable:selected,
hdyleaflet
  > box.vertical
  > scrolledwindow
  > viewport.frame
  list:not(.view):not(.tweak-group)
  row.activatable:selected,
leaflet
  > box.vertical
  > scrolledwindow
  > viewport.frame
  list:not(.view):not(.tweak-group)
  row.activatable:selected,
box.horizontal
  > stack.background
  > box.vertical
  > scrolledwindow
  > viewport.frame
  list:not(.view):not(.tweak-group)
  row.activatable:selected,
list.navigation-sidebar > row:selected,
window.background.csd
  > box.vertical
  > overlay
  > stack
  > box.vertical
  > box.horizontal
  > revealer
  > stack
  > list
  > row.activatable:selected
  image,
window.background.csd
  > box.vertical
  > overlay
  > stack
  > box.vertical
  > box.horizontal
  > revealer
  > stack
  > scrolledwindow
  > viewport.frame
  > list
  > row.activatable:selected
  image,
window.background.csd
  > box.vertical
  > overlay
  > stack
  > box.vertical
  > box.horizontal
  > revealer
  > stack
  > box.vertical
  > stack
  > scrolledwindow
  > viewport.frame
  > list
  > row.activatable:selected
  image,
hdyleaflet
  > box.vertical
  > scrolledwindow
  > viewport.frame
  list:not(.view):not(.tweak-group)
  row.activatable:selected
  image,
leaflet
  > box.vertical
  > scrolledwindow
  > viewport.frame
  list:not(.view):not(.tweak-group)
  row.activatable:selected
  image,
box.horizontal
  > stack.background
  > box.vertical
  > scrolledwindow
  > viewport.frame
  list:not(.view):not(.tweak-group)
  row.activatable:selected
  image,
list.navigation-sidebar > row:selected image,
window.background.csd
  > box.vertical
  > overlay
  > stack
  > box.vertical
  > box.horizontal
  > revealer
  > stack
  > list
  > row.activatable:selected
  label,
window.background.csd
  > box.vertical
  > overlay
  > stack
  > box.vertical
  > box.horizontal
  > revealer
  > stack
  > scrolledwindow
  > viewport.frame
  > list
  > row.activatable:selected
  label,
window.background.csd
  > box.vertical
  > overlay
  > stack
  > box.vertical
  > box.horizontal
  > revealer
  > stack
  > box.vertical
  > stack
  > scrolledwindow
  > viewport.frame
  > list
  > row.activatable:selected
  label,
hdyleaflet
  > box.vertical
  > scrolledwindow
  > viewport.frame
  list:not(.view):not(.tweak-group)
  row.activatable:selected
  label,
leaflet
  > box.vertical
  > scrolledwindow
  > viewport.frame
  list:not(.view):not(.tweak-group)
  row.activatable:selected
  label,
box.horizontal
  > stack.background
  > box.vertical
  > scrolledwindow
  > viewport.frame
  list:not(.view):not(.tweak-group)
  row.activatable:selected
  label,
list.navigation-sidebar > row:selected label {
  color: #${config.colorScheme.palette.base0E};
  font-weight: 500;
}

.csd .tweak-categories {
  border-bottom-left-radius: 12px;
}

.csd.maximized .tweak-categories,
.csd.tiled .tweak-categories {
  border-bottom-left-radius: 0;
}

.tweak {
  padding: 3px;
}

.tweak.title:hover {
  box-shadow: none;
}

.tweak-group-#${config.colorScheme.palette.base06},
.tweak-#${config.colorScheme.palette.base06},
.tweak-#${config.colorScheme.palette.base06}:hover {
  background-image: image(#${config.colorScheme.palette.base00});
}

.tweak-startup,
.tweak-startup:hover {
  background-image: image(#${config.colorScheme.palette.base00});
}

.tweak-group-startup {
  background-image: image(#${config.colorScheme.palette.base00});
}

.tweak-group-startup row.tweak-startup {
  border-radius: 6px;
  background-color: transparent;
  background-image: none;
}

row#Focus,
row#ClickMethod,
row#PrimaryWorkspaceTweak,
row#workspaces-only-on-primary {
  margin-top: 4px;
}

leaflet.titlebar > .titlebar.tweak-titlebar-left,
leaflet.titlebar > .titlebar.tweak-titlebar-right,
hdyleaflet.titlebar > .titlebar.tweak-titlebar-left,
hdyleaflet.titlebar > .titlebar.tweak-titlebar-right {
  background-color: inherit;
  box-shadow: inherit;
  transition: color 75ms cubic-bezier(0, 0, 0.2, 1);
}

leaflet.titlebar > .titlebar.tweak-titlebar-left + separator,
leaflet.titlebar > .titlebar.tweak-titlebar-right + separator,
hdyleaflet.titlebar > .titlebar.tweak-titlebar-left + separator,
hdyleaflet.titlebar > .titlebar.tweak-titlebar-right + separator {
  background-color: inherit;
  background-image: image(rgba(242, 213, 207, 0.12));
}

/************************
 * Gnome Control Center *
 ************************/
window.background.csd
  > headerbar.titlebar
  > leaflet
  > headerbar:first-child:not(:only-child),
window.background.csd
  > headerbar.titlebar
  > hdyleaflet
  > headerbar:first-child:not(:only-child) {
  border-top-left-radius: 12px;
}

window.background.csd
  > headerbar.titlebar
  > leaflet
  > headerbar:last-child:not(:only-child),
window.background.csd
  > headerbar.titlebar
  > hdyleaflet
  > headerbar:last-child:not(:only-child) {
  border-top-right-radius: 12px;
}

window.background.csd
  > headerbar.titlebar
  > leaflet
  > headerbar:first-child:only-child,
window.background.csd
  > headerbar.titlebar
  > leaflet
  > headerbar:last-child:only-child,
window.background.csd
  > headerbar.titlebar
  > hdyleaflet
  > headerbar:first-child:only-child,
window.background.csd
  > headerbar.titlebar
  > hdyleaflet
  > headerbar:last-child:only-child {
  border-top-right-radius: 12px;
  border-top-left-radius: 12px;
}

window.background.csd > stack:not(.titlebar) > stack.background {
  border-radius: 0 0 12px 12px;
}

window.background.csd > leaflet > stack.background,
window.background.csd > hdyleaflet > stack.background,
window.background.csd > box.horizontal > stack.background {
  background: none;
}

window.background.csd
  > leaflet
  > stack.background
  > widget
  > box.vertical
  > box.vertical
  > scrolledwindow
  > viewport.frame,
window.background.csd
  > hdyleaflet
  > stack.background
  > widget
  > box.vertical
  > box.vertical
  > scrolledwindow
  > viewport.frame,
window.background.csd
  > box.horizontal
  > stack.background
  > widget
  > box.vertical
  > box.vertical
  > scrolledwindow
  > viewport.frame {
  background-color: #${config.colorScheme.palette.base00};
  border-bottom-right-radius: 12px;
}

window.background.csd
  > leaflet
  > stack.background
  > widget
  > box.vertical
  > box.vertical
  > scrolledwindow
  > viewport.frame
  > box.vertical.view,
window.background.csd
  > hdyleaflet
  > stack.background
  > widget
  > box.vertical
  > box.vertical
  > scrolledwindow
  > viewport.frame
  > box.vertical.view,
window.background.csd
  > box.horizontal
  > stack.background
  > widget
  > box.vertical
  > box.vertical
  > scrolledwindow
  > viewport.frame
  > box.vertical.view {
  background: none;
}

window.background.csd > leaflet > box.vertical > scrolledwindow.view,
window.background.csd > hdyleaflet > box.vertical > scrolledwindow.view,
window.background.csd > box.horizontal > box.vertical > scrolledwindow.view {
  background-color: #${config.colorScheme.palette.base00};
  border-bottom-left-radius: 12px;
}

window.background.csd
  > leaflet
  > box.vertical
  > scrolledwindow.view
  > viewport.frame
  > stack,
window.background.csd
  > hdyleaflet
  > box.vertical
  > scrolledwindow.view
  > viewport.frame
  > stack,
window.background.csd
  > box.horizontal
  > box.vertical
  > scrolledwindow.view
  > viewport.frame
  > stack {
  background-color: transparent;
}

window.background.csd
  > leaflet
  > box.vertical
  > scrolledwindow.view
  > viewport.frame
  > stack
  list,
window.background.csd
  > hdyleaflet
  > box.vertical
  > scrolledwindow.view
  > viewport.frame
  > stack
  list,
window.background.csd
  > box.horizontal
  > box.vertical
  > scrolledwindow.view
  > viewport.frame
  > stack
  list {
  background-color: transparent;
}

window.background.csd
  > leaflet
  > box.vertical
  > scrolledwindow.view
  > viewport.frame
  > stack
  list
  row.activatable:not(:hover):not(:active):not(:selected),
window.background.csd
  > hdyleaflet
  > box.vertical
  > scrolledwindow.view
  > viewport.frame
  > stack
  list
  row.activatable:not(:hover):not(:active):not(:selected),
window.background.csd
  > box.horizontal
  > box.vertical
  > scrolledwindow.view
  > viewport.frame
  > stack
  list
  row.activatable:not(:hover):not(:active):not(:selected) {
  background-color: transparent;
}

window.background.csd.maximized
  > headerbar.titlebar
  > leaflet
  > headerbar:first-child:not(:only-child),
window.background.csd.maximized
  > headerbar.titlebar
  > hdyleaflet
  > headerbar:first-child:not(:only-child),
window.background.csd.tiled
  > headerbar.titlebar
  > leaflet
  > headerbar:first-child:not(:only-child),
window.background.csd.tiled
  > headerbar.titlebar
  > hdyleaflet
  > headerbar:first-child:not(:only-child) {
  border-top-left-radius: 0;
}

window.background.csd.maximized
  > headerbar.titlebar
  > leaflet
  > headerbar:last-child:not(:only-child),
window.background.csd.maximized
  > headerbar.titlebar
  > hdyleaflet
  > headerbar:last-child:not(:only-child),
window.background.csd.tiled
  > headerbar.titlebar
  > leaflet
  > headerbar:last-child:not(:only-child),
window.background.csd.tiled
  > headerbar.titlebar
  > hdyleaflet
  > headerbar:last-child:not(:only-child) {
  border-top-right-radius: 0;
}

window.background.csd.maximized
  > headerbar.titlebar
  > leaflet
  > headerbar:first-child:only-child,
window.background.csd.maximized
  > headerbar.titlebar
  > leaflet
  > headerbar:last-child:only-child,
window.background.csd.maximized
  > headerbar.titlebar
  > hdyleaflet
  > headerbar:first-child:only-child,
window.background.csd.maximized
  > headerbar.titlebar
  > hdyleaflet
  > headerbar:last-child:only-child,
window.background.csd.tiled
  > headerbar.titlebar
  > leaflet
  > headerbar:first-child:only-child,
window.background.csd.tiled
  > headerbar.titlebar
  > leaflet
  > headerbar:last-child:only-child,
window.background.csd.tiled
  > headerbar.titlebar
  > hdyleaflet
  > headerbar:first-child:only-child,
window.background.csd.tiled
  > headerbar.titlebar
  > hdyleaflet
  > headerbar:last-child:only-child {
  border-top-right-radius: 0;
  border-top-left-radius: 0;
}

window.background.csd.maximized > stack:not(.titlebar) > stack.background,
window.background.csd.tiled > stack:not(.titlebar) > stack.background {
  border-radius: 0;
}

window.background.csd.maximized
  > leaflet
  > stack.background
  > widget
  > box.vertical
  > box.vertical
  > scrolledwindow
  > viewport.frame,
window.background.csd.maximized
  > hdyleaflet
  > stack.background
  > widget
  > box.vertical
  > box.vertical
  > scrolledwindow
  > viewport.frame,
window.background.csd.maximized
  > box.horizontal
  > stack.background
  > widget
  > box.vertical
  > box.vertical
  > scrolledwindow
  > viewport.frame,
window.background.csd.tiled
  > leaflet
  > stack.background
  > widget
  > box.vertical
  > box.vertical
  > scrolledwindow
  > viewport.frame,
window.background.csd.tiled
  > hdyleaflet
  > stack.background
  > widget
  > box.vertical
  > box.vertical
  > scrolledwindow
  > viewport.frame,
window.background.csd.tiled
  > box.horizontal
  > stack.background
  > widget
  > box.vertical
  > box.vertical
  > scrolledwindow
  > viewport.frame {
  border-bottom-right-radius: 0;
}

window.background.csd.maximized > leaflet > box.vertical > scrolledwindow.view,
window.background.csd.maximized
  > hdyleaflet
  > box.vertical
  > scrolledwindow.view,
window.background.csd.maximized
  > box.horizontal
  > box.vertical
  > scrolledwindow.view,
window.background.csd.tiled > leaflet > box.vertical > scrolledwindow.view,
window.background.csd.tiled > hdyleaflet > box.vertical > scrolledwindow.view,
window.background.csd.tiled
  > box.horizontal
  > box.vertical
  > scrolledwindow.view {
  border-bottom-left-radius: 0;
}

dialog.background.csd
  > box.vertical.dialog-vbox
  > notebook
  > stack
  > box.horizontal
  > notebook
  > stack {
  border-radius: 0 0 12px 12px;
}

dialog.background.csd.maximized
  > box.vertical.dialog-vbox
  > notebook
  > stack
  > box.horizontal
  > notebook
  > stack,
dialog.background.csd.tiled
  > box.vertical.dialog-vbox
  > notebook
  > stack
  > box.horizontal
  > notebook
  > stack {
  border-radius: 0;
}

hdyleaflet frame > border,
leaflet frame > border,
box.horizontal > stack.background frame > border {
  border: none;
}

hdyleaflet
  > box.vertical
  > scrolledwindow
  > viewport.frame
  list:not(.view):not(.tweak-group),
leaflet
  > box.vertical
  > scrolledwindow
  > viewport.frame
  list:not(.view):not(.tweak-group),
box.horizontal
  > stack.background
  > box.vertical
  > scrolledwindow
  > viewport.frame
  list:not(.view):not(.tweak-group) {
  padding: 3px;
}

hdyleaflet frame.view list,
leaflet frame.view list,
box.horizontal > stack.background frame.view list {
  background: none;
}

hdyleaflet frame.view list > separator,
leaflet frame.view list > separator,
box.horizontal > stack.background frame.view list > separator {
  background: none;
  min-height: 0;
}

/************************
 * Gnome system monitor *
 ************************/
window#gnome-system-monitor.background.csd > box.vertical > stack {
  background-color: #${config.colorScheme.palette.base00};
  border-radius: 0 0 12px 12px;
}

window#gnome-system-monitor.background.csd
  > box.vertical
  > stack
  > box.vertical
  > revealer
  > actionbar
  > revealer
  > box {
  border-radius: 0 0 12px 12px;
}

window#gnome-system-monitor.background:not(.csd) > box.vertical > headerbar {
  box-shadow: none;
}

/************************
 * Gnome Sound Recorder *
 ************************/
stack > grid.vertical > scrolledwindow {
  border: none;
  border-radius: 0 0 12px 12px;
}

stack > grid.vertical > scrolledwindow > viewport.frame list {
  border-radius: 0 0 12px 12px;
}

stack > grid.vertical scrolledwindow.frame.emptyGrid {
  border: none;
}

/******************
 * Gnome Contacts *
 ******************/
window.background.csd scrolledwindow.contacts-contact-form {
  border-bottom-right-radius: 12px;
}

/************************
 * Epiphany (Gnome Web) *
 ************************/
tabbox {
  border: none;
  background-color: rgba(242, 213, 207, 0.04);
  padding: 3px;
  margin: 3px;
  border-radius: 9px;
}

tabbox > tab button {
  min-height: 24px;
  min-width: 24px;
  border-radius: 9999px;
  border: none;
  padding: 0;
}

/*****************
 * Gnome Weather *
 *****************/
#weather-page,
#weekly-forecast-frame {
  border-bottom-right-radius: 12px;
}

#weather-page-content-view {
  border-bottom-right-radius: 12px;
  border-bottom-left-radius: 12px;
}

/***************
 * Gnome Music *
 ***************/
window.background.csd box.vertical > overlay > stack.background {
  border-radius: 0 0 12px 12px;
}

/****************
 * Gnome Clocks *
 ****************/
/*************
 * Rhythmbox *
 *************/
window.background
  > box.vertical
  > toolbar.primary-toolbar
  > toolitem
  > box.horizontal:not(.linked)
  > button.toggle,
window.background
  > box.vertical
  > toolbar.primary-toolbar
  > toolitem
  > .linked
  > button:not(.toggle):not(.raised):not(.flat),
window.background
  > box.vertical
  > toolbar.primary-toolbar
  > toolitem
  button.flat.scale,
window.background
  > box.vertical
  > toolbar.primary-toolbar
  > toolitem
  > .linked
  > button.image-button.raised,
window.csd
  > box.vertical
  > box.vertical
  > toolbar.horizontal
  > toolitem
  > .linked
  > button,
window.csd
  > box.vertical
  > box.vertical
  > toolbar.horizontal
  > toolitem
  > box.horizontal
  > button,
window.solid-csd
  > box.vertical
  > box.vertical
  > toolbar.horizontal
  > toolitem
  > .linked
  > button,
window.solid-csd
  > box.vertical
  > box.vertical
  > toolbar.horizontal
  > toolitem
  > box.horizontal
  > button {
  min-height: 24px;
  min-width: 24px;
  padding: 6px;
  margin: 0;
}

.sidebar-paned .inline-toolbar.horizontal.sidebar-toolbar button.image-button {
  border-radius: 9999px;
}

.sidebar-paned
  .inline-toolbar.horizontal.sidebar-toolbar
  button.image-button:not(:first-child),
.sidebar-paned
  .inline-toolbar.horizontal.sidebar-toolbar
  button.image-button:not(:last-child) {
  border-top-left-radius: 9999px;
  border-bottom-left-radius: 9999px;
  border-top-right-radius: 9999px;
  border-bottom-right-radius: 9999px;
}

.sidebar-paned
  .inline-toolbar.horizontal.sidebar-toolbar
  button.image-button.image-button:not(.text-button):first-child {
  border-top-left-radius: 9999px;
  border-bottom-left-radius: 9999px;
}

.sidebar-paned
  .inline-toolbar.horizontal.sidebar-toolbar
  button.image-button.image-button:not(.text-button):last-child {
  border-top-right-radius: 9999px;
  border-bottom-right-radius: 9999px;
}

.sidebar-paned
  .inline-toolbar.horizontal.sidebar-toolbar
  button.image-button
  > widget
  > box
  > image {
  padding: 0;
}

window.csd > box.vertical > box.vertical > toolbar.horizontal,
window.solid-csd > box.vertical > box.vertical > toolbar.horizontal {
  padding: 6px;
  border-bottom: none;
  box-shadow: none;
  background-color: transparent;
}

window.csd > box.vertical > box.vertical > frame,
window.solid-csd > box.vertical > box.vertical > frame {
  margin: -1px 0;
  padding: 0;
}

window.csd > box.vertical > box.vertical > frame > border,
window.solid-csd > box.vertical > box.vertical > frame > border {
  border: none;
}

window.background
  > box.vertical
  > toolbar.primary-toolbar
  > toolitem
  > .linked
  > button.image-button.raised
  > widget
  > box
  > image {
  padding: 0;
}

/**********
 * Polari *
 **********/
.polari-room-list .sidebar {
  background: none;
}

.polari-room-list .sidebar > row.activatable:selected {
  background-color: #${config.colorScheme.palette.base0F};
  color: rgba(0, 0, 0, 0.87);
}

stack.view.polari-entry-area {
  background-color: #${config.colorScheme.palette.base00};
  border-top: 1px solid rgba(242, 213, 207, 0.12);
  border-bottom-right-radius: 12px;
}

stack.view.polari-entry-area:disabled {
  background-image: image(#${config.colorScheme.palette.base00});
}

/***********
 * Builder *
 ***********/
layouttabbar {
  border-bottom: 1px solid rgba(242, 213, 207, 0.12);
  background-color: #${config.colorScheme.palette.base00};
}

layouttabbar > box > button {
  margin: 2px 0;
}

layouttab {
  margin: 0 8px;
  border-style: none solid;
  border-width: 1px;
  border-color: rgba(0, 0, 0, 0.2);
  box-shadow: inset 0 -2px #${config.colorScheme.palette.base0F};
  background-color: #${config.colorScheme.palette.base00};
}

layouttab separator.vertical {
  margin: 8px 4px;
}

layouttab button.text-button,
layouttab button.image-button,
layouttab button {
  margin-top: 8px;
  margin-bottom: 8px;
  padding: 0 4px;
}

layout {
  border: 1px solid rgba(0, 0, 0, 0.2);
  -pnldockbin-handle-size: 1;
}

entry.search-missing {
  background-color: #${config.colorScheme.palette.base08};
  color: rgba(0, 0, 0, 0.87);
}

window.workbench treeview.image {
  color: rgba(242, 213, 207, 0.7);
}

popover.popover-selector list {
  padding: 6px;
}

popover.popover-selector list row {
  border-radius: 6px;
}

popover.popover-selector list row image:dir(ltr) {
  margin-right: 6px;
}

popover.popover-selector list row image:dir(rtl) {
  margin-left: 6px;
}

popover.popover-selector list row .accel:dir(ltr) {
  margin-left: 6px;
}

popover.popover-selector list row .accel:dir(rtl) {
  margin-right: 6px;
}

omnibar.linked:not(.vertical) entry {
  border-radius: 6px;
}

omnibar:not(:hover):not(:active) entry {
  color: rgba(242, 213, 207, 0.7);
}

popover.omnibar list row:not(:last-child) {
  border-bottom: 1px solid rgba(242, 213, 207, 0.12);
}

entry.preferences-search {
  border-bottom: 1px solid rgba(242, 213, 207, 0.12);
  box-shadow: none;
  background-color: #${config.colorScheme.palette.base00};
}

preferences stacksidebar.sidebar list {
  background-color: #${config.colorScheme.palette.base01};
}

preferences stacksidebar.sidebar:dir(ltr) list,
preferences stacksidebar.sidebar:dir(rtl) list {
  border-style: none;
}

preferences > box > box:dir(ltr) {
  border-right: 1px solid rgba(242, 213, 207, 0.12);
}

preferences > box > box:dir(rtl) {
  border-left: 1px solid rgba(242, 213, 207, 0.12);
}

popover.messagepopover.background {
  padding: 0;
}

popover.messagepopover .popover-action-area button {
  padding: 8px 16px;
  border-top: 1px solid rgba(242, 213, 207, 0.12);
  border-radius: 0;
}

popover.messagepopover .popover-action-area button:first-child {
  border-bottom-left-radius: 6px;
}

popover.messagepopover .popover-action-area button:last-child {
  border-bottom-right-radius: 6px;
}

popover.messagepopover .popover-content-area {
  margin: 16px;
}

popover.transfers list {
  background-color: transparent;
}

popover.transfers list row:not(:first-child) {
  border-top: 1px solid rgba(242, 213, 207, 0.12);
}

popover.transfers list row > box {
  padding: 10px;
}

dockbin {
  border: 1px solid rgba(0, 0, 0, 0.2);
  -pnldockbin-handle-size: 1;
}

dockpaned {
  border: 1px solid rgba(0, 0, 0, 0.2);
}

eggsearchbar box.search-bar {
  padding: 0 8px;
  border-bottom: 1px solid rgba(242, 213, 207, 0.12);
  background-color: #${config.colorScheme.palette.base00};
}

docktabstrip {
  padding: 0 8px;
  border-bottom: 1px solid rgba(242, 213, 207, 0.12);
  background-color: #${config.colorScheme.palette.base00};
}

docktab {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1), background-size 0ms,
    background-image 0ms;
  min-height: 24px;
  min-width: 24px;
  margin-bottom: -1px;
  padding: 6px 6px;
  border-width: 1px;
  border-color: transparent;
  box-shadow: inset 0 -2px transparent;
  background-image: radial-gradient(circle, #${config.colorScheme.palette.base0F} 10%, transparent 0%);
  background-repeat: no-repeat;
  background-position: center;
  background-size: 0% 0%;
  color: rgba(242, 213, 207, 0.7);
  font-weight: 500;
}

docktab:hover {
  background-color: alpha(currentColor, 0.08);
  color: #${config.colorScheme.palette.base06};
}

docktab:checked {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1),
    background-size 225ms cubic-bezier(0, 0, 0.2, 1),
    background-image 525ms cubic-bezier(0, 0, 0.2, 1);
  box-shadow: inset 0 -2px #${config.colorScheme.palette.base0F};
  background-color: transparent;
  background-image: radial-gradient(circle, transparent 10%, transparent 0%);
  background-size: 1000% 1000%;
  color: #${config.colorScheme.palette.base06};
}

dockoverlayedge {
  background-color: #${config.colorScheme.palette.base00};
}

dockoverlayedge docktabstrip {
  padding: 0;
  border: none;
}

dockoverlayedge.left-edge docktab:checked {
  box-shadow: inset -2px 0 #${config.colorScheme.palette.base0F};
}

dockoverlayedge.right-edge docktab:checked {
  box-shadow: inset 2px 0 #${config.colorScheme.palette.base0F};
}

pillbox {
  background-color: #${config.colorScheme.palette.base00};
  border-radius: 6px;
}

layoutpane entry.search {
  border-bottom: 1px solid rgba(242, 213, 207, 0.12);
  box-shadow: none;
  background-color: #${config.colorScheme.palette.base00};
}

editortweak entry.search {
  margin-bottom: -1px;
  box-shadow: none;
  background-color: transparent;
}

.gb-search-entry-occurrences-tag {
  box-shadow: none;
  background-color: transparent;
}

docktabstrip {
  min-height: 39px;
}

window.workbench preferences preferencesgroup list entry {
  padding-top: 8px;
  padding-bottom: 8px;
}

button.run-arrow-button {
  padding-left: 10px;
  padding-right: 10px;
}

button.dzlmenubutton image {
  min-width: 30px;
}

button.dzlmenubutton image.arrow {
  min-width: 27px;
}

button.dzlmenubuttonitem {
  color: #${config.colorScheme.palette.base06};
  font-weight: normal;
}

button.dzlmenubuttonitem:disabled {
  color: rgba(242, 213, 207, 0.5);
}

idelayoutstackheader {
  border-bottom: 1px solid rgba(242, 213, 207, 0.12);
}

idelayoutstackheader button:checked {
  color: #${config.colorScheme.palette.base06};
}

ideeditorutilities > dzldockpaned > box > stackswitcher {
  padding: 8px 0;
  background-color: #${config.colorScheme.palette.base00};
}

ideeditorutilities > dzldockpaned > box > stackswitcher:dir(ltr) {
  border-right: 1px solid rgba(242, 213, 207, 0.12);
}

ideeditorutilities > dzldockpaned > box > stackswitcher:dir(rtl) {
  border-left: 1px solid rgba(242, 213, 207, 0.12);
}

ideeditorutilities > dzldockpaned > box > stackswitcher button {
  border-radius: 0;
  box-shadow: none;
  background-color: transparent;
}

ideeditorutilities > dzldockpaned > box > stackswitcher button:active {
  background-image: radial-gradient(
    circle,
    rgba(238, 190, 190, 0.7) 10%,
    transparent 0%
  );
}

ideeditorutilities > dzldockpaned > box > stackswitcher button:checked {
  background-color: transparent;
  color: #${config.colorScheme.palette.base06};
}

ideeditorutilities > dzldockpaned > box > stackswitcher button:dir(ltr) {
  margin-right: -1px;
}

ideeditorutilities
  > dzldockpaned
  > box
  > stackswitcher
  button:dir(ltr):checked {
  box-shadow: inset -2px 0 #${config.colorScheme.palette.base0F};
}

ideeditorutilities > dzldockpaned > box > stackswitcher button:dir(rtl) {
  margin-left: -1px;
}

ideeditorutilities
  > dzldockpaned
  > box
  > stackswitcher
  button:dir(rtl):checked {
  box-shadow: inset 2px 0 #${config.colorScheme.palette.base0F};
}

ideeditorsidebar notebook header {
  background: transparent;
}

popover.messagepopover list {
  border: 1px solid rgba(242, 213, 207, 0.12);
}

popover.messagepopover list row:not(:last-child) {
  border-bottom: 1px solid rgba(242, 213, 207, 0.12);
}

/**********
 * Photos *
 **********/
GdMainIconView.content-view {
  -gdmainiconview-icon-size: 48;
}

.documents-counter {
  margin: 8px;
  border-radius: 9999px;
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2),
    0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12);
  background-color: #${config.colorScheme.palette.base0F};
  color: rgba(0, 0, 0, 0.87);
  font-weight: bold;
}

.documents-scrolledwin.frame {
  border-style: none;
}

.documents-scrolledwin.frame frame.content-view > border {
  border-style: none;
}

.photos-fade-in {
  opacity: 1;
  transition: opacity 75ms cubic-bezier(0, 0, 0.2, 1);
}

.photos-fade-out {
  opacity: 0;
  transition: opacity 75ms cubic-bezier(0, 0, 0.2, 1);
}

button.photos-filter-preview {
  color: #${config.colorScheme.palette.base06};
  font-weight: normal;
}

button.photos-filter-preview:checked {
  background-color: alpha(currentColor, 0.06);
  color: #${config.colorScheme.palette.base06};
}

button.photos-filter-preview:checked image {
  color: #${config.colorScheme.palette.base06};
}

overlay grid.horizontal > revealer > scrolledwindow.frame:dir(ltr) {
  border-style: none none none solid;
}

overlay grid.horizontal > revealer > scrolledwindow.frame:dir(rtl) {
  border-style: none solid none none;
}

/*********
 * Music *
 *********/
.side-panel:dir(ltr) {
  border-style: solid;
  border-color: rgba(242, 213, 207, 0.12);
}

.side-panel:dir(rtl) {
  border-style: solid;
  border-color: rgba(242, 213, 207, 0.12);
}

.side-panel .view {
  background-image: image(#${config.colorScheme.palette.base01});
}

.side-panel .view:hover {
  background-image: image(#363636);
}

.side-panel .view:selected {
  background-image: image(#${config.colorScheme.palette.base0F});
}

.side-panel .view:selected:hover {
  background-image: image(rgba(210, 210, 210, 0.9896));
}

.songs-list:hover {
  background-image: image(alpha(currentColor, 0.08));
}

frame.documents-dropdown {
  margin: 8px;
}

frame.documents-dropdown > border {
  border: none;
}

box.vertical > revealer > toolbar.search-bar {
  border-bottom: 1px solid rgba(242, 213, 207, 0.12);
  background-clip: border-box;
}

box.vertical > revealer > toolbar.search-bar button > widget {
  -gtk-icon-source: -gtk-icontheme('pan-down-symbolic');
}

/*************
 * Documents *
 *************/
.documents-scrolledwin {
  background-color: transparent;
}

.documents-scrolledwin .content-view:not(:selected):not(:hover) {
  background-color: transparent;
}

.documents-scrolledwin viewport.frame {
  background-color: transparent;
}

.documents-scrolledwin
  viewport.frame
  widget
  > frame.content-view:not(:selected):not(:hover) {
  background-color: transparent;
}

.documents-scrolledwin
  viewport.frame
  widget
  > frame.content-view:not(:selected):not(:hover)
  border {
  border: none;
}

/*******************
 * Document Viewer *
 *******************/
window.background.csd evview.view.content-view {
  border-radius: 0 0 12px 12px;
}

/*******************
 * Archive Manager *
 *******************/
.background.csd > grid.horizontal > paned.horizontal > scrolledwindow {
  border-radius: 0 0 12px 12px;
  background-color: #${config.colorScheme.palette.base00};
}

.background.csd
  > grid.horizontal
  > paned.horizontal
  > box.vertical
  > scrolledwindow {
  border-radius: 0 0 0 12px;
  background-color: #${config.colorScheme.palette.base00};
}

/************
 * Terminal *
 ************/
terminal-window decoration {
  padding: 0 2px 3px 2px;
  background-color: #${config.colorScheme.palette.base00};
  border-radius: 12px;
}

terminal-window.background.csd,
terminal-window.background.csd.maximized {
  border-radius: 0 0 0 0;
}

terminal-window notebook > header > box {
  margin: -2px -2px -2px 1px;
}

terminal-window notebook > header > box button {
  min-height: 24px;
  min-width: 24px;
  padding: 3px;
}

window.background > box.vertical > box.horizontal > frame > border {
  border-width: 0 1px 0 0;
}

window.background
  > box.vertical
  > box.horizontal
  > frame
  > scrolledwindow
  > viewport.frame
  list {
  border-bottom-left-radius: 12px;
}

window.background
  > box.vertical
  > box.horizontal
  > stack
  > widget
  > notebook.frame {
  border-width: 0;
}

window.background
  > box.vertical
  > box.horizontal
  > stack
  > widget
  > notebook.frame
  > stack {
  border-bottom-right-radius: 12px;
}

.tilix-background,
.tilix-background vte-terminal {
  border-radius: 0 0 12px 12px;
}

/*********
 * To Do *
 *********/
task-list-view taskrow {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
  margin: 0 -8px;
}

task-list-view taskrow:hover {
  transition: none;
}

task-list-view taskrow label {
  margin: 0 8px;
}

task-list-view taskrow image.dim-label {
  min-width: 16px;
}

task-list-view > box > revealer > box > button {
  margin: -6px;
}

task-list-view > box > revealer > box > button .dim-label {
  color: inherit;
}

tasklistview taskrow {
  outline: none;
}

tasklistview taskrow entry,
tasklistview taskrow entry:focus,
tasklistview taskrow entry:disabled {
  box-shadow: none;
}

tasklistview taskrow image.dim-label {
  min-width: 16px;
}

tasklistview > box > revealer > box > button {
  margin: -6px;
}

tasklistview > box > revealer > box > button .dim-label {
  color: inherit;
}

/*******
 * Eog *
 *******/
#eog-thumb-nav scrolledwindow {
  border-top: none;
}

/*************
 * Evolution *
 *************/
frame.taskbar > border {
  border-style: solid none none;
}

box.vertical > paned.horizontal notebook widget .frame {
  border-style: none;
}

/***********
 * Fractal *
 ***********/
.background.csd.main-window .sidebar.rooms-sidebar {
  border-bottom-left-radius: 12px;
}

/********
 * Gitg *
 ********/
frame.commit-frame > border {
  border-style: solid none none;
}

/**************
 * Characters *
 **************/
box.dialog-vbox scrolledwindow.related {
  border: 1px solid rgba(0, 0, 0, 0.2);
}

list.categories {
  background-image: image(#${config.colorScheme.palette.base01});
}

/*********
 * Boxes *
 *********/
.transparent-bg + stack overlay > label {
  min-height: 24px;
  padding: 0 4px;
  border-radius: 6px;
  background-color: #${config.colorScheme.palette.base01};
  color: #${config.colorScheme.palette.base06};
}

/**************
 * Calculator *
 **************/
button.title label {
  min-height: 36px;
}

/*********
 * Geary *
 *********/
window.background.csd.geary-main-window
  > deck
  > overlay
  > box.vertical
  > paned.horizontal
  > box.sidebar.vertical,
window#GearyMainWindow.background.csd
  > deck
  > overlay
  > box.vertical
  > paned.horizontal
  > box.sidebar.vertical {
  border-bottom-left-radius: 12px;
}

window.background.csd.geary-main-window
  > deck
  > overlay
  > box.vertical
  > paned.horizontal
  > box.sidebar.vertical
  statusbar,
window#GearyMainWindow.background.csd
  > deck
  > overlay
  > box.vertical
  > paned.horizontal
  > box.sidebar.vertical
  statusbar {
  border-bottom-left-radius: 12px;
}

window.background.csd.geary-main-window stack#conversation_viewer,
window#GearyMainWindow.background.csd stack#conversation_viewer {
  border-bottom-right-radius: 12px;
}

window.background.csd.geary-main-window
  stack#conversation_viewer
  scrolledwindow.geary-conversation-scroller
  viewport.frame
  list.conversation-listbox,
window#GearyMainWindow.background.csd
  stack#conversation_viewer
  scrolledwindow.geary-conversation-scroller
  viewport.frame
  list.conversation-listbox {
  background: none;
  border-bottom-right-radius: 12px;
}

window.background.csd.geary-main-window
  stack#conversation_viewer
  .geary-expanded,
window#GearyMainWindow.background.csd
  stack#conversation_viewer
  .geary-expanded {
  animation: none;
  background-image: none;
}

window.background.csd.geary-main-window
  stack#conversation_viewer
  .geary-expanded
  > .geary-composer-embed
  actionbar
  > revealer
  > box,
window#GearyMainWindow.background.csd
  stack#conversation_viewer
  .geary-expanded
  > .geary-composer-embed
  actionbar
  > revealer
  > box {
  border-radius: 0;
}

window.background.csd.geary-main-window
  stack#conversation_viewer
  .geary-expanded
  > .geary-composer-embed
  headerbar,
window#GearyMainWindow.background.csd
  stack#conversation_viewer
  .geary-expanded
  > .geary-composer-embed
  headerbar {
  color: #${config.colorScheme.palette.base06};
  background-color: #${config.colorScheme.palette.base00};
  box-shadow: none;
  border-bottom: 1px solid rgba(0, 0, 0, 0.2);
}

window.background.csd.geary-main-window
  stack#conversation_viewer
  .geary-composer-box
  actionbar
  > revealer
  > box,
window#GearyMainWindow.background.csd
  stack#conversation_viewer
  .geary-composer-box
  actionbar
  > revealer
  > box {
  border-bottom-left-radius: 0;
}

.geary-accounts-editor-pane frame:not(.geary-signature) > border,
.geary-accounts-editor-pane scrolledwindow.frame {
  border: none;
}

.geary-main-window.unified > deck > overlay > .geary-main-layout {
  background-color: #${config.colorScheme.palette.base00};
}

.geary-main-window.unified
  > deck
  > overlay
  > .geary-main-layout
  > leaflet
  > headerbar,
.geary-main-window.unified
  > deck
  > overlay
  > .geary-main-layout
  > leaflet
  > leaflet
  > headerbar {
  box-shadow: inset 0 -1px rgba(242, 213, 207, 0.12);
}

.geary-main-window.unified
  > deck
  > overlay
  > .geary-main-layout
  > leaflet
  > separator.sidebar,
.geary-main-window.unified
  > deck
  > overlay
  > .geary-main-layout
  > leaflet
  > leaflet
  > separator.sidebar {
  background-color: #${config.colorScheme.palette.base00};
  box-shadow: inset 0 -1px rgba(242, 213, 207, 0.12);
  transition: background-color 75ms cubic-bezier(0, 0, 0.2, 1),
    color 75ms cubic-bezier(0, 0, 0.2, 1),
    box-shadow 75ms cubic-bezier(0, 0, 0.2, 1);
}

.geary-main-window.unified
  > deck
  > overlay
  > .geary-main-layout
  > leaflet
  > separator.sidebar:backdrop,
.geary-main-window.unified
  > deck
  > overlay
  > .geary-main-layout
  > leaflet
  > leaflet
  > separator.sidebar:backdrop {
  background-color: #${config.colorScheme.palette.base00};
}

.geary-main-window.unified
  > deck
  > overlay
  > .geary-main-layout
  > leaflet
  > leaflet
  > box.vertical
  + separator.sidebar {
  min-width: 1px;
  background-color: rgba(242, 213, 207, 0.12);
}

.geary-main-window.unified frame.geary-conversation-frame scrolledwindow {
  padding: 3px;
}

.geary-main-window.unified
  frame.geary-conversation-frame
  scrolledwindow
  treeview.view {
  border: 1px solid transparent;
  border-radius: 6px;
  padding: 6px;
}

.geary-main-window.unified
  frame.geary-conversation-frame
  scrolledwindow
  treeview.view:selected,
.geary-main-window.unified
  frame.geary-conversation-frame
  scrolledwindow
  treeview.view:active {
  border-radius: 6px;
  background-color: #${config.colorScheme.palette.base0F};
  color: rgba(0, 0, 0, 0.87);
}

.geary-main-window.unified separator.geary-sidebar-pane-separator {
  min-width: 1px;
  background-color: rgba(242, 213, 207, 0.12);
}

.geary-main-window.unified
  geary-conversation-viewer#conversation_viewer
  list.background.conversation-listbox.content
  > row.activatable {
  border: 1px solid rgba(242, 213, 207, 0.12);
  border-bottom-width: 0;
  background-color: #${config.colorScheme.palette.base00};
}

.geary-main-window.unified
  geary-conversation-viewer#conversation_viewer
  list.background.conversation-listbox.content
  > row.activatable:first-child {
  border-top-left-radius: 8px;
  border-top-right-radius: 8px;
}

.geary-main-window.unified
  geary-conversation-viewer#conversation_viewer
  list.background.conversation-listbox.content
  .geary-attachment-pane {
  border-radius: 0 0 8px 8px;
}

.geary-main-window.unified
  geary-conversation-viewer#conversation_viewer
  list.background.conversation-listbox.content
  .geary-attachment-pane
  actionbar.background {
  background-color: transparent;
}

.geary-main-window.unified
  geary-conversation-viewer#conversation_viewer
  list.background.conversation-listbox.content
  .geary-attachment-pane
  actionbar.background
  > revealer
  > box {
  border-radius: 0 0 6px 6px;
}

/**************
 * Extensions *
 **************/
window.background.csd stack stack stack frame > border,
window.background.csd > stack > stack > box > frame > border,
window.background.csd > stack > stack > box > box > frame > border,
window.background.csd > stack > box > stack > box > frame > border,
window.background.csd
  > stack
  > box
  > stack
  > scrolledwindow
  > viewport
  frame
  > border,
window.background.csd
  > stack
  > box
  > stack
  > box
  > scrolledwindow
  > viewport
  > frame
  > border,
window.background.csd
  > stack
  > grid
  > scrolledwindow
  > viewport
  > box
  > frame
  > border {
  border: none;
}

window.background.csd > stack > box > box > list,
window.background.csd > stack > box > stack > scrolledwindow > viewport > list {
  border-bottom-left-radius: 12px;
}

window.background.csd
  > stack
  > box
  > .sidebar
  > scrolledwindow
  > viewport
  > list {
  padding: 0 0;
}

/***********
 * Dialogs *
 ***********/
dialog.background.csd > headerbar.titlebar {
  box-shadow: inset 0 -1px rgba(242, 213, 207, 0.12);
}

dialog.background.csd
  > box.vertical.dialog-vbox
  > grid.horizontal
  > scrolledwindow.frame
  > viewport.frame
  list:first-child {
  border-radius: 0 0 0 12px;
}

dialog.background.csd
  > box.vertical.dialog-vbox
  > grid.horizontal
  > scrolledwindow.frame
  > viewport.frame
  list:last-child {
  border-radius: 0 0 12px 0;
}

dialog.background.csd > box.vertical.dialog-vbox > stack > scrolledwindow,
dialog.background.csd
  > box.vertical.dialog-vbox
  > stack
  > stack
  > scrolledwindow {
  border-radius: 0 0 12px 12px;
  background-color: #${config.colorScheme.palette.base00};
}

dialog.background.csd
  > box.vertical.dialog-vbox
  > stack
  > scrolledwindow
  iconview.view:not(:hover):not(:selected):not(:active),
dialog.background.csd
  > box.vertical.dialog-vbox
  > stack
  > stack
  > scrolledwindow
  iconview.view:not(:hover):not(:selected):not(:active) {
  background-color: transparent;
}

dialog.background.csd
  > box.vertical.dialog-vbox
  > stack
  > scrolledwindow
  > viewport.frame
  > list {
  border-radius: 0 0 12px 12px;
}

dialog.background.csd
  > box.vertical.dialog-vbox
  > stack
  > scrolledwindow
  > viewport.frame
  > list
  row.activatable:not(:hover):not(:selected):not(:active) {
  background-color: transparent;
}

dialog.background.csd > box.vertical.dialog-vbox > stack toolbar.toolbar {
  border-radius: 0 0 12px 12px;
}

dialog.background.csd > box.vertical.dialog-vbox > notebook > stack {
  border-radius: 0 0 12px 12px;
}

dialog.background.csd stack scrolledwindow.frame {
  border-radius: 6px;
}

dialog.background.csd stack scrolledwindow.frame textview.view {
  border-radius: 6px;
}

dialog.background.csd stack scrolledwindow.frame textview.view > text {
  background: none;
}

dialog.background.csd stack scrolledwindow viewport.frame.view {
  border-radius: 6px;
}

window.background.csd.unified headerbar {
  box-shadow: none;
}

window.background.csd.unified headerbar.selection-mode {
  box-shadow: none;
}

window.background.csd.unified,
window.background.csd.unified > decoration,
window.background.csd.unified > decoration-overlay {
  border-radius: 12px;
  border: none;
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2),
    0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12),
    0 0 0 2px #${config.colorScheme.palette.base0D}, 0 0 16px transparent;
}

window.background.csd.unified:backdrop,
window.background.csd.unified > decoration:backdrop,
window.background.csd.unified > decoration-overlay:backdrop {
  box-shadow: 0 2px 2px -2px rgba(0, 0, 0, 0.3),
    0 1px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 2px -0.6px rgba(0, 0, 0, 0.17),
    0 0 0 2px #${config.colorScheme.palette.base04}, 0 0 16px transparent;
}

window.background.csd.unified.tiled > decoration-overlay,
window.background.csd.unified.tiled-top > decoration-overlay,
window.background.csd.unified.tiled-right > decoration-overlay,
window.background.csd.unified.tiled-bottom > decoration-overlay,
window.background.csd.unified.tiled-left > decoration-overlay,
window.background.csd.unified.maximized > decoration-overlay,
window.background.csd.unified.fullscreen > decoration-overlay {
  box-shadow: none;
}

window.background.csd.unified.tiled,
window.background.csd.unified.tiled > decoration,
window.background.csd.unified.tiled > decoration-overlay,
window.background.csd.unified.tiled-top,
window.background.csd.unified.tiled-top > decoration,
window.background.csd.unified.tiled-top > decoration-overlay,
window.background.csd.unified.tiled-right,
window.background.csd.unified.tiled-right > decoration,
window.background.csd.unified.tiled-right > decoration-overlay,
window.background.csd.unified.tiled-bottom,
window.background.csd.unified.tiled-bottom > decoration,
window.background.csd.unified.tiled-bottom > decoration-overlay,
window.background.csd.unified.tiled-left,
window.background.csd.unified.tiled-left > decoration,
window.background.csd.unified.tiled-left > decoration-overlay,
window.background.csd.unified.maximized,
window.background.csd.unified.maximized > decoration,
window.background.csd.unified.maximized > decoration-overlay,
window.background.csd.unified.fullscreen,
window.background.csd.unified.fullscreen > decoration,
window.background.csd.unified.fullscreen > decoration-overlay {
  border-radius: 0;
}

/*********
 * Tilix *
 *********/
overlay > revealer.left > scrolledwindow.frame,
overlay > revealer.right > scrolledwindow.frame {
  border-style: none;
  box-shadow: 0 8px 6px -5px rgba(0, 0, 0, 0.2),
    0 16px 14.4px 2px rgba(0, 0, 0, 0.14), 0 6px 18px 5px rgba(0, 0, 0, 0.12);
}

overlay > revealer.left > scrolledwindow.frame {
  margin-right: 32px;
}

overlay > revealer.right > scrolledwindow.frame {
  margin-left: 32px;
}

.terminix-session-sidebar,
.tilix-session-sidebar {
  background-image: image(#${config.colorScheme.palette.base02});
}

.terminal-titlebar button {
  border-radius: 0;
}

button.image-button.session-new-button {
  min-width: 32px;
}

notebook.tilix-background tab > box > stack {
  margin: -6px;
}

button.flat.tilix-small-button {
  min-height: 20px;
  min-width: 16px;
}

window > notebook > stack {
  margin: 0 3px 3px 3px;
}

window > notebook {
  border-top-left-radius: 0px;
  border-top-right-radius: 0px;
}

/**************
 * Terminator *
 **************/
.terminator-terminal-window paned > separator {
  background-color: #${config.colorScheme.palette.base00};
}

.terminator-terminal-window notebook.frame {
  border-style: none;
}

/*************
 * Ubitquity *
 *************/
#live_installer .menubar progressbar trough {
  border-radius: 4px;
  background-color: rgba(242, 213, 207, 0.12);
}

/***********
 * Eclipse *
 ***********/
window.background > box.vertical > scrolledwindow > widget toolbar {
  padding: 2px;
}

window.background > box.vertical > scrolledwindow > widget toolbar separator,
window.background > box.vertical > scrolledwindow > widget toolbar button {
  margin: 2px;
}

window.background > box.vertical > scrolledwindow > widget toolbar button {
  border-radius: 6px;
}

/************
 * Chromium *
 ************/
window.background.chromium {
  background-color: #${config.colorScheme.palette.base02};
}

window.background.chromium decoration {
  background-clip: padding-box;
  box-shadow: 0 8px 6px -5px rgba(0, 0, 0, 0.2),
    0 16px 14.4px 2px rgba(0, 0, 0, 0.14), 0 6px 18px 5px rgba(0, 0, 0, 0.12);
}

window.background.chromium entry,
window.background.chromium > button {
  border: 1px solid #${config.colorScheme.palette.base03};
}

window.background.chromium > button {
  color: #${config.colorScheme.palette.base0F};
}

window.background.chromium > button:disabled {
  color: rgba(242, 213, 207, 0.3);
}

window.background.chromium menubar,
window.background.chromium headerbar {
  color: rgba(242, 213, 207, 0.7);
}

window.background.chromium headerbar button:active {
  background-color: alpha(currentColor, 0.12);
}

window.background.chromium spinner {
  color: #${config.colorScheme.palette.base0F};
}

window.background.chromium textview.view {
  background-color: transparent;
}

window.background.chromium treeview.view.cell:selected:focus {
  background-color: #${config.colorScheme.palette.base0F};
  color: rgba(0, 0, 0, 0.87);
}

window.background.chromium treeview.view button {
  border: 1px solid #${config.colorScheme.palette.base03};
  background-color: #${config.colorScheme.palette.base00};
}

window.background.chromium menu {
  border-color: #${config.colorScheme.palette.base04};
}

window.background.chromium menu menuitem {
  border-radius: 0;
}

tooltip.background.chromium {
  background-color: #${config.colorScheme.palette.base01};
}

/***********
 * Firefox *
 ***********/
#MozillaGtkWidget > widget text {
  background-color: #${config.colorScheme.palette.base00};
}

#MozillaGtkWidget > widget text:selected {
  background-color: #${config.colorScheme.palette.base0F};
  color: rgba(0, 0, 0, 0.87);
}

#MozillaGtkWidget > widget > separator {
  color: #${config.colorScheme.palette.base00};
}

#MozillaGtkWidget > widget > scrollbar {
  background-clip: border-box;
}

#MozillaGtkWidget > widget > frame > border {
  border-color: #${config.colorScheme.palette.base00};
}

#MozillaGtkWidget > widget > entry,
#MozillaGtkWidget > widget > button > button {
  border: 1px solid #${config.colorScheme.palette.base00};
  border-radius: 6px;
  box-shadow: none;
}

#MozillaGtkWidget > widget > entry:disabled,
#MozillaGtkWidget > widget > button > button:disabled {
  border-color: rgba(242, 213, 207, 0.12);
}

#MozillaGtkWidget > widget > entry {
  min-height: 30px;
  background-color: #${config.colorScheme.palette.base00};
}

#MozillaGtkWidget > widget > entry:focus {
  border-color: #${config.colorScheme.palette.base0F};
  box-shadow: inset 0 0 0 1px #${config.colorScheme.palette.base0F};
}

#MozillaGtkWidget > widget > entry:disabled {
  background-color: #${config.colorScheme.palette.base01};
}

#MozillaGtkWidget > widget > button > button {
  padding: 4px 8px;
  background-size: auto;
}

#MozillaGtkWidget > widget > button > button:hover {
  box-shadow: inset 0 0 0 9999px alpha(currentColor, 0.08);
}

#MozillaGtkWidget > widget > button > button:active {
  background-image: image(alpha(currentColor, 0.12));
}

#MozillaGtkWidget > widget > checkbutton > check,
#MozillaGtkWidget > widget > radiobutton > radio {
  margin: 0;
  padding: 0;
}

#MozillaGtkWidget
  > widget
  > checkbutton
  > check:not(:checked):not(:indeterminate),
#MozillaGtkWidget
  > widget
  > radiobutton
  > radio:not(:checked):not(:indeterminate) {
  color: #838ba7;
}

#MozillaGtkWidget
  > widget
  > checkbutton
  > check:not(:checked):not(:indeterminate):hover,
#MozillaGtkWidget
  > widget
  > checkbutton
  > check:not(:checked):not(:indeterminate):active,
#MozillaGtkWidget
  > widget
  > radiobutton
  > radio:not(:checked):not(:indeterminate):hover,
#MozillaGtkWidget
  > widget
  > radiobutton
  > radio:not(:checked):not(:indeterminate):active {
  color: #838ba7;
}

#MozillaGtkWidget
  > widget
  > checkbutton
  > check:not(:checked):not(:indeterminate):disabled,
#MozillaGtkWidget
  > widget
  > radiobutton
  > radio:not(:checked):not(:indeterminate):disabled {
  color: rgba(127, 132, 165, 0.5);
}

#MozillaGtkWidget menu {
  border: none;
}

#MozillaGtkWidget > widget > menubar {
  color: rgba(242, 213, 207, 0.7);
}

#MozillaGtkWidget > widget > menubar:hover {
  color: #${config.colorScheme.palette.base06};
}

#MozillaGtkWidget > widget > menubar:disabled {
  color: rgba(242, 213, 207, 0.3);
}

#MozillaGtkWidget > widget > frame {
  color: #${config.colorScheme.palette.base03};
}

#MozillaGtkWidget menu > separator {
  color: #${config.colorScheme.palette.base03};
}

window.background:not(.csd) > window > menu menuitem {
  transition: none;
}

/************
 * Inkscape *
 ************/
#ToolboxCommon > #AuxToolbox #StyleSwatch {
  font-size: smaller;
}

#ToolboxCommon > #AuxToolbox #Kludge {
  padding: 0;
}

#ToolboxCommon > #AuxToolbox spinbutton,
#ToolboxCommon > #AuxToolbox entry {
  min-height: 32px;
}

#ToolboxCommon > #AuxToolbox button:not(.up):not(.down) {
  min-height: 24px;
  min-width: 16px;
  padding: 4px 8px;
}

#ToolboxCommon > #AuxToolbox spinbutton button {
  border-width: 4px;
}

#ToolboxCommon > toolbar.vertical {
  margin-top: -4px;
}

#ToolboxCommon > toolbar.vertical button {
  min-height: 24px;
  min-width: 24px;
  padding: 4px;
}

#CanvasTable button {
  min-height: 16px;
  min-width: 16px;
  padding: 0;
}

#CanvasTable #HorizontalScrollbar {
  border-top: 1px solid rgba(242, 213, 207, 0.12);
}

#CanvasTable #VerticalScrollbar:dir(ltr) {
  border-left: 1px solid rgba(242, 213, 207, 0.12);
}

#CanvasTable #VerticalScrollbar:dir(rtl) {
  border-right: 1px solid rgba(242, 213, 207, 0.12);
}

#Canvas_and_Dock frame > border {
  border: none;
}

#Canvas_and_Dock widget > widget > button.flat {
  min-height: 16px;
  min-width: 16px;
  padding: 4px;
}

#Canvas_and_Dock widget > widget > box.horizontal image {
  padding: 4px;
}

#Canvas_and_Dock box.horizontal > box.vertical > button.flat {
  min-height: 16px;
  min-width: 24px;
  padding: 8px 4px;
}

scrolledwindow#DialogNotebook
  > viewport.frame
  > notebook.frame
  button.close-button
  image {
  padding: 4px;
}

/***********
 * Synapse *
 ***********/
/***************
 * Libreoffice *
 ***************/
window.background
  > grid
  > widget
  > widget
  > scrolledwindow
  > viewport
  > grid
  > box
  > box
  > frame
  > box {
  background-color: #${config.colorScheme.palette.base00};
}

/*********
 * Pamac *
 *********/
window.background.csd
  > box.vertical
  > overlay
  > stack
  > box.vertical
  > box.horizontal
  > revealer
  > stack
  > list,
window.background.csd
  > box.vertical
  > overlay
  > stack
  > box.vertical
  > box.horizontal
  > revealer
  > stack
  > scrolledwindow
  > viewport.frame
  > list,
window.background.csd
  > box.vertical
  > overlay
  > stack
  > box.vertical
  > box.horizontal
  > revealer
  > stack
  > box.vertical
  > stack
  > scrolledwindow
  > viewport.frame
  > list {
  border: none;
  border-radius: 0;
}

/***********
 * GnuCash *
 ***********/
#gnc-id-main-window gnc-id-sheet-list > scrolledwindow {
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2),
    0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12);
  margin-top: -2px;
  border: 2px solid #${config.colorScheme.palette.base0F};
}

#gnc-id-main-window treeview.view {
  background-color: #${config.colorScheme.palette.base00};
}

/*********
 * Unity *
 *********/
UnityDecoration {
  -unitydecoration-extents: 28px 0 0 0;
  -unitydecoration-input-extents: 8px;
  -unitydecoration-shadow-offset-x: 0;
  -unitydecoration-shadow-offset-y: 3px;
  -unitydecoration-active-shadow-color: rgba(0, 0, 0, 0.48);
  -unitydecoration-active-shadow-radius: 18px;
  -unitydecoration-inactive-shadow-color: rgba(0, 0, 0, 0.32);
  -unitydecoration-inactive-shadow-radius: 6px;
  -unitydecoration-glow-size: 8px;
  -unitydecoration-glow-color: #${config.colorScheme.palette.base0F};
  -unitydecoration-title-indent: 4px;
  -unitydecoration-title-fade: 32px;
  -unitydecoration-title-alignment: 0;
}

UnityDecoration .top {
  padding: 0 2px;
  border-style: none;
  border-radius: 12px 12px 0 0;
  box-shadow: inset 0 1px rgba(242, 213, 207, 0.1);
  background-color: #${config.colorScheme.palette.base00};
  color: #${config.colorScheme.palette.base06};
}

UnityDecoration .top:backdrop {
  background-color: #${config.colorScheme.palette.base00};
  color: rgba(242, 213, 207, 0.7);
}

UnityDecoration .menuitem {
  color: rgba(242, 213, 207, 0.7);
}

UnityDecoration .menuitem:hover {
  box-shadow: inset 0 -2px currentColor;
  background-color: transparent;
  color: #${config.colorScheme.palette.base06};
}

.background:not(.csd) headerbar:not(.titlebar) {
  border-radius: 0;
  box-shadow: 0 2px 2px -2px rgba(0, 0, 0, 0.3),
    0 1px 2px -1px rgba(0, 0, 0, 0.24), 0 1px 2px -0.6px rgba(0, 0, 0, 0.17);
}

.background:not(.csd) headerbar.inline-toolbar:not(.titlebar) {
  border-style: none;
}

UnityPanelWidget,
.unity-panel {
  background-color: rgba(48, 52, 70, 0.95);
  color: #${config.colorScheme.palette.base06};
}

UnityPanelWidget:backdrop,
.unity-panel:backdrop {
  color: rgba(242, 213, 207, 0.7);
}

.unity-panel.menuitem,
.unity-panel .menuitem {
  color: rgba(242, 213, 207, 0.7);
}

.unity-panel.menubar.menuitem:hover,
.unity-panel.menubar .menuitem *:hover {
  box-shadow: inset 0 -2px currentColor;
  background-color: transparent;
  color: #${config.colorScheme.palette.base06};
}

.menu IdoPlaybackMenuItem.menuitem:active {
  -gtk-icon-source: -gtk-icontheme('process-working-symbolic');
  animation: spin 1s linear infinite;
  color: #${config.colorScheme.palette.base0F};
}

/**************
 * Mate-Panel *
 **************/
.mate-panel-menu-bar menubar,
#PanelApplet-window-menu-applet-button {
  background-color: transparent;
}

.mate-panel-menu-bar {
  background-color: rgba(48, 52, 70, 0.95);
  color: rgba(242, 213, 207, 0.7);
  font-weight: 500;
}

.mate-panel-menu-bar button {
  min-height: 16px;
  min-width: 16px;
  padding: 0;
  border-radius: 0;
}

PanelToplevel.horizontal > grid > button {
  min-width: 24px;
}

PanelToplevel.vertical > grid > button {
  min-height: 24px;
}

PanelSeparator {
  color: rgba(242, 213, 207, 0.12);
}

MatePanelAppletFrameDBus {
  border-style: solid;
  border-color: rgba(242, 213, 207, 0.12);
}

.mate-panel-menu-bar.horizontal MatePanelAppletFrameDBus {
  border-width: 0 1px;
}

.mate-panel-menu-bar.vertical MatePanelAppletFrameDBus {
  border-width: 1px 0;
}

.mate-panel-menu-bar menubar > menuitem {
  color: rgba(242, 213, 207, 0.7);
}

.mate-panel-menu-bar menubar > menuitem:hover {
  color: #${config.colorScheme.palette.base06};
}

.mate-panel-menu-bar menubar > menuitem:disabled {
  color: rgba(242, 213, 207, 0.3);
}

.mate-panel-menu-bar.horizontal menubar > menuitem {
  padding: 0 8px;
}

.mate-panel-menu-bar.vertical menubar > menuitem {
  padding: 8px 0;
}

.mate-panel-menu-bar menubar menu > menuitem {
  min-height: 28px;
  padding: 0 6px;
}

.mate-panel-menu-bar #PanelApplet button {
  -gtkwidget-window-dragging: true;
}

.mate-panel-menu-bar #tasklist-button {
  border-image: radial-gradient(
      circle closest-corner at center calc(100% - 1px),
      currentColor 0%,
      transparent 0%
    )
    0 0 0/0 0 0px;
}

.mate-panel-menu-bar #tasklist-button:checked {
  border-image: radial-gradient(
      circle closest-corner at center calc(100% - 1px),
      currentColor 100%,
      transparent 0%
    )
    0 0 2/0 0 2px;
}

.mate-panel-menu-bar #tasklist-button image:dir(ltr),
.mate-panel-menu-bar #tasklist-button label:dir(rtl) {
  padding-left: 4px;
}

.mate-panel-menu-bar #tasklist-button label:dir(ltr),
.mate-panel-menu-bar #tasklist-button image:dir(rtl) {
  padding-right: 4px;
}

.mate-panel-menu-bar.vertical #tasklist-button {
  min-height: 32px;
}

.mate-panel-menu-bar.horizontal #showdesktop-button image {
  min-width: 24px;
  padding: 0 4px;
}

.mate-panel-menu-bar.vertical #showdesktop-button image {
  min-height: 24px;
  padding: 4px 0;
}

PanelApplet.wnck-applet .wnck-pager {
  background-color: transparent;
  color: #${config.colorScheme.palette.base0F};
}

PanelApplet.wnck-applet .wnck-pager:hover {
  background-color: alpha(currentColor, 0.08);
}

PanelApplet.wnck-applet .wnck-pager:active {
  background-color: alpha(currentColor, 0.12);
}

PanelApplet.wnck-applet .wnck-pager:selected {
  background-color: #${config.colorScheme.palette.base0F};
}

.mate-panel-menu-bar.horizontal #clock-applet-button label {
  padding: 0 8px;
}

.mate-panel-menu-bar.vertical #clock-applet-button label {
  padding: 8px 0;
}

#MatePanelPopupWindow {
  border: 1px solid rgba(0, 0, 0, 0.2);
  border-radius: 7px;
  box-shadow: inset 0 1px rgba(242, 213, 207, 0.1);
  background-color: #${config.colorScheme.palette.base02};
}

#MatePanelPopupWindow frame > border {
  border-style: none;
}

#MatePanelPopupWindow calendar {
  border-style: none;
}

#MatePanelPopupWindow calendar:not(:selected) {
  background-color: transparent;
}

#MatePanelPopupWindow calendar + box {
  margin-top: -5px;
  padding-top: 5px;
  border-top: 1px solid rgba(242, 213, 207, 0.12);
}

#MatePanelPopupWindow expander > title {
  min-height: 32px;
}

#MatePanelPopupWindow button {
  padding: 4px 16px;
}

#MatePanelPopupWindow > frame > box > box > box > widget {
  color: rgba(242, 213, 207, 0.12);
}

na-tray-applet {
  -natrayapplet-icon-padding: 3px;
  -natrayapplet-icon-size: 16;
}

.mate-panel-menu-bar {
  -panelmenubar-icon-visible: true;
}

.mate-panel-applet-slider {
  border: 1px solid rgba(0, 0, 0, 0.2);
  border-radius: 7px;
  box-shadow: inset 0 1px rgba(242, 213, 207, 0.1);
  background-color: #${config.colorScheme.palette.base02};
}

.mate-panel-applet-slider frame > border {
  border-style: none;
}

#PanelApplet:not(:selected) > box {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
}

#PanelApplet:selected > box {
  background-color: alpha(currentColor, 0.1);
  color: #${config.colorScheme.palette.base06};
}

#mate-menu {
  border: 1px solid rgba(0, 0, 0, 0.2);
  background-color: #${config.colorScheme.palette.base02};
}

#mate-menu button {
  min-height: 24px;
  min-width: 24px;
  padding: 4px 0;
  color: #${config.colorScheme.palette.base06};
  font-weight: normal;
}

#mate-menu button:not(.flat) {
  background-color: alpha(currentColor, 0.1);
}

#mate-menu button image,
#mate-menu button label + label {
  color: rgba(242, 213, 207, 0.7);
}

#mate-menu entry {
  margin: 0 0 4px;
}

#mate-menu entry image {
  margin: 0;
}

#mate-menu entry + button {
  margin: 0 4px 4px;
  padding: 6px;
}

.brisk-menu {
  box-shadow: inset 0 1px rgba(242, 213, 207, 0.1);
  background-color: #${config.colorScheme.palette.base02};
}

.brisk-menu entry {
  margin-bottom: -2px;
  border-bottom: 1px solid rgba(242, 213, 207, 0.12);
  border-image: none;
  box-shadow: none;
  background-color: transparent;
}

.brisk-menu entry + box > box:dir(ltr) {
  margin-right: -2px;
  border-right: 1px solid rgba(242, 213, 207, 0.12);
}

.brisk-menu entry + box > box:dir(rtl) {
  margin-left: -2px;
  border-left: 1px solid rgba(242, 213, 207, 0.12);
}

.brisk-menu .categories-list {
  padding-top: 4px;
}

.brisk-menu .categories-list button {
  margin: 0 4px;
}

.brisk-menu .categories-list button:checked {
  color: #${config.colorScheme.palette.base0F};
}

.brisk-menu .session-button {
  padding: 12px;
}

.brisk-menu .frame {
  border-style: none;
}

.brisk-menu .apps-list {
  padding: 4px 0;
  background-color: transparent;
}

.brisk-menu .apps-list row {
  padding: 0;
}

.brisk-menu .apps-list row:hover {
  box-shadow: none;
}

.brisk-menu .apps-list button {
  border-radius: 0;
  color: #${config.colorScheme.palette.base06};
  font-weight: normal;
}

/*********************
 * CAJA File manager *
 *********************/
.caja-navigation-window button.toggle.image-button {
  border-radius: 6px;
}

.caja-pathbar button {
  margin: 0 -1px 0 -2px;
}

.caja-pathbar button.slider-button {
  min-width: 24px;
}

.caja-pathbar button > widget {
  -gtk-icon-source: -gtk-icontheme('pan-down-symbolic');
  -gtkarrow-arrow-scaling: 1;
}

.caja-side-pane notebook viewport.frame,
.caja-side-pane notebook widget .vertical {
  background-color: #${config.colorScheme.palette.base00};
}

.caja-side-pane notebook,
.caja-notebook {
  border-top: 1px solid rgba(242, 213, 207, 0.12);
}

.caja-side-pane notebook .frame,
.caja-notebook .frame {
  border-style: none;
}

.caja-canvas-item {
  border-radius: 6px;
}

.caja-desktop.view .entry,
.caja-navigation-window .view .entry {
  border: none;
  border-radius: 6px;
  background-color: rgba(242, 213, 207, 0.04);
  background-image: none;
  color: #${config.colorScheme.palette.base06};
}

.caja-desktop.view .entry:selected,
.caja-navigation-window .view .entry:selected {
  background-color: alpha(currentColor, 0.06);
}

.caja-desktop.view .entry {
  background-color: #${config.colorScheme.palette.base00};
  color: #${config.colorScheme.palette.base06};
  caret-color: currentColor;
}

.caja-desktop.view .entry:selected {
  background-color: alpha(currentColor, 0.06);
}

.caja-navigation-window statusbar {
  margin: 0 -10px;
  padding: 0 4px;
  border-top: 1px solid rgba(242, 213, 207, 0.12);
}

.caja-notebook frame > border {
  border-style: none;
}

#caja-extra-view-widget {
  border-bottom: 1px solid rgba(242, 213, 207, 0.12);
  background-color: #${config.colorScheme.palette.base00};
}

#caja-extra-view-widget > box > box > label {
  font-weight: bold;
}

/*********
 * Pluma *
 *********/
.pluma-window statusbar {
  margin: 0 -10px;
  padding: 0 4px;
  border-top: 1px solid rgba(242, 213, 207, 0.12);
}

.pluma-window statusbar frame > border {
  border-style: none;
}

.pluma-window statusbar frame button.flat {
  padding: 0 4px;
  border-radius: 0;
}

.pluma-window statusbar frame button.flat widget {
  -gtk-icon-source: -gtk-icontheme('pan-down-symbolic');
  -gtkarrow-arrow-scaling: 1;
}

.pluma-print-preview toolbar {
  border-bottom: 1px solid rgba(242, 213, 207, 0.12);
}

.pluma-window paned.horizontal box.vertical box.horizontal button.flat {
  margin: 1px;
}

.pluma-window paned.horizontal box.vertical .frame {
  border-style: none;
}

.pluma-window paned.horizontal box.vertical notebook.frame {
  margin-top: -1px;
  border-top: 1px solid rgba(242, 213, 207, 0.12);
}

.pluma-window
  paned.horizontal
  box.vertical
  notebook.frame
  box.vertical
  toolbar.horizontal {
  border-bottom: 1px solid rgba(242, 213, 207, 0.12);
}

/*********
 * Atril *
 *********/
.atril-window paned.horizontal box.vertical .frame {
  border-style: none;
}

.atril-window paned.horizontal box.vertical notebook .frame {
  border-top: 1px solid rgba(242, 213, 207, 0.12);
}

/* mate-screensaver lock dialog */
.lock-dialog {
  border: 1px solid rgba(0, 0, 0, 0.2);
  border-radius: 7px;
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2),
    0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12),
    inset 0 1px rgba(242, 213, 207, 0.1);
  background-color: #${config.colorScheme.palette.base02};
}

.lock-dialog frame > border {
  border-style: none;
}

.lock-dialog button:not(:disabled) {
  color: #${config.colorScheme.palette.base0F};
}

/* multimedia OSD */
MsdOsdWindow.background.osd {
  border-radius: 6px;
  background-color: rgba(48, 52, 70, 0.9);
  color: #${config.colorScheme.palette.base06};
}

MsdOsdWindow.background.osd .trough {
  border-radius: 0;
  background-color: rgba(242, 213, 207, 0.12);
}

MsdOsdWindow.background.osd .progressbar {
  border-radius: 0;
  background-color: #${config.colorScheme.palette.base0F};
}

/******************
 * Budgie Desktop *
 ******************/
.budgie-container {
  background-color: transparent;
}

.budgie-settings-window list.sidebar {
  border-radius: 0 0 0 12px;
}

.budgie-settings-window buttonbox.inline-toolbar {
  border-style: none none solid;
}

.budgie-settings-window buttonbox.inline-toolbar button {
  border-radius: 6px;
}

.budgie-popover {
  border-style: solid;
  border-width: 1px;
  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.2) rgba(0, 0, 0, 0.3);
  border-radius: 6px;
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2),
    0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12);
  background-color: #${config.colorScheme.palette.base02};
}

.budgie-popover .container {
  padding: 6px;
}

.budgie-popover separator {
  margin: 3px 0;
}

.budgie-popover border {
  border: none;
}

.budgie-popover list {
  background-color: transparent;
}

.budgie-popover row {
  padding: 0;
}

.budgie-popover row:hover {
  box-shadow: none;
}

.budgie-popover row button {
  border-radius: 0px;
}

.budgie-popover scrolledwindow.sidebar.categories {
  background-color: rgba(242, 213, 207, 0.04);
}

.budgie-popover scrolledwindow.sidebar:not(.categories) {
  background-color: rgba(242, 213, 207, 0.04);
  border-right: none;
  border-bottom-left-radius: 6px;
}

.budgie-popover scrolledwindow.sidebar:not(.categories) list > row.activatable {
  padding: 6px 8px;
}

.budgie-popover.bottom scrolledwindow.sidebar:not(.categories) {
  padding-top: 6px;
  border-top-left-radius: 6px;
  border-bottom-left-radius: 0;
}

.budgie-popover
  > frame.container
  > grid.horizontal
  > grid.horizontal
  > widget
  > grid.horizontal
  > stack {
  border-top: 1px solid rgba(242, 213, 207, 0.12);
}

.budgie-popover.bottom
  > frame.container
  > grid.horizontal
  > grid.horizontal
  > widget
  > grid.horizontal
  > stack {
  border-top: none;
  border-bottom: 1px solid rgba(242, 213, 207, 0.12);
}

.budgie-popover button {
  border-radius: 0px;
}

.budgie-popover button.flat:not(.image-button) {
  min-height: 28px;
  padding: 0 8px;
  color: #${config.colorScheme.palette.base06};
  font-weight: normal;
  border-radius: 0px;
}

.budgie-popover button.flat:not(.image-button):disabled {
  color: rgba(242, 213, 207, 0.5);
}

.budgie-popover.budgie-menu .container {
  padding: 0;
}

.budgie-popover.budgie-menu .sidebar,
.budgie-popover.budgie-menu scrollbar,
.budgie-popover.budgie-menu entry.search {
  background-color: transparent;
}

.budgie-popover.budgie-menu entry.search {
  border-bottom: 1px solid rgba(242, 213, 207, 0.12);
  border-image: none;
  border-radius: 0;
  box-shadow: none;
  font-size: 120%;
}

.budgie-popover.budgie-menu
  button.flat:not(.image-button):not(.indicator-item) {
  min-height: 32px;
  padding: 0 8px;
  border-radius: 0;
}

.budgie-popover.budgie-menu
  button.flat:not(.image-button):not(.indicator-item):checked:disabled {
  background-color: transparent;
}

.budgie-popover.user-menu list,
.budgie-popover.user-menu row {
  border: none;
  background: none;
  box-shadow: none;
}

.budgie-popover.user-menu
  > frame.container
  > box.vertical
  row.activatable:first-child {
  margin-bottom: 3px;
  outline-width: 0;
  border-radius: 6px;
}

.budgie-popover.user-menu
  > frame.container
  > box.vertical
  row.activatable:first-child
  button.indicator-item {
  transition: none;
  animation: none;
}

.budgie-popover.night-light-indicator .container {
  padding: 3px;
}

.budgie-popover.night-light-indicator .view-header {
  margin: 0 6px;
}

.budgie-popover.places-menu .container {
  padding: 3px;
}

.budgie-popover.places-menu .name-button image:dir(ltr) {
  margin-right: 3px;
}

.budgie-popover.places-menu .name-button image:dir(rtl) {
  margin-left: 3px;
}

.budgie-popover.places-menu .unmount-button {
  margin: 2px;
  padding: 0;
}

.budgie-popover.places-menu .places-list:not(.always-expand) {
  margin-top: 3px;
  padding-top: 3px;
  border-top: 1px solid rgba(242, 213, 207, 0.12);
}

.budgie-popover.places-menu .alternative-label {
  padding: 3px;
  font-size: 15px;
}

.budgie-popover.workspace-popover flowboxchild {
  padding: 0;
}

.workspace-switcher .workspace-layout {
  border: 0 solid rgba(242, 213, 207, 0.12);
}

.top .workspace-switcher .workspace-layout:dir(ltr),
.bottom .workspace-switcher .workspace-layout:dir(ltr) {
  border-left-width: 1px;
}

.top .workspace-switcher .workspace-layout:dir(rtl),
.bottom .workspace-switcher .workspace-layout:dir(rtl) {
  border-right-width: 1px;
}

.left .workspace-switcher .workspace-layout,
.right .workspace-switcher .workspace-layout {
  border-top-width: 1px;
}

.workspace-switcher .workspace-item,
.workspace-switcher .workspace-add-button {
  border: 0 solid rgba(242, 213, 207, 0.12);
}

.top .workspace-switcher .workspace-item:dir(ltr),
.bottom .workspace-switcher .workspace-item:dir(ltr),
.top .workspace-switcher .workspace-add-button:dir(ltr),
.bottom .workspace-switcher .workspace-add-button:dir(ltr) {
  border-right-width: 1px;
}

.top .workspace-switcher .workspace-item:dir(rtl),
.bottom .workspace-switcher .workspace-item:dir(rtl),
.top .workspace-switcher .workspace-add-button:dir(rtl),
.bottom .workspace-switcher .workspace-add-button:dir(rtl) {
  border-left-width: 1px;
}

.left .workspace-switcher .workspace-item,
.right .workspace-switcher .workspace-item,
.left .workspace-switcher .workspace-add-button,
.right .workspace-switcher .workspace-add-button {
  border-bottom-width: 1px;
}

.workspace-switcher .workspace-item {
  transition: all 75ms cubic-bezier(0, 0, 0.2, 1);
}

.workspace-switcher .workspace-item.current-workspace {
  background-color: alpha(currentColor, 0.1);
}

.workspace-switcher .workspace-add-button:hover {
  box-shadow: none;
}

.workspace-switcher .workspace-add-button:active {
  background-image: none;
}

.workspace-switcher .workspace-add-button:active image {
  margin: 1px 0 -1px;
}

.budgie-panel .workspace-switcher .workspace-icon-button {
  min-height: 24px;
  min-width: 24px;
  padding: 0;
  border-radius: 6px;
}

.budgie-panel button.budgie-menu-launcher {
  padding: 0 0;
  margin: 3px 0;
  min-width: 16px;
  min-height: 16px;
  color: rgba(242, 213, 207, 0.7);
}

.budgie-panel button.budgie-menu-launcher {
  background: none;
  box-shadow: none;
}

.budgie-panel button.budgie-menu-launcher image {
  padding: 0;
  margin: 0;
  border-radius: 9999px;
  background-image: image(rgba(242, 213, 207, 0.12));
}

.budgie-panel button.budgie-menu-launcher:hover {
  color: #${config.colorScheme.palette.base06};
}

.budgie-panel button.budgie-menu-launcher:hover image {
  background-image: image(rgba(242, 213, 207, 0.2));
}

.budgie-panel button.budgie-menu-launcher:active,
.budgie-panel button.budgie-menu-launcher:checked {
  color: #${config.colorScheme.palette.base06};
}

.budgie-panel button.budgie-menu-launcher:active image,
.budgie-panel button.budgie-menu-launcher:checked image {
  background-image: image(rgba(242, 213, 207, 0.28));
}

.budgie-panel {
  transition: background-color 75ms cubic-bezier(0, 0, 0.2, 1);
  background-color: rgba(48, 52, 70, 0.95);
  color: rgba(242, 213, 207, 0.7);
  font-weight: 500;
}

.budgie-panel.transparent {
  background-color: #${config.colorScheme.palette.base01};
}

.budgie-panel button {
  color: rgba(242, 213, 207, 0.7);
  min-height: 24px;
  min-width: 24px;
  padding: 0;
  border-radius: 0;
}

.budgie-panel button:hover {
  color: #${config.colorScheme.palette.base06};
}

.budgie-panel button:active {
  color: rgba(242, 213, 207, 0.7);
}

.budgie-panel button.budgie-menu-launcher {
  color: rgba(242, 213, 207, 0.7);
}

.budgie-panel button.budgie-menu-launcher:focus {
  background: none;
  box-shadow: none;
  border: none;
  color: rgba(242, 213, 207, 0.7);
}

.budgie-panel button.raven-trigger {
  color: rgba(242, 213, 207, 0.7);
}

.budgie-panel.horizontal button {
  padding: 0 4px;
}

.budgie-panel.vertical button {
  padding: 4px 0;
}

.budgie-panel separator {
  background-color: rgba(242, 213, 207, 0.3);
}

.budgie-panel .alert {
  color: #${config.colorScheme.palette.base08};
}

.budgie-panel .titlebar:not(headerbar) {
  min-height: 0;
  padding: 0;
  box-shadow: none;
  background-color: transparent;
  color: #${config.colorScheme.palette.base06};
}

.budgie-panel
  .titlebar:not(headerbar)
  button:not(.suggested-action):not(.destructive-action) {
  color: rgba(242, 213, 207, 0.7);
}

.budgie-panel
  .titlebar:not(headerbar)
  button:not(.suggested-action):not(.destructive-action):hover,
.budgie-panel
  .titlebar:not(headerbar)
  button:not(.suggested-action):not(.destructive-action):active {
  color: #${config.colorScheme.palette.base06};
}

.budgie-panel menubar,
.budgie-panel .menubar {
  color: rgba(242, 213, 207, 0.7);
}

.budgie-panel menubar > menuitem,
.budgie-panel .menubar > menuitem {
  color: rgba(242, 213, 207, 0.7);
}

.budgie-panel menubar > menuitem:hover,
.budgie-panel menubar > menuitem:active,
.budgie-panel .menubar > menuitem:hover,
.budgie-panel .menubar > menuitem:active {
  color: #${config.colorScheme.palette.base06};
}

.budgie-panel #tasklist-button {
  padding: 0 4px;
}

.budgie-panel.vertical #tasklist-button {
  min-height: 32px;
}

.budgie-panel button.flat.launcher {
  padding: 0;
}

.budgie-panel button.flat.launcher:not(:checked) {
  color: rgba(242, 213, 207, 0.5);
}

.budgie-panel button.flat.launcher:not(:checked):hover,
.budgie-panel button.flat.launcher:not(:checked):active {
  color: rgba(242, 213, 207, 0.7);
}

.budgie-panel button.flat.launcher:not(:checked):disabled {
  color: rgba(242, 213, 207, 0.3);
}

.top .budgie-panel .unpinned button.flat.launcher:checked,
.top .budgie-panel .pinned button.flat.launcher.running:checked {
  border-image: radial-gradient(
      circle closest-corner at center calc(1px),
      currentColor 100%,
      transparent 0%
    )
    2 0 0 0/2px 0 0 0;
}

.bottom .budgie-panel .unpinned button.flat.launcher:checked,
.bottom .budgie-panel .pinned button.flat.launcher.running:checked {
  border-image: radial-gradient(
      circle closest-corner at center calc(100% - 1px),
      currentColor 100%,
      transparent 0%
    )
    0 0 2 0/0 0 2px 0;
}

.left .budgie-panel .unpinned button.flat.launcher:checked,
.left .budgie-panel .pinned button.flat.launcher.running:checked {
  border-image: radial-gradient(
      circle closest-corner at calc(1px) center,
      currentColor 100%,
      transparent 0%
    )
    0 0 0 2/0 0 0 2px;
}

.right .budgie-panel .unpinned button.flat.launcher:checked,
.right .budgie-panel .pinned button.flat.launcher.running:checked {
  border-image: radial-gradient(
      circle closest-corner at calc(100% - 1px) center,
      currentColor 100%,
      transparent 0%
    )
    0 2 0 0/0 2px 0 0;
}

.top .budgie-panel #tasklist-button,
.budgie-panel .top #tasklist-button {
  border-image: radial-gradient(
      circle closest-corner at center calc(1px),
      currentColor 0%,
      transparent 0%
    )
    0 0 0 0/0 0 0 0;
}

.top .budgie-panel #tasklist-button:checked,
.budgie-panel .top #tasklist-button:checked {
  border-image: radial-gradient(
      circle closest-corner at center calc(1px),
      currentColor 100%,
      transparent 0%
    )
    2 0 0 0/2px 0 0 0;
}

.bottom .budgie-panel #tasklist-button,
.budgie-panel .bottom #tasklist-button {
  border-image: radial-gradient(
      circle closest-corner at center calc(100% - 1px),
      currentColor 0%,
      transparent 0%
    )
    0 0 0 0/0 0 0 0;
}

.bottom .budgie-panel #tasklist-button:checked,
.budgie-panel .bottom #tasklist-button:checked {
  border-image: radial-gradient(
      circle closest-corner at center calc(100% - 1px),
      currentColor 100%,
      transparent 0%
    )
    0 0 2 0/0 0 2px 0;
}

.left .budgie-panel #tasklist-button,
.budgie-panel .left #tasklist-button {
  border-image: radial-gradient(
      circle closest-corner at calc(1px) center,
      currentColor 0%,
      transparent 0%
    )
    0 0 0 0/0 0 0 0;
}

.left .budgie-panel #tasklist-button:checked,
.budgie-panel .left #tasklist-button:checked {
  border-image: radial-gradient(
      circle closest-corner at calc(1px) center,
      currentColor 100%,
      transparent 0%
    )
    0 0 0 2/0 0 0 2px;
}

.right .budgie-panel #tasklist-button,
.budgie-panel .right #tasklist-button {
  border-image: radial-gradient(
      circle closest-corner at calc(100% - 1px) center,
      currentColor 0%,
      transparent 0%
    )
    0 0 0 0/0 0 0 0;
}

.right .budgie-panel #tasklist-button:checked,
.budgie-panel .right #tasklist-button:checked {
  border-image: radial-gradient(
      circle closest-corner at calc(100% - 1px) center,
      currentColor 100%,
      transparent 0%
    )
    0 2 0 0/0 2px 0 0;
}

frame.raven-frame > border {
  border-style: none;
}

.top frame.raven-frame > border {
  margin-bottom: 32px;
}

.bottom frame.raven-frame > border {
  margin-top: 32px;
}

.left frame.raven-frame > border {
  margin-right: 32px;
}

.right frame.raven-frame > border {
  margin-left: 32px;
}

.raven {
  background-color: #${config.colorScheme.palette.base02};
  box-shadow: 0 8px 6px -5px rgba(0, 0, 0, 0.2),
    0 16px 14.4px 2px rgba(0, 0, 0, 0.14), 0 6px 18px 5px rgba(0, 0, 0, 0.12);
}

.raven > box {
  margin-bottom: -10px;
}

.raven stackswitcher.linked {
  margin: 6px 16px;
}

.raven stackswitcher.linked > button:focus {
  box-shadow: none;
}

.raven .raven-header {
  min-height: 36px;
  padding: 3px;
}

.raven .raven-header.top {
  padding: 0;
  border-bottom: 1px solid rgba(242, 213, 207, 0.12);
}

.raven .raven-header.top stackswitcher button {
  margin: -4px 0 -5px;
  padding: 0 16px;
  min-height: 36px;
}

.raven .raven-header.bottom {
  border-top: 1px solid rgba(242, 213, 207, 0.12);
}

.raven stack .raven-header {
  margin-top: -6px;
}

.raven stack scrolledwindow .raven-header {
  margin-top: -8px;
}

.raven .raven-background {
  border-style: solid none;
  border-width: 1px;
  border-color: rgba(242, 213, 207, 0.12);
  background-color: #${config.colorScheme.palette.base00};
}

.raven .raven-background > overlay > widget > image {
  color: rgba(242, 213, 207, 0.12);
}

.raven scrolledwindow.raven-background {
  border-bottom-style: none;
}

.raven .powerstrip button {
  margin: 2px 0 1px;
  padding: 12px;
}

.raven .option-subtitle {
  font-size: smaller;
}

.raven .audio-widget scale.marks-after {
  padding-top: 0;
  padding-bottom: 0;
}

.raven .audio-widget scale.marks-after label {
  font-size: 90%;
  padding: 0;
  margin: -10px 0 0 6px;
}

.raven .audio-widget button.flat.expander-button {
  margin-top: 4px;
  margin-bottom: 4px;
}

.raven .audio-widget list.devices-list.sound-devices > row.activatable:selected,
.raven .audio-widget list.devices-list.sound-devices > row.activatable:checked {
  background-color: rgba(242, 213, 207, 0.06);
  color: #${config.colorScheme.palette.base06};
}

.raven
  .audio-widget
  list.devices-list.sound-devices
  > row.activatable:selected
  label,
.raven
  .audio-widget
  list.devices-list.sound-devices
  > row.activatable:checked
  label {
  color: #${config.colorScheme.palette.base06};
}

.raven .audio-widget list.devices-list.sound-devices > row.activatable label {
  padding-left: 12px;
}

calendar.raven-calendar {
  border-style: none;
  background-color: transparent;
}

calendar.raven-calendar:selected {
  border-radius: 6px;
}

.raven-mpris {
  background-color: #${config.colorScheme.palette.base01};
  color: #${config.colorScheme.palette.base06};
}

.raven-mpris label {
  min-height: 24px;
}

.raven-mpris button.image-button {
  padding: 12px;
}

.budgie-notification-window,
.budgie-switcher-window,
.budgie-osd-window {
  background-color: transparent;
}

.budgie-notification .notification-title,
.budgie-switcher .notification-title {
  font-size: 120%;
}

.budgie-notification .notification-body,
.budgie-switcher .notification-body {
  color: rgba(242, 213, 207, 0.7);
}

.budgie-osd .budgie-osd-text {
  font-size: 120%;
}

.budgie-panel .lock-keys image:disabled {
  color: rgba(242, 213, 207, 0.3);
}

.drop-shadow {
  margin: 5px 9px;
  padding: 3px;
  border-radius: 12px;
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2),
    0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12),
    inset 0 1px rgba(242, 213, 207, 0.1);
  background-color: #${config.colorScheme.palette.base02};
}

.drop-shadow .linked > button {
  border-radius: 12px;
}

.budgie-session-dialog,
.budgie-polkit-dialog,
.budgie-run-dialog {
  box-shadow: inset 0 1px rgba(242, 213, 207, 0.1);
  background-color: #${config.colorScheme.palette.base02};
}

.budgie-session-dialog.background.csd,
.budgie-session-dialog decoration,
.budgie-polkit-dialog.background.csd,
.budgie-polkit-dialog decoration,
.budgie-run-dialog.background.csd,
.budgie-run-dialog decoration {
  border-radius: 12px 12px 12px 12px;
}

.budgie-session-dialog label:not(:last-child),
.budgie-session-dialog .dialog-title,
.budgie-polkit-dialog label:not(:last-child),
.budgie-polkit-dialog .dialog-title,
.budgie-run-dialog label:not(:last-child),
.budgie-run-dialog .dialog-title {
  font-size: 120%;
}

.budgie-session-dialog .linked.horizontal > button,
.budgie-polkit-dialog .linked.horizontal > button,
.budgie-run-dialog .linked.horizontal > button {
  padding: 8px 16px;
  border-top: 1px solid rgba(242, 213, 207, 0.12);
  border-radius: 0;
}

.budgie-session-dialog .linked.horizontal > button:first-child,
.budgie-polkit-dialog .linked.horizontal > button:first-child,
.budgie-run-dialog .linked.horizontal > button:first-child {
  border-bottom-left-radius: 12px;
}

.budgie-session-dialog .linked.horizontal > button:last-child,
.budgie-polkit-dialog .linked.horizontal > button:last-child,
.budgie-run-dialog .linked.horizontal > button:last-child {
  border-bottom-right-radius: 12px;
}

.budgie-polkit-dialog .message {
  color: rgba(242, 213, 207, 0.7);
}

.budgie-polkit-dialog .failure {
  color: #${config.colorScheme.palette.base08};
}

.budgie-run-dialog entry.search {
  font-size: 120%;
  padding: 6px 14px;
  border-image: none;
  box-shadow: none;
  background-color: transparent;
}

.budgie-run-dialog list .dim-label {
  color: #${config.colorScheme.palette.base06};
}

.budgie-run-dialog scrolledwindow {
  border-top: 1px solid rgba(242, 213, 207, 0.12);
}

/**************
 * Xfce4 Apps *
 **************/
.XfceHeading {
  background-color: #${config.colorScheme.palette.base00};
}

/***************
 * xfce4-panel *
 ***************/
.xfce4-panel.background {
  border: none;
  background-color: rgba(48, 52, 70, 0.95);
  color: rgba(242, 213, 207, 0.7);
  font-weight: 500;
}

.xfce4-panel.background button {
  min-height: 16px;
  min-width: 16px;
  padding: 0;
  border-radius: 0;
}

.xfce4-panel.background .tasklist button {
  border-image: image(transparent) 0 0 2/0 0 2px;
}

.xfce4-panel.background .tasklist button:checked {
  border-image: image(currentColor) 0 0 2/0 0 2px;
}

.xfce4-panel.background .tasklist button image {
  padding: 4px;
}

wnck-pager:hover {
  background-color: alpha(currentColor, 0.08);
}

wnck-pager:active {
  background-color: alpha(currentColor, 0.12);
}

wnck-pager:selected {
  background-color: #${config.colorScheme.palette.base0F};
}

XfdesktopIconView.view {
  border-radius: 6px;
  background-color: transparent;
  color: #${config.colorScheme.palette.base06};
}

XfdesktopIconView.view:active {
  box-shadow: none;
}

XfdesktopIconView.view .rubberband {
  border-radius: 0;
}

#XfceNotifyWindow buttonbox {
  padding: 0;
}

#XfceNotifyWindow label#summary {
  font-weight: bold;
}

#xfwm-tabwin {
  padding: 12px;
  border-radius: 6px;
  -xfwmtabwinwidget-icon-size: 64px;
  -xfwmtabwinwidget-preview-size: 64px;
}

/**********
 * Thunar *
 **********/
.thunar #location-toolbar {
  border-bottom: 1px solid rgba(242, 213, 207, 0.12);
}

.thunar .standard-view.frame {
  border-style: none;
}

.thunar .sidebar .view:not(:selected) {
  background-color: transparent;
}

.thunar statusbar {
  margin: 0 -10px;
  padding: 0 4px;
  border-top: 1px solid rgba(242, 213, 207, 0.12);
}

.thunar
  > grid.horizontal
  > paned.horizontal
  > scrolledwindow.frame.sidebar.shortcuts-pane {
  border-top: none;
}

window.background.csd.thunar
  > grid.horizontal
  > paned.horizontal
  > scrolledwindow.frame.sidebar.shortcuts-pane {
  border-bottom-left-radius: 12px;
}

window.background.csd.thunar
  > grid.horizontal
  > paned.horizontal
  > scrolledwindow.frame.sidebar.shortcuts-pane
  treeview.view:not(:hover):not(:selected) {
  background-color: transparent;
}

/************************
 * LightDM GTK+ Greeter *
 ************************/
#panel_window {
  background-color: #${config.colorScheme.palette.base00};
  color: #${config.colorScheme.palette.base06};
}

#panel_window menubar,
#panel_window separator {
  background-color: transparent;
}

#panel_window separator {
  padding: 0 4px;
}

#panel_window separator:first-child {
  padding: 0 8px;
}

#panel_window menubar > menuitem {
  color: rgba(242, 213, 207, 0.7);
}

#panel_window menubar > menuitem:hover {
  color: #${config.colorScheme.palette.base06};
}

#panel_window menubar > menuitem:disabled label {
  color: rgba(242, 213, 207, 0.3);
}

#login_window,
#shutdown_dialog,
#restart_dialog {
  margin: 8px;
  border-radius: 6px;
  box-shadow: 0 2px 2.4px -1px rgba(0, 0, 0, 0.2),
    0 4px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 6px 0 rgba(0, 0, 0, 0.12),
    inset 0 1px rgba(242, 213, 207, 0.1);
  background-color: #${config.colorScheme.palette.base02};
}

#content_frame {
  padding-bottom: 16px;
}

#buttonbox_frame {
  padding-top: 24px;
}

#buttonbox_frame > box,
#buttonbox_frame > buttonbox {
  margin: -16px;
}

#buttonbox_frame button:not(:disabled) {
  color: #${config.colorScheme.palette.base0F};
}

/********
 * Nemo *
 ********/
.nemo-window .primary-toolbar {
  background-color: #${config.colorScheme.palette.base00};
  border-bottom: 1px solid rgba(242, 213, 207, 0.12);
}

.nemo-window .primary-toolbar entry {
  min-height: 0;
  margin: 0;
}

.nemo-window .primary-toolbar button.text-button {
  padding-left: 8px;
  padding-right: 8px;
  color: rgba(242, 213, 207, 0.7);
}

.nemo-window .primary-toolbar button.text-button:hover,
.nemo-window .primary-toolbar button.text-button:active,
.nemo-window .primary-toolbar button.text-button:checked {
  color: #${config.colorScheme.palette.base06};
}

.nemo-window .primary-toolbar button.text-button:disabled {
  color: rgba(242, 213, 207, 0.5);
}

.nemo-window .primary-toolbar button:not(.text-button):not(.image-button) {
  padding-left: 4px;
  padding-right: 4px;
}

.nemo-window scrolledwindow.frame {
  border-style: none;
}

.nemo-window scrolledwindow.frame .view:not(:selected) {
  background-color: transparent;
}

.nemo-window .nemo-inactive-pane .view:not(:selected) {
  background-color: #${config.colorScheme.palette.base01};
}

.nemo-window .nemo-window-pane widget.entry {
  border-radius: 6px;
  background-color: rgba(242, 213, 207, 0.04);
}

.places-treeview {
  -nemoplacestreeview-disk-full-bg-color: #${config.colorScheme.palette.base04};
  -nemoplacestreeview-disk-full-fg-color: #${config.colorScheme.palette.base0F};
  -nemoplacestreeview-disk-full-bar-width: 2px;
  -nemoplacestreeview-disk-full-bar-radius: 0;
  -nemoplacestreeview-disk-full-bottom-padding: 1px;
  -nemoplacestreeview-disk-full-max-length: 80px;
  padding-top: 3px;
  padding-bottom: 3px;
}
  '';
}