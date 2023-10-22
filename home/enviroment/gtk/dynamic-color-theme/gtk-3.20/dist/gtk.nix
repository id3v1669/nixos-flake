{ config, lib, pkgs, uservars, ... }:
{
  home.file.".themes/dynamic-color-theme/gtk-3.20/dist/gtk.css".text = ''
/*$dark_shadow: #000;*/
/*$light_shadow: #fff;*/
/*$selected_borders_color: if($variant == 'light', darken($selected_bg_color, 30%), darken($selected_bg_color, 20%));*/
/*$borders_color: if($variant == 'light', shade($bg_color, .85), shade($bg_color, .88));*/
/*$button_border_strength: if(lightness($bg) > 50, 0, .1);*/
/*$button_shadow_strength: if(lightness($bg) > 50, 0, .1);*/
/*$dark_shadow: #000;*/
/*$light_shadow: #fff;*/
/*$selected_borders_color: if($variant == 'light', darken($selected_bg_color, 30%), darken($selected_bg_color, 20%));*/
/*$borders_color: if($variant == 'light', shade($bg_color, .85), shade($bg_color, .88));*/
/*$button_border_strength: if(lightness($bg) > 50, 0, .1);*/
/*$button_shadow_strength: if(lightness($bg) > 50, 0, .1);*/
/* dark color scheme */
@define-color dark_bg_color #16172d;
@define-color dark_fg_color #ffffff;
/* colormap actually used by the theme, to be overridden in other css files */
@define-color theme_bg_color #1b1c36;
@define-color theme_fg_color #ffffff;
@define-color theme_base_color #1b1c36;
@define-color text_view_bg  #1b1c36;
/*workaround for new vte versions */
@define-color theme_text_color #c1c3cc;
@define-color theme_selected_bg_color #30365f;
@define-color theme_selected_fg_color #ffffff;
@define-color theme_tooltip_bg_color #1b1c36;
@define-color theme_tooltip_fg_color #ffffff;
/* shadow effects */
@define-color light_shadow #1c1d37;
@define-color dark_shadow #333333;
/* misc colors used by gtk+ */
@define-color info_fg_color #1b1c36;
@define-color info_bg_color #0c12de;
@define-color warning_fg_color #1b1c36;
@define-color warning_bg_color #afb500;
@define-color question_fg_color #1b1c36;
@define-color question_bg_color #0c12de;
@define-color error_fg_color #1b1c36;
@define-color error_bg_color #af0000;
@define-color link_color #0000cd;
@define-color success_color #00b500;
@define-color warning_color #afb500;
@define-color error_color #af0000;
/* widget colors */
@define-color titlebar_bg_focused @dark_bg_color;
@define-color titlebar_bg_unfocused @theme_bg_color;
@define-color titlebar_fg_focused @dark_fg_color;
@define-color titlebar_fg_unfocused mix(#ffffff,#1b1c36,0.4);
@define-color menubar_bg_color @dark_bg_color;
@define-color menubar_fg_color @dark_fg_color;
@define-color toolbar_bg_color @theme_bg_color;
@define-color toolbar_fg_color @theme_fg_color;
@define-color menu_bg_color @dark_bg_color;
@define-color menu_fg_color @dark_fg_color;
@define-color panel_bg_color @dark_bg_color;
@define-color panel_fg_color @dark_fg_color;
@define-color borders mix(#1b1c36,#ffffff,0.18);
@define-color unfocused_borders mix(#1b1c36,mix(#1b1c36,#ffffff,0.18),0.9);
@define-color button_bg_color #30365F;
@define-color button_fg_color #ffffff;
@define-color header_button_bg_color #30365f;
@define-color header_button_fg_color #d3dae3;
@define-color insensitive_bg_color mix(#1b1c36,#1b1c36,0.6);
@define-color insensitive_fg_color mix(#ffffff,#1b1c36,0.5);
/* osd */
@define-color osd_base #16172d;
@define-color osd_bg rgba(22, 23, 45, 0.8);
@define-color osd_fg #ffffff;
@define-color osd_insensitive_bg_color mix(#ffffff,rgba(22, 23, 45, 0.8),0.5);
@define-color osd_insensitive_fg_color mix(#ffffff,#16172d,0.6);
@define-color osd_borders_color rgba(19, 20, 38, 0.8);
/* lightdm greeter colors */
@define-color lightdm_bg_color #16172d;
@define-color lightdm_fg_color #ffffff;
/* widget text/foreground color on backdrop windows */
@define-color theme_unfocused_fg_color mix(#ffffff,#1b1c36,0.5);
/* text color for entries, views and content in general on backdrop windows */
@define-color theme_unfocused_text_color #c1c3cc;
/* widget base background color on backdrop windows */
@define-color theme_unfocused_bg_color #1b1c36;
/* text widgets and the like base background color on backdrop windows */
@define-color theme_unfocused_base_color #1b1c36;
/* base background color of selections on backdrop windows */
@define-color theme_unfocused_selected_bg_color #30365f;
/* text/foreground color of selections on backdrop windows */
@define-color theme_unfocused_selected_fg_color #ffffff;
/* insensitive color on backdrop windows*/
@define-color unfocused_insensitive_color #020203;
/* window manager colors */
@define-color wm_bg_focused #16172d;
@define-color wm_bg_unfocused #1b1c36;
@define-color wm_border_focused #00a3cc;
@define-color wm_border_unfocused #16172d;
@define-color wm_title_focused #ffffff;
@define-color wm_title_unfocused mix(#ffffff,#1b1c36,0.4);
@define-color wm_icons_focused #ffffff;
@define-color wm_icons_focused_prelight #30365f;
@define-color wm_icons_focused_pressed #262b4c;
@define-color wm_icons_unfocused mix(#ffffff,#1b1c36,0.4);
@define-color wm_icons_unfocused_prelight #30365f;
@define-color wm_icons_unfocused_pressed #262b4c;
/**************
 ! GTK settings
***************/
* {
  -GtkWindow-resize-grip-height: 0;
  -GtkWindow-resize-grip-width: 0;
  -WnckTasklist-fade-overlay-rect: 0;
  -GtkWidget-cursor-aspect-ratio: 0.04;
  outline-color: rgba(48, 54, 95, 0.5);
  outline-style: dashed;
  outline-width: 1px;
  outline-offset: -1px;
  -gtk-outline-radius: 8px; }

/*************
 ! Base states
 *************/
GeditViewFrame .gedit-search-slider .not-found:selected, .gedit-document-panel-document-row:selected, .gedit-document-panel-document-row:selected:hover, GucharmapChartable:focus, GucharmapChartable:hover, GucharmapChartable:active, GucharmapChartable:selected, .gtkstyle-fallback:selected, *:selected, :focus:selected {
  background-color: #30365f;
  color: #ffffff; }

* {
  /* hyperlinks */
  -GtkIMHtml-hyperlink-color: #0000cd; }
  *:disabled, *:disabled:disabled {
    color: mix(#ffffff,#1b1c36,0.5); }
  *:disabled, *:disabled {
    -gtk-icon-effect: dim; }
  *:hover {
    -gtk-icon-effect: highlight; }
  *:link, *:visited {
    color: #0000cd; }

.background {
  background-color: #1b1c36;
  color: #ffffff; }
  .background:backdrop {
    text-shadow: none;
    -gtk-icon-shadow: none; }
  .background.csd {
    background-color: #1b1c36; }

.gtkstyle-fallback {
  background-color: rgba(27, 28, 54, 0.5);
  color: #ffffff; }
  .gtkstyle-fallback:hover {
    background-color: #1e1f3b;
    color: #ffffff; }
  .gtkstyle-fallback:active {
    background-color: #181931;
    color: #ffffff; }
  .gtkstyle-fallback:disabled {
    background-color: #1b1c36;
    color: mix(#ffffff,#1b1c36,0.5); }

image, image:disabled, label, label:disabled, box, box:disabled, grid, grid:disabled {
  background-color: transparent; }

label.separator {
  color: #ffffff; }
  label.separator:backdrop {
    color: mix(#ffffff,#1b1c36,0.5); }

label selection {
  background-color: #30365f;
  color: #ffffff; }

label:disabled {
  color: mix(#ffffff,#1b1c36,0.5); }
  label:disabled:backdrop {
    color: #020203; }

label:backdrop {
  color: mix(#ffffff,#1b1c36,0.5); }

assistant .sidebar {
  background-color: #1b1c36;
  border-top: 1px solid mix(#1b1c36,#ffffff,0.18); }
  assistant .sidebar:backdrop {
    background-color: #1b1c36;
    border-color: mix(#1b1c36,mix(#1b1c36,#ffffff,0.18),0.9); }

assistant.csd .sidebar {
  border-top-style: none; }

assistant .sidebar label {
  padding: 4px 8px; }

assistant .sidebar label.highlight {
  background-color: mix(#ffffff,#1b1c36,0.8); }

/*********
 ! Buttons
**********/
@keyframes needs_attention {
  from {
    background-image: -gtk-gradient(radial, center center, 0, center center, 0.01, to(#30365f), to(transparent)); }
  to {
    background-image: -gtk-gradient(radial, center center, 0, center center, 0.5, to(#30365f), to(transparent)); } }

stacksidebar row.needs-attention > label {
  animation: needs_attention 150ms ease-in;
  background-image: -gtk-gradient(radial, center center, 0, center center, 0.5, to(#30365f), to(transparent)), -gtk-gradient(radial, center center, 0, center center, 0.5, to(rgba(102, 102, 102, 0.872941)), to(transparent));
  background-size: 6px 6px, 6px 6px;
  background-repeat: no-repeat;
  background-position: right 3px, right 4px; }
  stacksidebar row.needs-attention > label:backdrop {
    background-size: 6px 6px, 0 0; }
  stacksidebar row.needs-attention > label:dir(rtl) {
    background-position: left 3px, left 4px; }

#restart_button button, #shutdown_button button, #login_window button, .nemo-window .sidebar + separator + box .primary-toolbar button.flat, .nemo-window .sidebar + separator + box .primary-toolbar button.flat.nautilus-circular-button.image-button, treeview.view header button:active, treeview.view header button:hover, treeview.view header button, .osd spinbutton.vertical button:first-child, .osd spinbutton:not(.vertical) button, .osd button, button.osd,
#XfceNotifyWindow button, frame.app-notification button, popover.background button, infobar.error button, infobar.question button, infobar.warning button, infobar.info button, headerbar.selection-mode button,
.titlebar.selection-mode:not(headerbar) button, .destructive-action, .suggested-action, headerbar.selection-mode button.suggested-action, toolbar.inline-toolbar button, toolbar button, .titlebar:not(headerbar) button, headerbar button, button, button.nautilus-circular-button.image-button {
  min-height: 22px;
  min-width: 22px;
  padding: 4px;
  border-width: 1px;
  border-style: solid;
  border-radius: 8px;
  -gtk-outline-radius: 17.6px;
  transition: 150ms ease;
  outline-color: transparent; }
  #restart_button button.text-button, #shutdown_button button.text-button, #login_window button.text-button, .nemo-window .sidebar + separator + box .primary-toolbar button.text-button.flat, .nemo-window .sidebar + separator + box .primary-toolbar button.text-button.flat.nautilus-circular-button.image-button, treeview.view header button.text-button, .osd spinbutton.vertical button.text-button:first-child, .osd spinbutton:not(.vertical) button.text-button,
  #XfceNotifyWindow button.text-button, frame.app-notification button.text-button, popover.background button.text-button, infobar.error button.text-button, infobar.question button.text-button, infobar.warning button.text-button, infobar.info button.text-button, headerbar.selection-mode button.text-button,
  .titlebar:not(headerbar).selection-mode button.text-button, .text-button.destructive-action, .text-button.suggested-action, toolbar.inline-toolbar button.text-button, button.text-button, button.text-button.nautilus-circular-button.image-button {
    padding: 4px 6.2857142857px; }

notebook > header > tabs > tab button.flat:active, notebook > header > tabs > tab button.flat:active:hover, notebook > header > tabs > tab button.flat:hover, modelbutton.flat,
menuitem.button.flat, menu menuitem calendar.button:hover,
.menu menuitem calendar.button:hover,
.context-menu menuitem calendar.button:hover, menu menuitem calendar.button,
.menu menuitem calendar.button,
.context-menu menuitem calendar.button, calendar.button:disabled, calendar.button:backdrop, calendar.button:hover, calendar.button, calendar.view, calendar.view:backdrop {
  border-color: transparent;
  background-color: transparent;
  background-image: none;
  box-shadow: none; }

toolbar.inline-toolbar toolbutton > button.flat:dir(rtl), .linked:not(.vertical) > combobox > box > button.combo:dir(rtl), spinbutton:not(.vertical) button:dir(rtl) {
  border-radius: 0;
  -gtk-outline-radius: 0; }

toolbar.inline-toolbar toolbutton > button.flat:dir(ltr), .linked:not(.vertical) > combobox > box > button.combo:dir(ltr), spinbutton:not(.vertical) button, spinbutton:not(.vertical) button.nautilus-circular-button.image-button {
  border-radius: 0;
  -gtk-outline-radius: 0; }

.linked.vertical > combobox > box > button.combo {
  border-radius: 0;
  -gtk-outline-radius: 0; }
  .linked.vertical > combobox > box > button.combo:dir(rtl) {
    border-radius: 0;
    -gtk-outline-radius: 0; }

toolbar.inline-toolbar toolbutton:first-child > button.flat, .linked:not(.vertical) > combobox:first-child > box > button.combo, .nemo-window toolbar toolitem stack widget button:first-child, popover.background .linked > button:first-child, headerbar.selection-mode viewswitcher button:first-child, toolbar.inline-toolbar toolbutton > button.flat:first-child, toolbar viewswitcher button:first-child, toolbar viewswitcher button.nautilus-circular-button.image-button:first-child,
toolbar .linked > button:first-child, .titlebar:not(headerbar) viewswitcher button:first-child, headerbar viewswitcher button:first-child, headerbar viewswitcher button.nautilus-circular-button.image-button:first-child,
.titlebar:not(headerbar) .linked > button:first-child,
headerbar .linked > button:first-child, combobox box button:first-child, combobox box button.nautilus-circular-button.image-button:first-child, combobox box entry:first-child, .inline-toolbar button:first-child, .linked > button:first-child {
  border-width: 1px;
  border-radius: 8px 0 0 8px;
  -gtk-outline-radius: 17.6px 0 0 17.6px; }

toolbar.inline-toolbar toolbutton:last-child > button.flat, .linked:not(.vertical) > combobox:last-child > box > button.combo, .nemo-window toolbar toolitem stack widget button:last-child, popover.background .linked > button:last-child, headerbar.selection-mode viewswitcher button:last-child, toolbar.inline-toolbar toolbutton > button.flat:last-child, toolbar viewswitcher button:last-child, toolbar viewswitcher button.nautilus-circular-button.image-button:last-child,
toolbar .linked > button:last-child, .titlebar:not(headerbar) viewswitcher button:last-child, headerbar viewswitcher button:last-child, headerbar viewswitcher button.nautilus-circular-button.image-button:last-child,
.titlebar:not(headerbar) .linked > button:last-child,
headerbar .linked > button:last-child, combobox box button:last-child, combobox box button.nautilus-circular-button.image-button:last-child, combobox box entry:last-child, .inline-toolbar button:last-child, .linked > button:last-child {
  border-width: 1px;
  border-radius: 0 8px 8px 0;
  -gtk-outline-radius: 0 17.6px 17.6px 0; }

toolbar.inline-toolbar toolbutton:only-child > button.flat, .linked:not(.vertical) > combobox:only-child > box > button.combo, .nemo-window toolbar toolitem stack widget button:only-child, popover.background .linked > button:only-child, headerbar.selection-mode viewswitcher button:only-child, toolbar.inline-toolbar toolbutton > button.flat:only-child, toolbar viewswitcher button:only-child, toolbar viewswitcher button.nautilus-circular-button.image-button:only-child,
toolbar .linked > button:only-child, .titlebar:not(headerbar) viewswitcher button:only-child, headerbar viewswitcher button:only-child, headerbar viewswitcher button.nautilus-circular-button.image-button:only-child,
.titlebar:not(headerbar) .linked > button:only-child,
headerbar .linked > button:only-child, combobox box button:only-child, combobox box button.nautilus-circular-button.image-button:only-child, combobox box entry:only-child, .inline-toolbar button:only-child, .linked > button:only-child {
  border-width: 1px;
  border-style: solid;
  border-radius: 8px;
  -gtk-outline-radius: 17.6px; }

.nemo-window toolbar toolitem stack widget button, .nemo-window toolbar toolitem stack widget button.nautilus-circular-button.image-button, popover.background .linked > button, headerbar.selection-mode viewswitcher button,
headerbar.selection-mode .linked > button,
.titlebar.selection-mode:not(headerbar) viewswitcher button, toolbar.inline-toolbar toolbutton > button.flat,
toolbar.inline-toolbar toolbutton:backdrop > button.flat, toolbar viewswitcher button, toolbar viewswitcher button.nautilus-circular-button.image-button,
toolbar .linked > button,
toolbar .linked > button.nautilus-circular-button.image-button, .titlebar:not(headerbar) viewswitcher button, headerbar viewswitcher button, headerbar viewswitcher button.nautilus-circular-button.image-button,
.titlebar:not(headerbar) .linked > button,
headerbar .linked > button,
headerbar .linked > button.nautilus-circular-button.image-button, combobox box button, combobox box button.nautilus-circular-button.image-button, combobox box entry, .inline-toolbar button, .inline-toolbar button.nautilus-circular-button.image-button, .linked > button, .linked > button.nautilus-circular-button.image-button {
  border-width: 1px;
  border-radius: 0;
  -gtk-outline-radius: 0; }

.linked.vertical > combobox:first-child > box > button.combo, .linked.vertical > button:first-child {
  border-width: 1px;
  border-radius: 8px 8px 0 0;
  -gtk-outline-radius: 17.6px 17.6px 0 0; }

.linked.vertical > combobox:last-child > box > button.combo, .linked.vertical > button:last-child {
  border-width: 1px;
  border-radius: 0 0 8px 8px;
  -gtk-outline-radius: 0 0 17.6px 17.6px; }

.linked.vertical > combobox:only-child > box > button.combo, .linked.vertical > button:only-child {
  border-width: 1px;
  border-radius: 8px;
  -gtk-outline-radius: 17.6px; }

.linked.vertical > button {
  border-width: 1px;
  border-style: solid;
  border-radius: 0;
  -gtk-outline-radius: 0; }

notebook > header > tabs > arrow, infobar.error button.close, infobar.question button.close, infobar.warning button.close, infobar.info button.close {
  border: 1px solid transparent;
  background-color: transparent;
  background-image: none;
  box-shadow: none; }
  notebook > header > tabs > arrow:focus, infobar.error button.close:focus, infobar.question button.close:focus, infobar.warning button.close:focus, infobar.info button.close:focus, notebook > header > tabs > arrow:hover, infobar.error button.close:hover, infobar.question button.close:hover, infobar.warning button.close:hover, infobar.info button.close:hover {
    border: 1px solid rgba(27, 28, 54, 0.3);
    background-color: rgba(255, 255, 255, 0.2);
    background-image: none;
    box-shadow: none; }
  notebook > header > tabs > arrow:active, infobar.error button.close:active, infobar.question button.close:active, infobar.warning button.close:active, infobar.info button.close:active, notebook > header > tabs > arrow:checked, infobar.error button.close:checked, infobar.question button.close:checked, infobar.warning button.close:checked, infobar.info button.close:checked {
    border: 1px solid rgba(48, 54, 95, 0.3);
    background-color: rgba(255, 255, 255, 0.1);
    background-image: none;
    box-shadow: none; }

button, button.nautilus-circular-button.image-button {
  background-color: #30365F;
  background-image: none;
  border-color: rgba(204, 204, 204, 0.22);
  color: #ffffff;
  box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22); }
  button:focus, button.nautilus-circular-button.image-button:focus, button:hover, button.nautilus-circular-button.image-button:hover {
    border-color: mix(#30365f,rgba(255, 255, 255, 0.22),0.3); }
  button:active, button.nautilus-circular-button.image-button:active, button:active:hover, button:active:focus, button:active:hover:focus, button:checked, button.nautilus-circular-button.image-button:checked, button:checked:hover, button:checked:focus, button:checked:hover:focus {
    border-color: rgba(179, 179, 179, 0.22); }
  button:disabled, button.nautilus-circular-button.image-button:disabled {
    border-color: rgba(217, 217, 217, 0.22); }
  button:active:disabled, button:checked:disabled {
    border-color: rgba(204, 204, 204, 0.22); }
  .linked:not(.vertical) > button:not(:last-child):not(:only-child), .linked:not(.vertical) > :not(:last-child):not(:only-child) button, viewswitcher:not(.vertical) > button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > button:not(:last-child):not(:only-child) {
    border-right-style: none; }
    .linked:not(.vertical) > button:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) button:hover, viewswitcher:not(.vertical) > button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > button:not(:last-child):not(:only-child):hover {
      border-color: mix(#30365f,rgba(255, 255, 255, 0.36),0.3);
      border-right-style: none;
      box-shadow: inset-1px 0 0 mix(#30365f,rgba(255, 255, 255, 0.36),0.3); }
  .linked:not(.vertical) > button:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > :not(:last-child):not(:only-child) button:checked, viewswitcher:not(.vertical) > button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > button:not(:last-child):not(:only-child):checked {
    border-right-style: none; }
    .linked:not(.vertical) > button:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) button:checked:hover, viewswitcher:not(.vertical) > button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > button:not(:last-child):not(:only-child):checked:hover {
      border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
      border-right-style: none;
      box-shadow: inset-1px 0 0 mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
  .linked.vertical > button:not(:last-child):not(:only-child), .linked.vertical > :not(:last-child):not(:only-child) button, stackswitcher.vertical > button:not(:last-child):not(:only-child) {
    border-bottom-style: none; }
    .linked.vertical > button:not(:last-child):not(:only-child):hover, .linked.vertical > :not(:last-child):not(:only-child) button:hover, stackswitcher.vertical > button:not(:last-child):not(:only-child):hover {
      border-color: mix(#30365f,rgba(255, 255, 255, 0.36),0.3);
      border-bottom-style: none;
      box-shadow: inset 0 -1px mix(#30365f,rgba(255, 255, 255, 0.36),0.3); }
  .linked.vertical > button:not(:last-child):not(:only-child):checked, .linked.vertical > :not(:last-child):not(:only-child) button:checked, stackswitcher.vertical > button:not(:last-child):not(:only-child):checked {
    border-bottom-style: none; }
    .linked.vertical > button:not(:last-child):not(:only-child):checked:hover, .linked.vertical > :not(:last-child):not(:only-child) button:checked:hover, stackswitcher.vertical > button:not(:last-child):not(:only-child):checked:hover {
      border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
      border-bottom-style: none;
      box-shadow: inset 0 -1px mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
  button.flat, button.flat.nautilus-circular-button.image-button {
    color: #ffffff;
    border-color: rgba(48, 54, 95, 0);
    background-color: rgba(48, 54, 95, 0);
    background-image: none;
    box-shadow: none; }
  button:hover, button.nautilus-circular-button.image-button:hover, button.flat:hover {
    background-color: #323964;
    background-image: none;
    border-color: rgba(204, 204, 204, 0.3);
    color: #ffffff;
    box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.32); }
    button:hover:focus, button:hover:hover, button.flat:hover:focus, button.flat:hover:hover {
      border-color: mix(#30365f,rgba(255, 255, 255, 0.3),0.3); }
    button:hover:active, button:hover:active:focus, button.flat:hover:active:focus, button:hover:checked, button:hover:checked:focus, button.flat:hover:checked:focus, button.flat:hover:active, button.flat:hover:active:hover:focus, button.flat:hover:checked, button.flat:hover:checked:hover:focus {
      border-color: rgba(179, 179, 179, 0.3); }
    button:hover:disabled, button.flat:hover:disabled {
      border-color: rgba(217, 217, 217, 0.3); }
    button:hover:active:disabled, button:hover:checked:disabled, button.flat:hover:active:disabled, button.flat:hover:checked:disabled {
      border-color: rgba(204, 204, 204, 0.3); }
  button:focus, button.nautilus-circular-button.image-button:focus, button.flat:focus {
    background-color: #323964;
    background-image: none;
    border-color: rgba(255, 255, 255, 0.22);
    outline-color: rgba(48, 54, 95, 0.5);
    outline-width: 3px;
    outline-style: solid;
    outline-offset: 10px;
    color: #ffffff;
    box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
    button:focus:hover, button.flat:focus:hover {
      background-color: #353b69;
      background-image: none;
      border-color: rgba(204, 204, 204, 0.3);
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.48); }
      button:focus:hover:hover, button.flat:focus:hover:hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.3),0.3); }
      button:focus:hover:active, button.flat:focus:hover:active, button.flat:focus:hover:active:focus, button:focus:hover:checked, button.flat:focus:hover:checked, button.flat:focus:hover:checked:focus, button.flat:focus:hover:active:hover:focus, button.flat:focus:hover:checked:hover:focus {
        border-color: rgba(179, 179, 179, 0.3); }
      button:focus:hover:disabled, button.flat:focus:hover:disabled {
        border-color: rgba(217, 217, 217, 0.3); }
      button:focus:hover:active:disabled, button:focus:hover:checked:disabled, button.flat:focus:hover:active:disabled, button.flat:focus:hover:checked:disabled {
        border-color: rgba(204, 204, 204, 0.3); }
  button:checked, button.nautilus-circular-button.image-button:checked, button:active, button.nautilus-circular-button.image-button:active, button.flat:checked, button.flat:active {
    /*@include linear-gradient(shade($bg, .7), to top);*/
    background-color: #30365f;
    background-image: none;
    border-color: rgba(204, 204, 204, 0.22);
    color: #ffffff;
    box-shadow: inset 1px 0 rgba(255, 255, 255, 0.06), inset 0 1px rgba(255, 255, 255, 0.07), inset -1px 0 rgba(255, 255, 255, 0.06), inset 0 -1px rgba(255, 255, 255, 0.05); }
    button:checked:focus, button:checked:hover, button:active:focus, button:active:hover, button.flat:checked:focus, button.flat:checked:hover, button.flat:active:focus, button.flat:active:hover {
      border-color: mix(#30365f,rgba(255, 255, 255, 0.22),0.3); }
    button:active:checked, button:active:checked:hover, button:active:checked:focus, button:active:checked:hover:focus, button.flat:active:checked, button.flat:active:checked:hover, button.flat:active:checked:focus, button.flat:active:checked:hover:focus {
      border-color: rgba(179, 179, 179, 0.22); }
    button:checked:disabled, button:active:disabled, button.flat:checked:disabled, button.flat:active:disabled {
      border-color: rgba(217, 217, 217, 0.22); }
    button:active:checked:disabled, button.flat:active:checked:disabled {
      border-color: rgba(204, 204, 204, 0.22); }
    button:checked:focus, button:checked:hover, button:active:focus, button:active:hover, button.flat:checked:focus, button.flat:checked:hover, button.flat:active:focus, button.flat:active:hover {
      /*@include linear-gradient(shade($bg, .65), to top);*/
      background-color: #323964;
      background-image: none;
      color: #ffffff; }
  button:focus, button.nautilus-circular-button.image-button:focus, button:hover, button.nautilus-circular-button.image-button:hover, button.flat:focus, button.flat:hover {
    color: #ffffff; }
  button:disabled:disabled, button.flat:disabled:disabled {
    background-color: alpha(mix(#30365F,#ffffff,0.2),0.4);
    background-image: none;
    /*border: 1px solid alpha($bg, .2);*/
    opacity: .6;
    color: mix(#30365F,#ffffff,0.6);
    box-shadow: none; }
    button:disabled:disabled :disabled, button.flat:disabled:disabled :disabled {
      color: mix(#30365F,#ffffff,0.6); }
  button:active:disabled, button:checked:disabled, button.flat:active:disabled, button.flat:checked:disabled {
    background-color: rgba(48, 54, 95, 0.6);
    background-image: none;
    color: rgba(255, 255, 255, 0.85);
    box-shadow: none; }
    button:active:disabled :disabled, button:checked:disabled :disabled, button.flat:active:disabled :disabled, button.flat:checked:disabled :disabled {
      color: rgba(255, 255, 255, 0.85); }
  button:backdrop, button.nautilus-circular-button.image-button:backdrop, button.flat:backdrop {
    color: mix(#ffffff,mix(#ffffff,#1b1c36,0.5),0.8); }
  button.separator, button.separator.nautilus-circular-button.image-button, button .separator, button.nautilus-circular-button.image-button .separator {
    border: 1px solid currentColor;
    color: rgba(48, 54, 95, 0.9); }
    button.separator:disabled, button .separator:disabled {
      color: rgba(48, 54, 95, 0.85); }
  button separator, button.nautilus-circular-button.image-button separator {
    background-image: image(mix(#ffffff,#30365F,0.9)); }
  .inline-toolbar button, .inline-toolbar button.nautilus-circular-button.image-button, .linked > button, .linked > button.nautilus-circular-button.image-button {
    box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22); }
    .inline-toolbar button:focus, .inline-toolbar button:hover, .linked > button:focus, .linked > button:hover {
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
    .inline-toolbar button:active, .inline-toolbar button:active:hover, .inline-toolbar button:active:focus, .inline-toolbar button:active:hover:focus, .inline-toolbar button:checked, .inline-toolbar button:checked:hover, .inline-toolbar button:checked:focus, .inline-toolbar button:checked:hover:focus, .linked > button:active, .linked > button:active:hover, .linked > button:active:focus, .linked > button:active:hover:focus, .linked > button:checked, .linked > button:checked:hover, .linked > button:checked:focus, .linked > button:checked:hover:focus {
      box-shadow: inset 0 1px rgba(51, 51, 51, 0.07), inset 0 -1px rgba(51, 51, 51, 0.05); }
    .inline-toolbar button:disabled, .linked > button:disabled {
      box-shadow: inset -1px 0 #262b4c; }
    .inline-toolbar button:last-child, .inline-toolbar button:only-child, .linked > button:last-child, .linked > button:only-child {
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22); }
    .inline-toolbar button:last-child:hover, .inline-toolbar button:only-child:hover, .linked > button:last-child:hover, .linked > button:only-child:hover {
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
    .inline-toolbar button:disabled:last-child, .inline-toolbar button:disabled:only-child, .inline-toolbar button:active:disabled:last-child, .inline-toolbar button:active:disabled:only-child, .inline-toolbar button:checked:disabled:last-child, .inline-toolbar button:checked:disabled:only-child, .linked > button:disabled:last-child, .linked > button:disabled:only-child, .linked > button:active:disabled:last-child, .linked > button:active:disabled:only-child, .linked > button:checked:disabled:last-child, .linked > button:checked:disabled:only-child {
      box-shadow: none; }
    .inline-toolbar button:active:last-child, .inline-toolbar button:active:last-child:focus, .inline-toolbar button:active:last-child:hover, .inline-toolbar button:active:last-child:hover:focus, .inline-toolbar button:checked:last-child, .inline-toolbar button:checked:last-child:focus, .inline-toolbar button:checked:last-child:hover, .inline-toolbar button:checked:last-child:hover:focus, .linked > button:active:last-child, .linked > button:active:last-child:focus, .linked > button:active:last-child:hover, .linked > button:active:last-child:hover:focus, .linked > button:checked:last-child, .linked > button:checked:last-child:focus, .linked > button:checked:last-child:hover, .linked > button:checked:last-child:hover:focus {
      box-shadow: inset 0 1px rgba(51, 51, 51, 0.07), inset -1px 0 rgba(51, 51, 51, 0.06); }
    .inline-toolbar button:active:only-child, .inline-toolbar button:active:only-child:focus, .inline-toolbar button:active:only-child:hover, .inline-toolbar button:active:only-child:hover:focus, .inline-toolbar button:checked:only-child, .inline-toolbar button:checked:only-child:focus, .inline-toolbar button:checked:only-child:hover, .inline-toolbar button:checked:only-child:hover:focus, .linked > button:active:only-child, .linked > button:active:only-child:focus, .linked > button:active:only-child:hover, .linked > button:active:only-child:hover:focus, .linked > button:checked:only-child, .linked > button:checked:only-child:focus, .linked > button:checked:only-child:hover, .linked > button:checked:only-child:hover:focus {
      box-shadow: inset 1px 0 rgba(51, 51, 51, 0.06), inset 0 1px rgba(51, 51, 51, 0.07), inset -1px 0 rgba(51, 51, 51, 0.06); }
  .linked.vertical > button {
    box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22); }
    .linked.vertical > button:focus, .linked.vertical > button:hover {
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
    .linked.vertical > button:active, .linked.vertical > button:active:hover, .linked.vertical > button:active:focus, .linked.vertical > button:active:hover:focus, .linked.vertical > button:checked, .linked.vertical > button:checked:hover, .linked.vertical > button:checked:focus, .linked.vertical > button:checked:hover:focus {
      box-shadow: inset 1px 0 rgba(51, 51, 51, 0.07), inset -1px 0 rgba(51, 51, 51, 0.05); }
    .linked.vertical > button:disabled {
      box-shadow: inset 0 -1px #262b4c; }
    .linked.vertical > button:last-child, .linked.vertical > button:only-child {
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22); }
    .linked.vertical > button:last-child:hover, .linked.vertical > button:only-child:hover {
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
    .linked.vertical > button:disabled:last-child, .linked.vertical > button:disabled:only-child, .linked.vertical > button:active:disabled:last-child, .linked.vertical > button:active:disabled:only-child, .linked.vertical > button:checked:disabled:last-child, .linked.vertical > button:checked:disabled:only-child {
      box-shadow: none; }
    .linked.vertical > button:active:last-child, .linked.vertical > button:active:last-child:focus, .linked.vertical > button:active:last-child:hover, .linked.vertical > button:active:last-child:hover:focus, .linked.vertical > button:checked:last-child, .linked.vertical > button:checked:last-child:focus, .linked.vertical > button:checked:last-child:hover, .linked.vertical > button:checked:last-child:hover:focus {
      box-shadow: inset 0 1px rgba(51, 51, 51, 0.07), inset -1px 0 rgba(51, 51, 51, 0.06); }
    .linked.vertical > button:active:only-child, .linked.vertical > button:active:only-child:focus, .linked.vertical > button:active:only-child:hover, .linked.vertical > button:active:only-child:hover:focus, .linked.vertical > button:checked:only-child, .linked.vertical > button:checked:only-child:focus, .linked.vertical > button:checked:only-child:hover, .linked.vertical > button:checked:only-child:hover:focus {
      box-shadow: inset 1px 0 rgba(51, 51, 51, 0.06), inset 0 1px rgba(51, 51, 51, 0.07), inset -1px 0 rgba(51, 51, 51, 0.06); }
  button.circular, button.nautilus-circular-button.image-button, button.circular-button {
    padding: 0;
    min-width: 30px;
    min-height: 30px;
    border-radius: 9999px;
    -gtk-outline-radius: 9999px; }
    button.circular label, button.nautilus-circular-button.image-button label, button.circular-button label {
      padding: 0; }

spinbutton:disabled {
  opacity: .6; }

spinbutton button, spinbutton button.nautilus-circular-button.image-button {
  color: #ffffff;
  padding: 4px 7px; }
  spinbutton button:active, spinbutton button.nautilus-circular-button.image-button:active, spinbutton button:checked, spinbutton button.nautilus-circular-button.image-button:checked, spinbutton button:hover, spinbutton button.nautilus-circular-button.image-button:hover {
    background-color: #3a4172;
    background-image: none; }
  spinbutton button:hover, spinbutton button.nautilus-circular-button.image-button:hover, spinbutton button:focus:hover {
    border-color: rgba(204, 204, 204, 0.3); }
    spinbutton button:hover:focus, spinbutton button:hover:hover, spinbutton button:focus:hover:hover {
      border-color: mix(#30365f,rgba(255, 255, 255, 0.3),0.3); }
    spinbutton button:hover:active, spinbutton button:focus:hover:active, spinbutton button:focus:hover:active:focus, spinbutton button:hover:checked, spinbutton button:focus:hover:checked, spinbutton button:focus:hover:checked:focus, spinbutton button:focus:hover:active:hover:focus, spinbutton button:focus:hover:checked:hover:focus {
      border-color: rgba(179, 179, 179, 0.3); }
    spinbutton button:hover:disabled, spinbutton button:focus:hover:disabled {
      border-color: rgba(217, 217, 217, 0.3); }
    spinbutton button:hover:active:disabled, spinbutton button:hover:checked:disabled, spinbutton button:focus:hover:active:disabled, spinbutton button:focus:hover:checked:disabled {
      border-color: rgba(204, 204, 204, 0.3); }
  spinbutton button:focus:hover {
    color: mix(#ffffff,mix(#30365f,mix(#1b1c36,#ffffff,0.18),0.3),0.3); }
  spinbutton button:disabled, spinbutton button.nautilus-circular-button.image-button:disabled {
    color: mix(#ffffff,#1b1c36,0.7); }
  spinbutton button:backdrop, spinbutton button.nautilus-circular-button.image-button:backdrop {
    color: mix(#ffffff,mix(#ffffff,#1b1c36,0.5),0.8); }
  spinbutton button:backdrop:disabled {
    color: rgba(2, 2, 3, 0.8); }

spinbutton:not(.vertical) {
  /*@extend %entry;*/
  background-color: #1b1c36;
  background-image: none;
  /*@include border($base_color);*/
  padding: 0;
  border-radius: 8px;
  -gtk-outline-radius: 17.6px;
  color: #c1c3cc;
  caret-color: #c1c3cc;
  /*&:focus, &:active { border-color: border_focus($borders_color); }*/ }
  spinbutton:not(.vertical):disabled {
    background-color: #181931;
    background-image: none;
    color: mix(#1b1c36,#c1c3cc,0.5); }
  spinbutton:not(.vertical) entry {
    border-radius: 8px 0 0 8px;
    -gtk-outline-radius: 17.6px 0 0 17.6px;
    border-right-width: 0;
    box-shadow: none; }
  spinbutton:not(.vertical) button, spinbutton:not(.vertical) button.nautilus-circular-button.image-button {
    border-radius: 0;
    -gtk-outline-radius: 0;
    border-style: solid;
    background-image: none;
    box-shadow: none; }
    spinbutton:not(.vertical) button:focus {
      border-top-color: mix(#30365f,mix(#1b1c36,#ffffff,0.18),0.3);
      border-bottom-color: mix(#30365f,mix(#1b1c36,#ffffff,0.18),0.3); }
    spinbutton:not(.vertical) button:active {
      box-shadow: inset 0 2px 3px -1px rgba(102, 102, 102, 0.2); }
    spinbutton:not(.vertical) button:backdrop {
      border-color: alpha(mix(#1b1c36,mix(#1b1c36,#ffffff,0.18),0.9),0.8); }
    spinbutton:not(.vertical) button.up:dir(ltr), spinbutton:not(.vertical) button.down:dir(rtl) {
      border-style: solid; }
      spinbutton:not(.vertical) button.up:dir(ltr):hover, spinbutton:not(.vertical) button.up:dir(ltr):focus:hover, spinbutton:not(.vertical) button.down:dir(rtl):hover, spinbutton:not(.vertical) button.down:dir(rtl):focus:hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.3),0.3); }
    spinbutton:not(.vertical) button.down:dir(rtl) {
      border-right-style: none;
      border-radius: 8px 0 0 8px;
      -gtk-outline-radius: 17.6px 0 0 17.6px; }
      spinbutton:not(.vertical) button.down:dir(rtl):focus {
        border-top-color: mix(#30365f,mix(#1b1c36,#ffffff,0.18),0.3);
        border-bottom-color: mix(#30365f,mix(#1b1c36,#ffffff,0.18),0.3);
        border-left-color: mix(#30365f,mix(#1b1c36,#ffffff,0.18),0.3); }
      spinbutton:not(.vertical) button.down:dir(rtl):hover, spinbutton:not(.vertical) button.down:dir(rtl):focus:hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.3),0.3);
        box-shadow: inset-1px 0 0 mix(#30365f,rgba(255, 255, 255, 0.3),0.3); }
    spinbutton:not(.vertical) button.up:dir(ltr) {
      border-left-style: none;
      border-radius: 0 8px 8px 0;
      -gtk-outline-radius: 0 17.6px 17.6px 0; }
      spinbutton:not(.vertical) button.up:dir(ltr):focus {
        border-top-color: mix(#30365f,mix(#1b1c36,#ffffff,0.18),0.3);
        border-bottom-color: mix(#30365f,mix(#1b1c36,#ffffff,0.18),0.3);
        border-right-color: mix(#30365f,mix(#1b1c36,#ffffff,0.18),0.3); }
      spinbutton:not(.vertical) button.up:dir(ltr):hover, spinbutton:not(.vertical) button.up:dir(ltr):focus:hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.3),0.3);
        box-shadow: inset 1px 0 mix(#30365f,rgba(255, 255, 255, 0.3),0.3); }

spinbutton.vertical button, spinbutton.vertical button.nautilus-circular-button.image-button, spinbutton.vertical entry {
  min-width: 0;
  padding-left: 2px;
  padding-right: 2px; }

spinbutton.vertical entry {
  border-radius: 0;
  -gtk-outline-radius: 0;
  border-top-width: 0;
  border-bottom-width: 0; }

spinbutton.vertical button.up:focus:hover, spinbutton.vertical button.down:focus:hover {
  border-color: mix(#30365f,rgba(255, 255, 255, 0.3),0.3); }

spinbutton.vertical button.up {
  border-radius: 8px 8px 0 0;
  -gtk-outline-radius: 17.6px 17.6px 0 0; }
  spinbutton.vertical button.up:focus {
    border-top-color: mix(#30365f,mix(#1b1c36,#ffffff,0.18),0.3);
    border-left-color: mix(#30365f,mix(#1b1c36,#ffffff,0.18),0.3);
    border-right-color: mix(#30365f,mix(#1b1c36,#ffffff,0.18),0.3); }

spinbutton.vertical button.down {
  border-radius: 0 0 8px 8px;
  -gtk-outline-radius: 0 0 17.6px 17.6px; }
  spinbutton.vertical button.down:focus {
    border-bottom-color: mix(#30365f,mix(#1b1c36,#ffffff,0.18),0.3);
    border-left-color: mix(#30365f,mix(#1b1c36,#ffffff,0.18),0.3);
    border-right-color: mix(#30365f,mix(#1b1c36,#ffffff,0.18),0.3); }

/******************
! ComboBoxes *
*******************/
combobox button.combo, combobox button.combo.nautilus-circular-button.image-button {
  min-width: 0;
  padding-left: 6.2857142857px;
  padding-right: 6.2857142857px; }

combobox arrow {
  -gtk-icon-source: -gtk-icontheme("pan-down-symbolic");
  min-height: 18px;
  min-width: 18px;
  padding: 2px; }

combobox box button, combobox box button.nautilus-circular-button.image-button, combobox box entry {
  padding: 4px 6.2857142857px; }

combobox box > entry + button.combo, combobox box > entry + button.combo.nautilus-circular-button.image-button {
  padding: 4px; }

combobox menu menuitem {
  padding: 4px 7px; }
  combobox menu menuitem cellview {
    min-height: 22px; }

/*********
 ! Entry *
**********/
.linked:not(.vertical) > entry {
  border-width: 1px;
  border-radius: 0;
  border-right-width: 0;
  border-left-width: 0; }
  .linked:not(.vertical) > entry:first-child {
    border-width: 1px;
    border-radius: 8px;
    border-right-width: 0;
    border-bottom-right-radius: 0;
    border-top-right-radius: 0; }
    .linked:not(.vertical) > entry:first-child:dir(rtl) {
      border-left-width: 0;
      border-right-width: 1px; }
  .linked:not(.vertical) > entry:last-child {
    border-width: 1px;
    border-radius: 8px;
    border-left-width: 0;
    border-bottom-left-radius: 0;
    border-top-left-radius: 0; }
    .linked:not(.vertical) > entry:last-child:dir(rtl) {
      border-left-width: 1px;
      border-right-width: 0; }
  .linked:not(.vertical) > entry:only-child {
    border-width: 1px; }
  .linked:not(.vertical) > entry:only-child {
    border-radius: 8px; }

.linked.vertical > entry {
  border-width: 1px;
  border-radius: 0;
  border-top-width: 0;
  border-bottom-width: 0; }
  .linked.vertical > entry:first-child {
    border-width: 1px;
    border-radius: 8px;
    border-top-width: 1px;
    border-bottom-width: 0;
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0; }
    .linked.vertical > entry:first-child:dir(rtl) {
      border-top-width: 0;
      border-bottom-width: 1px; }
  .linked.vertical > entry:last-child {
    border-width: 1px;
    border-radius: 8px;
    border-top-width: 0;
    border-bottom-width: 1px;
    border-top-left-radius: 0;
    border-top-right-radius: 0; }
    .linked.vertical > entry:last-child:dir(rtl) {
      border-top-width: 1px;
      border-bottom-width: 0; }
  .linked.vertical > entry:only-child {
    border-width: 1px; }
  .linked.vertical > entry:only-child {
    border-radius: 8px; }

#login_window entry, .osd entry,
#XfceNotifyWindow entry, popover.background entry, menuitem entry, entry {
  border-width: 1px;
  border-style: solid;
  border-radius: 8px;
  transition: border 100ms ease-out;
  box-shadow: inset 1px 0 rgba(51, 51, 51, 0.1), inset 0 1px rgba(51, 51, 51, 0.12), inset -1px 0 rgba(51, 51, 51, 0.1), inset 0 -1px rgba(51, 51, 51, 0.05); }
  #login_window entry:focus,
  #XfceNotifyWindow entry:focus, popover.background entry:focus, entry:focus, #login_window entry:hover,
  #XfceNotifyWindow entry:hover, popover.background entry:hover, entry:hover, #login_window entry:active,
  #XfceNotifyWindow entry:active, popover.background entry:active, entry:active {
    transition: border 100ms ease-in; }
  #login_window entry:selected,
  #XfceNotifyWindow entry:selected, popover.background entry:selected, entry:selected {
    background-color: #30365f;
    color: #ffffff; }
  #login_window entry:disabled,
  #XfceNotifyWindow entry:disabled, popover.background entry:disabled, entry:disabled {
    box-shadow: none; }
  #login_window entry progress, .osd entry progress,
  #XfceNotifyWindow entry progress, popover.background entry progress, entry progress {
    background-color: #30365f;
    background-image: none;
    border-width: 0;
    border-radius: 8px;
    color: #ffffff; }
  #login_window entry image.left,
  #XfceNotifyWindow entry image.left, entry image.left {
    padding-right: 4px; }
  #login_window entry image.right,
  #XfceNotifyWindow entry image.right, entry image.right {
    padding-left: 4px; }
  #login_window entry.warning,
  #XfceNotifyWindow entry.warning, popover.background entry.warning, entry.warning {
    color: #1b1c36;
    border-color: #8c9100;
    background-color: mix(#1b1c36,#afb500,0.6); }
    #login_window entry.warning image,
    #XfceNotifyWindow entry.warning image, entry.warning image {
      color: #1b1c36; }
    #login_window entry.warning:focus,
    #XfceNotifyWindow entry.warning:focus, entry.warning:focus {
      color: #1b1c36;
      border-color: mix(#30365f,#afb500,0.3);
      background-color: #afb500;
      box-shadow: none; }
    #login_window entry.warning selection,
    #XfceNotifyWindow entry.warning selection, entry.warning selection {
      background-color: #1b1c36;
      color: #afb500; }
  #login_window entry.error,
  #XfceNotifyWindow entry.error, popover.background entry.error, entry.error {
    color: #1b1c36;
    border-color: #8c0000;
    background-color: mix(#1b1c36,#af0000,0.6); }
    #login_window entry.error image,
    #XfceNotifyWindow entry.error image, entry.error image {
      color: #1b1c36; }
    #login_window entry.error:focus,
    #XfceNotifyWindow entry.error:focus, entry.error:focus {
      color: #1b1c36;
      border-color: mix(#30365f,#af0000,0.3);
      background-color: #af0000;
      box-shadow: none; }
    #login_window entry.error selection,
    #XfceNotifyWindow entry.error selection, entry.error selection {
      background-color: #1b1c36;
      color: #af0000; }
  #login_window entry.search-missing,
  #XfceNotifyWindow entry.search-missing, popover.background entry.search-missing, entry.search-missing {
    color: #1b1c36;
    border-color: #8c0000;
    background-color: mix(#1b1c36,#af0000,0.6); }
    #login_window entry.search-missing image,
    #XfceNotifyWindow entry.search-missing image, entry.search-missing image {
      color: #1b1c36; }
    #login_window entry.search-missing:focus,
    #XfceNotifyWindow entry.search-missing:focus, entry.search-missing:focus {
      color: #1b1c36;
      border-color: mix(#30365f,#af0000,0.3);
      background-color: #af0000;
      box-shadow: none; }
    #login_window entry.search-missing selection,
    #XfceNotifyWindow entry.search-missing selection, entry.search-missing selection {
      background-color: #1b1c36;
      color: #af0000; }

entry {
  background-color: #1b1c36;
  background-image: none;
  border-color: mix(#c1c3cc,#1b1c36,0.8);
  padding: 6px 6.2857142857px;
  color: #c1c3cc;
  caret-color: #c1c3cc;
  -gtk-secondary-caret-color: #ff0007; }
  entry:focus, entry:hover {
    border-color: mix(#30365f,mix(#c1c3cc,#1b1c36,0.7),0.3); }
  entry:active, entry:active:hover, entry:active:focus, entry:active:hover:focus, entry:checked, entry:checked:hover, entry:checked:focus, entry:checked:hover:focus {
    border-color: mix(#c1c3cc,#1b1c36,0.32); }
  entry:disabled {
    border-color: mix(#c1c3cc,#1b1c36,0.84); }
  entry:active:disabled, entry:checked:disabled {
    border-color: mix(#c1c3cc,#1b1c36,0.8); }
  entry:focus, entry:active {
    border-color: mix(#30365f,mix(#1b1c36,#ffffff,0.18),0.3); }
  entry:disabled {
    background-color: mix(#1b1c36,#c1c3cc,0.07);
    background-image: none;
    opacity: .9;
    color: mix(#1b1c36,#c1c3cc,0.9); }

/*********
 ! Buttons
**********/
/******************
! ComboBoxes *
*******************/
/*********
 ! Buttons
**********/
/******************
! ComboBoxes *
*******************/
/*********
 ! Toolbar
**********/
toolbar {
  padding: 3px;
  border-style: none; }
  toolbar.horizontal separator {
    margin: 0 6px 1px; }
  toolbar.vertical separator {
    margin: 6px 1px 6px 0; }

headerbar {
  border-width: 0 0 1px;
  border-style: solid; }
  headerbar entry,
  headerbar spinbutton,
  headerbar separator,
  headerbar button,
  headerbar button.nautilus-circular-button.image-button {
    margin-top: 7px;
    margin-bottom: 7px; }
  headerbar switch {
    margin-top: 5px;
    margin-bottom: 5px; }
  window:not(.tiled):not(.maximized) separator:first-child + headerbar, window:not(.tiled):not(.maximized) headerbar:first-child {
    border-top-left-radius: 8px; }
  window:not(.tiled):not(.maximized) headerbar:last-child {
    border-top-right-radius: 8px; }

.titlebar:not(headerbar), headerbar {
  background-color: #16172d;
  background-image: none;
  border-color: mix(#ffffff,#16172d,0.88);
  color: #ffffff;
  background-color: #16172d;
  background-image: none;
  border-radius: 8px 8px 0 0;
  color: #ffffff;
  padding: 0 6px;
  min-height: 42px; }
  .titlebar:focus:not(headerbar), headerbar:focus, .titlebar:hover:not(headerbar), headerbar:hover {
    border-color: mix(#30365f,mix(#ffffff,#16172d,0.8),0.3); }
  .titlebar:active:not(headerbar), headerbar:active, .titlebar:checked:not(headerbar), headerbar:checked {
    border-color: mix(#ffffff,#16172d,0.4); }
  .titlebar:disabled:not(headerbar), headerbar:disabled {
    border-color: mix(#ffffff,#16172d,0.92); }
  .titlebar:active:disabled:not(headerbar), headerbar:active:disabled, .titlebar:checked:disabled:not(headerbar), headerbar:checked:disabled {
    border-color: mix(#ffffff,#16172d,0.88); }
  .titlebar:disabled:not(headerbar), headerbar:disabled {
    background-color: #141529;
    background-image: none;
    color: mix(#ffffff,#16172d,0.5); }
  .titlebar:not(headerbar) .background, headerbar .background {
    background-color: #16172d;
    border-color: mix(#16172d,#ffffff,0.3); }
  .titlebar:not(headerbar) .title, headerbar .title {
    font-weight: bold;
    padding: 0 8px; }
  .titlebar:not(headerbar) .subtitle, headerbar .subtitle {
    font-size: smaller;
    padding: 0 8px; }
  .titlebar:not(headerbar) button, headerbar button, headerbar button.nautilus-circular-button.image-button {
    background-color: #16172d;
    background-image: none;
    border-color: rgba(204, 204, 204, 0.22);
    color: #ffffff;
    box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22); }
    .titlebar:not(headerbar) button:focus, headerbar button:focus, headerbar button.nautilus-circular-button.image-button:focus, .titlebar:not(headerbar) button:hover, headerbar button:hover, headerbar button.nautilus-circular-button.image-button:hover {
      border-color: mix(#30365f,rgba(255, 255, 255, 0.22),0.3); }
    .titlebar:not(headerbar) button:active, headerbar button:active, headerbar button.nautilus-circular-button.image-button:active, .titlebar:not(headerbar) button:checked, headerbar button:checked, headerbar button.nautilus-circular-button.image-button:checked {
      border-color: rgba(179, 179, 179, 0.22); }
    .titlebar:not(headerbar) button:disabled, headerbar button:disabled, headerbar button.nautilus-circular-button.image-button:disabled {
      border-color: rgba(217, 217, 217, 0.22); }
    .titlebar:not(headerbar) button:active:disabled, headerbar button:active:disabled, .titlebar:not(headerbar) button:checked:disabled, headerbar button:checked:disabled {
      border-color: rgba(204, 204, 204, 0.22); }
    .linked:not(.vertical) > .titlebar:not(headerbar) button:not(:last-child):not(:only-child), .linked:not(.vertical) > headerbar button:not(:last-child):not(:only-child), .linked:not(.vertical) > :not(:last-child):not(:only-child) .titlebar:not(headerbar) button, .linked:not(.vertical) > :not(:last-child):not(:only-child) headerbar button, viewswitcher:not(.vertical) > .titlebar:not(headerbar) button:not(:last-child):not(:only-child), viewswitcher:not(.vertical) > headerbar button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > .titlebar:not(headerbar) button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > headerbar button:not(:last-child):not(:only-child) {
      border-right-style: none; }
      .linked:not(.vertical) > .titlebar:not(headerbar) button:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > headerbar button:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) .titlebar:not(headerbar) button:hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) headerbar button:hover, viewswitcher:not(.vertical) > .titlebar:not(headerbar) button:not(:last-child):not(:only-child):hover, viewswitcher:not(.vertical) > headerbar button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > .titlebar:not(headerbar) button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > headerbar button:not(:last-child):not(:only-child):hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.36),0.3);
        border-right-style: none;
        box-shadow: inset-1px 0 0 mix(#30365f,rgba(255, 255, 255, 0.36),0.3); }
    .linked:not(.vertical) > .titlebar:not(headerbar) button:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > headerbar button:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > :not(:last-child):not(:only-child) .titlebar:not(headerbar) button:checked, .linked:not(.vertical) > :not(:last-child):not(:only-child) headerbar button:checked, viewswitcher:not(.vertical) > .titlebar:not(headerbar) button:not(:last-child):not(:only-child), viewswitcher:not(.vertical) > headerbar button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > .titlebar:not(headerbar) button:not(:last-child):not(:only-child):checked, stackswitcher:not(.vertical) > headerbar button:not(:last-child):not(:only-child):checked {
      border-right-style: none; }
      .linked:not(.vertical) > .titlebar:not(headerbar) button:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > headerbar button:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) .titlebar:not(headerbar) button:checked:hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) headerbar button:checked:hover, viewswitcher:not(.vertical) > .titlebar:not(headerbar) button:not(:last-child):not(:only-child):hover, viewswitcher:not(.vertical) > headerbar button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > .titlebar:not(headerbar) button:not(:last-child):not(:only-child):checked:hover, stackswitcher:not(.vertical) > headerbar button:not(:last-child):not(:only-child):checked:hover {
        border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
        border-right-style: none;
        box-shadow: inset-1px 0 0 mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
    .linked.vertical > .titlebar:not(headerbar) button:not(:last-child):not(:only-child), .linked.vertical > headerbar button:not(:last-child):not(:only-child), .linked.vertical > :not(:last-child):not(:only-child) .titlebar:not(headerbar) button, .linked.vertical > :not(:last-child):not(:only-child) headerbar button, stackswitcher.vertical > .titlebar:not(headerbar) button:not(:last-child):not(:only-child), stackswitcher.vertical > headerbar button:not(:last-child):not(:only-child) {
      border-bottom-style: none; }
      .linked.vertical > .titlebar:not(headerbar) button:not(:last-child):not(:only-child):hover, .linked.vertical > headerbar button:not(:last-child):not(:only-child):hover, .linked.vertical > :not(:last-child):not(:only-child) .titlebar:not(headerbar) button:hover, .linked.vertical > :not(:last-child):not(:only-child) headerbar button:hover, stackswitcher.vertical > .titlebar:not(headerbar) button:not(:last-child):not(:only-child):hover, stackswitcher.vertical > headerbar button:not(:last-child):not(:only-child):hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.36),0.3);
        border-bottom-style: none;
        box-shadow: inset 0 -1px mix(#30365f,rgba(255, 255, 255, 0.36),0.3); }
    .linked.vertical > .titlebar:not(headerbar) button:not(:last-child):not(:only-child):checked, .linked.vertical > headerbar button:not(:last-child):not(:only-child):checked, .linked.vertical > :not(:last-child):not(:only-child) .titlebar:not(headerbar) button:checked, .linked.vertical > :not(:last-child):not(:only-child) headerbar button:checked, stackswitcher.vertical > .titlebar:not(headerbar) button:not(:last-child):not(:only-child):checked, stackswitcher.vertical > headerbar button:not(:last-child):not(:only-child):checked {
      border-bottom-style: none; }
      .linked.vertical > .titlebar:not(headerbar) button:not(:last-child):not(:only-child):checked:hover, .linked.vertical > headerbar button:not(:last-child):not(:only-child):checked:hover, .linked.vertical > :not(:last-child):not(:only-child) .titlebar:not(headerbar) button:checked:hover, .linked.vertical > :not(:last-child):not(:only-child) headerbar button:checked:hover, stackswitcher.vertical > .titlebar:not(headerbar) button:not(:last-child):not(:only-child):checked:hover, stackswitcher.vertical > headerbar button:not(:last-child):not(:only-child):checked:hover {
        border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
        border-bottom-style: none;
        box-shadow: inset 0 -1px mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
    .titlebar:not(headerbar) button.flat, headerbar button.flat, headerbar button.flat.nautilus-circular-button.image-button {
      color: #ffffff;
      border-color: rgba(22, 23, 45, 0);
      background-color: rgba(22, 23, 45, 0);
      background-image: none;
      box-shadow: none; }
    .titlebar:not(headerbar) button:hover, headerbar button:hover, headerbar button.nautilus-circular-button.image-button:hover {
      background-color: #17182f;
      background-image: none;
      border-color: rgba(204, 204, 204, 0.3);
      color: #ffffff;
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.32); }
      .titlebar:not(headerbar) button:hover:hover, headerbar button:hover:hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.3),0.3); }
      .titlebar:not(headerbar) button:hover:active, headerbar button:hover:active, .titlebar:not(headerbar) button:hover:checked, headerbar button:hover:checked {
        border-color: rgba(179, 179, 179, 0.3); }
      .titlebar:not(headerbar) button:hover:disabled, headerbar button:hover:disabled {
        border-color: rgba(217, 217, 217, 0.3); }
      .titlebar:not(headerbar) button:hover:active:disabled, headerbar button:hover:active:disabled, .titlebar:not(headerbar) button:hover:checked:disabled, headerbar button:hover:checked:disabled {
        border-color: rgba(204, 204, 204, 0.3); }
    .titlebar:not(headerbar) button:focus, headerbar button:focus, headerbar button.nautilus-circular-button.image-button:focus {
      background-color: #17182f;
      background-image: none;
      border-color: rgba(255, 255, 255, 0.22);
      outline-color: rgba(48, 54, 95, 0.5);
      outline-width: 3px;
      outline-style: solid;
      outline-offset: 10px;
      color: #ffffff;
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
      .titlebar:not(headerbar) button:focus:hover, headerbar button:focus:hover {
        background-color: #181932;
        background-image: none;
        border-color: rgba(204, 204, 204, 0.3);
        box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.48); }
        .titlebar:not(headerbar) button:focus:hover:focus, headerbar button:focus:hover:focus {
          border-color: mix(#30365f,rgba(255, 255, 255, 0.3),0.3); }
        .titlebar:not(headerbar) button:focus:hover:active, headerbar button:focus:hover:active, .titlebar:not(headerbar) button:focus:hover:checked, headerbar button:focus:hover:checked {
          border-color: rgba(179, 179, 179, 0.3); }
        .titlebar:not(headerbar) button:focus:hover:disabled, headerbar button:focus:hover:disabled {
          border-color: rgba(217, 217, 217, 0.3); }
        .titlebar:not(headerbar) button:focus:hover:active:disabled, headerbar button:focus:hover:active:disabled, .titlebar:not(headerbar) button:focus:hover:checked:disabled, headerbar button:focus:hover:checked:disabled {
          border-color: rgba(204, 204, 204, 0.3); }
    .titlebar:not(headerbar) button:checked, headerbar button:checked, headerbar button.nautilus-circular-button.image-button:checked, .titlebar:not(headerbar) button:active, headerbar button:active, headerbar button.nautilus-circular-button.image-button:active {
      /*@include linear-gradient(shade($bg, .7), to top);*/
      background-color: #30365f;
      background-image: none;
      border-color: rgba(204, 204, 204, 0.22);
      color: #ffffff;
      box-shadow: inset 1px 0 rgba(255, 255, 255, 0.06), inset 0 1px rgba(255, 255, 255, 0.07), inset -1px 0 rgba(255, 255, 255, 0.06), inset 0 -1px rgba(255, 255, 255, 0.05); }
      .titlebar:not(headerbar) button:checked:focus, headerbar button:checked:focus, .titlebar:not(headerbar) button:checked:hover, headerbar button:checked:hover, .titlebar:not(headerbar) button:active:focus, headerbar button:active:focus, .titlebar:not(headerbar) button:active:hover, headerbar button:active:hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.22),0.3); }
      .titlebar:not(headerbar) button:checked:checked, headerbar button:checked:checked, .titlebar:not(headerbar) button:active:active, headerbar button:active:active {
        border-color: rgba(179, 179, 179, 0.22); }
      .titlebar:not(headerbar) button:checked:disabled, headerbar button:checked:disabled, .titlebar:not(headerbar) button:active:disabled, headerbar button:active:disabled {
        border-color: rgba(217, 217, 217, 0.22); }
      .titlebar:not(headerbar) button:checked:checked:disabled, headerbar button:checked:checked:disabled, .titlebar:not(headerbar) button:active:active:disabled, headerbar button:active:active:disabled {
        border-color: rgba(204, 204, 204, 0.22); }
      .titlebar:not(headerbar) button:checked:focus, headerbar button:checked:focus, .titlebar:not(headerbar) button:checked:hover, headerbar button:checked:hover, .titlebar:not(headerbar) button:active:focus, headerbar button:active:focus, .titlebar:not(headerbar) button:active:hover, headerbar button:active:hover {
        /*@include linear-gradient(shade($bg, .65), to top);*/
        background-color: #323964;
        background-image: none;
        color: #ffffff; }
    .titlebar:not(headerbar) button:focus, headerbar button:focus, headerbar button.nautilus-circular-button.image-button:focus, .titlebar:not(headerbar) button:hover, headerbar button:hover, headerbar button.nautilus-circular-button.image-button:hover {
      color: #ffffff; }
    .titlebar:not(headerbar) button:disabled:disabled, headerbar button:disabled:disabled {
      background-color: alpha(mix(#16172d,#ffffff,0.2),0.4);
      background-image: none;
      /*border: 1px solid alpha($bg, .2);*/
      opacity: .6;
      color: mix(#16172d,#ffffff,0.6);
      box-shadow: none; }
      .titlebar:not(headerbar) button:disabled:disabled :disabled, headerbar button:disabled:disabled :disabled {
        color: mix(#16172d,#ffffff,0.6); }
    .titlebar:not(headerbar) button:active:disabled, headerbar button:active:disabled, .titlebar:not(headerbar) button:checked:disabled, headerbar button:checked:disabled {
      background-color: rgba(48, 54, 95, 0.6);
      background-image: none;
      color: rgba(255, 255, 255, 0.85);
      box-shadow: none; }
      .titlebar:not(headerbar) button:active:disabled :disabled, headerbar button:active:disabled :disabled, .titlebar:not(headerbar) button:checked:disabled :disabled, headerbar button:checked:disabled :disabled {
        color: rgba(255, 255, 255, 0.85); }
    .titlebar:not(headerbar) button:backdrop, headerbar button:backdrop, headerbar button.nautilus-circular-button.image-button:backdrop {
      color: mix(#ffffff,mix(#ffffff,#1b1c36,0.5),0.8); }
    .titlebar:not(headerbar) button.separator, headerbar button.separator, headerbar button.separator.nautilus-circular-button.image-button, .titlebar:not(headerbar) button .separator, headerbar button .separator, headerbar button.nautilus-circular-button.image-button .separator {
      border: 1px solid currentColor;
      color: rgba(22, 23, 45, 0.9); }
      .titlebar:not(headerbar) button.separator:disabled, headerbar button.separator:disabled, .titlebar:not(headerbar) button .separator:disabled, headerbar button .separator:disabled {
        color: rgba(22, 23, 45, 0.85); }
    .titlebar:not(headerbar) button separator, headerbar button separator, headerbar button.nautilus-circular-button.image-button separator {
      background-image: image(mix(#ffffff,#16172d,0.9)); }
    .titlebar:not(headerbar) button.image-button, headerbar button.image-button, headerbar button.image-button.nautilus-circular-button {
      padding: 4px; }
  .titlebar:not(headerbar) viewswitcher button, headerbar viewswitcher button, headerbar viewswitcher button.nautilus-circular-button.image-button,
  .titlebar:not(headerbar) .linked > button,
  headerbar .linked > button,
  headerbar .linked > button.nautilus-circular-button.image-button {
    box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22); }
    .titlebar:not(headerbar) viewswitcher button:focus, headerbar viewswitcher button:focus, headerbar viewswitcher button.nautilus-circular-button.image-button:focus, .titlebar:not(headerbar) viewswitcher button:hover, headerbar viewswitcher button:hover, headerbar viewswitcher button.nautilus-circular-button.image-button:hover,
    .titlebar:not(headerbar) .linked > button:focus,
    headerbar .linked > button:focus,
    .titlebar:not(headerbar) .linked > button:hover,
    headerbar .linked > button:hover {
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
    .titlebar:not(headerbar) viewswitcher button:active, headerbar viewswitcher button:active, headerbar viewswitcher button.nautilus-circular-button.image-button:active, .titlebar:not(headerbar) viewswitcher button:checked, headerbar viewswitcher button:checked, headerbar viewswitcher button.nautilus-circular-button.image-button:checked,
    .titlebar:not(headerbar) .linked > button:active,
    headerbar .linked > button:active,
    .titlebar:not(headerbar) .linked > button:checked,
    headerbar .linked > button:checked {
      box-shadow: inset 0 1px rgba(51, 51, 51, 0.07), inset 0 -1px rgba(51, 51, 51, 0.05); }
    .titlebar:not(headerbar) viewswitcher button:disabled, headerbar viewswitcher button:disabled, headerbar viewswitcher button.nautilus-circular-button.image-button:disabled,
    .titlebar:not(headerbar) .linked > button:disabled,
    headerbar .linked > button:disabled {
      box-shadow: inset -1px 0 #121224; }
    .titlebar:not(headerbar) viewswitcher button:last-child, headerbar viewswitcher button:last-child, headerbar viewswitcher button.nautilus-circular-button.image-button:last-child, .titlebar:not(headerbar) viewswitcher button:only-child, headerbar viewswitcher button:only-child, headerbar viewswitcher button.nautilus-circular-button.image-button:only-child,
    .titlebar:not(headerbar) .linked > button:last-child,
    headerbar .linked > button:last-child,
    .titlebar:not(headerbar) .linked > button:only-child,
    headerbar .linked > button:only-child {
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22); }
    .titlebar:not(headerbar) viewswitcher button:last-child:hover, headerbar viewswitcher button:last-child:hover, .titlebar:not(headerbar) viewswitcher button:only-child:hover, headerbar viewswitcher button:only-child:hover,
    .titlebar:not(headerbar) .linked > button:last-child:hover,
    headerbar .linked > button:last-child:hover,
    .titlebar:not(headerbar) .linked > button:only-child:hover,
    headerbar .linked > button:only-child:hover {
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
    .titlebar:not(headerbar) viewswitcher button:disabled:last-child, headerbar viewswitcher button:disabled:last-child, .titlebar:not(headerbar) viewswitcher button:disabled:only-child, headerbar viewswitcher button:disabled:only-child,
    .titlebar:not(headerbar) .linked > button:disabled:last-child,
    headerbar .linked > button:disabled:last-child,
    .titlebar:not(headerbar) .linked > button:disabled:only-child,
    headerbar .linked > button:disabled:only-child {
      box-shadow: none; }
    .titlebar:not(headerbar) viewswitcher button:active:last-child, headerbar viewswitcher button:active:last-child, .titlebar:not(headerbar) viewswitcher button:checked:last-child, headerbar viewswitcher button:checked:last-child,
    .titlebar:not(headerbar) .linked > button:active:last-child,
    headerbar .linked > button:active:last-child,
    .titlebar:not(headerbar) .linked > button:checked:last-child,
    headerbar .linked > button:checked:last-child {
      box-shadow: inset 0 1px rgba(51, 51, 51, 0.07), inset -1px 0 rgba(51, 51, 51, 0.06); }
    .titlebar:not(headerbar) viewswitcher button:active:only-child, headerbar viewswitcher button:active:only-child, .titlebar:not(headerbar) viewswitcher button:checked:only-child, headerbar viewswitcher button:checked:only-child,
    .titlebar:not(headerbar) .linked > button:active:only-child,
    headerbar .linked > button:active:only-child,
    .titlebar:not(headerbar) .linked > button:checked:only-child,
    headerbar .linked > button:checked:only-child {
      box-shadow: inset 1px 0 rgba(51, 51, 51, 0.06), inset 0 1px rgba(51, 51, 51, 0.07), inset -1px 0 rgba(51, 51, 51, 0.06); }
  .titlebar:not(headerbar) box button.image-button, headerbar box button.image-button, headerbar box button.image-button.nautilus-circular-button {
    padding: 4px 8px; }
  .titlebar:not(headerbar) separator, headerbar separator {
    color: #0d0e1b;
    border-color: currentColor;
    -GtkWidget-window-dragging: true; }
  .titlebar:not(headerbar) separator, headerbar separator {
    background-image: image(mix(#ffffff,#16172d,0.9)); }
  .titlebar:backdrop:not(headerbar), headerbar:backdrop {
    background-color: #1b1c36;
    background-image: none;
    color: mix(#ffffff,#1b1c36,0.4);
    text-shadow: none;
    border-color: mix(mix(#1b1c36,mix(#1b1c36,#ffffff,0.18),0.9),#1b1c36,0.5); }
  .default-decoration.titlebar:not(headerbar), headerbar.default-decoration {
    min-height: 24px;
    box-shadow: none;
    border: 0; }
    .default-decoration.titlebar:not(headerbar) button.titlebutton, headerbar.default-decoration button.titlebutton {
      min-height: 16px;
      min-width: 16px;
      margin: 0;
      padding: 0; }
  .solid-csd .titlebar:dir(rtl):not(headerbar), .solid-csd headerbar:dir(rtl), .solid-csd .titlebar:dir(ltr):not(headerbar), .solid-csd headerbar:dir(ltr) {
    border-radius: 0;
    box-shadow: none; }
  .tiled .titlebar:not(headerbar), .tiled headerbar, .maximized .titlebar:not(headerbar), .maximized headerbar {
    border-radius: 0; }
  .titlebar:not(headerbar) .title, headerbar .title {
    font-weight: bold; }
  .titlebar:not(headerbar) separator.titlebutton, headerbar separator.titlebutton {
    margin-left: 4px; }
  .titlebar:not(headerbar) button, headerbar button, headerbar button.nautilus-circular-button.image-button {
    background-color: #30365f;
    background-image: none;
    border-color: rgba(157, 173, 193, 0.22);
    color: #d3dae3;
    box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22);
    padding: 4px; }
    .titlebar:not(headerbar) button:focus, headerbar button:focus, headerbar button.nautilus-circular-button.image-button:focus, .titlebar:not(headerbar) button:hover, headerbar button:hover, headerbar button.nautilus-circular-button.image-button:hover {
      border-color: mix(#30365f,rgba(211, 218, 227, 0.22),0.3); }
    .titlebar:not(headerbar) button:active, headerbar button:active, headerbar button.nautilus-circular-button.image-button:active, .titlebar:not(headerbar) button:checked, headerbar button:checked, headerbar button.nautilus-circular-button.image-button:checked {
      border-color: rgba(131, 150, 176, 0.22); }
    .titlebar:not(headerbar) button:disabled, headerbar button:disabled, headerbar button.nautilus-circular-button.image-button:disabled {
      border-color: rgba(171, 184, 201, 0.22); }
    .titlebar:not(headerbar) button:active:disabled, headerbar button:active:disabled, .titlebar:not(headerbar) button:checked:disabled, headerbar button:checked:disabled {
      border-color: rgba(157, 173, 193, 0.22); }
    .linked:not(.vertical) > .titlebar:not(headerbar) button:not(:last-child):not(:only-child), .linked:not(.vertical) > headerbar button:not(:last-child):not(:only-child), .linked:not(.vertical) > :not(:last-child):not(:only-child) .titlebar:not(headerbar) button, .linked:not(.vertical) > :not(:last-child):not(:only-child) headerbar button, viewswitcher:not(.vertical) > .titlebar:not(headerbar) button:not(:last-child):not(:only-child), viewswitcher:not(.vertical) > headerbar button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > .titlebar:not(headerbar) button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > headerbar button:not(:last-child):not(:only-child) {
      border-right-style: none; }
      .linked:not(.vertical) > .titlebar:not(headerbar) button:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > headerbar button:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) .titlebar:not(headerbar) button:hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) headerbar button:hover, viewswitcher:not(.vertical) > .titlebar:not(headerbar) button:not(:last-child):not(:only-child):hover, viewswitcher:not(.vertical) > headerbar button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > .titlebar:not(headerbar) button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > headerbar button:not(:last-child):not(:only-child):hover {
        border-color: mix(#30365f,rgba(211, 218, 227, 0.36),0.3);
        border-right-style: none;
        box-shadow: inset-1px 0 0 mix(#30365f,rgba(211, 218, 227, 0.36),0.3); }
    .linked:not(.vertical) > .titlebar:not(headerbar) button:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > headerbar button:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > :not(:last-child):not(:only-child) .titlebar:not(headerbar) button:checked, .linked:not(.vertical) > :not(:last-child):not(:only-child) headerbar button:checked, viewswitcher:not(.vertical) > .titlebar:not(headerbar) button:not(:last-child):not(:only-child), viewswitcher:not(.vertical) > headerbar button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > .titlebar:not(headerbar) button:not(:last-child):not(:only-child):checked, stackswitcher:not(.vertical) > headerbar button:not(:last-child):not(:only-child):checked {
      border-right-style: none; }
      .linked:not(.vertical) > .titlebar:not(headerbar) button:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > headerbar button:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) .titlebar:not(headerbar) button:checked:hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) headerbar button:checked:hover, viewswitcher:not(.vertical) > .titlebar:not(headerbar) button:not(:last-child):not(:only-child):hover, viewswitcher:not(.vertical) > headerbar button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > .titlebar:not(headerbar) button:not(:last-child):not(:only-child):checked:hover, stackswitcher:not(.vertical) > headerbar button:not(:last-child):not(:only-child):checked:hover {
        border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
        border-right-style: none;
        box-shadow: inset-1px 0 0 mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
    .linked.vertical > .titlebar:not(headerbar) button:not(:last-child):not(:only-child), .linked.vertical > headerbar button:not(:last-child):not(:only-child), .linked.vertical > :not(:last-child):not(:only-child) .titlebar:not(headerbar) button, .linked.vertical > :not(:last-child):not(:only-child) headerbar button, stackswitcher.vertical > .titlebar:not(headerbar) button:not(:last-child):not(:only-child), stackswitcher.vertical > headerbar button:not(:last-child):not(:only-child) {
      border-bottom-style: none; }
      .linked.vertical > .titlebar:not(headerbar) button:not(:last-child):not(:only-child):hover, .linked.vertical > headerbar button:not(:last-child):not(:only-child):hover, .linked.vertical > :not(:last-child):not(:only-child) .titlebar:not(headerbar) button:hover, .linked.vertical > :not(:last-child):not(:only-child) headerbar button:hover, stackswitcher.vertical > .titlebar:not(headerbar) button:not(:last-child):not(:only-child):hover, stackswitcher.vertical > headerbar button:not(:last-child):not(:only-child):hover {
        border-color: mix(#30365f,rgba(211, 218, 227, 0.36),0.3);
        border-bottom-style: none;
        box-shadow: inset 0 -1px mix(#30365f,rgba(211, 218, 227, 0.36),0.3); }
    .linked.vertical > .titlebar:not(headerbar) button:not(:last-child):not(:only-child):checked, .linked.vertical > headerbar button:not(:last-child):not(:only-child):checked, .linked.vertical > :not(:last-child):not(:only-child) .titlebar:not(headerbar) button:checked, .linked.vertical > :not(:last-child):not(:only-child) headerbar button:checked, stackswitcher.vertical > .titlebar:not(headerbar) button:not(:last-child):not(:only-child):checked, stackswitcher.vertical > headerbar button:not(:last-child):not(:only-child):checked {
      border-bottom-style: none; }
      .linked.vertical > .titlebar:not(headerbar) button:not(:last-child):not(:only-child):checked:hover, .linked.vertical > headerbar button:not(:last-child):not(:only-child):checked:hover, .linked.vertical > :not(:last-child):not(:only-child) .titlebar:not(headerbar) button:checked:hover, .linked.vertical > :not(:last-child):not(:only-child) headerbar button:checked:hover, stackswitcher.vertical > .titlebar:not(headerbar) button:not(:last-child):not(:only-child):checked:hover, stackswitcher.vertical > headerbar button:not(:last-child):not(:only-child):checked:hover {
        border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
        border-bottom-style: none;
        box-shadow: inset 0 -1px mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
    .titlebar:not(headerbar) button.flat, headerbar button.flat, headerbar button.flat.nautilus-circular-button.image-button {
      color: #d3dae3;
      border-color: rgba(48, 54, 95, 0);
      background-color: rgba(48, 54, 95, 0);
      background-image: none;
      box-shadow: none; }
    .titlebar:not(headerbar) button:hover, headerbar button:hover, headerbar button.nautilus-circular-button.image-button:hover {
      background-color: #323964;
      background-image: none;
      border-color: rgba(157, 173, 193, 0.3);
      color: #d3dae3;
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.32); }
      .titlebar:not(headerbar) button:hover:hover, headerbar button:hover:hover {
        border-color: mix(#30365f,rgba(211, 218, 227, 0.3),0.3); }
      .titlebar:not(headerbar) button:hover:active, headerbar button:hover:active, .titlebar:not(headerbar) button:hover:checked, headerbar button:hover:checked {
        border-color: rgba(131, 150, 176, 0.3); }
      .titlebar:not(headerbar) button:hover:disabled, headerbar button:hover:disabled {
        border-color: rgba(171, 184, 201, 0.3); }
      .titlebar:not(headerbar) button:hover:active:disabled, headerbar button:hover:active:disabled, .titlebar:not(headerbar) button:hover:checked:disabled, headerbar button:hover:checked:disabled {
        border-color: rgba(157, 173, 193, 0.3); }
    .titlebar:not(headerbar) button:focus, headerbar button:focus, headerbar button.nautilus-circular-button.image-button:focus {
      background-color: #323964;
      background-image: none;
      border-color: rgba(211, 218, 227, 0.22);
      outline-color: rgba(48, 54, 95, 0.5);
      outline-width: 3px;
      outline-style: solid;
      outline-offset: 10px;
      color: #d3dae3;
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
      .titlebar:not(headerbar) button:focus:hover, headerbar button:focus:hover {
        background-color: #353b69;
        background-image: none;
        border-color: rgba(157, 173, 193, 0.3);
        box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.48); }
        .titlebar:not(headerbar) button:focus:hover:focus, headerbar button:focus:hover:focus {
          border-color: mix(#30365f,rgba(211, 218, 227, 0.3),0.3); }
        .titlebar:not(headerbar) button:focus:hover:active, headerbar button:focus:hover:active, .titlebar:not(headerbar) button:focus:hover:checked, headerbar button:focus:hover:checked {
          border-color: rgba(131, 150, 176, 0.3); }
        .titlebar:not(headerbar) button:focus:hover:disabled, headerbar button:focus:hover:disabled {
          border-color: rgba(171, 184, 201, 0.3); }
        .titlebar:not(headerbar) button:focus:hover:active:disabled, headerbar button:focus:hover:active:disabled, .titlebar:not(headerbar) button:focus:hover:checked:disabled, headerbar button:focus:hover:checked:disabled {
          border-color: rgba(157, 173, 193, 0.3); }
    .titlebar:not(headerbar) button:checked, headerbar button:checked, headerbar button.nautilus-circular-button.image-button:checked, .titlebar:not(headerbar) button:active, headerbar button:active, headerbar button.nautilus-circular-button.image-button:active {
      /*@include linear-gradient(shade($bg, .7), to top);*/
      background-color: #30365f;
      background-image: none;
      border-color: rgba(157, 173, 193, 0.22);
      color: #ffffff;
      box-shadow: inset 1px 0 rgba(211, 218, 227, 0.06), inset 0 1px rgba(211, 218, 227, 0.07), inset -1px 0 rgba(211, 218, 227, 0.06), inset 0 -1px rgba(211, 218, 227, 0.05); }
      .titlebar:not(headerbar) button:checked:focus, headerbar button:checked:focus, .titlebar:not(headerbar) button:checked:hover, headerbar button:checked:hover, .titlebar:not(headerbar) button:active:focus, headerbar button:active:focus, .titlebar:not(headerbar) button:active:hover, headerbar button:active:hover {
        border-color: mix(#30365f,rgba(211, 218, 227, 0.22),0.3); }
      .titlebar:not(headerbar) button:checked:checked, headerbar button:checked:checked, .titlebar:not(headerbar) button:active:active, headerbar button:active:active {
        border-color: rgba(131, 150, 176, 0.22); }
      .titlebar:not(headerbar) button:checked:disabled, headerbar button:checked:disabled, .titlebar:not(headerbar) button:active:disabled, headerbar button:active:disabled {
        border-color: rgba(171, 184, 201, 0.22); }
      .titlebar:not(headerbar) button:checked:checked:disabled, headerbar button:checked:checked:disabled, .titlebar:not(headerbar) button:active:active:disabled, headerbar button:active:active:disabled {
        border-color: rgba(157, 173, 193, 0.22); }
      .titlebar:not(headerbar) button:checked:focus, headerbar button:checked:focus, .titlebar:not(headerbar) button:checked:hover, headerbar button:checked:hover, .titlebar:not(headerbar) button:active:focus, headerbar button:active:focus, .titlebar:not(headerbar) button:active:hover, headerbar button:active:hover {
        /*@include linear-gradient(shade($bg, .65), to top);*/
        background-color: #323964;
        background-image: none;
        color: #ffffff; }
    .titlebar:not(headerbar) button:focus, headerbar button:focus, headerbar button.nautilus-circular-button.image-button:focus, .titlebar:not(headerbar) button:hover, headerbar button:hover, headerbar button.nautilus-circular-button.image-button:hover {
      color: #d3dae3; }
    .titlebar:not(headerbar) button:disabled:disabled, headerbar button:disabled:disabled {
      background-color: alpha(mix(#30365f,#d3dae3,0.2),0.4);
      background-image: none;
      /*border: 1px solid alpha($bg, .2);*/
      opacity: .6;
      color: mix(#30365f,#d3dae3,0.6);
      box-shadow: none; }
      .titlebar:not(headerbar) button:disabled:disabled :disabled, headerbar button:disabled:disabled :disabled {
        color: mix(#30365f,#d3dae3,0.6); }
    .titlebar:not(headerbar) button:active:disabled, headerbar button:active:disabled, .titlebar:not(headerbar) button:checked:disabled, headerbar button:checked:disabled {
      background-color: rgba(48, 54, 95, 0.6);
      background-image: none;
      color: rgba(255, 255, 255, 0.85);
      box-shadow: none; }
      .titlebar:not(headerbar) button:active:disabled :disabled, headerbar button:active:disabled :disabled, .titlebar:not(headerbar) button:checked:disabled :disabled, headerbar button:checked:disabled :disabled {
        color: rgba(255, 255, 255, 0.85); }
    .titlebar:not(headerbar) button:backdrop, headerbar button:backdrop, headerbar button.nautilus-circular-button.image-button:backdrop {
      color: mix(#ffffff,mix(#ffffff,#1b1c36,0.5),0.8); }
    .titlebar:not(headerbar) button.separator, headerbar button.separator, headerbar button.separator.nautilus-circular-button.image-button, .titlebar:not(headerbar) button .separator, headerbar button .separator, headerbar button.nautilus-circular-button.image-button .separator {
      border: 1px solid currentColor;
      color: rgba(48, 54, 95, 0.9); }
      .titlebar:not(headerbar) button.separator:disabled, headerbar button.separator:disabled, .titlebar:not(headerbar) button .separator:disabled, headerbar button .separator:disabled {
        color: rgba(48, 54, 95, 0.85); }
    .titlebar:not(headerbar) button separator, headerbar button separator, headerbar button.nautilus-circular-button.image-button separator {
      background-image: image(mix(#d3dae3,#30365f,0.9)); }
    .titlebar:not(headerbar) button.text-button, headerbar button.text-button, headerbar button.text-button.nautilus-circular-button.image-button {
      padding: 4px 6.2857142857px; }
    .titlebar:not(headerbar) button.flat, headerbar button.flat, headerbar button.flat.nautilus-circular-button.image-button {
      color: #ffffff; }
    .titlebar:not(headerbar) button.flat:hover, headerbar button.flat:hover {
      color: #d3dae3; }
    .titlebar:not(headerbar) button:backdrop, headerbar button:backdrop, headerbar button.nautilus-circular-button.image-button:backdrop {
      color: mix(#ffffff,#1b1c36,0.4); }
    .titlebar:not(headerbar) button stack box.narrow, headerbar button stack box.narrow, headerbar button.nautilus-circular-button.image-button stack box.narrow {
      /* have no clue why it's ignored by gtk and forced to 5px and 7px */
      padding: 0; }
    .titlebar:not(headerbar) button:not(:checked):not(:hover) stack box, headerbar button:not(:checked):not(:hover) stack box {
      color: #ffffff; }
  .titlebar:not(headerbar) viewswitcher button:not(:checked):not(:hover) stack box, headerbar viewswitcher button:not(:checked):not(:hover) stack box {
    color: #ffffff; }
  .titlebar:not(headerbar) button.titlebutton + separator.titlebutton, headerbar button.titlebutton + separator.titlebutton {
    margin-left: 0;
    margin-right: 4px; }
  .titlebar:not(headerbar) button.titlebutton, headerbar button.titlebutton, headerbar button.titlebutton.nautilus-circular-button.image-button {
    border: 0;
    padding: 4px;
    background-image: none;
    background-color: transparent;
    color: #ffffff;
    box-shadow: none; }
    .titlebar:not(headerbar) button.titlebutton:hover, headerbar button.titlebutton:hover {
      background-image: none;
      background-color: transparent;
      color: #30365f;
      box-shadow: none; }
    .titlebar:not(headerbar) button.titlebutton:active, headerbar button.titlebutton:active {
      background-image: none;
      background-color: transparent;
      color: #2b3156;
      box-shadow: none; }
    .titlebar:not(headerbar) button.titlebutton:backdrop, headerbar button.titlebutton:backdrop {
      background: none;
      color: mix(#ffffff,#1b1c36,0.4);
      -gtk-icon-shadow: none; }

toolbar {
  background-color: #1b1c36;
  background-image: none;
  border-color: mix(#ffffff,#1b1c36,0.88);
  color: #ffffff; }
  toolbar:focus, toolbar:hover {
    border-color: mix(#30365f,mix(#ffffff,#1b1c36,0.8),0.3); }
  toolbar:active, toolbar:active:hover, toolbar:active:focus, toolbar:active:hover:focus, toolbar:checked, toolbar:checked:hover, toolbar:checked:focus, toolbar:checked:hover:focus {
    border-color: mix(#ffffff,#1b1c36,0.4); }
  toolbar:disabled {
    border-color: mix(#ffffff,#1b1c36,0.92); }
  toolbar:active:disabled, toolbar:checked:disabled {
    border-color: mix(#ffffff,#1b1c36,0.88); }
  toolbar:disabled {
    background-color: #181931;
    background-image: none;
    color: mix(#ffffff,#1b1c36,0.5); }
  toolbar .background {
    background-color: #1b1c36;
    border-color: mix(#1b1c36,#ffffff,0.3); }
  toolbar .title {
    font-weight: bold;
    padding: 0 8px; }
  toolbar .subtitle {
    font-size: smaller;
    padding: 0 8px; }
  toolbar button, toolbar button.nautilus-circular-button.image-button {
    background-color: #1b1c36;
    background-image: none;
    border-color: rgba(204, 204, 204, 0.22);
    color: #ffffff;
    box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22); }
    toolbar button:focus, toolbar button.nautilus-circular-button.image-button:focus, toolbar button:hover, toolbar button.nautilus-circular-button.image-button:hover {
      border-color: mix(#30365f,rgba(255, 255, 255, 0.22),0.3); }
    toolbar button:active, toolbar button.nautilus-circular-button.image-button:active, toolbar button:active:hover, toolbar button:active:focus, toolbar button:active:hover:focus, toolbar button:checked, toolbar button.nautilus-circular-button.image-button:checked, toolbar button:checked:hover, toolbar button:checked:focus, toolbar button:checked:hover:focus {
      border-color: rgba(179, 179, 179, 0.22); }
    toolbar button:disabled, toolbar button.nautilus-circular-button.image-button:disabled {
      border-color: rgba(217, 217, 217, 0.22); }
    toolbar button:active:disabled, toolbar button:checked:disabled {
      border-color: rgba(204, 204, 204, 0.22); }
    .linked:not(.vertical) > toolbar button:not(:last-child):not(:only-child), .linked:not(.vertical) > :not(:last-child):not(:only-child) toolbar button, viewswitcher:not(.vertical) > toolbar button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > toolbar button:not(:last-child):not(:only-child) {
      border-right-style: none; }
      .linked:not(.vertical) > toolbar button:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) toolbar button:hover, viewswitcher:not(.vertical) > toolbar button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > toolbar button:not(:last-child):not(:only-child):hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.36),0.3);
        border-right-style: none;
        box-shadow: inset-1px 0 0 mix(#30365f,rgba(255, 255, 255, 0.36),0.3); }
    .linked:not(.vertical) > toolbar button:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > :not(:last-child):not(:only-child) toolbar button:checked, viewswitcher:not(.vertical) > toolbar button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > toolbar button:not(:last-child):not(:only-child):checked {
      border-right-style: none; }
      .linked:not(.vertical) > toolbar button:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) toolbar button:checked:hover, viewswitcher:not(.vertical) > toolbar button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > toolbar button:not(:last-child):not(:only-child):checked:hover {
        border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
        border-right-style: none;
        box-shadow: inset-1px 0 0 mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
    .linked.vertical > toolbar button:not(:last-child):not(:only-child), .linked.vertical > :not(:last-child):not(:only-child) toolbar button, stackswitcher.vertical > toolbar button:not(:last-child):not(:only-child) {
      border-bottom-style: none; }
      .linked.vertical > toolbar button:not(:last-child):not(:only-child):hover, .linked.vertical > :not(:last-child):not(:only-child) toolbar button:hover, stackswitcher.vertical > toolbar button:not(:last-child):not(:only-child):hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.36),0.3);
        border-bottom-style: none;
        box-shadow: inset 0 -1px mix(#30365f,rgba(255, 255, 255, 0.36),0.3); }
    .linked.vertical > toolbar button:not(:last-child):not(:only-child):checked, .linked.vertical > :not(:last-child):not(:only-child) toolbar button:checked, stackswitcher.vertical > toolbar button:not(:last-child):not(:only-child):checked {
      border-bottom-style: none; }
      .linked.vertical > toolbar button:not(:last-child):not(:only-child):checked:hover, .linked.vertical > :not(:last-child):not(:only-child) toolbar button:checked:hover, stackswitcher.vertical > toolbar button:not(:last-child):not(:only-child):checked:hover {
        border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
        border-bottom-style: none;
        box-shadow: inset 0 -1px mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
    toolbar button.flat, toolbar button.flat.nautilus-circular-button.image-button {
      color: #ffffff;
      border-color: rgba(27, 28, 54, 0);
      background-color: rgba(27, 28, 54, 0);
      background-image: none;
      box-shadow: none; }
    toolbar button:hover, toolbar button.nautilus-circular-button.image-button:hover, toolbar button.flat:hover {
      background-color: #1c1d39;
      background-image: none;
      border-color: rgba(204, 204, 204, 0.3);
      color: #ffffff;
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.32); }
      toolbar button:hover:focus, toolbar button:hover:hover, toolbar button.flat:hover:focus, toolbar button.flat:hover:hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.3),0.3); }
      toolbar button:hover:active, toolbar button:hover:active:focus, toolbar button.flat:hover:active:focus, toolbar button:hover:checked, toolbar button:hover:checked:focus, toolbar button.flat:hover:checked:focus, toolbar button.flat:hover:active, toolbar button.flat:hover:active:hover:focus, toolbar button.flat:hover:checked, toolbar button.flat:hover:checked:hover:focus {
        border-color: rgba(179, 179, 179, 0.3); }
      toolbar button:hover:disabled, toolbar button.flat:hover:disabled {
        border-color: rgba(217, 217, 217, 0.3); }
      toolbar button:hover:active:disabled, toolbar button:hover:checked:disabled, toolbar button.flat:hover:active:disabled, toolbar button.flat:hover:checked:disabled {
        border-color: rgba(204, 204, 204, 0.3); }
    toolbar button:focus, toolbar button.nautilus-circular-button.image-button:focus, toolbar button.flat:focus {
      background-color: #1c1d39;
      background-image: none;
      border-color: rgba(255, 255, 255, 0.22);
      outline-color: rgba(48, 54, 95, 0.5);
      outline-width: 3px;
      outline-style: solid;
      outline-offset: 10px;
      color: #ffffff;
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
      toolbar button:focus:hover, toolbar button.flat:focus:hover {
        background-color: #1e1f3b;
        background-image: none;
        border-color: rgba(204, 204, 204, 0.3);
        box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.48); }
        toolbar button:focus:hover:hover, toolbar button.flat:focus:hover:hover {
          border-color: mix(#30365f,rgba(255, 255, 255, 0.3),0.3); }
        toolbar button:focus:hover:active, toolbar button.flat:focus:hover:active, toolbar button.flat:focus:hover:active:focus, toolbar button:focus:hover:checked, toolbar button.flat:focus:hover:checked, toolbar button.flat:focus:hover:checked:focus, toolbar button.flat:focus:hover:active:hover:focus, toolbar button.flat:focus:hover:checked:hover:focus {
          border-color: rgba(179, 179, 179, 0.3); }
        toolbar button:focus:hover:disabled, toolbar button.flat:focus:hover:disabled {
          border-color: rgba(217, 217, 217, 0.3); }
        toolbar button:focus:hover:active:disabled, toolbar button:focus:hover:checked:disabled, toolbar button.flat:focus:hover:active:disabled, toolbar button.flat:focus:hover:checked:disabled {
          border-color: rgba(204, 204, 204, 0.3); }
    toolbar button:checked, toolbar button.nautilus-circular-button.image-button:checked, toolbar button:active, toolbar button.nautilus-circular-button.image-button:active, toolbar button.flat:checked, toolbar button.flat:active {
      /*@include linear-gradient(shade($bg, .7), to top);*/
      background-color: #30365f;
      background-image: none;
      border-color: rgba(204, 204, 204, 0.22);
      color: #ffffff;
      box-shadow: inset 1px 0 rgba(255, 255, 255, 0.06), inset 0 1px rgba(255, 255, 255, 0.07), inset -1px 0 rgba(255, 255, 255, 0.06), inset 0 -1px rgba(255, 255, 255, 0.05); }
      toolbar button:checked:focus, toolbar button:checked:hover, toolbar button:active:focus, toolbar button:active:hover, toolbar button.flat:checked:focus, toolbar button.flat:checked:hover, toolbar button.flat:active:focus, toolbar button.flat:active:hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.22),0.3); }
      toolbar button:active:checked, toolbar button:active:checked:hover, toolbar button:active:checked:focus, toolbar button:active:checked:hover:focus, toolbar button.flat:active:checked, toolbar button.flat:active:checked:hover, toolbar button.flat:active:checked:focus, toolbar button.flat:active:checked:hover:focus {
        border-color: rgba(179, 179, 179, 0.22); }
      toolbar button:checked:disabled, toolbar button:active:disabled, toolbar button.flat:checked:disabled, toolbar button.flat:active:disabled {
        border-color: rgba(217, 217, 217, 0.22); }
      toolbar button:active:checked:disabled, toolbar button.flat:active:checked:disabled {
        border-color: rgba(204, 204, 204, 0.22); }
      toolbar button:checked:focus, toolbar button:checked:hover, toolbar button:active:focus, toolbar button:active:hover, toolbar button.flat:checked:focus, toolbar button.flat:checked:hover, toolbar button.flat:active:focus, toolbar button.flat:active:hover {
        /*@include linear-gradient(shade($bg, .65), to top);*/
        background-color: #323964;
        background-image: none;
        color: #ffffff; }
    toolbar button:focus, toolbar button.nautilus-circular-button.image-button:focus, toolbar button:hover, toolbar button.nautilus-circular-button.image-button:hover, toolbar button.flat:focus, toolbar button.flat:hover {
      color: #ffffff; }
    toolbar button:disabled:disabled, toolbar button.flat:disabled:disabled {
      background-color: alpha(mix(#1b1c36,#ffffff,0.2),0.4);
      background-image: none;
      /*border: 1px solid alpha($bg, .2);*/
      opacity: .6;
      color: mix(#1b1c36,#ffffff,0.6);
      box-shadow: none; }
      toolbar button:disabled:disabled :disabled, toolbar button.flat:disabled:disabled :disabled {
        color: mix(#1b1c36,#ffffff,0.6); }
    toolbar button:active:disabled, toolbar button:checked:disabled, toolbar button.flat:active:disabled, toolbar button.flat:checked:disabled {
      background-color: rgba(48, 54, 95, 0.6);
      background-image: none;
      color: rgba(255, 255, 255, 0.85);
      box-shadow: none; }
      toolbar button:active:disabled :disabled, toolbar button:checked:disabled :disabled, toolbar button.flat:active:disabled :disabled, toolbar button.flat:checked:disabled :disabled {
        color: rgba(255, 255, 255, 0.85); }
    toolbar button:backdrop, toolbar button.nautilus-circular-button.image-button:backdrop, toolbar button.flat:backdrop {
      color: mix(#ffffff,mix(#ffffff,#1b1c36,0.5),0.8); }
    toolbar button.separator, toolbar button.separator.nautilus-circular-button.image-button, toolbar button .separator, toolbar button.nautilus-circular-button.image-button .separator {
      border: 1px solid currentColor;
      color: rgba(27, 28, 54, 0.9); }
      toolbar button.separator:disabled, toolbar button .separator:disabled {
        color: rgba(27, 28, 54, 0.85); }
    toolbar button separator, toolbar button.nautilus-circular-button.image-button separator {
      background-image: image(mix(#ffffff,#1b1c36,0.9)); }
    toolbar button.image-button, toolbar button.image-button.nautilus-circular-button {
      padding: 4px; }
  toolbar viewswitcher button, toolbar viewswitcher button.nautilus-circular-button.image-button,
  toolbar .linked > button,
  toolbar .linked > button.nautilus-circular-button.image-button {
    box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22); }
    toolbar viewswitcher button:focus, toolbar viewswitcher button.nautilus-circular-button.image-button:focus, toolbar viewswitcher button:hover, toolbar viewswitcher button.nautilus-circular-button.image-button:hover,
    toolbar .linked > button:focus,
    toolbar .linked > button:hover {
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
    toolbar viewswitcher button:active, toolbar viewswitcher button.nautilus-circular-button.image-button:active, toolbar viewswitcher button:active:hover, toolbar viewswitcher button:active:focus, toolbar viewswitcher button:active:hover:focus, toolbar viewswitcher button:checked, toolbar viewswitcher button.nautilus-circular-button.image-button:checked, toolbar viewswitcher button:checked:hover, toolbar viewswitcher button:checked:focus, toolbar viewswitcher button:checked:hover:focus,
    toolbar .linked > button:active,
    toolbar .linked > button:active:hover,
    toolbar .linked > button:active:focus,
    toolbar .linked > button:active:hover:focus,
    toolbar .linked > button:checked,
    toolbar .linked > button:checked:hover,
    toolbar .linked > button:checked:focus,
    toolbar .linked > button:checked:hover:focus {
      box-shadow: inset 0 1px rgba(51, 51, 51, 0.07), inset 0 -1px rgba(51, 51, 51, 0.05); }
    toolbar viewswitcher button:disabled, toolbar viewswitcher button.nautilus-circular-button.image-button:disabled,
    toolbar .linked > button:disabled {
      box-shadow: inset -1px 0 #16162b; }
    toolbar viewswitcher button:last-child, toolbar viewswitcher button.nautilus-circular-button.image-button:last-child, toolbar viewswitcher button:only-child, toolbar viewswitcher button.nautilus-circular-button.image-button:only-child,
    toolbar .linked > button:last-child,
    toolbar .linked > button:only-child {
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22); }
    toolbar viewswitcher button:last-child:hover, toolbar viewswitcher button:only-child:hover,
    toolbar .linked > button:last-child:hover,
    toolbar .linked > button:only-child:hover {
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
    toolbar viewswitcher button:disabled:last-child, toolbar viewswitcher button:disabled:only-child, toolbar viewswitcher button:active:disabled:last-child, toolbar viewswitcher button:active:disabled:only-child, toolbar viewswitcher button:checked:disabled:last-child, toolbar viewswitcher button:checked:disabled:only-child,
    toolbar .linked > button:disabled:last-child,
    toolbar .linked > button:disabled:only-child,
    toolbar .linked > button:active:disabled:last-child,
    toolbar .linked > button:active:disabled:only-child,
    toolbar .linked > button:checked:disabled:last-child,
    toolbar .linked > button:checked:disabled:only-child {
      box-shadow: none; }
    toolbar viewswitcher button:active:last-child, toolbar viewswitcher button:active:last-child:focus, toolbar viewswitcher button:active:last-child:hover, toolbar viewswitcher button:active:last-child:hover:focus, toolbar viewswitcher button:checked:last-child, toolbar viewswitcher button:checked:last-child:focus, toolbar viewswitcher button:checked:last-child:hover, toolbar viewswitcher button:checked:last-child:hover:focus,
    toolbar .linked > button:active:last-child,
    toolbar .linked > button:active:last-child:focus,
    toolbar .linked > button:active:last-child:hover,
    toolbar .linked > button:active:last-child:hover:focus,
    toolbar .linked > button:checked:last-child,
    toolbar .linked > button:checked:last-child:focus,
    toolbar .linked > button:checked:last-child:hover,
    toolbar .linked > button:checked:last-child:hover:focus {
      box-shadow: inset 0 1px rgba(51, 51, 51, 0.07), inset -1px 0 rgba(51, 51, 51, 0.06); }
    toolbar viewswitcher button:active:only-child, toolbar viewswitcher button:active:only-child:focus, toolbar viewswitcher button:active:only-child:hover, toolbar viewswitcher button:active:only-child:hover:focus, toolbar viewswitcher button:checked:only-child, toolbar viewswitcher button:checked:only-child:focus, toolbar viewswitcher button:checked:only-child:hover, toolbar viewswitcher button:checked:only-child:hover:focus,
    toolbar .linked > button:active:only-child,
    toolbar .linked > button:active:only-child:focus,
    toolbar .linked > button:active:only-child:hover,
    toolbar .linked > button:active:only-child:hover:focus,
    toolbar .linked > button:checked:only-child,
    toolbar .linked > button:checked:only-child:focus,
    toolbar .linked > button:checked:only-child:hover,
    toolbar .linked > button:checked:only-child:hover:focus {
      box-shadow: inset 1px 0 rgba(51, 51, 51, 0.06), inset 0 1px rgba(51, 51, 51, 0.07), inset -1px 0 rgba(51, 51, 51, 0.06); }
  toolbar box button.image-button, toolbar box button.image-button.nautilus-circular-button {
    padding: 4px 8px; }
  toolbar separator, toolbar separator:disabled {
    color: #101120;
    border-color: currentColor;
    -GtkWidget-window-dragging: true; }
  toolbar.inline-toolbar {
    padding: 1px;
    border-width: 0 1px 1px;
    border-style: solid;
    border-color: mix(#1b1c36,#ffffff,0.18);
    background-color: mix(mix(#1b1c36,#ffffff,0.18),#1b1c36,0.7);
    background-image: none; }
    toolbar.inline-toolbar:backdrop {
      border-color: mix(#1b1c36,mix(#1b1c36,#ffffff,0.18),0.9);
      background-color: mix(#1b1c36,mix(#1b1c36,mix(#1b1c36,#ffffff,0.18),0.9),0.35);
      transition: 200ms ease-out; }
    toolbar.inline-toolbar button, toolbar.inline-toolbar button.nautilus-circular-button.image-button {
      background-color: #1b1c36;
      background-image: none;
      border-color: rgba(204, 204, 204, 0.22);
      color: #ffffff;
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22); }
      toolbar.inline-toolbar button:focus, toolbar.inline-toolbar button:hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.22),0.3); }
      toolbar.inline-toolbar button:active, toolbar.inline-toolbar button:active:hover, toolbar.inline-toolbar button:active:focus, toolbar.inline-toolbar button:active:hover:focus, toolbar.inline-toolbar button:checked, toolbar.inline-toolbar button:checked:hover, toolbar.inline-toolbar button:checked:focus, toolbar.inline-toolbar button:checked:hover:focus {
        border-color: rgba(179, 179, 179, 0.22); }
      toolbar.inline-toolbar button:disabled {
        border-color: rgba(217, 217, 217, 0.22); }
      toolbar.inline-toolbar button:active:disabled, toolbar.inline-toolbar button:checked:disabled {
        border-color: rgba(204, 204, 204, 0.22); }
      .linked:not(.vertical) > toolbar.inline-toolbar button:not(:last-child):not(:only-child), .linked:not(.vertical) > :not(:last-child):not(:only-child) toolbar.inline-toolbar button, viewswitcher:not(.vertical) > toolbar.inline-toolbar button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > toolbar.inline-toolbar button:not(:last-child):not(:only-child) {
        border-right-style: none; }
        .linked:not(.vertical) > toolbar.inline-toolbar button:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) toolbar.inline-toolbar button:hover, viewswitcher:not(.vertical) > toolbar.inline-toolbar button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > toolbar.inline-toolbar button:not(:last-child):not(:only-child):hover {
          border-color: mix(#30365f,rgba(255, 255, 255, 0.36),0.3);
          border-right-style: none;
          box-shadow: inset-1px 0 0 mix(#30365f,rgba(255, 255, 255, 0.36),0.3); }
      .linked:not(.vertical) > toolbar.inline-toolbar button:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > :not(:last-child):not(:only-child) toolbar.inline-toolbar button:checked, viewswitcher:not(.vertical) > toolbar.inline-toolbar button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > toolbar.inline-toolbar button:not(:last-child):not(:only-child):checked {
        border-right-style: none; }
        .linked:not(.vertical) > toolbar.inline-toolbar button:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) toolbar.inline-toolbar button:checked:hover, viewswitcher:not(.vertical) > toolbar.inline-toolbar button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > toolbar.inline-toolbar button:not(:last-child):not(:only-child):checked:hover {
          border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
          border-right-style: none;
          box-shadow: inset-1px 0 0 mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
      .linked.vertical > toolbar.inline-toolbar button:not(:last-child):not(:only-child), .linked.vertical > :not(:last-child):not(:only-child) toolbar.inline-toolbar button, stackswitcher.vertical > toolbar.inline-toolbar button:not(:last-child):not(:only-child) {
        border-bottom-style: none; }
        .linked.vertical > toolbar.inline-toolbar button:not(:last-child):not(:only-child):hover, .linked.vertical > :not(:last-child):not(:only-child) toolbar.inline-toolbar button:hover, stackswitcher.vertical > toolbar.inline-toolbar button:not(:last-child):not(:only-child):hover {
          border-color: mix(#30365f,rgba(255, 255, 255, 0.36),0.3);
          border-bottom-style: none;
          box-shadow: inset 0 -1px mix(#30365f,rgba(255, 255, 255, 0.36),0.3); }
      .linked.vertical > toolbar.inline-toolbar button:not(:last-child):not(:only-child):checked, .linked.vertical > :not(:last-child):not(:only-child) toolbar.inline-toolbar button:checked, stackswitcher.vertical > toolbar.inline-toolbar button:not(:last-child):not(:only-child):checked {
        border-bottom-style: none; }
        .linked.vertical > toolbar.inline-toolbar button:not(:last-child):not(:only-child):checked:hover, .linked.vertical > :not(:last-child):not(:only-child) toolbar.inline-toolbar button:checked:hover, stackswitcher.vertical > toolbar.inline-toolbar button:not(:last-child):not(:only-child):checked:hover {
          border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
          border-bottom-style: none;
          box-shadow: inset 0 -1px mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
      toolbar.inline-toolbar button.flat {
        color: #ffffff;
        border-color: rgba(27, 28, 54, 0);
        background-color: rgba(27, 28, 54, 0);
        background-image: none;
        box-shadow: none; }
      toolbar.inline-toolbar button:hover, toolbar.inline-toolbar button.flat:hover {
        background-color: #1c1d39;
        background-image: none;
        border-color: rgba(204, 204, 204, 0.3);
        color: #ffffff;
        box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.32); }
        toolbar.inline-toolbar button:hover:focus, toolbar.inline-toolbar button:hover:hover, toolbar.inline-toolbar button.flat:hover:focus, toolbar.inline-toolbar button.flat:hover:hover {
          border-color: mix(#30365f,rgba(255, 255, 255, 0.3),0.3); }
        toolbar.inline-toolbar button:hover:active, toolbar.inline-toolbar button:hover:active:focus, toolbar.inline-toolbar button.flat:hover:active:focus, toolbar.inline-toolbar button:hover:checked, toolbar.inline-toolbar button:hover:checked:focus, toolbar.inline-toolbar button.flat:hover:checked:focus, toolbar.inline-toolbar button.flat:hover:active, toolbar.inline-toolbar button.flat:hover:active:hover:focus, toolbar.inline-toolbar button.flat:hover:checked, toolbar.inline-toolbar button.flat:hover:checked:hover:focus {
          border-color: rgba(179, 179, 179, 0.3); }
        toolbar.inline-toolbar button:hover:disabled, toolbar.inline-toolbar button.flat:hover:disabled {
          border-color: rgba(217, 217, 217, 0.3); }
        toolbar.inline-toolbar button:hover:active:disabled, toolbar.inline-toolbar button:hover:checked:disabled, toolbar.inline-toolbar button.flat:hover:active:disabled, toolbar.inline-toolbar button.flat:hover:checked:disabled {
          border-color: rgba(204, 204, 204, 0.3); }
      toolbar.inline-toolbar button:focus, toolbar.inline-toolbar button.flat:focus {
        background-color: #1c1d39;
        background-image: none;
        border-color: rgba(255, 255, 255, 0.22);
        outline-color: rgba(48, 54, 95, 0.5);
        outline-width: 3px;
        outline-style: solid;
        outline-offset: 10px;
        color: #ffffff;
        box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
        toolbar.inline-toolbar button:focus:hover, toolbar.inline-toolbar button.flat:focus:hover {
          background-color: #1e1f3b;
          background-image: none;
          border-color: rgba(204, 204, 204, 0.3);
          box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.48); }
          toolbar.inline-toolbar button:focus:hover:hover, toolbar.inline-toolbar button.flat:focus:hover:hover {
            border-color: mix(#30365f,rgba(255, 255, 255, 0.3),0.3); }
          toolbar.inline-toolbar button:focus:hover:active, toolbar.inline-toolbar button.flat:focus:hover:active, toolbar.inline-toolbar button.flat:focus:hover:active:focus, toolbar.inline-toolbar button:focus:hover:checked, toolbar.inline-toolbar button.flat:focus:hover:checked, toolbar.inline-toolbar button.flat:focus:hover:checked:focus, toolbar.inline-toolbar button.flat:focus:hover:active:hover:focus, toolbar.inline-toolbar button.flat:focus:hover:checked:hover:focus {
            border-color: rgba(179, 179, 179, 0.3); }
          toolbar.inline-toolbar button:focus:hover:disabled, toolbar.inline-toolbar button.flat:focus:hover:disabled {
            border-color: rgba(217, 217, 217, 0.3); }
          toolbar.inline-toolbar button:focus:hover:active:disabled, toolbar.inline-toolbar button:focus:hover:checked:disabled, toolbar.inline-toolbar button.flat:focus:hover:active:disabled, toolbar.inline-toolbar button.flat:focus:hover:checked:disabled {
            border-color: rgba(204, 204, 204, 0.3); }
      toolbar.inline-toolbar button:checked, toolbar.inline-toolbar button:active, toolbar.inline-toolbar button.flat:checked, toolbar.inline-toolbar button.flat:active {
        /*@include linear-gradient(shade($bg, .7), to top);*/
        background-color: #30365f;
        background-image: none;
        border-color: rgba(204, 204, 204, 0.22);
        color: #ffffff;
        box-shadow: inset 1px 0 rgba(255, 255, 255, 0.06), inset 0 1px rgba(255, 255, 255, 0.07), inset -1px 0 rgba(255, 255, 255, 0.06), inset 0 -1px rgba(255, 255, 255, 0.05); }
        toolbar.inline-toolbar button:checked:focus, toolbar.inline-toolbar button:checked:hover, toolbar.inline-toolbar button:active:focus, toolbar.inline-toolbar button:active:hover, toolbar.inline-toolbar button.flat:checked:focus, toolbar.inline-toolbar button.flat:checked:hover, toolbar.inline-toolbar button.flat:active:focus, toolbar.inline-toolbar button.flat:active:hover {
          border-color: mix(#30365f,rgba(255, 255, 255, 0.22),0.3); }
        toolbar.inline-toolbar button:active:checked, toolbar.inline-toolbar button:active:checked:hover, toolbar.inline-toolbar button:active:checked:focus, toolbar.inline-toolbar button:active:checked:hover:focus, toolbar.inline-toolbar button.flat:active:checked, toolbar.inline-toolbar button.flat:active:checked:hover, toolbar.inline-toolbar button.flat:active:checked:focus, toolbar.inline-toolbar button.flat:active:checked:hover:focus {
          border-color: rgba(179, 179, 179, 0.22); }
        toolbar.inline-toolbar button:checked:disabled, toolbar.inline-toolbar button:active:disabled, toolbar.inline-toolbar button.flat:checked:disabled, toolbar.inline-toolbar button.flat:active:disabled {
          border-color: rgba(217, 217, 217, 0.22); }
        toolbar.inline-toolbar button:active:checked:disabled, toolbar.inline-toolbar button.flat:active:checked:disabled {
          border-color: rgba(204, 204, 204, 0.22); }
        toolbar.inline-toolbar button:checked:focus, toolbar.inline-toolbar button:checked:hover, toolbar.inline-toolbar button:active:focus, toolbar.inline-toolbar button:active:hover, toolbar.inline-toolbar button.flat:checked:focus, toolbar.inline-toolbar button.flat:checked:hover, toolbar.inline-toolbar button.flat:active:focus, toolbar.inline-toolbar button.flat:active:hover {
          /*@include linear-gradient(shade($bg, .65), to top);*/
          background-color: #323964;
          background-image: none;
          color: #ffffff; }
      toolbar.inline-toolbar button:focus, toolbar.inline-toolbar button:hover, toolbar.inline-toolbar button.flat:focus, toolbar.inline-toolbar button.flat:hover {
        color: #ffffff; }
      toolbar.inline-toolbar button:disabled:disabled, toolbar.inline-toolbar button.flat:disabled:disabled {
        background-color: alpha(mix(#1b1c36,#ffffff,0.2),0.4);
        background-image: none;
        /*border: 1px solid alpha($bg, .2);*/
        opacity: .6;
        color: mix(#1b1c36,#ffffff,0.6);
        box-shadow: none; }
        toolbar.inline-toolbar button:disabled:disabled :disabled, toolbar.inline-toolbar button.flat:disabled:disabled :disabled {
          color: mix(#1b1c36,#ffffff,0.6); }
      toolbar.inline-toolbar button:active:disabled, toolbar.inline-toolbar button:checked:disabled, toolbar.inline-toolbar button.flat:active:disabled, toolbar.inline-toolbar button.flat:checked:disabled {
        background-color: rgba(48, 54, 95, 0.6);
        background-image: none;
        color: rgba(255, 255, 255, 0.85);
        box-shadow: none; }
        toolbar.inline-toolbar button:active:disabled :disabled, toolbar.inline-toolbar button:checked:disabled :disabled, toolbar.inline-toolbar button.flat:active:disabled :disabled, toolbar.inline-toolbar button.flat:checked:disabled :disabled {
          color: rgba(255, 255, 255, 0.85); }
      toolbar.inline-toolbar button:backdrop, toolbar.inline-toolbar button.flat:backdrop {
        color: mix(#ffffff,mix(#ffffff,#1b1c36,0.5),0.8); }
      toolbar.inline-toolbar button.separator, toolbar.inline-toolbar button .separator {
        border: 1px solid currentColor;
        color: rgba(27, 28, 54, 0.9); }
        toolbar.inline-toolbar button.separator:disabled, toolbar.inline-toolbar button .separator:disabled {
          color: rgba(27, 28, 54, 0.85); }
      toolbar.inline-toolbar button separator, toolbar.inline-toolbar button.nautilus-circular-button.image-button separator {
        background-image: image(mix(#ffffff,#1b1c36,0.9)); }

window.csd > .titlebar:not(headerbar) {
  padding: 0;
  background-color: transparent;
  background-image: none;
  border-style: none;
  border-color: transparent;
  box-shadow: none; }

.titlebar:not(headerbar) > separator {
  background-color: #131428; }

.background .titlebar:backdrop, .background .titlebar {
  border-top-left-radius: 8px;
  border-top-right-radius: 8px; }

.background.tiled .titlebar:backdrop, .background.tiled .titlebar,
.background.tiled-top .titlebar:backdrop,
.background.tiled-top .titlebar,
.background.tiled-right .titlebar:backdrop,
.background.tiled-right .titlebar,
.background.tiled-bottom .titlebar:backdrop,
.background.tiled-bottom .titlebar,
.background.tiled-left .titlebar:backdrop,
.background.tiled-left .titlebar,
.background.maximized .titlebar:backdrop,
.background.maximized .titlebar,
.background.solid-csd .titlebar:backdrop,
.background.solid-csd .titlebar {
  border-top-left-radius: 0;
  border-top-right-radius: 0; }

.background:not(.csd):not(.ssd):not(.solid-csd) headerbar, .background:not(.csd):not(.ssd):not(.solid-csd) headerbar:not(:last-child), .background:not(.csd):not(.ssd):not(.solid-csd) headerbar:backdrop, .background:not(.csd):not(.ssd):not(.solid-csd) headerbar:backdrop:not(:last-child) {
  border-radius: 0;
  border-top-color: transparent; }

/**************
 ! Action-bar *
***************/
actionbar > revealer > box {
  padding: 4px;
  border-top: 1px solid mix(#1b1c36,#ffffff,0.18); }
  actionbar > revealer > box:backdrop {
    border-color: mix(#1b1c36,mix(#1b1c36,#ffffff,0.18),0.9); }

/****************************
 ! Search and Location bars *
*****************************/
searchbar,
.location-bar {
  background-color: #1a1b35;
  background-image: none;
  border-width: 0 0 1px;
  border-style: solid;
  border-color: #16162b;
  color: #ffffff; }

/******************
 ! Action buttons *
*******************/
.suggested-action, headerbar.selection-mode button.suggested-action,
.titlebar.selection-mode:not(headerbar) button.suggested-action {
  background-color: #00b500;
  background-image: none;
  border-color: rgba(204, 204, 204, 0.22);
  color: #ffffff;
  box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22); }
  .suggested-action:focus, headerbar.selection-mode button.suggested-action:focus,
  .titlebar:not(headerbar).selection-mode button.suggested-action:focus, .suggested-action:hover, headerbar.selection-mode button.suggested-action:hover,
  .titlebar:not(headerbar).selection-mode button.suggested-action:hover {
    border-color: mix(#30365f,rgba(255, 255, 255, 0.22),0.3); }
  .suggested-action:active, headerbar.selection-mode button.suggested-action:active,
  .titlebar:not(headerbar).selection-mode button.suggested-action:active, .suggested-action:active:hover, .suggested-action:active:focus, .suggested-action:active:hover:focus, .suggested-action:checked, headerbar.selection-mode button.suggested-action:checked,
  .titlebar:not(headerbar).selection-mode button.suggested-action:checked, .suggested-action:checked:hover, .suggested-action:checked:focus, .suggested-action:checked:hover:focus {
    border-color: rgba(179, 179, 179, 0.22); }
  .suggested-action:disabled, headerbar.selection-mode button.suggested-action:disabled,
  .titlebar:not(headerbar).selection-mode button.suggested-action:disabled {
    border-color: rgba(217, 217, 217, 0.22); }
  .suggested-action:active:disabled,
  .titlebar:not(headerbar).selection-mode button.suggested-action:active:disabled, .suggested-action:checked:disabled,
  .titlebar:not(headerbar).selection-mode button.suggested-action:checked:disabled {
    border-color: rgba(204, 204, 204, 0.22); }
  .linked:not(.vertical) > .suggested-action:not(:last-child):not(:only-child), headerbar.selection-mode .linked:not(.vertical) > button.suggested-action:not(:last-child):not(:only-child),
  .titlebar:not(headerbar).selection-mode .linked:not(.vertical) > button.suggested-action:not(:last-child):not(:only-child), .linked:not(.vertical) > :not(:last-child):not(:only-child) .suggested-action, viewswitcher:not(.vertical) > .suggested-action:not(:last-child):not(:only-child), headerbar.selection-mode viewswitcher:not(.vertical) > button.suggested-action:not(:last-child):not(:only-child),
  .titlebar:not(headerbar).selection-mode viewswitcher:not(.vertical) > button.suggested-action:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > .suggested-action:not(:last-child):not(:only-child), headerbar.selection-mode stackswitcher:not(.vertical) > button.suggested-action:not(:last-child):not(:only-child),
  .titlebar:not(headerbar).selection-mode stackswitcher:not(.vertical) > button.suggested-action:not(:last-child):not(:only-child) {
    border-right-style: none; }
    .linked:not(.vertical) > .suggested-action:not(:last-child):not(:only-child):hover, headerbar.selection-mode .linked:not(.vertical) > button.suggested-action:not(:last-child):not(:only-child):hover,
    .titlebar:not(headerbar).selection-mode .linked:not(.vertical) > button.suggested-action:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) .suggested-action:hover, viewswitcher:not(.vertical) > .suggested-action:not(:last-child):not(:only-child):hover, headerbar.selection-mode viewswitcher:not(.vertical) > button.suggested-action:not(:last-child):not(:only-child):hover,
    .titlebar:not(headerbar).selection-mode viewswitcher:not(.vertical) > button.suggested-action:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > .suggested-action:not(:last-child):not(:only-child):hover, headerbar.selection-mode stackswitcher:not(.vertical) > button.suggested-action:not(:last-child):not(:only-child):hover,
    .titlebar:not(headerbar).selection-mode stackswitcher:not(.vertical) > button.suggested-action:not(:last-child):not(:only-child):hover {
      border-color: mix(#30365f,rgba(255, 255, 255, 0.36),0.3);
      border-right-style: none;
      box-shadow: inset-1px 0 0 mix(#30365f,rgba(255, 255, 255, 0.36),0.3); }
  .linked:not(.vertical) > .suggested-action:not(:last-child):not(:only-child):checked, headerbar.selection-mode .linked:not(.vertical) > button.suggested-action:not(:last-child):not(:only-child):checked,
  .titlebar:not(headerbar).selection-mode .linked:not(.vertical) > button.suggested-action:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > :not(:last-child):not(:only-child) .suggested-action:checked, viewswitcher:not(.vertical) > .suggested-action:not(:last-child):not(:only-child), headerbar.selection-mode viewswitcher:not(.vertical) > button.suggested-action:not(:last-child):not(:only-child),
  .titlebar:not(headerbar).selection-mode viewswitcher:not(.vertical) > button.suggested-action:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > .suggested-action:not(:last-child):not(:only-child):checked, headerbar.selection-mode stackswitcher:not(.vertical) > button.suggested-action:not(:last-child):not(:only-child):checked,
  .titlebar:not(headerbar).selection-mode stackswitcher:not(.vertical) > button.suggested-action:not(:last-child):not(:only-child):checked {
    border-right-style: none; }
    .linked:not(.vertical) > .suggested-action:not(:last-child):not(:only-child):checked:hover, headerbar.selection-mode .linked:not(.vertical) > button.suggested-action:not(:last-child):not(:only-child):checked:hover,
    .titlebar:not(headerbar).selection-mode .linked:not(.vertical) > button.suggested-action:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) .suggested-action:checked:hover, viewswitcher:not(.vertical) > .suggested-action:not(:last-child):not(:only-child):hover, headerbar.selection-mode viewswitcher:not(.vertical) > button.suggested-action:not(:last-child):not(:only-child):hover,
    .titlebar:not(headerbar).selection-mode viewswitcher:not(.vertical) > button.suggested-action:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > .suggested-action:not(:last-child):not(:only-child):checked:hover, headerbar.selection-mode stackswitcher:not(.vertical) > button.suggested-action:not(:last-child):not(:only-child):checked:hover,
    .titlebar:not(headerbar).selection-mode stackswitcher:not(.vertical) > button.suggested-action:not(:last-child):not(:only-child):checked:hover {
      border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
      border-right-style: none;
      box-shadow: inset-1px 0 0 mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
  .linked.vertical > .suggested-action:not(:last-child):not(:only-child), headerbar.selection-mode .linked.vertical > button.suggested-action:not(:last-child):not(:only-child),
  .titlebar:not(headerbar).selection-mode .linked.vertical > button.suggested-action:not(:last-child):not(:only-child), .linked.vertical > :not(:last-child):not(:only-child) .suggested-action, stackswitcher.vertical > .suggested-action:not(:last-child):not(:only-child), headerbar.selection-mode stackswitcher.vertical > button.suggested-action:not(:last-child):not(:only-child),
  .titlebar:not(headerbar).selection-mode stackswitcher.vertical > button.suggested-action:not(:last-child):not(:only-child) {
    border-bottom-style: none; }
    .linked.vertical > .suggested-action:not(:last-child):not(:only-child):hover, headerbar.selection-mode .linked.vertical > button.suggested-action:not(:last-child):not(:only-child):hover,
    .titlebar:not(headerbar).selection-mode .linked.vertical > button.suggested-action:not(:last-child):not(:only-child):hover, .linked.vertical > :not(:last-child):not(:only-child) .suggested-action:hover, stackswitcher.vertical > .suggested-action:not(:last-child):not(:only-child):hover, headerbar.selection-mode stackswitcher.vertical > button.suggested-action:not(:last-child):not(:only-child):hover,
    .titlebar:not(headerbar).selection-mode stackswitcher.vertical > button.suggested-action:not(:last-child):not(:only-child):hover {
      border-color: mix(#30365f,rgba(255, 255, 255, 0.36),0.3);
      border-bottom-style: none;
      box-shadow: inset 0 -1px mix(#30365f,rgba(255, 255, 255, 0.36),0.3); }
  .linked.vertical > .suggested-action:not(:last-child):not(:only-child):checked, headerbar.selection-mode .linked.vertical > button.suggested-action:not(:last-child):not(:only-child):checked,
  .titlebar:not(headerbar).selection-mode .linked.vertical > button.suggested-action:not(:last-child):not(:only-child):checked, .linked.vertical > :not(:last-child):not(:only-child) .suggested-action:checked, stackswitcher.vertical > .suggested-action:not(:last-child):not(:only-child):checked, headerbar.selection-mode stackswitcher.vertical > button.suggested-action:not(:last-child):not(:only-child):checked,
  .titlebar:not(headerbar).selection-mode stackswitcher.vertical > button.suggested-action:not(:last-child):not(:only-child):checked {
    border-bottom-style: none; }
    .linked.vertical > .suggested-action:not(:last-child):not(:only-child):checked:hover, headerbar.selection-mode .linked.vertical > button.suggested-action:not(:last-child):not(:only-child):checked:hover,
    .titlebar:not(headerbar).selection-mode .linked.vertical > button.suggested-action:not(:last-child):not(:only-child):checked:hover, .linked.vertical > :not(:last-child):not(:only-child) .suggested-action:checked:hover, stackswitcher.vertical > .suggested-action:not(:last-child):not(:only-child):checked:hover, headerbar.selection-mode stackswitcher.vertical > button.suggested-action:not(:last-child):not(:only-child):checked:hover,
    .titlebar:not(headerbar).selection-mode stackswitcher.vertical > button.suggested-action:not(:last-child):not(:only-child):checked:hover {
      border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
      border-bottom-style: none;
      box-shadow: inset 0 -1px mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
  .suggested-action.flat, headerbar.selection-mode button.flat.suggested-action,
  .titlebar:not(headerbar).selection-mode button.flat.suggested-action {
    color: #ffffff;
    border-color: rgba(0, 181, 0, 0);
    background-color: rgba(0, 181, 0, 0);
    background-image: none;
    box-shadow: none; }
  .suggested-action:hover, headerbar.selection-mode button.suggested-action:hover,
  .titlebar:not(headerbar).selection-mode button.suggested-action:hover, .suggested-action.flat:hover {
    background-color: #00be00;
    background-image: none;
    border-color: rgba(204, 204, 204, 0.3);
    color: #ffffff;
    box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.32); }
    .suggested-action:hover:focus, .suggested-action:hover:hover,
    .titlebar:not(headerbar).selection-mode button.suggested-action:hover:hover, .suggested-action.flat:hover:focus, .suggested-action.flat:hover:hover {
      border-color: mix(#30365f,rgba(255, 255, 255, 0.3),0.3); }
    .suggested-action:hover:active,
    .titlebar:not(headerbar).selection-mode button.suggested-action:hover:active, .suggested-action:hover:active:focus, .suggested-action.flat:hover:active:focus, .suggested-action:hover:checked,
    .titlebar:not(headerbar).selection-mode button.suggested-action:hover:checked, .suggested-action:hover:checked:focus, .suggested-action.flat:hover:checked:focus, .suggested-action.flat:hover:active, .suggested-action.flat:hover:active:hover:focus, .suggested-action.flat:hover:checked, .suggested-action.flat:hover:checked:hover:focus {
      border-color: rgba(179, 179, 179, 0.3); }
    .suggested-action:hover:disabled,
    .titlebar:not(headerbar).selection-mode button.suggested-action:hover:disabled, .suggested-action.flat:hover:disabled {
      border-color: rgba(217, 217, 217, 0.3); }
    .suggested-action:hover:active:disabled, .suggested-action:hover:checked:disabled, .suggested-action.flat:hover:active:disabled, .suggested-action.flat:hover:checked:disabled {
      border-color: rgba(204, 204, 204, 0.3); }
  .suggested-action:focus, headerbar.selection-mode button.suggested-action:focus,
  .titlebar:not(headerbar).selection-mode button.suggested-action:focus, .suggested-action.flat:focus {
    background-color: #00be00;
    background-image: none;
    border-color: rgba(255, 255, 255, 0.22);
    outline-color: rgba(48, 54, 95, 0.5);
    outline-width: 3px;
    outline-style: solid;
    outline-offset: 10px;
    color: #ffffff;
    box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
    .suggested-action:focus:hover,
    .titlebar:not(headerbar).selection-mode button.suggested-action:focus:hover, .suggested-action.flat:focus:hover {
      background-color: #00c700;
      background-image: none;
      border-color: rgba(204, 204, 204, 0.3);
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.48); }
      .suggested-action:focus:hover:hover, .suggested-action.flat:focus:hover:hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.3),0.3); }
      .suggested-action:focus:hover:active, .suggested-action.flat:focus:hover:active, .suggested-action.flat:focus:hover:active:focus, .suggested-action:focus:hover:checked, .suggested-action.flat:focus:hover:checked, .suggested-action.flat:focus:hover:checked:focus, .suggested-action.flat:focus:hover:active:hover:focus, .suggested-action.flat:focus:hover:checked:hover:focus {
        border-color: rgba(179, 179, 179, 0.3); }
      .suggested-action:focus:hover:disabled, .suggested-action.flat:focus:hover:disabled {
        border-color: rgba(217, 217, 217, 0.3); }
      .suggested-action:focus:hover:active:disabled, .suggested-action:focus:hover:checked:disabled, .suggested-action.flat:focus:hover:active:disabled, .suggested-action.flat:focus:hover:checked:disabled {
        border-color: rgba(204, 204, 204, 0.3); }
  .suggested-action:checked, headerbar.selection-mode button.suggested-action:checked,
  .titlebar:not(headerbar).selection-mode button.suggested-action:checked, .suggested-action:active, headerbar.selection-mode button.suggested-action:active,
  .titlebar:not(headerbar).selection-mode button.suggested-action:active, .suggested-action.flat:checked, .suggested-action.flat:active {
    /*@include linear-gradient(shade($bg, .7), to top);*/
    background-color: #30365f;
    background-image: none;
    border-color: rgba(204, 204, 204, 0.22);
    color: #ffffff;
    box-shadow: inset 1px 0 rgba(255, 255, 255, 0.06), inset 0 1px rgba(255, 255, 255, 0.07), inset -1px 0 rgba(255, 255, 255, 0.06), inset 0 -1px rgba(255, 255, 255, 0.05); }
    .suggested-action:checked:focus,
    .titlebar:not(headerbar).selection-mode button.suggested-action:checked:focus, .suggested-action:checked:hover,
    .titlebar:not(headerbar).selection-mode button.suggested-action:checked:hover, .suggested-action:active:focus,
    .titlebar:not(headerbar).selection-mode button.suggested-action:active:focus, .suggested-action:active:hover,
    .titlebar:not(headerbar).selection-mode button.suggested-action:active:hover, .suggested-action.flat:checked:focus, .suggested-action.flat:checked:hover, .suggested-action.flat:active:focus, .suggested-action.flat:active:hover {
      border-color: mix(#30365f,rgba(255, 255, 255, 0.22),0.3); }
    .suggested-action:active:checked, .suggested-action:active:checked:hover, .suggested-action:active:checked:focus, .suggested-action:active:checked:hover:focus,
    .titlebar:not(headerbar).selection-mode button.suggested-action:checked:checked,
    .titlebar:not(headerbar).selection-mode button.suggested-action:active:active, .suggested-action.flat:active:checked, .suggested-action.flat:active:checked:hover, .suggested-action.flat:active:checked:focus, .suggested-action.flat:active:checked:hover:focus {
      border-color: rgba(179, 179, 179, 0.22); }
    .suggested-action:checked:disabled,
    .titlebar:not(headerbar).selection-mode button.suggested-action:checked:disabled, .suggested-action:active:disabled,
    .titlebar:not(headerbar).selection-mode button.suggested-action:active:disabled, .suggested-action.flat:checked:disabled, .suggested-action.flat:active:disabled {
      border-color: rgba(217, 217, 217, 0.22); }
    .suggested-action:active:checked:disabled, .suggested-action.flat:active:checked:disabled {
      border-color: rgba(204, 204, 204, 0.22); }
    .suggested-action:checked:focus,
    .titlebar:not(headerbar).selection-mode button.suggested-action:checked:focus, .suggested-action:checked:hover,
    .titlebar:not(headerbar).selection-mode button.suggested-action:checked:hover, .suggested-action:active:focus,
    .titlebar:not(headerbar).selection-mode button.suggested-action:active:focus, .suggested-action:active:hover,
    .titlebar:not(headerbar).selection-mode button.suggested-action:active:hover, .suggested-action.flat:checked:focus, .suggested-action.flat:checked:hover, .suggested-action.flat:active:focus, .suggested-action.flat:active:hover {
      /*@include linear-gradient(shade($bg, .65), to top);*/
      background-color: #323964;
      background-image: none;
      color: #ffffff; }
  .suggested-action:focus, headerbar.selection-mode button.suggested-action:focus,
  .titlebar:not(headerbar).selection-mode button.suggested-action:focus, .suggested-action:hover, headerbar.selection-mode button.suggested-action:hover,
  .titlebar:not(headerbar).selection-mode button.suggested-action:hover, .suggested-action.flat:focus, .suggested-action.flat:hover {
    color: #ffffff; }
  .suggested-action:disabled:disabled,
  .titlebar:not(headerbar).selection-mode button.suggested-action:disabled:disabled, .suggested-action.flat:disabled:disabled {
    background-color: alpha(mix(#00b500,#ffffff,0.2),0.4);
    background-image: none;
    /*border: 1px solid alpha($bg, .2);*/
    opacity: .6;
    color: mix(#00b500,#ffffff,0.6);
    box-shadow: none; }
    .suggested-action:disabled:disabled :disabled, .suggested-action.flat:disabled:disabled :disabled {
      color: mix(#00b500,#ffffff,0.6); }
  .suggested-action:active:disabled,
  .titlebar:not(headerbar).selection-mode button.suggested-action:active:disabled, .suggested-action:checked:disabled,
  .titlebar:not(headerbar).selection-mode button.suggested-action:checked:disabled, .suggested-action.flat:active:disabled, .suggested-action.flat:checked:disabled {
    background-color: rgba(48, 54, 95, 0.6);
    background-image: none;
    color: rgba(255, 255, 255, 0.85);
    box-shadow: none; }
    .suggested-action:active:disabled :disabled, .suggested-action:checked:disabled :disabled, .suggested-action.flat:active:disabled :disabled, .suggested-action.flat:checked:disabled :disabled {
      color: rgba(255, 255, 255, 0.85); }
  .suggested-action:backdrop, headerbar.selection-mode button.suggested-action:backdrop,
  .titlebar:not(headerbar).selection-mode button.suggested-action:backdrop, .suggested-action.flat:backdrop {
    color: mix(#ffffff,mix(#ffffff,#1b1c36,0.5),0.8); }
  .suggested-action.separator, headerbar.selection-mode button.separator.suggested-action,
  .titlebar:not(headerbar).selection-mode button.separator.suggested-action, .suggested-action .separator, headerbar.selection-mode button.suggested-action .separator,
  .titlebar.selection-mode:not(headerbar) button.suggested-action .separator {
    border: 1px solid currentColor;
    color: rgba(0, 181, 0, 0.9); }
    .suggested-action.separator:disabled,
    .titlebar:not(headerbar).selection-mode button.separator.suggested-action:disabled, .suggested-action .separator:disabled,
    .titlebar.selection-mode:not(headerbar) button.suggested-action .separator:disabled {
      color: rgba(0, 181, 0, 0.85); }
  .suggested-action separator, headerbar.selection-mode button.suggested-action separator,
  .titlebar.selection-mode:not(headerbar) button.suggested-action separator {
    background-image: image(mix(#ffffff,#00b500,0.9)); }

.destructive-action {
  background-color: #af0000;
  background-image: none;
  border-color: rgba(204, 204, 204, 0.22);
  color: #ffffff;
  box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22); }
  .destructive-action:focus, .destructive-action:hover {
    border-color: mix(#30365f,rgba(255, 255, 255, 0.22),0.3); }
  .destructive-action:active, .destructive-action:active:hover, .destructive-action:active:focus, .destructive-action:active:hover:focus, .destructive-action:checked, .destructive-action:checked:hover, .destructive-action:checked:focus, .destructive-action:checked:hover:focus {
    border-color: rgba(179, 179, 179, 0.22); }
  .destructive-action:disabled {
    border-color: rgba(217, 217, 217, 0.22); }
  .destructive-action:active:disabled, .destructive-action:checked:disabled {
    border-color: rgba(204, 204, 204, 0.22); }
  .linked:not(.vertical) > .destructive-action:not(:last-child):not(:only-child), .linked:not(.vertical) > :not(:last-child):not(:only-child) .destructive-action, viewswitcher:not(.vertical) > .destructive-action:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > .destructive-action:not(:last-child):not(:only-child) {
    border-right-style: none; }
    .linked:not(.vertical) > .destructive-action:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) .destructive-action:hover, viewswitcher:not(.vertical) > .destructive-action:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > .destructive-action:not(:last-child):not(:only-child):hover {
      border-color: mix(#30365f,rgba(255, 255, 255, 0.36),0.3);
      border-right-style: none;
      box-shadow: inset-1px 0 0 mix(#30365f,rgba(255, 255, 255, 0.36),0.3); }
  .linked:not(.vertical) > .destructive-action:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > :not(:last-child):not(:only-child) .destructive-action:checked, viewswitcher:not(.vertical) > .destructive-action:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > .destructive-action:not(:last-child):not(:only-child):checked {
    border-right-style: none; }
    .linked:not(.vertical) > .destructive-action:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) .destructive-action:checked:hover, viewswitcher:not(.vertical) > .destructive-action:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > .destructive-action:not(:last-child):not(:only-child):checked:hover {
      border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
      border-right-style: none;
      box-shadow: inset-1px 0 0 mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
  .linked.vertical > .destructive-action:not(:last-child):not(:only-child), .linked.vertical > :not(:last-child):not(:only-child) .destructive-action, stackswitcher.vertical > .destructive-action:not(:last-child):not(:only-child) {
    border-bottom-style: none; }
    .linked.vertical > .destructive-action:not(:last-child):not(:only-child):hover, .linked.vertical > :not(:last-child):not(:only-child) .destructive-action:hover, stackswitcher.vertical > .destructive-action:not(:last-child):not(:only-child):hover {
      border-color: mix(#30365f,rgba(255, 255, 255, 0.36),0.3);
      border-bottom-style: none;
      box-shadow: inset 0 -1px mix(#30365f,rgba(255, 255, 255, 0.36),0.3); }
  .linked.vertical > .destructive-action:not(:last-child):not(:only-child):checked, .linked.vertical > :not(:last-child):not(:only-child) .destructive-action:checked, stackswitcher.vertical > .destructive-action:not(:last-child):not(:only-child):checked {
    border-bottom-style: none; }
    .linked.vertical > .destructive-action:not(:last-child):not(:only-child):checked:hover, .linked.vertical > :not(:last-child):not(:only-child) .destructive-action:checked:hover, stackswitcher.vertical > .destructive-action:not(:last-child):not(:only-child):checked:hover {
      border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
      border-bottom-style: none;
      box-shadow: inset 0 -1px mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
  .destructive-action.flat {
    color: #ffffff;
    border-color: rgba(175, 0, 0, 0);
    background-color: rgba(175, 0, 0, 0);
    background-image: none;
    box-shadow: none; }
  .destructive-action:hover, .destructive-action.flat:hover {
    background-color: #b80000;
    background-image: none;
    border-color: rgba(204, 204, 204, 0.3);
    color: #ffffff;
    box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.32); }
    .destructive-action:hover:focus, .destructive-action:hover:hover, .destructive-action.flat:hover:focus, .destructive-action.flat:hover:hover {
      border-color: mix(#30365f,rgba(255, 255, 255, 0.3),0.3); }
    .destructive-action:hover:active, .destructive-action:hover:active:hover, .destructive-action:hover:active:focus, .destructive-action:hover:active:hover:focus, .destructive-action:hover:checked, .destructive-action:hover:checked:hover, .destructive-action:hover:checked:focus, .destructive-action:hover:checked:hover:focus, .destructive-action.flat:hover:active, .destructive-action.flat:hover:active:hover, .destructive-action.flat:hover:active:focus, .destructive-action.flat:hover:active:hover:focus, .destructive-action.flat:hover:checked, .destructive-action.flat:hover:checked:hover, .destructive-action.flat:hover:checked:focus, .destructive-action.flat:hover:checked:hover:focus {
      border-color: rgba(179, 179, 179, 0.3); }
    .destructive-action:hover:disabled, .destructive-action.flat:hover:disabled {
      border-color: rgba(217, 217, 217, 0.3); }
    .destructive-action:hover:active:disabled, .destructive-action:hover:checked:disabled, .destructive-action.flat:hover:active:disabled, .destructive-action.flat:hover:checked:disabled {
      border-color: rgba(204, 204, 204, 0.3); }
  .destructive-action:focus, .destructive-action.flat:focus {
    background-color: #b80000;
    background-image: none;
    border-color: rgba(255, 255, 255, 0.22);
    outline-color: rgba(48, 54, 95, 0.5);
    outline-width: 3px;
    outline-style: solid;
    outline-offset: 10px;
    color: #ffffff;
    box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
    .destructive-action:focus:hover, .destructive-action.flat:focus:hover {
      background-color: #c10000;
      background-image: none;
      border-color: rgba(204, 204, 204, 0.3);
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.48); }
      .destructive-action:focus:hover:focus, .destructive-action:focus:hover:hover, .destructive-action.flat:focus:hover:focus, .destructive-action.flat:focus:hover:hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.3),0.3); }
      .destructive-action:focus:hover:active, .destructive-action:focus:hover:active:hover, .destructive-action:focus:hover:active:focus, .destructive-action:focus:hover:active:hover:focus, .destructive-action:focus:hover:checked, .destructive-action:focus:hover:checked:hover, .destructive-action:focus:hover:checked:focus, .destructive-action:focus:hover:checked:hover:focus, .destructive-action.flat:focus:hover:active, .destructive-action.flat:focus:hover:active:hover, .destructive-action.flat:focus:hover:active:focus, .destructive-action.flat:focus:hover:active:hover:focus, .destructive-action.flat:focus:hover:checked, .destructive-action.flat:focus:hover:checked:hover, .destructive-action.flat:focus:hover:checked:focus, .destructive-action.flat:focus:hover:checked:hover:focus {
        border-color: rgba(179, 179, 179, 0.3); }
      .destructive-action:focus:hover:disabled, .destructive-action.flat:focus:hover:disabled {
        border-color: rgba(217, 217, 217, 0.3); }
      .destructive-action:focus:hover:active:disabled, .destructive-action:focus:hover:checked:disabled, .destructive-action.flat:focus:hover:active:disabled, .destructive-action.flat:focus:hover:checked:disabled {
        border-color: rgba(204, 204, 204, 0.3); }
  .destructive-action:checked, .destructive-action:active, .destructive-action.flat:checked, .destructive-action.flat:active {
    /*@include linear-gradient(shade($bg, .7), to top);*/
    background-color: #30365f;
    background-image: none;
    border-color: rgba(204, 204, 204, 0.22);
    color: #ffffff;
    box-shadow: inset 1px 0 rgba(255, 255, 255, 0.06), inset 0 1px rgba(255, 255, 255, 0.07), inset -1px 0 rgba(255, 255, 255, 0.06), inset 0 -1px rgba(255, 255, 255, 0.05); }
    .destructive-action:checked:focus, .destructive-action:checked:hover, .destructive-action:active:focus, .destructive-action:active:hover, .destructive-action.flat:checked:focus, .destructive-action.flat:checked:hover, .destructive-action.flat:active:focus, .destructive-action.flat:active:hover {
      border-color: mix(#30365f,rgba(255, 255, 255, 0.22),0.3); }
    .destructive-action:checked:active, .destructive-action:checked:active:hover, .destructive-action:checked:active:focus, .destructive-action:checked:active:hover:focus, .destructive-action:checked:checked, .destructive-action:checked:checked:hover, .destructive-action:checked:checked:focus, .destructive-action:checked:checked:hover:focus, .destructive-action:active:active, .destructive-action:active:active:hover, .destructive-action:active:active:focus, .destructive-action:active:active:hover:focus, .destructive-action:active:checked, .destructive-action:active:checked:hover, .destructive-action:active:checked:focus, .destructive-action:active:checked:hover:focus, .destructive-action.flat:checked:active, .destructive-action.flat:checked:active:hover, .destructive-action.flat:checked:active:focus, .destructive-action.flat:checked:active:hover:focus, .destructive-action.flat:checked:checked, .destructive-action.flat:checked:checked:hover, .destructive-action.flat:checked:checked:focus, .destructive-action.flat:checked:checked:hover:focus, .destructive-action.flat:active:active, .destructive-action.flat:active:active:hover, .destructive-action.flat:active:active:focus, .destructive-action.flat:active:active:hover:focus, .destructive-action.flat:active:checked, .destructive-action.flat:active:checked:hover, .destructive-action.flat:active:checked:focus, .destructive-action.flat:active:checked:hover:focus {
      border-color: rgba(179, 179, 179, 0.22); }
    .destructive-action:checked:disabled, .destructive-action:active:disabled, .destructive-action.flat:checked:disabled, .destructive-action.flat:active:disabled {
      border-color: rgba(217, 217, 217, 0.22); }
    .destructive-action:checked:active:disabled, .destructive-action:checked:checked:disabled, .destructive-action:active:active:disabled, .destructive-action:active:checked:disabled, .destructive-action.flat:checked:active:disabled, .destructive-action.flat:checked:checked:disabled, .destructive-action.flat:active:active:disabled, .destructive-action.flat:active:checked:disabled {
      border-color: rgba(204, 204, 204, 0.22); }
    .destructive-action:checked:focus, .destructive-action:checked:hover, .destructive-action:active:focus, .destructive-action:active:hover, .destructive-action.flat:checked:focus, .destructive-action.flat:checked:hover, .destructive-action.flat:active:focus, .destructive-action.flat:active:hover {
      /*@include linear-gradient(shade($bg, .65), to top);*/
      background-color: #323964;
      background-image: none;
      color: #ffffff; }
  .destructive-action:focus, .destructive-action:hover, .destructive-action.flat:focus, .destructive-action.flat:hover {
    color: #ffffff; }
  .destructive-action:disabled:disabled, .destructive-action.flat:disabled:disabled {
    background-color: alpha(mix(#af0000,#ffffff,0.2),0.4);
    background-image: none;
    /*border: 1px solid alpha($bg, .2);*/
    opacity: .6;
    color: mix(#af0000,#ffffff,0.6);
    box-shadow: none; }
    .destructive-action:disabled:disabled :disabled, .destructive-action.flat:disabled:disabled :disabled {
      color: mix(#af0000,#ffffff,0.6); }
  .destructive-action:active:disabled, .destructive-action:checked:disabled, .destructive-action.flat:active:disabled, .destructive-action.flat:checked:disabled {
    background-color: rgba(48, 54, 95, 0.6);
    background-image: none;
    color: rgba(255, 255, 255, 0.85);
    box-shadow: none; }
    .destructive-action:active:disabled :disabled, .destructive-action:checked:disabled :disabled, .destructive-action.flat:active:disabled :disabled, .destructive-action.flat:checked:disabled :disabled {
      color: rgba(255, 255, 255, 0.85); }
  .destructive-action:backdrop, .destructive-action.flat:backdrop {
    color: mix(#ffffff,mix(#ffffff,#1b1c36,0.5),0.8); }
  .destructive-action.separator, .destructive-action .separator {
    border: 1px solid currentColor;
    color: rgba(175, 0, 0, 0.9); }
    .destructive-action.separator:disabled, .destructive-action .separator:disabled {
      color: rgba(175, 0, 0, 0.85); }
  .destructive-action separator {
    background-image: image(mix(#ffffff,#af0000,0.9)); }

/******************
 ! Selection mode *
*******************/
headerbar.selection-mode,
.titlebar:not(headerbar).selection-mode {
  background-color: #30365f;
  background-image: none;
  border-color: mix(#ffffff,#30365f,0.88);
  color: #ffffff; }
  headerbar.selection-mode:focus, headerbar.selection-mode:hover,
  .titlebar:not(headerbar).selection-mode:focus,
  .titlebar:not(headerbar).selection-mode:hover {
    border-color: mix(#30365f,mix(#ffffff,#30365f,0.8),0.3); }
  headerbar.selection-mode:active, headerbar.selection-mode:active:hover, headerbar.selection-mode:active:focus, headerbar.selection-mode:active:hover:focus, headerbar.selection-mode:checked, headerbar.selection-mode:checked:hover, headerbar.selection-mode:checked:focus, headerbar.selection-mode:checked:hover:focus,
  .titlebar:not(headerbar).selection-mode:active,
  .titlebar:not(headerbar).selection-mode:active:hover,
  .titlebar:not(headerbar).selection-mode:active:focus,
  .titlebar:not(headerbar).selection-mode:active:hover:focus,
  .titlebar:not(headerbar).selection-mode:checked,
  .titlebar:not(headerbar).selection-mode:checked:hover,
  .titlebar:not(headerbar).selection-mode:checked:focus,
  .titlebar:not(headerbar).selection-mode:checked:hover:focus {
    border-color: mix(#ffffff,#30365f,0.4); }
  headerbar.selection-mode:disabled,
  .titlebar:not(headerbar).selection-mode:disabled {
    border-color: mix(#ffffff,#30365f,0.92); }
  headerbar.selection-mode:active:disabled, headerbar.selection-mode:checked:disabled,
  .titlebar:not(headerbar).selection-mode:active:disabled,
  .titlebar:not(headerbar).selection-mode:checked:disabled {
    border-color: mix(#ffffff,#30365f,0.88); }
  headerbar.selection-mode:disabled,
  .titlebar:not(headerbar).selection-mode:disabled {
    background-color: #2b3156;
    background-image: none;
    color: mix(#ffffff,#30365f,0.5); }
  headerbar.selection-mode .background,
  .titlebar:not(headerbar).selection-mode .background {
    background-color: #30365f;
    border-color: mix(#30365f,#ffffff,0.3); }
  headerbar.selection-mode .title,
  .titlebar:not(headerbar).selection-mode .title {
    font-weight: bold;
    padding: 0 8px; }
  headerbar.selection-mode .subtitle,
  .titlebar:not(headerbar).selection-mode .subtitle {
    font-size: smaller;
    padding: 0 8px; }
  headerbar.selection-mode button, headerbar.selection-mode button.nautilus-circular-button.image-button,
  .titlebar:not(headerbar).selection-mode button {
    background-color: #30365f;
    background-image: none;
    border-color: rgba(204, 204, 204, 0.22);
    color: #ffffff;
    box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22); }
    headerbar.selection-mode button:focus, headerbar.selection-mode button:hover,
    .titlebar:not(headerbar).selection-mode button:focus,
    .titlebar:not(headerbar).selection-mode button:hover {
      border-color: mix(#30365f,rgba(255, 255, 255, 0.22),0.3); }
    headerbar.selection-mode button:active, headerbar.selection-mode button:active:hover, headerbar.selection-mode button:active:focus, headerbar.selection-mode button:active:hover:focus, headerbar.selection-mode button:checked, headerbar.selection-mode button:checked:hover, headerbar.selection-mode button:checked:focus, headerbar.selection-mode button:checked:hover:focus,
    .titlebar:not(headerbar).selection-mode button:active,
    .titlebar:not(headerbar).selection-mode button:active:hover,
    .titlebar:not(headerbar).selection-mode button:active:focus,
    .titlebar:not(headerbar).selection-mode button:active:hover:focus,
    .titlebar:not(headerbar).selection-mode button:checked,
    .titlebar:not(headerbar).selection-mode button:checked:hover,
    .titlebar:not(headerbar).selection-mode button:checked:focus,
    .titlebar:not(headerbar).selection-mode button:checked:hover:focus {
      border-color: rgba(179, 179, 179, 0.22); }
    headerbar.selection-mode button:disabled,
    .titlebar:not(headerbar).selection-mode button:disabled {
      border-color: rgba(217, 217, 217, 0.22); }
    headerbar.selection-mode button:active:disabled, headerbar.selection-mode button:checked:disabled,
    .titlebar:not(headerbar).selection-mode button:active:disabled,
    .titlebar:not(headerbar).selection-mode button:checked:disabled {
      border-color: rgba(204, 204, 204, 0.22); }
    .linked:not(.vertical) > headerbar.selection-mode button:not(:last-child):not(:only-child), .linked:not(.vertical) > :not(:last-child):not(:only-child) headerbar.selection-mode button, viewswitcher:not(.vertical) > headerbar.selection-mode button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > headerbar.selection-mode button:not(:last-child):not(:only-child), .linked:not(.vertical) > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child), .linked:not(.vertical) > :not(:last-child):not(:only-child) .titlebar:not(headerbar).selection-mode button, viewswitcher:not(.vertical) > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child) {
      border-right-style: none; }
      .linked:not(.vertical) > headerbar.selection-mode button:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) headerbar.selection-mode button:hover, viewswitcher:not(.vertical) > headerbar.selection-mode button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > headerbar.selection-mode button:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) .titlebar:not(headerbar).selection-mode button:hover, viewswitcher:not(.vertical) > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child):hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.36),0.3);
        border-right-style: none;
        box-shadow: inset-1px 0 0 mix(#30365f,rgba(255, 255, 255, 0.36),0.3); }
    .linked:not(.vertical) > headerbar.selection-mode button:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > :not(:last-child):not(:only-child) headerbar.selection-mode button:checked, viewswitcher:not(.vertical) > headerbar.selection-mode button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > headerbar.selection-mode button:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > :not(:last-child):not(:only-child) .titlebar:not(headerbar).selection-mode button:checked, viewswitcher:not(.vertical) > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child):checked {
      border-right-style: none; }
      .linked:not(.vertical) > headerbar.selection-mode button:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) headerbar.selection-mode button:checked:hover, viewswitcher:not(.vertical) > headerbar.selection-mode button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > headerbar.selection-mode button:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) .titlebar:not(headerbar).selection-mode button:checked:hover, viewswitcher:not(.vertical) > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child):checked:hover {
        border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
        border-right-style: none;
        box-shadow: inset-1px 0 0 mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
    .linked.vertical > headerbar.selection-mode button:not(:last-child):not(:only-child), .linked.vertical > :not(:last-child):not(:only-child) headerbar.selection-mode button, stackswitcher.vertical > headerbar.selection-mode button:not(:last-child):not(:only-child), .linked.vertical > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child), .linked.vertical > :not(:last-child):not(:only-child) .titlebar:not(headerbar).selection-mode button, stackswitcher.vertical > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child) {
      border-bottom-style: none; }
      .linked.vertical > headerbar.selection-mode button:not(:last-child):not(:only-child):hover, .linked.vertical > :not(:last-child):not(:only-child) headerbar.selection-mode button:hover, stackswitcher.vertical > headerbar.selection-mode button:not(:last-child):not(:only-child):hover, .linked.vertical > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child):hover, .linked.vertical > :not(:last-child):not(:only-child) .titlebar:not(headerbar).selection-mode button:hover, stackswitcher.vertical > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child):hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.36),0.3);
        border-bottom-style: none;
        box-shadow: inset 0 -1px mix(#30365f,rgba(255, 255, 255, 0.36),0.3); }
    .linked.vertical > headerbar.selection-mode button:not(:last-child):not(:only-child):checked, .linked.vertical > :not(:last-child):not(:only-child) headerbar.selection-mode button:checked, stackswitcher.vertical > headerbar.selection-mode button:not(:last-child):not(:only-child):checked, .linked.vertical > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child):checked, .linked.vertical > :not(:last-child):not(:only-child) .titlebar:not(headerbar).selection-mode button:checked, stackswitcher.vertical > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child):checked {
      border-bottom-style: none; }
      .linked.vertical > headerbar.selection-mode button:not(:last-child):not(:only-child):checked:hover, .linked.vertical > :not(:last-child):not(:only-child) headerbar.selection-mode button:checked:hover, stackswitcher.vertical > headerbar.selection-mode button:not(:last-child):not(:only-child):checked:hover, .linked.vertical > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child):checked:hover, .linked.vertical > :not(:last-child):not(:only-child) .titlebar:not(headerbar).selection-mode button:checked:hover, stackswitcher.vertical > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child):checked:hover {
        border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
        border-bottom-style: none;
        box-shadow: inset 0 -1px mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
    headerbar.selection-mode button.flat,
    .titlebar:not(headerbar).selection-mode button.flat {
      color: #ffffff;
      border-color: rgba(48, 54, 95, 0);
      background-color: rgba(48, 54, 95, 0);
      background-image: none;
      box-shadow: none; }
    headerbar.selection-mode button:hover, headerbar.selection-mode button.flat:hover,
    .titlebar:not(headerbar).selection-mode button:hover,
    .titlebar:not(headerbar).selection-mode button.flat:hover {
      background-color: #323964;
      background-image: none;
      border-color: rgba(204, 204, 204, 0.3);
      color: #ffffff;
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.32); }
      headerbar.selection-mode button:hover:focus, headerbar.selection-mode button:hover:hover, headerbar.selection-mode button.flat:hover:focus, headerbar.selection-mode button.flat:hover:hover,
      .titlebar:not(headerbar).selection-mode button:hover:focus,
      .titlebar:not(headerbar).selection-mode button:hover:hover,
      .titlebar:not(headerbar).selection-mode button.flat:hover:focus,
      .titlebar:not(headerbar).selection-mode button.flat:hover:hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.3),0.3); }
      headerbar.selection-mode button:hover:active, headerbar.selection-mode button:hover:active:focus, headerbar.selection-mode button.flat:hover:active:focus, headerbar.selection-mode button:hover:checked, headerbar.selection-mode button:hover:checked:focus, headerbar.selection-mode button.flat:hover:checked:focus, headerbar.selection-mode button.flat:hover:active, headerbar.selection-mode button.flat:hover:active:hover:focus, headerbar.selection-mode button.flat:hover:checked, headerbar.selection-mode button.flat:hover:checked:hover:focus,
      .titlebar:not(headerbar).selection-mode button:hover:active,
      .titlebar:not(headerbar).selection-mode button:hover:active:focus,
      .titlebar:not(headerbar).selection-mode button.flat:hover:active:focus,
      .titlebar:not(headerbar).selection-mode button:hover:checked,
      .titlebar:not(headerbar).selection-mode button:hover:checked:focus,
      .titlebar:not(headerbar).selection-mode button.flat:hover:checked:focus,
      .titlebar:not(headerbar).selection-mode button.flat:hover:active,
      .titlebar:not(headerbar).selection-mode button.flat:hover:active:hover:focus,
      .titlebar:not(headerbar).selection-mode button.flat:hover:checked,
      .titlebar:not(headerbar).selection-mode button.flat:hover:checked:hover:focus {
        border-color: rgba(179, 179, 179, 0.3); }
      headerbar.selection-mode button:hover:disabled, headerbar.selection-mode button.flat:hover:disabled,
      .titlebar:not(headerbar).selection-mode button:hover:disabled,
      .titlebar:not(headerbar).selection-mode button.flat:hover:disabled {
        border-color: rgba(217, 217, 217, 0.3); }
      headerbar.selection-mode button:hover:active:disabled, headerbar.selection-mode button:hover:checked:disabled, headerbar.selection-mode button.flat:hover:active:disabled, headerbar.selection-mode button.flat:hover:checked:disabled,
      .titlebar:not(headerbar).selection-mode button:hover:active:disabled,
      .titlebar:not(headerbar).selection-mode button:hover:checked:disabled,
      .titlebar:not(headerbar).selection-mode button.flat:hover:active:disabled,
      .titlebar:not(headerbar).selection-mode button.flat:hover:checked:disabled {
        border-color: rgba(204, 204, 204, 0.3); }
    headerbar.selection-mode button:focus, headerbar.selection-mode button.flat:focus,
    .titlebar:not(headerbar).selection-mode button:focus,
    .titlebar:not(headerbar).selection-mode button.flat:focus {
      background-color: #323964;
      background-image: none;
      border-color: rgba(255, 255, 255, 0.22);
      outline-color: rgba(48, 54, 95, 0.5);
      outline-width: 3px;
      outline-style: solid;
      outline-offset: 10px;
      color: #ffffff;
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
      headerbar.selection-mode button:focus:hover, headerbar.selection-mode button.flat:focus:hover,
      .titlebar:not(headerbar).selection-mode button:focus:hover,
      .titlebar:not(headerbar).selection-mode button.flat:focus:hover {
        background-color: #353b69;
        background-image: none;
        border-color: rgba(204, 204, 204, 0.3);
        box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.48); }
        headerbar.selection-mode button:focus:hover:hover, headerbar.selection-mode button.flat:focus:hover:hover,
        .titlebar:not(headerbar).selection-mode button:focus:hover:hover,
        .titlebar:not(headerbar).selection-mode button.flat:focus:hover:hover {
          border-color: mix(#30365f,rgba(255, 255, 255, 0.3),0.3); }
        headerbar.selection-mode button:focus:hover:active, headerbar.selection-mode button.flat:focus:hover:active, headerbar.selection-mode button.flat:focus:hover:active:focus, headerbar.selection-mode button:focus:hover:checked, headerbar.selection-mode button.flat:focus:hover:checked, headerbar.selection-mode button.flat:focus:hover:checked:focus, headerbar.selection-mode button.flat:focus:hover:active:hover:focus, headerbar.selection-mode button.flat:focus:hover:checked:hover:focus,
        .titlebar:not(headerbar).selection-mode button:focus:hover:active,
        .titlebar:not(headerbar).selection-mode button.flat:focus:hover:active,
        .titlebar:not(headerbar).selection-mode button.flat:focus:hover:active:focus,
        .titlebar:not(headerbar).selection-mode button:focus:hover:checked,
        .titlebar:not(headerbar).selection-mode button.flat:focus:hover:checked,
        .titlebar:not(headerbar).selection-mode button.flat:focus:hover:checked:focus,
        .titlebar:not(headerbar).selection-mode button.flat:focus:hover:active:hover:focus,
        .titlebar:not(headerbar).selection-mode button.flat:focus:hover:checked:hover:focus {
          border-color: rgba(179, 179, 179, 0.3); }
        headerbar.selection-mode button:focus:hover:disabled, headerbar.selection-mode button.flat:focus:hover:disabled,
        .titlebar:not(headerbar).selection-mode button:focus:hover:disabled,
        .titlebar:not(headerbar).selection-mode button.flat:focus:hover:disabled {
          border-color: rgba(217, 217, 217, 0.3); }
        headerbar.selection-mode button:focus:hover:active:disabled, headerbar.selection-mode button:focus:hover:checked:disabled, headerbar.selection-mode button.flat:focus:hover:active:disabled, headerbar.selection-mode button.flat:focus:hover:checked:disabled,
        .titlebar:not(headerbar).selection-mode button:focus:hover:active:disabled,
        .titlebar:not(headerbar).selection-mode button:focus:hover:checked:disabled,
        .titlebar:not(headerbar).selection-mode button.flat:focus:hover:active:disabled,
        .titlebar:not(headerbar).selection-mode button.flat:focus:hover:checked:disabled {
          border-color: rgba(204, 204, 204, 0.3); }
    headerbar.selection-mode button:checked, headerbar.selection-mode button:active, headerbar.selection-mode button.flat:checked, headerbar.selection-mode button.flat:active,
    .titlebar:not(headerbar).selection-mode button:checked,
    .titlebar:not(headerbar).selection-mode button:active,
    .titlebar:not(headerbar).selection-mode button.flat:checked,
    .titlebar:not(headerbar).selection-mode button.flat:active {
      /*@include linear-gradient(shade($bg, .7), to top);*/
      background-color: #30365f;
      background-image: none;
      border-color: rgba(204, 204, 204, 0.22);
      color: #ffffff;
      box-shadow: inset 1px 0 rgba(255, 255, 255, 0.06), inset 0 1px rgba(255, 255, 255, 0.07), inset -1px 0 rgba(255, 255, 255, 0.06), inset 0 -1px rgba(255, 255, 255, 0.05); }
      headerbar.selection-mode button:checked:focus, headerbar.selection-mode button:checked:hover, headerbar.selection-mode button:active:focus, headerbar.selection-mode button:active:hover, headerbar.selection-mode button.flat:checked:focus, headerbar.selection-mode button.flat:checked:hover, headerbar.selection-mode button.flat:active:focus, headerbar.selection-mode button.flat:active:hover,
      .titlebar:not(headerbar).selection-mode button:checked:focus,
      .titlebar:not(headerbar).selection-mode button:checked:hover,
      .titlebar:not(headerbar).selection-mode button:active:focus,
      .titlebar:not(headerbar).selection-mode button:active:hover,
      .titlebar:not(headerbar).selection-mode button.flat:checked:focus,
      .titlebar:not(headerbar).selection-mode button.flat:checked:hover,
      .titlebar:not(headerbar).selection-mode button.flat:active:focus,
      .titlebar:not(headerbar).selection-mode button.flat:active:hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.22),0.3); }
      headerbar.selection-mode button:checked:active, headerbar.selection-mode button.nautilus-circular-button.image-button:checked:active, headerbar.selection-mode button:checked:active:hover, headerbar.selection-mode button.nautilus-circular-button.image-button:checked:active:hover, headerbar.selection-mode button:checked:active:focus, headerbar.selection-mode button.nautilus-circular-button.image-button:checked:active:focus, headerbar.selection-mode button:checked:active:hover:focus, headerbar.selection-mode button.nautilus-circular-button.image-button:checked:active:hover:focus, headerbar.selection-mode button:checked:checked, headerbar.selection-mode button.nautilus-circular-button.image-button:checked:checked, headerbar.selection-mode button:checked:checked:hover, headerbar.selection-mode button.nautilus-circular-button.image-button:checked:checked:hover, headerbar.selection-mode button:checked:checked:focus, headerbar.selection-mode button.nautilus-circular-button.image-button:checked:checked:focus, headerbar.selection-mode button:checked:checked:hover:focus, headerbar.selection-mode button.nautilus-circular-button.image-button:checked:checked:hover:focus, headerbar.selection-mode button:active:active, headerbar.selection-mode button.nautilus-circular-button.image-button:active:active, headerbar.selection-mode button:active:active:hover, headerbar.selection-mode button.nautilus-circular-button.image-button:active:active:hover, headerbar.selection-mode button:active:active:focus, headerbar.selection-mode button.nautilus-circular-button.image-button:active:active:focus, headerbar.selection-mode button:active:active:hover:focus, headerbar.selection-mode button.nautilus-circular-button.image-button:active:active:hover:focus, headerbar.selection-mode button:active:checked, headerbar.selection-mode button.nautilus-circular-button.image-button:active:checked, headerbar.selection-mode button:active:checked:hover, headerbar.selection-mode button.nautilus-circular-button.image-button:active:checked:hover, headerbar.selection-mode button:active:checked:focus, headerbar.selection-mode button.nautilus-circular-button.image-button:active:checked:focus, headerbar.selection-mode button:active:checked:hover:focus, headerbar.selection-mode button.nautilus-circular-button.image-button:active:checked:hover:focus, headerbar.selection-mode button.flat:checked:active, headerbar.selection-mode button.flat.nautilus-circular-button.image-button:checked:active, headerbar.selection-mode button.flat:checked:active:hover, headerbar.selection-mode button.flat.nautilus-circular-button.image-button:checked:active:hover, headerbar.selection-mode button.flat:checked:active:focus, headerbar.selection-mode button.flat.nautilus-circular-button.image-button:checked:active:focus, headerbar.selection-mode button.flat:checked:active:hover:focus, headerbar.selection-mode button.flat.nautilus-circular-button.image-button:checked:active:hover:focus, headerbar.selection-mode button.flat:checked:checked, headerbar.selection-mode button.flat.nautilus-circular-button.image-button:checked:checked, headerbar.selection-mode button.flat:checked:checked:hover, headerbar.selection-mode button.flat.nautilus-circular-button.image-button:checked:checked:hover, headerbar.selection-mode button.flat:checked:checked:focus, headerbar.selection-mode button.flat.nautilus-circular-button.image-button:checked:checked:focus, headerbar.selection-mode button.flat:checked:checked:hover:focus, headerbar.selection-mode button.flat.nautilus-circular-button.image-button:checked:checked:hover:focus, headerbar.selection-mode button.flat:active:active, headerbar.selection-mode button.flat.nautilus-circular-button.image-button:active:active, headerbar.selection-mode button.flat:active:active:hover, headerbar.selection-mode button.flat.nautilus-circular-button.image-button:active:active:hover, headerbar.selection-mode button.flat:active:active:focus, headerbar.selection-mode button.flat.nautilus-circular-button.image-button:active:active:focus, headerbar.selection-mode button.flat:active:active:hover:focus, headerbar.selection-mode button.flat.nautilus-circular-button.image-button:active:active:hover:focus, headerbar.selection-mode button.flat:active:checked, headerbar.selection-mode button.flat.nautilus-circular-button.image-button:active:checked, headerbar.selection-mode button.flat:active:checked:hover, headerbar.selection-mode button.flat.nautilus-circular-button.image-button:active:checked:hover, headerbar.selection-mode button.flat:active:checked:focus, headerbar.selection-mode button.flat.nautilus-circular-button.image-button:active:checked:focus, headerbar.selection-mode button.flat:active:checked:hover:focus, headerbar.selection-mode button.flat.nautilus-circular-button.image-button:active:checked:hover:focus,
      .titlebar:not(headerbar).selection-mode button:checked:active,
      .titlebar:not(headerbar).selection-mode button.nautilus-circular-button.image-button:checked:active,
      .titlebar:not(headerbar).selection-mode button:checked:active:hover,
      .titlebar:not(headerbar).selection-mode button.nautilus-circular-button.image-button:checked:active:hover,
      .titlebar:not(headerbar).selection-mode button:checked:active:focus,
      .titlebar:not(headerbar).selection-mode button.nautilus-circular-button.image-button:checked:active:focus,
      .titlebar:not(headerbar).selection-mode button:checked:active:hover:focus,
      .titlebar:not(headerbar).selection-mode button.nautilus-circular-button.image-button:checked:active:hover:focus,
      .titlebar:not(headerbar).selection-mode button:checked:checked,
      .titlebar:not(headerbar).selection-mode button.nautilus-circular-button.image-button:checked:checked,
      .titlebar:not(headerbar).selection-mode button:checked:checked:hover,
      .titlebar:not(headerbar).selection-mode button.nautilus-circular-button.image-button:checked:checked:hover,
      .titlebar:not(headerbar).selection-mode button:checked:checked:focus,
      .titlebar:not(headerbar).selection-mode button.nautilus-circular-button.image-button:checked:checked:focus,
      .titlebar:not(headerbar).selection-mode button:checked:checked:hover:focus,
      .titlebar:not(headerbar).selection-mode button.nautilus-circular-button.image-button:checked:checked:hover:focus,
      .titlebar:not(headerbar).selection-mode button:active:active,
      .titlebar:not(headerbar).selection-mode button.nautilus-circular-button.image-button:active:active,
      .titlebar:not(headerbar).selection-mode button:active:active:hover,
      .titlebar:not(headerbar).selection-mode button.nautilus-circular-button.image-button:active:active:hover,
      .titlebar:not(headerbar).selection-mode button:active:active:focus,
      .titlebar:not(headerbar).selection-mode button.nautilus-circular-button.image-button:active:active:focus,
      .titlebar:not(headerbar).selection-mode button:active:active:hover:focus,
      .titlebar:not(headerbar).selection-mode button.nautilus-circular-button.image-button:active:active:hover:focus,
      .titlebar:not(headerbar).selection-mode button:active:checked,
      .titlebar:not(headerbar).selection-mode button.nautilus-circular-button.image-button:active:checked,
      .titlebar:not(headerbar).selection-mode button:active:checked:hover,
      .titlebar:not(headerbar).selection-mode button.nautilus-circular-button.image-button:active:checked:hover,
      .titlebar:not(headerbar).selection-mode button:active:checked:focus,
      .titlebar:not(headerbar).selection-mode button.nautilus-circular-button.image-button:active:checked:focus,
      .titlebar:not(headerbar).selection-mode button:active:checked:hover:focus,
      .titlebar:not(headerbar).selection-mode button.nautilus-circular-button.image-button:active:checked:hover:focus,
      .titlebar:not(headerbar).selection-mode button.flat:checked:active,
      .titlebar:not(headerbar).selection-mode button.flat.nautilus-circular-button.image-button:checked:active,
      .titlebar:not(headerbar).selection-mode button.flat:checked:active:hover,
      .titlebar:not(headerbar).selection-mode button.flat.nautilus-circular-button.image-button:checked:active:hover,
      .titlebar:not(headerbar).selection-mode button.flat:checked:active:focus,
      .titlebar:not(headerbar).selection-mode button.flat.nautilus-circular-button.image-button:checked:active:focus,
      .titlebar:not(headerbar).selection-mode button.flat:checked:active:hover:focus,
      .titlebar:not(headerbar).selection-mode button.flat.nautilus-circular-button.image-button:checked:active:hover:focus,
      .titlebar:not(headerbar).selection-mode button.flat:checked:checked,
      .titlebar:not(headerbar).selection-mode button.flat.nautilus-circular-button.image-button:checked:checked,
      .titlebar:not(headerbar).selection-mode button.flat:checked:checked:hover,
      .titlebar:not(headerbar).selection-mode button.flat.nautilus-circular-button.image-button:checked:checked:hover,
      .titlebar:not(headerbar).selection-mode button.flat:checked:checked:focus,
      .titlebar:not(headerbar).selection-mode button.flat.nautilus-circular-button.image-button:checked:checked:focus,
      .titlebar:not(headerbar).selection-mode button.flat:checked:checked:hover:focus,
      .titlebar:not(headerbar).selection-mode button.flat.nautilus-circular-button.image-button:checked:checked:hover:focus,
      .titlebar:not(headerbar).selection-mode button.flat:active:active,
      .titlebar:not(headerbar).selection-mode button.flat.nautilus-circular-button.image-button:active:active,
      .titlebar:not(headerbar).selection-mode button.flat:active:active:hover,
      .titlebar:not(headerbar).selection-mode button.flat.nautilus-circular-button.image-button:active:active:hover,
      .titlebar:not(headerbar).selection-mode button.flat:active:active:focus,
      .titlebar:not(headerbar).selection-mode button.flat.nautilus-circular-button.image-button:active:active:focus,
      .titlebar:not(headerbar).selection-mode button.flat:active:active:hover:focus,
      .titlebar:not(headerbar).selection-mode button.flat.nautilus-circular-button.image-button:active:active:hover:focus,
      .titlebar:not(headerbar).selection-mode button.flat:active:checked,
      .titlebar:not(headerbar).selection-mode button.flat.nautilus-circular-button.image-button:active:checked,
      .titlebar:not(headerbar).selection-mode button.flat:active:checked:hover,
      .titlebar:not(headerbar).selection-mode button.flat.nautilus-circular-button.image-button:active:checked:hover,
      .titlebar:not(headerbar).selection-mode button.flat:active:checked:focus,
      .titlebar:not(headerbar).selection-mode button.flat.nautilus-circular-button.image-button:active:checked:focus,
      .titlebar:not(headerbar).selection-mode button.flat:active:checked:hover:focus,
      .titlebar:not(headerbar).selection-mode button.flat.nautilus-circular-button.image-button:active:checked:hover:focus {
        border-color: rgba(179, 179, 179, 0.22); }
      headerbar.selection-mode button:checked:disabled, headerbar.selection-mode button:active:disabled, headerbar.selection-mode button.flat:checked:disabled, headerbar.selection-mode button.flat:active:disabled,
      .titlebar:not(headerbar).selection-mode button:checked:disabled,
      .titlebar:not(headerbar).selection-mode button:active:disabled,
      .titlebar:not(headerbar).selection-mode button.flat:checked:disabled,
      .titlebar:not(headerbar).selection-mode button.flat:active:disabled {
        border-color: rgba(217, 217, 217, 0.22); }
      headerbar.selection-mode button:active:checked:disabled, headerbar.selection-mode button.flat:active:checked:disabled,
      .titlebar:not(headerbar).selection-mode button:active:checked:disabled,
      .titlebar:not(headerbar).selection-mode button.flat:active:checked:disabled {
        border-color: rgba(204, 204, 204, 0.22); }
      headerbar.selection-mode button:checked:focus, headerbar.selection-mode button:checked:hover, headerbar.selection-mode button:active:focus, headerbar.selection-mode button:active:hover, headerbar.selection-mode button.flat:checked:focus, headerbar.selection-mode button.flat:checked:hover, headerbar.selection-mode button.flat:active:focus, headerbar.selection-mode button.flat:active:hover,
      .titlebar:not(headerbar).selection-mode button:checked:focus,
      .titlebar:not(headerbar).selection-mode button:checked:hover,
      .titlebar:not(headerbar).selection-mode button:active:focus,
      .titlebar:not(headerbar).selection-mode button:active:hover,
      .titlebar:not(headerbar).selection-mode button.flat:checked:focus,
      .titlebar:not(headerbar).selection-mode button.flat:checked:hover,
      .titlebar:not(headerbar).selection-mode button.flat:active:focus,
      .titlebar:not(headerbar).selection-mode button.flat:active:hover {
        /*@include linear-gradient(shade($bg, .65), to top);*/
        background-color: #323964;
        background-image: none;
        color: #ffffff; }
    headerbar.selection-mode button:focus, headerbar.selection-mode button:hover, headerbar.selection-mode button.flat:focus, headerbar.selection-mode button.flat:hover,
    .titlebar:not(headerbar).selection-mode button:focus,
    .titlebar:not(headerbar).selection-mode button:hover,
    .titlebar:not(headerbar).selection-mode button.flat:focus,
    .titlebar:not(headerbar).selection-mode button.flat:hover {
      color: #ffffff; }
    headerbar.selection-mode button:disabled:disabled, headerbar.selection-mode button.flat:disabled:disabled,
    .titlebar:not(headerbar).selection-mode button:disabled:disabled,
    .titlebar:not(headerbar).selection-mode button.flat:disabled:disabled {
      background-color: alpha(mix(#30365f,#ffffff,0.2),0.4);
      background-image: none;
      /*border: 1px solid alpha($bg, .2);*/
      opacity: .6;
      color: mix(#30365f,#ffffff,0.6);
      box-shadow: none; }
      headerbar.selection-mode button:disabled:disabled :disabled, headerbar.selection-mode button.flat:disabled:disabled :disabled,
      .titlebar:not(headerbar).selection-mode button:disabled:disabled :disabled,
      .titlebar:not(headerbar).selection-mode button.flat:disabled:disabled :disabled {
        color: mix(#30365f,#ffffff,0.6); }
    headerbar.selection-mode button:active:disabled, headerbar.selection-mode button:checked:disabled, headerbar.selection-mode button.flat:active:disabled, headerbar.selection-mode button.flat:checked:disabled,
    .titlebar:not(headerbar).selection-mode button:active:disabled,
    .titlebar:not(headerbar).selection-mode button:checked:disabled,
    .titlebar:not(headerbar).selection-mode button.flat:active:disabled,
    .titlebar:not(headerbar).selection-mode button.flat:checked:disabled {
      background-color: rgba(48, 54, 95, 0.6);
      background-image: none;
      color: rgba(255, 255, 255, 0.85);
      box-shadow: none; }
      headerbar.selection-mode button:active:disabled :disabled, headerbar.selection-mode button:checked:disabled :disabled, headerbar.selection-mode button.flat:active:disabled :disabled, headerbar.selection-mode button.flat:checked:disabled :disabled,
      .titlebar:not(headerbar).selection-mode button:active:disabled :disabled,
      .titlebar:not(headerbar).selection-mode button:checked:disabled :disabled,
      .titlebar:not(headerbar).selection-mode button.flat:active:disabled :disabled,
      .titlebar:not(headerbar).selection-mode button.flat:checked:disabled :disabled {
        color: rgba(255, 255, 255, 0.85); }
    headerbar.selection-mode button:backdrop, headerbar.selection-mode button.flat:backdrop,
    .titlebar:not(headerbar).selection-mode button:backdrop,
    .titlebar:not(headerbar).selection-mode button.flat:backdrop {
      color: mix(#ffffff,mix(#ffffff,#1b1c36,0.5),0.8); }
    headerbar.selection-mode button.separator, headerbar.selection-mode button .separator,
    .titlebar:not(headerbar).selection-mode button.separator,
    .titlebar:not(headerbar).selection-mode button .separator {
      border: 1px solid currentColor;
      color: rgba(48, 54, 95, 0.9); }
      headerbar.selection-mode button.separator:disabled, headerbar.selection-mode button .separator:disabled,
      .titlebar:not(headerbar).selection-mode button.separator:disabled,
      .titlebar:not(headerbar).selection-mode button .separator:disabled {
        color: rgba(48, 54, 95, 0.85); }
    headerbar.selection-mode button separator, headerbar.selection-mode button.nautilus-circular-button.image-button separator,
    .titlebar:not(headerbar).selection-mode button separator {
      background-image: image(mix(#ffffff,#30365f,0.9)); }
    headerbar.selection-mode button.image-button,
    .titlebar:not(headerbar).selection-mode button.image-button {
      padding: 4px; }
  headerbar.selection-mode viewswitcher button, headerbar.selection-mode viewswitcher button.nautilus-circular-button.image-button,
  headerbar.selection-mode .linked > button,
  .titlebar:not(headerbar).selection-mode viewswitcher button,
  .titlebar:not(headerbar).selection-mode .linked > button {
    box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22); }
    headerbar.selection-mode viewswitcher button:focus, headerbar.selection-mode viewswitcher button:hover,
    headerbar.selection-mode .linked > button:focus,
    headerbar.selection-mode .linked > button:hover,
    .titlebar:not(headerbar).selection-mode viewswitcher button:focus,
    .titlebar:not(headerbar).selection-mode viewswitcher button:hover,
    .titlebar:not(headerbar).selection-mode .linked > button:focus,
    .titlebar:not(headerbar).selection-mode .linked > button:hover {
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
    headerbar.selection-mode viewswitcher button:active, headerbar.selection-mode viewswitcher button:active:hover, headerbar.selection-mode viewswitcher button:active:focus, headerbar.selection-mode viewswitcher button:active:hover:focus, headerbar.selection-mode viewswitcher button:checked, headerbar.selection-mode viewswitcher button:checked:hover, headerbar.selection-mode viewswitcher button:checked:focus, headerbar.selection-mode viewswitcher button:checked:hover:focus,
    headerbar.selection-mode .linked > button:active,
    headerbar.selection-mode .linked > button:active:hover,
    headerbar.selection-mode .linked > button:active:focus,
    headerbar.selection-mode .linked > button:active:hover:focus,
    headerbar.selection-mode .linked > button:checked,
    headerbar.selection-mode .linked > button:checked:hover,
    headerbar.selection-mode .linked > button:checked:focus,
    headerbar.selection-mode .linked > button:checked:hover:focus,
    .titlebar:not(headerbar).selection-mode viewswitcher button:active,
    .titlebar:not(headerbar).selection-mode viewswitcher button:active:hover,
    .titlebar:not(headerbar).selection-mode viewswitcher button:active:focus,
    .titlebar:not(headerbar).selection-mode viewswitcher button:active:hover:focus,
    .titlebar:not(headerbar).selection-mode viewswitcher button:checked,
    .titlebar:not(headerbar).selection-mode viewswitcher button:checked:hover,
    .titlebar:not(headerbar).selection-mode viewswitcher button:checked:focus,
    .titlebar:not(headerbar).selection-mode viewswitcher button:checked:hover:focus,
    .titlebar:not(headerbar).selection-mode .linked > button:active,
    .titlebar:not(headerbar).selection-mode .linked > button:active:hover,
    .titlebar:not(headerbar).selection-mode .linked > button:active:focus,
    .titlebar:not(headerbar).selection-mode .linked > button:active:hover:focus,
    .titlebar:not(headerbar).selection-mode .linked > button:checked,
    .titlebar:not(headerbar).selection-mode .linked > button:checked:hover,
    .titlebar:not(headerbar).selection-mode .linked > button:checked:focus,
    .titlebar:not(headerbar).selection-mode .linked > button:checked:hover:focus {
      box-shadow: inset 0 1px rgba(51, 51, 51, 0.07), inset 0 -1px rgba(51, 51, 51, 0.05); }
    headerbar.selection-mode viewswitcher button:disabled,
    headerbar.selection-mode .linked > button:disabled,
    .titlebar:not(headerbar).selection-mode viewswitcher button:disabled,
    .titlebar:not(headerbar).selection-mode .linked > button:disabled {
      box-shadow: inset -1px 0 #262b4c; }
    headerbar.selection-mode viewswitcher button:last-child, headerbar.selection-mode viewswitcher button:only-child,
    headerbar.selection-mode .linked > button:last-child,
    headerbar.selection-mode .linked > button:only-child,
    .titlebar:not(headerbar).selection-mode viewswitcher button:last-child,
    .titlebar:not(headerbar).selection-mode viewswitcher button:only-child,
    .titlebar:not(headerbar).selection-mode .linked > button:last-child,
    .titlebar:not(headerbar).selection-mode .linked > button:only-child {
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22); }
    headerbar.selection-mode viewswitcher button:last-child:hover, headerbar.selection-mode viewswitcher button:only-child:hover,
    headerbar.selection-mode .linked > button:last-child:hover,
    headerbar.selection-mode .linked > button:only-child:hover,
    .titlebar:not(headerbar).selection-mode viewswitcher button:last-child:hover,
    .titlebar:not(headerbar).selection-mode viewswitcher button:only-child:hover,
    .titlebar:not(headerbar).selection-mode .linked > button:last-child:hover,
    .titlebar:not(headerbar).selection-mode .linked > button:only-child:hover {
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
    headerbar.selection-mode viewswitcher button:disabled:last-child, headerbar.selection-mode viewswitcher button:disabled:only-child, headerbar.selection-mode viewswitcher button:active:disabled:last-child, headerbar.selection-mode viewswitcher button:active:disabled:only-child, headerbar.selection-mode viewswitcher button:checked:disabled:last-child, headerbar.selection-mode viewswitcher button:checked:disabled:only-child,
    headerbar.selection-mode .linked > button:disabled:last-child,
    headerbar.selection-mode .linked > button:disabled:only-child,
    headerbar.selection-mode .linked > button:active:disabled:last-child,
    headerbar.selection-mode .linked > button:active:disabled:only-child,
    headerbar.selection-mode .linked > button:checked:disabled:last-child,
    headerbar.selection-mode .linked > button:checked:disabled:only-child,
    .titlebar:not(headerbar).selection-mode viewswitcher button:disabled:last-child,
    .titlebar:not(headerbar).selection-mode viewswitcher button:disabled:only-child,
    .titlebar:not(headerbar).selection-mode viewswitcher button:active:disabled:last-child,
    .titlebar:not(headerbar).selection-mode viewswitcher button:active:disabled:only-child,
    .titlebar:not(headerbar).selection-mode viewswitcher button:checked:disabled:last-child,
    .titlebar:not(headerbar).selection-mode viewswitcher button:checked:disabled:only-child,
    .titlebar:not(headerbar).selection-mode .linked > button:disabled:last-child,
    .titlebar:not(headerbar).selection-mode .linked > button:disabled:only-child,
    .titlebar:not(headerbar).selection-mode .linked > button:active:disabled:last-child,
    .titlebar:not(headerbar).selection-mode .linked > button:active:disabled:only-child,
    .titlebar:not(headerbar).selection-mode .linked > button:checked:disabled:last-child,
    .titlebar:not(headerbar).selection-mode .linked > button:checked:disabled:only-child {
      box-shadow: none; }
    headerbar.selection-mode viewswitcher button:active:last-child, headerbar.selection-mode viewswitcher button:active:last-child:focus, headerbar.selection-mode viewswitcher button:active:last-child:hover, headerbar.selection-mode viewswitcher button:active:last-child:hover:focus, headerbar.selection-mode viewswitcher button:checked:last-child, headerbar.selection-mode viewswitcher button:checked:last-child:focus, headerbar.selection-mode viewswitcher button:checked:last-child:hover, headerbar.selection-mode viewswitcher button:checked:last-child:hover:focus,
    headerbar.selection-mode .linked > button:active:last-child,
    headerbar.selection-mode .linked > button:active:last-child:focus,
    headerbar.selection-mode .linked > button:active:last-child:hover,
    headerbar.selection-mode .linked > button:active:last-child:hover:focus,
    headerbar.selection-mode .linked > button:checked:last-child,
    headerbar.selection-mode .linked > button:checked:last-child:focus,
    headerbar.selection-mode .linked > button:checked:last-child:hover,
    headerbar.selection-mode .linked > button:checked:last-child:hover:focus,
    .titlebar:not(headerbar).selection-mode viewswitcher button:active:last-child,
    .titlebar:not(headerbar).selection-mode viewswitcher button:active:last-child:focus,
    .titlebar:not(headerbar).selection-mode viewswitcher button:active:last-child:hover,
    .titlebar:not(headerbar).selection-mode viewswitcher button:active:last-child:hover:focus,
    .titlebar:not(headerbar).selection-mode viewswitcher button:checked:last-child,
    .titlebar:not(headerbar).selection-mode viewswitcher button:checked:last-child:focus,
    .titlebar:not(headerbar).selection-mode viewswitcher button:checked:last-child:hover,
    .titlebar:not(headerbar).selection-mode viewswitcher button:checked:last-child:hover:focus,
    .titlebar:not(headerbar).selection-mode .linked > button:active:last-child,
    .titlebar:not(headerbar).selection-mode .linked > button:active:last-child:focus,
    .titlebar:not(headerbar).selection-mode .linked > button:active:last-child:hover,
    .titlebar:not(headerbar).selection-mode .linked > button:active:last-child:hover:focus,
    .titlebar:not(headerbar).selection-mode .linked > button:checked:last-child,
    .titlebar:not(headerbar).selection-mode .linked > button:checked:last-child:focus,
    .titlebar:not(headerbar).selection-mode .linked > button:checked:last-child:hover,
    .titlebar:not(headerbar).selection-mode .linked > button:checked:last-child:hover:focus {
      box-shadow: inset 0 1px rgba(51, 51, 51, 0.07), inset -1px 0 rgba(51, 51, 51, 0.06); }
    headerbar.selection-mode viewswitcher button:active:only-child, headerbar.selection-mode viewswitcher button:active:only-child:focus, headerbar.selection-mode viewswitcher button:active:only-child:hover, headerbar.selection-mode viewswitcher button:active:only-child:hover:focus, headerbar.selection-mode viewswitcher button:checked:only-child, headerbar.selection-mode viewswitcher button:checked:only-child:focus, headerbar.selection-mode viewswitcher button:checked:only-child:hover, headerbar.selection-mode viewswitcher button:checked:only-child:hover:focus,
    headerbar.selection-mode .linked > button:active:only-child,
    headerbar.selection-mode .linked > button:active:only-child:focus,
    headerbar.selection-mode .linked > button:active:only-child:hover,
    headerbar.selection-mode .linked > button:active:only-child:hover:focus,
    headerbar.selection-mode .linked > button:checked:only-child,
    headerbar.selection-mode .linked > button:checked:only-child:focus,
    headerbar.selection-mode .linked > button:checked:only-child:hover,
    headerbar.selection-mode .linked > button:checked:only-child:hover:focus,
    .titlebar:not(headerbar).selection-mode viewswitcher button:active:only-child,
    .titlebar:not(headerbar).selection-mode viewswitcher button:active:only-child:focus,
    .titlebar:not(headerbar).selection-mode viewswitcher button:active:only-child:hover,
    .titlebar:not(headerbar).selection-mode viewswitcher button:active:only-child:hover:focus,
    .titlebar:not(headerbar).selection-mode viewswitcher button:checked:only-child,
    .titlebar:not(headerbar).selection-mode viewswitcher button:checked:only-child:focus,
    .titlebar:not(headerbar).selection-mode viewswitcher button:checked:only-child:hover,
    .titlebar:not(headerbar).selection-mode viewswitcher button:checked:only-child:hover:focus,
    .titlebar:not(headerbar).selection-mode .linked > button:active:only-child,
    .titlebar:not(headerbar).selection-mode .linked > button:active:only-child:focus,
    .titlebar:not(headerbar).selection-mode .linked > button:active:only-child:hover,
    .titlebar:not(headerbar).selection-mode .linked > button:active:only-child:hover:focus,
    .titlebar:not(headerbar).selection-mode .linked > button:checked:only-child,
    .titlebar:not(headerbar).selection-mode .linked > button:checked:only-child:focus,
    .titlebar:not(headerbar).selection-mode .linked > button:checked:only-child:hover,
    .titlebar:not(headerbar).selection-mode .linked > button:checked:only-child:hover:focus {
      box-shadow: inset 1px 0 rgba(51, 51, 51, 0.06), inset 0 1px rgba(51, 51, 51, 0.07), inset -1px 0 rgba(51, 51, 51, 0.06); }
  headerbar.selection-mode box button.image-button,
  .titlebar:not(headerbar).selection-mode box button.image-button {
    padding: 4px 8px; }
  headerbar.selection-mode separator, headerbar.selection-mode separator:disabled,
  .titlebar:not(headerbar).selection-mode separator,
  .titlebar:not(headerbar).selection-mode separator:disabled {
    color: #1d2039;
    border-color: currentColor;
    -GtkWidget-window-dragging: true; }
  headerbar.selection-mode button, headerbar.selection-mode button.nautilus-circular-button.image-button,
  .titlebar:not(headerbar).selection-mode button {
    background-color: #30365f;
    background-image: none;
    border-color: rgba(204, 204, 204, 0.22);
    color: #ffffff;
    box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22); }
    headerbar.selection-mode button:focus, headerbar.selection-mode button:hover,
    .titlebar:not(headerbar).selection-mode button:focus,
    .titlebar:not(headerbar).selection-mode button:hover {
      border-color: mix(#30365f,rgba(255, 255, 255, 0.22),0.3); }
    headerbar.selection-mode button:active, headerbar.selection-mode button:active:hover, headerbar.selection-mode button:active:focus, headerbar.selection-mode button:active:hover:focus, headerbar.selection-mode button:checked, headerbar.selection-mode button:checked:hover, headerbar.selection-mode button:checked:focus, headerbar.selection-mode button:checked:hover:focus,
    .titlebar:not(headerbar).selection-mode button:active,
    .titlebar:not(headerbar).selection-mode button:active:hover,
    .titlebar:not(headerbar).selection-mode button:active:focus,
    .titlebar:not(headerbar).selection-mode button:active:hover:focus,
    .titlebar:not(headerbar).selection-mode button:checked,
    .titlebar:not(headerbar).selection-mode button:checked:hover,
    .titlebar:not(headerbar).selection-mode button:checked:focus,
    .titlebar:not(headerbar).selection-mode button:checked:hover:focus {
      border-color: rgba(179, 179, 179, 0.22); }
    headerbar.selection-mode button:disabled,
    .titlebar:not(headerbar).selection-mode button:disabled {
      border-color: rgba(217, 217, 217, 0.22); }
    headerbar.selection-mode button:active:disabled, headerbar.selection-mode button:checked:disabled,
    .titlebar:not(headerbar).selection-mode button:active:disabled,
    .titlebar:not(headerbar).selection-mode button:checked:disabled {
      border-color: rgba(204, 204, 204, 0.22); }
    .linked:not(.vertical) > headerbar.selection-mode button:not(:last-child):not(:only-child), .linked:not(.vertical) > :not(:last-child):not(:only-child) headerbar.selection-mode button, viewswitcher:not(.vertical) > headerbar.selection-mode button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > headerbar.selection-mode button:not(:last-child):not(:only-child), .linked:not(.vertical) > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child), .linked:not(.vertical) > :not(:last-child):not(:only-child) .titlebar:not(headerbar).selection-mode button, viewswitcher:not(.vertical) > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child) {
      border-right-style: none; }
      .linked:not(.vertical) > headerbar.selection-mode button:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) headerbar.selection-mode button:hover, viewswitcher:not(.vertical) > headerbar.selection-mode button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > headerbar.selection-mode button:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) .titlebar:not(headerbar).selection-mode button:hover, viewswitcher:not(.vertical) > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child):hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.36),0.3);
        border-right-style: none;
        box-shadow: inset-1px 0 0 mix(#30365f,rgba(255, 255, 255, 0.36),0.3); }
    .linked:not(.vertical) > headerbar.selection-mode button:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > :not(:last-child):not(:only-child) headerbar.selection-mode button:checked, viewswitcher:not(.vertical) > headerbar.selection-mode button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > headerbar.selection-mode button:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > :not(:last-child):not(:only-child) .titlebar:not(headerbar).selection-mode button:checked, viewswitcher:not(.vertical) > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child):checked {
      border-right-style: none; }
      .linked:not(.vertical) > headerbar.selection-mode button:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) headerbar.selection-mode button:checked:hover, viewswitcher:not(.vertical) > headerbar.selection-mode button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > headerbar.selection-mode button:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) .titlebar:not(headerbar).selection-mode button:checked:hover, viewswitcher:not(.vertical) > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child):checked:hover {
        border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
        border-right-style: none;
        box-shadow: inset-1px 0 0 mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
    .linked.vertical > headerbar.selection-mode button:not(:last-child):not(:only-child), .linked.vertical > :not(:last-child):not(:only-child) headerbar.selection-mode button, stackswitcher.vertical > headerbar.selection-mode button:not(:last-child):not(:only-child), .linked.vertical > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child), .linked.vertical > :not(:last-child):not(:only-child) .titlebar:not(headerbar).selection-mode button, stackswitcher.vertical > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child) {
      border-bottom-style: none; }
      .linked.vertical > headerbar.selection-mode button:not(:last-child):not(:only-child):hover, .linked.vertical > :not(:last-child):not(:only-child) headerbar.selection-mode button:hover, stackswitcher.vertical > headerbar.selection-mode button:not(:last-child):not(:only-child):hover, .linked.vertical > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child):hover, .linked.vertical > :not(:last-child):not(:only-child) .titlebar:not(headerbar).selection-mode button:hover, stackswitcher.vertical > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child):hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.36),0.3);
        border-bottom-style: none;
        box-shadow: inset 0 -1px mix(#30365f,rgba(255, 255, 255, 0.36),0.3); }
    .linked.vertical > headerbar.selection-mode button:not(:last-child):not(:only-child):checked, .linked.vertical > :not(:last-child):not(:only-child) headerbar.selection-mode button:checked, stackswitcher.vertical > headerbar.selection-mode button:not(:last-child):not(:only-child):checked, .linked.vertical > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child):checked, .linked.vertical > :not(:last-child):not(:only-child) .titlebar:not(headerbar).selection-mode button:checked, stackswitcher.vertical > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child):checked {
      border-bottom-style: none; }
      .linked.vertical > headerbar.selection-mode button:not(:last-child):not(:only-child):checked:hover, .linked.vertical > :not(:last-child):not(:only-child) headerbar.selection-mode button:checked:hover, stackswitcher.vertical > headerbar.selection-mode button:not(:last-child):not(:only-child):checked:hover, .linked.vertical > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child):checked:hover, .linked.vertical > :not(:last-child):not(:only-child) .titlebar:not(headerbar).selection-mode button:checked:hover, stackswitcher.vertical > .titlebar:not(headerbar).selection-mode button:not(:last-child):not(:only-child):checked:hover {
        border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
        border-bottom-style: none;
        box-shadow: inset 0 -1px mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
    headerbar.selection-mode button.flat,
    .titlebar:not(headerbar).selection-mode button.flat {
      color: #ffffff;
      border-color: rgba(48, 54, 95, 0);
      background-color: rgba(48, 54, 95, 0);
      background-image: none;
      box-shadow: none; }
    headerbar.selection-mode button:hover, headerbar.selection-mode button.flat:hover,
    .titlebar:not(headerbar).selection-mode button:hover,
    .titlebar:not(headerbar).selection-mode button.flat:hover {
      background-color: #323964;
      background-image: none;
      border-color: rgba(204, 204, 204, 0.3);
      color: #ffffff;
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.32); }
      headerbar.selection-mode button:hover:focus, headerbar.selection-mode button:hover:hover, headerbar.selection-mode button.flat:hover:focus, headerbar.selection-mode button.flat:hover:hover,
      .titlebar:not(headerbar).selection-mode button:hover:focus,
      .titlebar:not(headerbar).selection-mode button:hover:hover,
      .titlebar:not(headerbar).selection-mode button.flat:hover:focus,
      .titlebar:not(headerbar).selection-mode button.flat:hover:hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.3),0.3); }
      headerbar.selection-mode button:hover:active, headerbar.selection-mode button:hover:active:focus, headerbar.selection-mode button.flat:hover:active:focus, headerbar.selection-mode button:hover:checked, headerbar.selection-mode button:hover:checked:focus, headerbar.selection-mode button.flat:hover:checked:focus, headerbar.selection-mode button.flat:hover:active, headerbar.selection-mode button.flat:hover:active:hover:focus, headerbar.selection-mode button.flat:hover:checked, headerbar.selection-mode button.flat:hover:checked:hover:focus,
      .titlebar:not(headerbar).selection-mode button:hover:active,
      .titlebar:not(headerbar).selection-mode button:hover:active:focus,
      .titlebar:not(headerbar).selection-mode button.flat:hover:active:focus,
      .titlebar:not(headerbar).selection-mode button:hover:checked,
      .titlebar:not(headerbar).selection-mode button:hover:checked:focus,
      .titlebar:not(headerbar).selection-mode button.flat:hover:checked:focus,
      .titlebar:not(headerbar).selection-mode button.flat:hover:active,
      .titlebar:not(headerbar).selection-mode button.flat:hover:active:hover:focus,
      .titlebar:not(headerbar).selection-mode button.flat:hover:checked,
      .titlebar:not(headerbar).selection-mode button.flat:hover:checked:hover:focus {
        border-color: rgba(179, 179, 179, 0.3); }
      headerbar.selection-mode button:hover:disabled, headerbar.selection-mode button.flat:hover:disabled,
      .titlebar:not(headerbar).selection-mode button:hover:disabled,
      .titlebar:not(headerbar).selection-mode button.flat:hover:disabled {
        border-color: rgba(217, 217, 217, 0.3); }
      headerbar.selection-mode button:hover:active:disabled, headerbar.selection-mode button:hover:checked:disabled, headerbar.selection-mode button.flat:hover:active:disabled, headerbar.selection-mode button.flat:hover:checked:disabled,
      .titlebar:not(headerbar).selection-mode button:hover:active:disabled,
      .titlebar:not(headerbar).selection-mode button:hover:checked:disabled,
      .titlebar:not(headerbar).selection-mode button.flat:hover:active:disabled,
      .titlebar:not(headerbar).selection-mode button.flat:hover:checked:disabled {
        border-color: rgba(204, 204, 204, 0.3); }
    headerbar.selection-mode button:focus, headerbar.selection-mode button.flat:focus,
    .titlebar:not(headerbar).selection-mode button:focus,
    .titlebar:not(headerbar).selection-mode button.flat:focus {
      background-color: #323964;
      background-image: none;
      border-color: rgba(255, 255, 255, 0.22);
      outline-color: rgba(48, 54, 95, 0.5);
      outline-width: 3px;
      outline-style: solid;
      outline-offset: 10px;
      color: #ffffff;
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
      headerbar.selection-mode button:focus:hover, headerbar.selection-mode button.flat:focus:hover,
      .titlebar:not(headerbar).selection-mode button:focus:hover,
      .titlebar:not(headerbar).selection-mode button.flat:focus:hover {
        background-color: #353b69;
        background-image: none;
        border-color: rgba(204, 204, 204, 0.3);
        box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.48); }
        headerbar.selection-mode button:focus:hover:hover, headerbar.selection-mode button.flat:focus:hover:hover,
        .titlebar:not(headerbar).selection-mode button:focus:hover:hover,
        .titlebar:not(headerbar).selection-mode button.flat:focus:hover:hover {
          border-color: mix(#30365f,rgba(255, 255, 255, 0.3),0.3); }
        headerbar.selection-mode button:focus:hover:active, headerbar.selection-mode button.flat:focus:hover:active, headerbar.selection-mode button.flat:focus:hover:active:focus, headerbar.selection-mode button:focus:hover:checked, headerbar.selection-mode button.flat:focus:hover:checked, headerbar.selection-mode button.flat:focus:hover:checked:focus, headerbar.selection-mode button.flat:focus:hover:active:hover:focus, headerbar.selection-mode button.flat:focus:hover:checked:hover:focus,
        .titlebar:not(headerbar).selection-mode button:focus:hover:active,
        .titlebar:not(headerbar).selection-mode button.flat:focus:hover:active,
        .titlebar:not(headerbar).selection-mode button.flat:focus:hover:active:focus,
        .titlebar:not(headerbar).selection-mode button:focus:hover:checked,
        .titlebar:not(headerbar).selection-mode button.flat:focus:hover:checked,
        .titlebar:not(headerbar).selection-mode button.flat:focus:hover:checked:focus,
        .titlebar:not(headerbar).selection-mode button.flat:focus:hover:active:hover:focus,
        .titlebar:not(headerbar).selection-mode button.flat:focus:hover:checked:hover:focus {
          border-color: rgba(179, 179, 179, 0.3); }
        headerbar.selection-mode button:focus:hover:disabled, headerbar.selection-mode button.flat:focus:hover:disabled,
        .titlebar:not(headerbar).selection-mode button:focus:hover:disabled,
        .titlebar:not(headerbar).selection-mode button.flat:focus:hover:disabled {
          border-color: rgba(217, 217, 217, 0.3); }
        headerbar.selection-mode button:focus:hover:active:disabled, headerbar.selection-mode button:focus:hover:checked:disabled, headerbar.selection-mode button.flat:focus:hover:active:disabled, headerbar.selection-mode button.flat:focus:hover:checked:disabled,
        .titlebar:not(headerbar).selection-mode button:focus:hover:active:disabled,
        .titlebar:not(headerbar).selection-mode button:focus:hover:checked:disabled,
        .titlebar:not(headerbar).selection-mode button.flat:focus:hover:active:disabled,
        .titlebar:not(headerbar).selection-mode button.flat:focus:hover:checked:disabled {
          border-color: rgba(204, 204, 204, 0.3); }
    headerbar.selection-mode button:checked, headerbar.selection-mode button:active, headerbar.selection-mode button.flat:checked, headerbar.selection-mode button.flat:active,
    .titlebar:not(headerbar).selection-mode button:checked,
    .titlebar:not(headerbar).selection-mode button:active,
    .titlebar:not(headerbar).selection-mode button.flat:checked,
    .titlebar:not(headerbar).selection-mode button.flat:active {
      /*@include linear-gradient(shade($bg, .7), to top);*/
      background-color: #30365f;
      background-image: none;
      border-color: rgba(204, 204, 204, 0.22);
      color: #ffffff;
      box-shadow: inset 1px 0 rgba(255, 255, 255, 0.06), inset 0 1px rgba(255, 255, 255, 0.07), inset -1px 0 rgba(255, 255, 255, 0.06), inset 0 -1px rgba(255, 255, 255, 0.05); }
      headerbar.selection-mode button:checked:focus, headerbar.selection-mode button:checked:hover, headerbar.selection-mode button:active:focus, headerbar.selection-mode button:active:hover, headerbar.selection-mode button.flat:checked:focus, headerbar.selection-mode button.flat:checked:hover, headerbar.selection-mode button.flat:active:focus, headerbar.selection-mode button.flat:active:hover,
      .titlebar:not(headerbar).selection-mode button:checked:focus,
      .titlebar:not(headerbar).selection-mode button:checked:hover,
      .titlebar:not(headerbar).selection-mode button:active:focus,
      .titlebar:not(headerbar).selection-mode button:active:hover,
      .titlebar:not(headerbar).selection-mode button.flat:checked:focus,
      .titlebar:not(headerbar).selection-mode button.flat:checked:hover,
      .titlebar:not(headerbar).selection-mode button.flat:active:focus,
      .titlebar:not(headerbar).selection-mode button.flat:active:hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.22),0.3); }
      headerbar.selection-mode button:checked:active, headerbar.selection-mode button.nautilus-circular-button.image-button:checked:active, headerbar.selection-mode button:checked:active:hover, headerbar.selection-mode button.nautilus-circular-button.image-button:checked:active:hover, headerbar.selection-mode button:checked:active:focus, headerbar.selection-mode button.nautilus-circular-button.image-button:checked:active:focus, headerbar.selection-mode button:checked:active:hover:focus, headerbar.selection-mode button.nautilus-circular-button.image-button:checked:active:hover:focus, headerbar.selection-mode button:checked:checked, headerbar.selection-mode button.nautilus-circular-button.image-button:checked:checked, headerbar.selection-mode button:checked:checked:hover, headerbar.selection-mode button.nautilus-circular-button.image-button:checked:checked:hover, headerbar.selection-mode button:checked:checked:focus, headerbar.selection-mode button.nautilus-circular-button.image-button:checked:checked:focus, headerbar.selection-mode button:checked:checked:hover:focus, headerbar.selection-mode button.nautilus-circular-button.image-button:checked:checked:hover:focus, headerbar.selection-mode button:active:active, headerbar.selection-mode button.nautilus-circular-button.image-button:active:active, headerbar.selection-mode button:active:active:hover, headerbar.selection-mode button.nautilus-circular-button.image-button:active:active:hover, headerbar.selection-mode button:active:active:focus, headerbar.selection-mode button.nautilus-circular-button.image-button:active:active:focus, headerbar.selection-mode button:active:active:hover:focus, headerbar.selection-mode button.nautilus-circular-button.image-button:active:active:hover:focus, headerbar.selection-mode button:active:checked, headerbar.selection-mode button.nautilus-circular-button.image-button:active:checked, headerbar.selection-mode button:active:checked:hover, headerbar.selection-mode button.nautilus-circular-button.image-button:active:checked:hover, headerbar.selection-mode button:active:checked:focus, headerbar.selection-mode button.nautilus-circular-button.image-button:active:checked:focus, headerbar.selection-mode button:active:checked:hover:focus, headerbar.selection-mode button.nautilus-circular-button.image-button:active:checked:hover:focus, headerbar.selection-mode button.flat:checked:active, headerbar.selection-mode button.flat.nautilus-circular-button.image-button:checked:active, headerbar.selection-mode button.flat:checked:active:hover, headerbar.selection-mode button.flat.nautilus-circular-button.image-button:checked:active:hover, headerbar.selection-mode button.flat:checked:active:focus, headerbar.selection-mode button.flat.nautilus-circular-button.image-button:checked:active:focus, headerbar.selection-mode button.flat:checked:active:hover:focus, headerbar.selection-mode button.flat.nautilus-circular-button.image-button:checked:active:hover:focus, headerbar.selection-mode button.flat:checked:checked, headerbar.selection-mode button.flat.nautilus-circular-button.image-button:checked:checked, headerbar.selection-mode button.flat:checked:checked:hover, headerbar.selection-mode button.flat.nautilus-circular-button.image-button:checked:checked:hover, headerbar.selection-mode button.flat:checked:checked:focus, headerbar.selection-mode button.flat.nautilus-circular-button.image-button:checked:checked:focus, headerbar.selection-mode button.flat:checked:checked:hover:focus, headerbar.selection-mode button.flat.nautilus-circular-button.image-button:checked:checked:hover:focus, headerbar.selection-mode button.flat:active:active, headerbar.selection-mode button.flat.nautilus-circular-button.image-button:active:active, headerbar.selection-mode button.flat:active:active:hover, headerbar.selection-mode button.flat.nautilus-circular-button.image-button:active:active:hover, headerbar.selection-mode button.flat:active:active:focus, headerbar.selection-mode button.flat.nautilus-circular-button.image-button:active:active:focus, headerbar.selection-mode button.flat:active:active:hover:focus, headerbar.selection-mode button.flat.nautilus-circular-button.image-button:active:active:hover:focus, headerbar.selection-mode button.flat:active:checked, headerbar.selection-mode button.flat.nautilus-circular-button.image-button:active:checked, headerbar.selection-mode button.flat:active:checked:hover, headerbar.selection-mode button.flat.nautilus-circular-button.image-button:active:checked:hover, headerbar.selection-mode button.flat:active:checked:focus, headerbar.selection-mode button.flat.nautilus-circular-button.image-button:active:checked:focus, headerbar.selection-mode button.flat:active:checked:hover:focus, headerbar.selection-mode button.flat.nautilus-circular-button.image-button:active:checked:hover:focus,
      .titlebar:not(headerbar).selection-mode button:checked:active,
      .titlebar:not(headerbar).selection-mode button.nautilus-circular-button.image-button:checked:active,
      .titlebar:not(headerbar).selection-mode button:checked:active:hover,
      .titlebar:not(headerbar).selection-mode button.nautilus-circular-button.image-button:checked:active:hover,
      .titlebar:not(headerbar).selection-mode button:checked:active:focus,
      .titlebar:not(headerbar).selection-mode button.nautilus-circular-button.image-button:checked:active:focus,
      .titlebar:not(headerbar).selection-mode button:checked:active:hover:focus,
      .titlebar:not(headerbar).selection-mode button.nautilus-circular-button.image-button:checked:active:hover:focus,
      .titlebar:not(headerbar).selection-mode button:checked:checked,
      .titlebar:not(headerbar).selection-mode button.nautilus-circular-button.image-button:checked:checked,
      .titlebar:not(headerbar).selection-mode button:checked:checked:hover,
      .titlebar:not(headerbar).selection-mode button.nautilus-circular-button.image-button:checked:checked:hover,
      .titlebar:not(headerbar).selection-mode button:checked:checked:focus,
      .titlebar:not(headerbar).selection-mode button.nautilus-circular-button.image-button:checked:checked:focus,
      .titlebar:not(headerbar).selection-mode button:checked:checked:hover:focus,
      .titlebar:not(headerbar).selection-mode button.nautilus-circular-button.image-button:checked:checked:hover:focus,
      .titlebar:not(headerbar).selection-mode button:active:active,
      .titlebar:not(headerbar).selection-mode button.nautilus-circular-button.image-button:active:active,
      .titlebar:not(headerbar).selection-mode button:active:active:hover,
      .titlebar:not(headerbar).selection-mode button.nautilus-circular-button.image-button:active:active:hover,
      .titlebar:not(headerbar).selection-mode button:active:active:focus,
      .titlebar:not(headerbar).selection-mode button.nautilus-circular-button.image-button:active:active:focus,
      .titlebar:not(headerbar).selection-mode button:active:active:hover:focus,
      .titlebar:not(headerbar).selection-mode button.nautilus-circular-button.image-button:active:active:hover:focus,
      .titlebar:not(headerbar).selection-mode button:active:checked,
      .titlebar:not(headerbar).selection-mode button.nautilus-circular-button.image-button:active:checked,
      .titlebar:not(headerbar).selection-mode button:active:checked:hover,
      .titlebar:not(headerbar).selection-mode button.nautilus-circular-button.image-button:active:checked:hover,
      .titlebar:not(headerbar).selection-mode button:active:checked:focus,
      .titlebar:not(headerbar).selection-mode button.nautilus-circular-button.image-button:active:checked:focus,
      .titlebar:not(headerbar).selection-mode button:active:checked:hover:focus,
      .titlebar:not(headerbar).selection-mode button.nautilus-circular-button.image-button:active:checked:hover:focus,
      .titlebar:not(headerbar).selection-mode button.flat:checked:active,
      .titlebar:not(headerbar).selection-mode button.flat.nautilus-circular-button.image-button:checked:active,
      .titlebar:not(headerbar).selection-mode button.flat:checked:active:hover,
      .titlebar:not(headerbar).selection-mode button.flat.nautilus-circular-button.image-button:checked:active:hover,
      .titlebar:not(headerbar).selection-mode button.flat:checked:active:focus,
      .titlebar:not(headerbar).selection-mode button.flat.nautilus-circular-button.image-button:checked:active:focus,
      .titlebar:not(headerbar).selection-mode button.flat:checked:active:hover:focus,
      .titlebar:not(headerbar).selection-mode button.flat.nautilus-circular-button.image-button:checked:active:hover:focus,
      .titlebar:not(headerbar).selection-mode button.flat:checked:checked,
      .titlebar:not(headerbar).selection-mode button.flat.nautilus-circular-button.image-button:checked:checked,
      .titlebar:not(headerbar).selection-mode button.flat:checked:checked:hover,
      .titlebar:not(headerbar).selection-mode button.flat.nautilus-circular-button.image-button:checked:checked:hover,
      .titlebar:not(headerbar).selection-mode button.flat:checked:checked:focus,
      .titlebar:not(headerbar).selection-mode button.flat.nautilus-circular-button.image-button:checked:checked:focus,
      .titlebar:not(headerbar).selection-mode button.flat:checked:checked:hover:focus,
      .titlebar:not(headerbar).selection-mode button.flat.nautilus-circular-button.image-button:checked:checked:hover:focus,
      .titlebar:not(headerbar).selection-mode button.flat:active:active,
      .titlebar:not(headerbar).selection-mode button.flat.nautilus-circular-button.image-button:active:active,
      .titlebar:not(headerbar).selection-mode button.flat:active:active:hover,
      .titlebar:not(headerbar).selection-mode button.flat.nautilus-circular-button.image-button:active:active:hover,
      .titlebar:not(headerbar).selection-mode button.flat:active:active:focus,
      .titlebar:not(headerbar).selection-mode button.flat.nautilus-circular-button.image-button:active:active:focus,
      .titlebar:not(headerbar).selection-mode button.flat:active:active:hover:focus,
      .titlebar:not(headerbar).selection-mode button.flat.nautilus-circular-button.image-button:active:active:hover:focus,
      .titlebar:not(headerbar).selection-mode button.flat:active:checked,
      .titlebar:not(headerbar).selection-mode button.flat.nautilus-circular-button.image-button:active:checked,
      .titlebar:not(headerbar).selection-mode button.flat:active:checked:hover,
      .titlebar:not(headerbar).selection-mode button.flat.nautilus-circular-button.image-button:active:checked:hover,
      .titlebar:not(headerbar).selection-mode button.flat:active:checked:focus,
      .titlebar:not(headerbar).selection-mode button.flat.nautilus-circular-button.image-button:active:checked:focus,
      .titlebar:not(headerbar).selection-mode button.flat:active:checked:hover:focus,
      .titlebar:not(headerbar).selection-mode button.flat.nautilus-circular-button.image-button:active:checked:hover:focus {
        border-color: rgba(179, 179, 179, 0.22); }
      headerbar.selection-mode button:checked:disabled, headerbar.selection-mode button:active:disabled, headerbar.selection-mode button.flat:checked:disabled, headerbar.selection-mode button.flat:active:disabled,
      .titlebar:not(headerbar).selection-mode button:checked:disabled,
      .titlebar:not(headerbar).selection-mode button:active:disabled,
      .titlebar:not(headerbar).selection-mode button.flat:checked:disabled,
      .titlebar:not(headerbar).selection-mode button.flat:active:disabled {
        border-color: rgba(217, 217, 217, 0.22); }
      headerbar.selection-mode button:active:checked:disabled, headerbar.selection-mode button.flat:active:checked:disabled,
      .titlebar:not(headerbar).selection-mode button:active:checked:disabled,
      .titlebar:not(headerbar).selection-mode button.flat:active:checked:disabled {
        border-color: rgba(204, 204, 204, 0.22); }
      headerbar.selection-mode button:checked:focus, headerbar.selection-mode button:checked:hover, headerbar.selection-mode button:active:focus, headerbar.selection-mode button:active:hover, headerbar.selection-mode button.flat:checked:focus, headerbar.selection-mode button.flat:checked:hover, headerbar.selection-mode button.flat:active:focus, headerbar.selection-mode button.flat:active:hover,
      .titlebar:not(headerbar).selection-mode button:checked:focus,
      .titlebar:not(headerbar).selection-mode button:checked:hover,
      .titlebar:not(headerbar).selection-mode button:active:focus,
      .titlebar:not(headerbar).selection-mode button:active:hover,
      .titlebar:not(headerbar).selection-mode button.flat:checked:focus,
      .titlebar:not(headerbar).selection-mode button.flat:checked:hover,
      .titlebar:not(headerbar).selection-mode button.flat:active:focus,
      .titlebar:not(headerbar).selection-mode button.flat:active:hover {
        /*@include linear-gradient(shade($bg, .65), to top);*/
        background-color: #323964;
        background-image: none;
        color: #ffffff; }
    headerbar.selection-mode button:focus, headerbar.selection-mode button:hover, headerbar.selection-mode button.flat:focus, headerbar.selection-mode button.flat:hover,
    .titlebar:not(headerbar).selection-mode button:focus,
    .titlebar:not(headerbar).selection-mode button:hover,
    .titlebar:not(headerbar).selection-mode button.flat:focus,
    .titlebar:not(headerbar).selection-mode button.flat:hover {
      color: #ffffff; }
    headerbar.selection-mode button:disabled:disabled, headerbar.selection-mode button.flat:disabled:disabled,
    .titlebar:not(headerbar).selection-mode button:disabled:disabled,
    .titlebar:not(headerbar).selection-mode button.flat:disabled:disabled {
      background-color: alpha(mix(#30365f,#ffffff,0.2),0.4);
      background-image: none;
      /*border: 1px solid alpha($bg, .2);*/
      opacity: .6;
      color: mix(#30365f,#ffffff,0.6);
      box-shadow: none; }
      headerbar.selection-mode button:disabled:disabled :disabled, headerbar.selection-mode button.flat:disabled:disabled :disabled,
      .titlebar:not(headerbar).selection-mode button:disabled:disabled :disabled,
      .titlebar:not(headerbar).selection-mode button.flat:disabled:disabled :disabled {
        color: mix(#30365f,#ffffff,0.6); }
    headerbar.selection-mode button:active:disabled, headerbar.selection-mode button:checked:disabled, headerbar.selection-mode button.flat:active:disabled, headerbar.selection-mode button.flat:checked:disabled,
    .titlebar:not(headerbar).selection-mode button:active:disabled,
    .titlebar:not(headerbar).selection-mode button:checked:disabled,
    .titlebar:not(headerbar).selection-mode button.flat:active:disabled,
    .titlebar:not(headerbar).selection-mode button.flat:checked:disabled {
      background-color: rgba(48, 54, 95, 0.6);
      background-image: none;
      color: rgba(255, 255, 255, 0.85);
      box-shadow: none; }
      headerbar.selection-mode button:active:disabled :disabled, headerbar.selection-mode button:checked:disabled :disabled, headerbar.selection-mode button.flat:active:disabled :disabled, headerbar.selection-mode button.flat:checked:disabled :disabled,
      .titlebar:not(headerbar).selection-mode button:active:disabled :disabled,
      .titlebar:not(headerbar).selection-mode button:checked:disabled :disabled,
      .titlebar:not(headerbar).selection-mode button.flat:active:disabled :disabled,
      .titlebar:not(headerbar).selection-mode button.flat:checked:disabled :disabled {
        color: rgba(255, 255, 255, 0.85); }
    headerbar.selection-mode button:backdrop, headerbar.selection-mode button.flat:backdrop,
    .titlebar:not(headerbar).selection-mode button:backdrop,
    .titlebar:not(headerbar).selection-mode button.flat:backdrop {
      color: mix(#ffffff,mix(#ffffff,#1b1c36,0.5),0.8); }
    headerbar.selection-mode button.separator, headerbar.selection-mode button .separator,
    .titlebar:not(headerbar).selection-mode button.separator,
    .titlebar:not(headerbar).selection-mode button .separator {
      border: 1px solid currentColor;
      color: rgba(48, 54, 95, 0.9); }
      headerbar.selection-mode button.separator:disabled, headerbar.selection-mode button .separator:disabled,
      .titlebar:not(headerbar).selection-mode button.separator:disabled,
      .titlebar:not(headerbar).selection-mode button .separator:disabled {
        color: rgba(48, 54, 95, 0.85); }
    headerbar.selection-mode button separator, headerbar.selection-mode button.nautilus-circular-button.image-button separator,
    .titlebar:not(headerbar).selection-mode button separator {
      background-image: image(mix(#ffffff,#30365f,0.9)); }
  headerbar.selection-mode:backdrop,
  .titlebar:not(headerbar).selection-mode:backdrop {
    background-color: #30365f;
    background-image: none; }
  headerbar.selection-mode .selection-menu:backdrop, headerbar.selection-mode .selection-menu,
  .titlebar:not(headerbar).selection-mode .selection-menu:backdrop,
  .titlebar:not(headerbar).selection-mode .selection-menu {
    color: #262b4c;
    background-color: transparent;
    background-image: none;
    box-shadow: none;
    border: 0; }
    headerbar.selection-mode .selection-menu:backdrop:hover, headerbar.selection-mode .selection-menu:hover,
    .titlebar:not(headerbar).selection-mode .selection-menu:backdrop:hover,
    .titlebar:not(headerbar).selection-mode .selection-menu:hover {
      color: #222643; }
    headerbar.selection-mode .selection-menu:backdrop:active, headerbar.selection-mode .selection-menu:active,
    .titlebar:not(headerbar).selection-mode .selection-menu:backdrop:active,
    .titlebar:not(headerbar).selection-mode .selection-menu:active {
      color: #242947; }
    headerbar.selection-mode .selection-menu:backdrop .arrow, headerbar.selection-mode .selection-menu .arrow,
    .titlebar:not(headerbar).selection-mode .selection-menu:backdrop .arrow,
    .titlebar:not(headerbar).selection-mode .selection-menu .arrow {
      -gtk-icon-source: -gtk-icontheme("pan-down-symbolic");
      color: rgba(255, 255, 255, 0.5);
      -gtk-icon-shadow: none; }
  headerbar.selection-mode .dim-label, headerbar.selection-mode label.separator, .selection-menu headerbar.selection-mode .dim-label,
  .titlebar:not(headerbar).selection-mode .dim-label,
  .titlebar:not(headerbar).selection-mode label.separator, .selection-menu .titlebar:not(headerbar).selection-mode .dim-label {
    color: #222643; }

/**********
 ! Calendar
***********/
calendar {
  padding: 1px 3px;
  outline-offset: -1px;
  color: #c1c3cc; }
  calendar:selected {
    border-radius: 8px; }
  calendar.header {
    border-bottom: 1px solid rgba(102, 102, 102, 0.1);
    border-radius: 0; }
    calendar.header:backdrop {
      border-color: rgba(102, 102, 102, 0.1); }
  calendar.button {
    color: rgba(255, 255, 255, 0.55); }
    calendar.button:hover {
      color: #ffffff; }
    calendar.button:backdrop {
      color: alpha(mix(#ffffff,#1b1c36,0.5),0.55); }
    calendar.button:disabled {
      color: alpha(mix(#ffffff,#1b1c36,0.5),0.55); }
  calendar:indeterminate, calendar:indeterminate:backdrop {
    color: mix(#ffffff,#1b1c36,0.5); }
  calendar.highlight, calendar.highlight:backdrop {
    font-size: smaller;
    color: mix(#30365f,#ffffff,0.5); }
  calendar:backdrop {
    color: mix(#1b1c36,#c1c3cc,0.8); }

/* gnome-calendar */
.calendar-view {
  background-color: #1b1c36;
  color: #c1c3cc; }

/***************
 ! Color chooser
****************/
colorswatch:drop(active), colorswatch {
  border-style: none; }

colorswatch.top {
  border-top-left-radius: 8.5px;
  border-top-right-radius: 8.5px; }
  colorswatch.top overlay {
    border-top-left-radius: 8px;
    border-top-right-radius: 8px; }

colorswatch.bottom {
  border-bottom-left-radius: 8.5px;
  border-bottom-right-radius: 8.5px; }
  colorswatch.bottom overlay {
    border-bottom-left-radius: 8px;
    border-bottom-right-radius: 8px; }

colorswatch.left, colorswatch:first-child:not(.top) {
  border-top-left-radius: 8.5px;
  border-bottom-left-radius: 8.5px; }
  colorswatch.left overlay, colorswatch:first-child:not(.top) overlay {
    border-top-left-radius: 8px;
    border-bottom-left-radius: 8px; }

colorswatch.right, colorswatch:last-child:not(.bottom) {
  border-top-right-radius: 8.5px;
  border-bottom-right-radius: 8.5px; }
  colorswatch.right overlay, colorswatch:last-child:not(.bottom) overlay {
    border-top-right-radius: 8px;
    border-bottom-right-radius: 8px; }

colorswatch.dark overlay {
  color: #ffffff; }
  colorswatch.dark overlay:hover {
    border-color: rgba(102, 102, 102, 0.8); }
  colorswatch.dark overlay:backdrop {
    color: mix(#30365f,#ffffff,0.66); }

colorswatch.light overlay {
  color: #c1c3cc; }
  colorswatch.light overlay:hover {
    border-color: rgba(102, 102, 102, 0.5); }
  colorswatch.light overlay:backdrop {
    color: mix(#1b1c36,#c1c3cc,0.8); }

colorswatch:drop(active) {
  box-shadow: none; }
  colorswatch:drop(active).light overlay {
    border-color: #30365f;
    box-shadow: inset 0 0 0 2px #242947, inset 0 0 0 1px #30365f; }
  colorswatch:drop(active).dark overlay {
    border-color: #30365f;
    box-shadow: inset 0 0 0 2px rgba(102, 102, 102, 0.3), inset 0 0 0 1px #30365f; }

colorswatch overlay {
  border: 1px solid rgba(102, 102, 102, 0.3); }
  colorswatch overlay:hover {
    box-shadow: inset 0 1px rgba(28, 29, 56, 0.4), inset 0 -1px rgba(102, 102, 102, 0.2); }
  colorswatch overlay:backdrop, colorswatch overlay:backdrop:hover {
    border-color: rgba(102, 102, 102, 0.3);
    box-shadow: none; }

colorswatch:disabled {
  opacity: .5; }
  colorswatch:disabled overlay {
    border-color: rgba(102, 102, 102, 0.6);
    box-shadow: none; }

row:selected colorswatch {
  box-shadow: 0 0 0 2px #ffffff; }

colorswatch#add-color-button {
  border-radius: 8px 8px 0 0; }
  colorswatch#add-color-button:only-child {
    border-radius: 8px; }
  colorswatch#add-color-button overlay {
    background-color: #1a1b33;
    color: #ffffff; }
    colorswatch#add-color-button overlay:hover {
      background-color: #181931; }
    colorswatch#add-color-button overlay:backdrop {
      background-color: #1a1b33; }

colorswatch#editor-color-sample {
  border-radius: 8px; }
  colorswatch#editor-color-sample overlay {
    border-radius: 8.5px; }

button.color, button.color.nautilus-circular-button.image-button {
  padding: 4px; }
  button.color colorswatch:only-child, button.color colorswatch:only-child overlay {
    border-radius: 8px; }
  button.color:disabled colorswatch:only-child, button.color:backdrop colorswatch:only-child, button.color:active colorswatch:only-child, button.color:checked colorswatch:only-child {
    box-shadow: none; }

/***********************
! Font and file choosers
************************/
filechooser {
  /* for fallback when header bar not used */ }
  filechooser .dialog-action-box {
    border-top: 1px solid mix(#1b1c36,#ffffff,0.18); }
    filechooser .dialog-action-box:backdrop {
      border-top-color: mix(#1b1c36,mix(#1b1c36,#ffffff,0.18),0.9); }
  filechooser #pathbarbox {
    border-bottom: 1px solid mix(#1b1c36,#ffffff,0.18);
    background-color: #1b1c36; }

filechooserbutton:drop(active) {
  box-shadow: none;
  border-color: transparent; }

/******************
 ! Grid and flowbox
*******************/
widget:active {
  background-color: mix(#30365f,#1b1c36,0.5); }

list {
  color: #c1c3cc;
  background-color: #1b1c36;
  border-color: mix(#1b1c36,#ffffff,0.18); }
  list:backdrop {
    background-color: #1b1c36;
    border-color: mix(#1b1c36,mix(#1b1c36,#ffffff,0.18),0.9); }
  list row {
    padding: 4px; }

row {
  transition: all 150ms cubic-bezier(0.25, 0.46, 0.45, 0.94); }
  row:hover {
    transition: none; }
  row:backdrop {
    transition: 200ms ease-out; }
  row.activatable.has-open-popup, row.activatable:hover {
    background-color: rgba(255, 255, 255, 0.05); }
  row.activatable:active {
    box-shadow: inset 0 2px 2px -2px rgba(102, 102, 102, 0.2); }
  row.activatable:backdrop:hover {
    background-color: transparent; }
  row.activatable:selected:active {
    box-shadow: inset 0 2px 3px -1px rgba(102, 102, 102, 0.5); }
  row.activatable:selected.has-open-popup, row.activatable:selected:hover {
    background-color: mix(#30365f,#ffffff,0.1); }
  row.activatable:selected:backdrop {
    background-color: #30365f; }

flowbox flowboxchild {
  padding: 4px;
  border-radius: 8px; }
  flowbox flowboxchild:selected {
    outline-offset: -2px; }

/*********
 ! Buttons
**********/
/******************
! ComboBoxes *
*******************/
/*********
 ! Infobar
**********/
infobar {
  border: 0; }
  infobar.info, infobar.info:backdrop {
    background-color: #0c12de;
    background-image: none;
    border: 1px solid #0a0eb2;
    caret-color: currentColor; }
    infobar.info label, infobar.info, infobar.info:backdrop label, infobar.info:backdrop {
      color: #1b1c36; }
  infobar.info button, infobar.info button.nautilus-circular-button.image-button {
    background-color: #0c12de;
    background-image: none;
    border-color: rgba(22, 22, 43, 0.32);
    color: #1b1c36;
    box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22); }
    infobar.info button:focus, infobar.info button:hover {
      border-color: mix(#30365f,rgba(27, 28, 54, 0.32),0.3); }
    infobar.info button:active, infobar.info button:active:hover, infobar.info button:active:focus, infobar.info button:active:hover:focus, infobar.info button:checked, infobar.info button:checked:hover, infobar.info button:checked:focus, infobar.info button:checked:hover:focus {
      border-color: rgba(19, 20, 38, 0.32); }
    infobar.info button:disabled {
      border-color: rgba(23, 24, 46, 0.32); }
    infobar.info button:active:disabled, infobar.info button:checked:disabled {
      border-color: rgba(22, 22, 43, 0.32); }
    .linked:not(.vertical) > infobar.info button:not(:last-child):not(:only-child), .linked:not(.vertical) > :not(:last-child):not(:only-child) infobar.info button, viewswitcher:not(.vertical) > infobar.info button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > infobar.info button:not(:last-child):not(:only-child) {
      border-right-style: none; }
      .linked:not(.vertical) > infobar.info button:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) infobar.info button:hover, viewswitcher:not(.vertical) > infobar.info button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > infobar.info button:not(:last-child):not(:only-child):hover {
        border-color: mix(#30365f,rgba(27, 28, 54, 0.36),0.3);
        border-right-style: none;
        box-shadow: inset-1px 0 0 mix(#30365f,rgba(27, 28, 54, 0.36),0.3); }
    .linked:not(.vertical) > infobar.info button:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > :not(:last-child):not(:only-child) infobar.info button:checked, viewswitcher:not(.vertical) > infobar.info button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > infobar.info button:not(:last-child):not(:only-child):checked {
      border-right-style: none; }
      .linked:not(.vertical) > infobar.info button:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) infobar.info button:checked:hover, viewswitcher:not(.vertical) > infobar.info button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > infobar.info button:not(:last-child):not(:only-child):checked:hover {
        border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
        border-right-style: none;
        box-shadow: inset-1px 0 0 mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
    .linked.vertical > infobar.info button:not(:last-child):not(:only-child), .linked.vertical > :not(:last-child):not(:only-child) infobar.info button, stackswitcher.vertical > infobar.info button:not(:last-child):not(:only-child) {
      border-bottom-style: none; }
      .linked.vertical > infobar.info button:not(:last-child):not(:only-child):hover, .linked.vertical > :not(:last-child):not(:only-child) infobar.info button:hover, stackswitcher.vertical > infobar.info button:not(:last-child):not(:only-child):hover {
        border-color: mix(#30365f,rgba(27, 28, 54, 0.36),0.3);
        border-bottom-style: none;
        box-shadow: inset 0 -1px mix(#30365f,rgba(27, 28, 54, 0.36),0.3); }
    .linked.vertical > infobar.info button:not(:last-child):not(:only-child):checked, .linked.vertical > :not(:last-child):not(:only-child) infobar.info button:checked, stackswitcher.vertical > infobar.info button:not(:last-child):not(:only-child):checked {
      border-bottom-style: none; }
      .linked.vertical > infobar.info button:not(:last-child):not(:only-child):checked:hover, .linked.vertical > :not(:last-child):not(:only-child) infobar.info button:checked:hover, stackswitcher.vertical > infobar.info button:not(:last-child):not(:only-child):checked:hover {
        border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
        border-bottom-style: none;
        box-shadow: inset 0 -1px mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
    infobar.info button.flat {
      color: #1b1c36;
      border-color: rgba(12, 18, 222, 0);
      background-color: rgba(12, 18, 222, 0);
      background-image: none;
      box-shadow: none; }
    infobar.info button:hover, infobar.info button.flat:hover {
      background-color: #0d13e9;
      background-image: none;
      border-color: rgba(22, 22, 43, 0.4);
      color: #1b1c36;
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.32); }
      infobar.info button:hover:focus, infobar.info button:hover:hover, infobar.info button.flat:hover:focus, infobar.info button.flat:hover:hover {
        border-color: mix(#30365f,rgba(27, 28, 54, 0.4),0.3); }
      infobar.info button:hover:active, infobar.info button:hover:active:focus, infobar.info button.flat:hover:active:focus, infobar.info button:hover:checked, infobar.info button:hover:checked:focus, infobar.info button.flat:hover:checked:focus, infobar.info button.flat:hover:active, infobar.info button.flat:hover:active:hover:focus, infobar.info button.flat:hover:checked, infobar.info button.flat:hover:checked:hover:focus {
        border-color: rgba(19, 20, 38, 0.4); }
      infobar.info button:hover:disabled, infobar.info button.flat:hover:disabled {
        border-color: rgba(23, 24, 46, 0.4); }
      infobar.info button:hover:active:disabled, infobar.info button:hover:checked:disabled, infobar.info button.flat:hover:active:disabled, infobar.info button.flat:hover:checked:disabled {
        border-color: rgba(22, 22, 43, 0.4); }
    infobar.info button:focus, infobar.info button.flat:focus {
      background-color: #0d13e9;
      background-image: none;
      border-color: rgba(27, 28, 54, 0.32);
      outline-color: rgba(48, 54, 95, 0.5);
      outline-width: 3px;
      outline-style: solid;
      outline-offset: 10px;
      color: #1b1c36;
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
      infobar.info button:focus:hover, infobar.info button.flat:focus:hover {
        background-color: #0f16f2;
        background-image: none;
        border-color: rgba(22, 22, 43, 0.4);
        box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.48); }
        infobar.info button:focus:hover:hover, infobar.info button.flat:focus:hover:hover {
          border-color: mix(#30365f,rgba(27, 28, 54, 0.4),0.3); }
        infobar.info button:focus:hover:active, infobar.info button.flat:focus:hover:active, infobar.info button.flat:focus:hover:active:focus, infobar.info button:focus:hover:checked, infobar.info button.flat:focus:hover:checked, infobar.info button.flat:focus:hover:checked:focus, infobar.info button.flat:focus:hover:active:hover:focus, infobar.info button.flat:focus:hover:checked:hover:focus {
          border-color: rgba(19, 20, 38, 0.4); }
        infobar.info button:focus:hover:disabled, infobar.info button.flat:focus:hover:disabled {
          border-color: rgba(23, 24, 46, 0.4); }
        infobar.info button:focus:hover:active:disabled, infobar.info button:focus:hover:checked:disabled, infobar.info button.flat:focus:hover:active:disabled, infobar.info button.flat:focus:hover:checked:disabled {
          border-color: rgba(22, 22, 43, 0.4); }
    infobar.info button:checked, infobar.info button:active, infobar.info button.flat:checked, infobar.info button.flat:active {
      /*@include linear-gradient(shade($bg, .7), to top);*/
      background-color: #30365f;
      background-image: none;
      border-color: rgba(22, 22, 43, 0.32);
      color: #ffffff;
      box-shadow: inset 1px 0 rgba(27, 28, 54, 0.06), inset 0 1px rgba(27, 28, 54, 0.07), inset -1px 0 rgba(27, 28, 54, 0.06), inset 0 -1px rgba(27, 28, 54, 0.05); }
      infobar.info button:checked:focus, infobar.info button:checked:hover, infobar.info button:active:focus, infobar.info button:active:hover, infobar.info button.flat:checked:focus, infobar.info button.flat:checked:hover, infobar.info button.flat:active:focus, infobar.info button.flat:active:hover {
        border-color: mix(#30365f,rgba(27, 28, 54, 0.32),0.3); }
      infobar.info button:active:checked, infobar.info button:active:checked:hover, infobar.info button:active:checked:focus, infobar.info button:active:checked:hover:focus, infobar.info button.flat:active:checked, infobar.info button.flat:active:checked:hover, infobar.info button.flat:active:checked:focus, infobar.info button.flat:active:checked:hover:focus {
        border-color: rgba(19, 20, 38, 0.32); }
      infobar.info button:checked:disabled, infobar.info button:active:disabled, infobar.info button.flat:checked:disabled, infobar.info button.flat:active:disabled {
        border-color: rgba(23, 24, 46, 0.32); }
      infobar.info button:active:checked:disabled, infobar.info button.flat:active:checked:disabled {
        border-color: rgba(22, 22, 43, 0.32); }
      infobar.info button:checked:focus, infobar.info button:checked:hover, infobar.info button:active:focus, infobar.info button:active:hover, infobar.info button.flat:checked:focus, infobar.info button.flat:checked:hover, infobar.info button.flat:active:focus, infobar.info button.flat:active:hover {
        /*@include linear-gradient(shade($bg, .65), to top);*/
        background-color: #323964;
        background-image: none;
        color: #ffffff; }
    infobar.info button:focus, infobar.info button:hover, infobar.info button.flat:focus, infobar.info button.flat:hover {
      color: #1b1c36; }
    infobar.info button:disabled:disabled, infobar.info button.flat:disabled:disabled {
      background-color: alpha(mix(#0c12de,#1b1c36,0.2),0.4);
      background-image: none;
      /*border: 1px solid alpha($bg, .2);*/
      opacity: .6;
      color: mix(#0c12de,#1b1c36,0.6);
      box-shadow: none; }
      infobar.info button:disabled:disabled :disabled, infobar.info button.flat:disabled:disabled :disabled {
        color: mix(#0c12de,#1b1c36,0.6); }
    infobar.info button:active:disabled, infobar.info button:checked:disabled, infobar.info button.flat:active:disabled, infobar.info button.flat:checked:disabled {
      background-color: rgba(48, 54, 95, 0.6);
      background-image: none;
      color: rgba(255, 255, 255, 0.85);
      box-shadow: none; }
      infobar.info button:active:disabled :disabled, infobar.info button:checked:disabled :disabled, infobar.info button.flat:active:disabled :disabled, infobar.info button.flat:checked:disabled :disabled {
        color: rgba(255, 255, 255, 0.85); }
    infobar.info button:backdrop, infobar.info button.flat:backdrop {
      color: mix(#ffffff,mix(#ffffff,#1b1c36,0.5),0.8); }
    infobar.info button.separator, infobar.info button .separator {
      border: 1px solid currentColor;
      color: rgba(12, 18, 222, 0.9); }
      infobar.info button.separator:disabled, infobar.info button .separator:disabled {
        color: rgba(12, 18, 222, 0.85); }
    infobar.info button separator, infobar.info button.nautilus-circular-button.image-button separator {
      background-image: image(mix(#1b1c36,#0c12de,0.9)); }
  infobar.warning, infobar.warning:backdrop {
    background-color: #afb500;
    background-image: none;
    border: 1px solid #8c9100;
    caret-color: currentColor; }
    infobar.warning label, infobar.warning, infobar.warning:backdrop label, infobar.warning:backdrop {
      color: #1b1c36; }
  infobar.warning button, infobar.warning button.nautilus-circular-button.image-button {
    background-color: #afb500;
    background-image: none;
    border-color: rgba(22, 22, 43, 0.32);
    color: #1b1c36;
    box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22); }
    infobar.warning button:focus, infobar.warning button:hover {
      border-color: mix(#30365f,rgba(27, 28, 54, 0.32),0.3); }
    infobar.warning button:active, infobar.warning button:active:hover, infobar.warning button:active:focus, infobar.warning button:active:hover:focus, infobar.warning button:checked, infobar.warning button:checked:hover, infobar.warning button:checked:focus, infobar.warning button:checked:hover:focus {
      border-color: rgba(19, 20, 38, 0.32); }
    infobar.warning button:disabled {
      border-color: rgba(23, 24, 46, 0.32); }
    infobar.warning button:active:disabled, infobar.warning button:checked:disabled {
      border-color: rgba(22, 22, 43, 0.32); }
    .linked:not(.vertical) > infobar.warning button:not(:last-child):not(:only-child), .linked:not(.vertical) > :not(:last-child):not(:only-child) infobar.warning button, viewswitcher:not(.vertical) > infobar.warning button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > infobar.warning button:not(:last-child):not(:only-child) {
      border-right-style: none; }
      .linked:not(.vertical) > infobar.warning button:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) infobar.warning button:hover, viewswitcher:not(.vertical) > infobar.warning button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > infobar.warning button:not(:last-child):not(:only-child):hover {
        border-color: mix(#30365f,rgba(27, 28, 54, 0.36),0.3);
        border-right-style: none;
        box-shadow: inset-1px 0 0 mix(#30365f,rgba(27, 28, 54, 0.36),0.3); }
    .linked:not(.vertical) > infobar.warning button:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > :not(:last-child):not(:only-child) infobar.warning button:checked, viewswitcher:not(.vertical) > infobar.warning button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > infobar.warning button:not(:last-child):not(:only-child):checked {
      border-right-style: none; }
      .linked:not(.vertical) > infobar.warning button:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) infobar.warning button:checked:hover, viewswitcher:not(.vertical) > infobar.warning button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > infobar.warning button:not(:last-child):not(:only-child):checked:hover {
        border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
        border-right-style: none;
        box-shadow: inset-1px 0 0 mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
    .linked.vertical > infobar.warning button:not(:last-child):not(:only-child), .linked.vertical > :not(:last-child):not(:only-child) infobar.warning button, stackswitcher.vertical > infobar.warning button:not(:last-child):not(:only-child) {
      border-bottom-style: none; }
      .linked.vertical > infobar.warning button:not(:last-child):not(:only-child):hover, .linked.vertical > :not(:last-child):not(:only-child) infobar.warning button:hover, stackswitcher.vertical > infobar.warning button:not(:last-child):not(:only-child):hover {
        border-color: mix(#30365f,rgba(27, 28, 54, 0.36),0.3);
        border-bottom-style: none;
        box-shadow: inset 0 -1px mix(#30365f,rgba(27, 28, 54, 0.36),0.3); }
    .linked.vertical > infobar.warning button:not(:last-child):not(:only-child):checked, .linked.vertical > :not(:last-child):not(:only-child) infobar.warning button:checked, stackswitcher.vertical > infobar.warning button:not(:last-child):not(:only-child):checked {
      border-bottom-style: none; }
      .linked.vertical > infobar.warning button:not(:last-child):not(:only-child):checked:hover, .linked.vertical > :not(:last-child):not(:only-child) infobar.warning button:checked:hover, stackswitcher.vertical > infobar.warning button:not(:last-child):not(:only-child):checked:hover {
        border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
        border-bottom-style: none;
        box-shadow: inset 0 -1px mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
    infobar.warning button.flat {
      color: #1b1c36;
      border-color: rgba(175, 181, 0, 0);
      background-color: rgba(175, 181, 0, 0);
      background-image: none;
      box-shadow: none; }
    infobar.warning button:hover, infobar.warning button.flat:hover {
      background-color: #b8be00;
      background-image: none;
      border-color: rgba(22, 22, 43, 0.4);
      color: #1b1c36;
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.32); }
      infobar.warning button:hover:focus, infobar.warning button:hover:hover, infobar.warning button.flat:hover:focus, infobar.warning button.flat:hover:hover {
        border-color: mix(#30365f,rgba(27, 28, 54, 0.4),0.3); }
      infobar.warning button:hover:active, infobar.warning button:hover:active:focus, infobar.warning button.flat:hover:active:focus, infobar.warning button:hover:checked, infobar.warning button:hover:checked:focus, infobar.warning button.flat:hover:checked:focus, infobar.warning button.flat:hover:active, infobar.warning button.flat:hover:active:hover:focus, infobar.warning button.flat:hover:checked, infobar.warning button.flat:hover:checked:hover:focus {
        border-color: rgba(19, 20, 38, 0.4); }
      infobar.warning button:hover:disabled, infobar.warning button.flat:hover:disabled {
        border-color: rgba(23, 24, 46, 0.4); }
      infobar.warning button:hover:active:disabled, infobar.warning button:hover:checked:disabled, infobar.warning button.flat:hover:active:disabled, infobar.warning button.flat:hover:checked:disabled {
        border-color: rgba(22, 22, 43, 0.4); }
    infobar.warning button:focus, infobar.warning button.flat:focus {
      background-color: #b8be00;
      background-image: none;
      border-color: rgba(27, 28, 54, 0.32);
      outline-color: rgba(48, 54, 95, 0.5);
      outline-width: 3px;
      outline-style: solid;
      outline-offset: 10px;
      color: #1b1c36;
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
      infobar.warning button:focus:hover, infobar.warning button.flat:focus:hover {
        background-color: #c1c700;
        background-image: none;
        border-color: rgba(22, 22, 43, 0.4);
        box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.48); }
        infobar.warning button:focus:hover:hover, infobar.warning button.flat:focus:hover:hover {
          border-color: mix(#30365f,rgba(27, 28, 54, 0.4),0.3); }
        infobar.warning button:focus:hover:active, infobar.warning button.flat:focus:hover:active, infobar.warning button.flat:focus:hover:active:focus, infobar.warning button:focus:hover:checked, infobar.warning button.flat:focus:hover:checked, infobar.warning button.flat:focus:hover:checked:focus, infobar.warning button.flat:focus:hover:active:hover:focus, infobar.warning button.flat:focus:hover:checked:hover:focus {
          border-color: rgba(19, 20, 38, 0.4); }
        infobar.warning button:focus:hover:disabled, infobar.warning button.flat:focus:hover:disabled {
          border-color: rgba(23, 24, 46, 0.4); }
        infobar.warning button:focus:hover:active:disabled, infobar.warning button:focus:hover:checked:disabled, infobar.warning button.flat:focus:hover:active:disabled, infobar.warning button.flat:focus:hover:checked:disabled {
          border-color: rgba(22, 22, 43, 0.4); }
    infobar.warning button:checked, infobar.warning button:active, infobar.warning button.flat:checked, infobar.warning button.flat:active {
      /*@include linear-gradient(shade($bg, .7), to top);*/
      background-color: #30365f;
      background-image: none;
      border-color: rgba(22, 22, 43, 0.32);
      color: #ffffff;
      box-shadow: inset 1px 0 rgba(27, 28, 54, 0.06), inset 0 1px rgba(27, 28, 54, 0.07), inset -1px 0 rgba(27, 28, 54, 0.06), inset 0 -1px rgba(27, 28, 54, 0.05); }
      infobar.warning button:checked:focus, infobar.warning button:checked:hover, infobar.warning button:active:focus, infobar.warning button:active:hover, infobar.warning button.flat:checked:focus, infobar.warning button.flat:checked:hover, infobar.warning button.flat:active:focus, infobar.warning button.flat:active:hover {
        border-color: mix(#30365f,rgba(27, 28, 54, 0.32),0.3); }
      infobar.warning button:active:checked, infobar.warning button:active:checked:hover, infobar.warning button:active:checked:focus, infobar.warning button:active:checked:hover:focus, infobar.warning button.flat:active:checked, infobar.warning button.flat:active:checked:hover, infobar.warning button.flat:active:checked:focus, infobar.warning button.flat:active:checked:hover:focus {
        border-color: rgba(19, 20, 38, 0.32); }
      infobar.warning button:checked:disabled, infobar.warning button:active:disabled, infobar.warning button.flat:checked:disabled, infobar.warning button.flat:active:disabled {
        border-color: rgba(23, 24, 46, 0.32); }
      infobar.warning button:active:checked:disabled, infobar.warning button.flat:active:checked:disabled {
        border-color: rgba(22, 22, 43, 0.32); }
      infobar.warning button:checked:focus, infobar.warning button:checked:hover, infobar.warning button:active:focus, infobar.warning button:active:hover, infobar.warning button.flat:checked:focus, infobar.warning button.flat:checked:hover, infobar.warning button.flat:active:focus, infobar.warning button.flat:active:hover {
        /*@include linear-gradient(shade($bg, .65), to top);*/
        background-color: #323964;
        background-image: none;
        color: #ffffff; }
    infobar.warning button:focus, infobar.warning button:hover, infobar.warning button.flat:focus, infobar.warning button.flat:hover {
      color: #1b1c36; }
    infobar.warning button:disabled:disabled, infobar.warning button.flat:disabled:disabled {
      background-color: alpha(mix(#afb500,#1b1c36,0.2),0.4);
      background-image: none;
      /*border: 1px solid alpha($bg, .2);*/
      opacity: .6;
      color: mix(#afb500,#1b1c36,0.6);
      box-shadow: none; }
      infobar.warning button:disabled:disabled :disabled, infobar.warning button.flat:disabled:disabled :disabled {
        color: mix(#afb500,#1b1c36,0.6); }
    infobar.warning button:active:disabled, infobar.warning button:checked:disabled, infobar.warning button.flat:active:disabled, infobar.warning button.flat:checked:disabled {
      background-color: rgba(48, 54, 95, 0.6);
      background-image: none;
      color: rgba(255, 255, 255, 0.85);
      box-shadow: none; }
      infobar.warning button:active:disabled :disabled, infobar.warning button:checked:disabled :disabled, infobar.warning button.flat:active:disabled :disabled, infobar.warning button.flat:checked:disabled :disabled {
        color: rgba(255, 255, 255, 0.85); }
    infobar.warning button:backdrop, infobar.warning button.flat:backdrop {
      color: mix(#ffffff,mix(#ffffff,#1b1c36,0.5),0.8); }
    infobar.warning button.separator, infobar.warning button .separator {
      border: 1px solid currentColor;
      color: rgba(175, 181, 0, 0.9); }
      infobar.warning button.separator:disabled, infobar.warning button .separator:disabled {
        color: rgba(175, 181, 0, 0.85); }
    infobar.warning button separator, infobar.warning button.nautilus-circular-button.image-button separator {
      background-image: image(mix(#1b1c36,#afb500,0.9)); }
  infobar.question, infobar.question:backdrop {
    background-color: #0c12de;
    background-image: none;
    border: 1px solid #0a0eb2;
    caret-color: currentColor; }
    infobar.question label, infobar.question, infobar.question:backdrop label, infobar.question:backdrop {
      color: #1b1c36; }
  infobar.question button, infobar.question button.nautilus-circular-button.image-button {
    background-color: #0c12de;
    background-image: none;
    border-color: rgba(22, 22, 43, 0.32);
    color: #1b1c36;
    box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22); }
    infobar.question button:focus, infobar.question button:hover {
      border-color: mix(#30365f,rgba(27, 28, 54, 0.32),0.3); }
    infobar.question button:active, infobar.question button:active:hover, infobar.question button:active:focus, infobar.question button:active:hover:focus, infobar.question button:checked, infobar.question button:checked:hover, infobar.question button:checked:focus, infobar.question button:checked:hover:focus {
      border-color: rgba(19, 20, 38, 0.32); }
    infobar.question button:disabled {
      border-color: rgba(23, 24, 46, 0.32); }
    infobar.question button:active:disabled, infobar.question button:checked:disabled {
      border-color: rgba(22, 22, 43, 0.32); }
    .linked:not(.vertical) > infobar.question button:not(:last-child):not(:only-child), .linked:not(.vertical) > :not(:last-child):not(:only-child) infobar.question button, viewswitcher:not(.vertical) > infobar.question button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > infobar.question button:not(:last-child):not(:only-child) {
      border-right-style: none; }
      .linked:not(.vertical) > infobar.question button:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) infobar.question button:hover, viewswitcher:not(.vertical) > infobar.question button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > infobar.question button:not(:last-child):not(:only-child):hover {
        border-color: mix(#30365f,rgba(27, 28, 54, 0.36),0.3);
        border-right-style: none;
        box-shadow: inset-1px 0 0 mix(#30365f,rgba(27, 28, 54, 0.36),0.3); }
    .linked:not(.vertical) > infobar.question button:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > :not(:last-child):not(:only-child) infobar.question button:checked, viewswitcher:not(.vertical) > infobar.question button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > infobar.question button:not(:last-child):not(:only-child):checked {
      border-right-style: none; }
      .linked:not(.vertical) > infobar.question button:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) infobar.question button:checked:hover, viewswitcher:not(.vertical) > infobar.question button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > infobar.question button:not(:last-child):not(:only-child):checked:hover {
        border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
        border-right-style: none;
        box-shadow: inset-1px 0 0 mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
    .linked.vertical > infobar.question button:not(:last-child):not(:only-child), .linked.vertical > :not(:last-child):not(:only-child) infobar.question button, stackswitcher.vertical > infobar.question button:not(:last-child):not(:only-child) {
      border-bottom-style: none; }
      .linked.vertical > infobar.question button:not(:last-child):not(:only-child):hover, .linked.vertical > :not(:last-child):not(:only-child) infobar.question button:hover, stackswitcher.vertical > infobar.question button:not(:last-child):not(:only-child):hover {
        border-color: mix(#30365f,rgba(27, 28, 54, 0.36),0.3);
        border-bottom-style: none;
        box-shadow: inset 0 -1px mix(#30365f,rgba(27, 28, 54, 0.36),0.3); }
    .linked.vertical > infobar.question button:not(:last-child):not(:only-child):checked, .linked.vertical > :not(:last-child):not(:only-child) infobar.question button:checked, stackswitcher.vertical > infobar.question button:not(:last-child):not(:only-child):checked {
      border-bottom-style: none; }
      .linked.vertical > infobar.question button:not(:last-child):not(:only-child):checked:hover, .linked.vertical > :not(:last-child):not(:only-child) infobar.question button:checked:hover, stackswitcher.vertical > infobar.question button:not(:last-child):not(:only-child):checked:hover {
        border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
        border-bottom-style: none;
        box-shadow: inset 0 -1px mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
    infobar.question button.flat {
      color: #1b1c36;
      border-color: rgba(12, 18, 222, 0);
      background-color: rgba(12, 18, 222, 0);
      background-image: none;
      box-shadow: none; }
    infobar.question button:hover, infobar.question button.flat:hover {
      background-color: #0d13e9;
      background-image: none;
      border-color: rgba(22, 22, 43, 0.4);
      color: #1b1c36;
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.32); }
      infobar.question button:hover:focus, infobar.question button:hover:hover, infobar.question button.flat:hover:focus, infobar.question button.flat:hover:hover {
        border-color: mix(#30365f,rgba(27, 28, 54, 0.4),0.3); }
      infobar.question button:hover:active, infobar.question button:hover:active:focus, infobar.question button.flat:hover:active:focus, infobar.question button:hover:checked, infobar.question button:hover:checked:focus, infobar.question button.flat:hover:checked:focus, infobar.question button.flat:hover:active, infobar.question button.flat:hover:active:hover:focus, infobar.question button.flat:hover:checked, infobar.question button.flat:hover:checked:hover:focus {
        border-color: rgba(19, 20, 38, 0.4); }
      infobar.question button:hover:disabled, infobar.question button.flat:hover:disabled {
        border-color: rgba(23, 24, 46, 0.4); }
      infobar.question button:hover:active:disabled, infobar.question button:hover:checked:disabled, infobar.question button.flat:hover:active:disabled, infobar.question button.flat:hover:checked:disabled {
        border-color: rgba(22, 22, 43, 0.4); }
    infobar.question button:focus, infobar.question button.flat:focus {
      background-color: #0d13e9;
      background-image: none;
      border-color: rgba(27, 28, 54, 0.32);
      outline-color: rgba(48, 54, 95, 0.5);
      outline-width: 3px;
      outline-style: solid;
      outline-offset: 10px;
      color: #1b1c36;
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
      infobar.question button:focus:hover, infobar.question button.flat:focus:hover {
        background-color: #0f16f2;
        background-image: none;
        border-color: rgba(22, 22, 43, 0.4);
        box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.48); }
        infobar.question button:focus:hover:hover, infobar.question button.flat:focus:hover:hover {
          border-color: mix(#30365f,rgba(27, 28, 54, 0.4),0.3); }
        infobar.question button:focus:hover:active, infobar.question button.flat:focus:hover:active, infobar.question button.flat:focus:hover:active:focus, infobar.question button:focus:hover:checked, infobar.question button.flat:focus:hover:checked, infobar.question button.flat:focus:hover:checked:focus, infobar.question button.flat:focus:hover:active:hover:focus, infobar.question button.flat:focus:hover:checked:hover:focus {
          border-color: rgba(19, 20, 38, 0.4); }
        infobar.question button:focus:hover:disabled, infobar.question button.flat:focus:hover:disabled {
          border-color: rgba(23, 24, 46, 0.4); }
        infobar.question button:focus:hover:active:disabled, infobar.question button:focus:hover:checked:disabled, infobar.question button.flat:focus:hover:active:disabled, infobar.question button.flat:focus:hover:checked:disabled {
          border-color: rgba(22, 22, 43, 0.4); }
    infobar.question button:checked, infobar.question button:active, infobar.question button.flat:checked, infobar.question button.flat:active {
      /*@include linear-gradient(shade($bg, .7), to top);*/
      background-color: #30365f;
      background-image: none;
      border-color: rgba(22, 22, 43, 0.32);
      color: #ffffff;
      box-shadow: inset 1px 0 rgba(27, 28, 54, 0.06), inset 0 1px rgba(27, 28, 54, 0.07), inset -1px 0 rgba(27, 28, 54, 0.06), inset 0 -1px rgba(27, 28, 54, 0.05); }
      infobar.question button:checked:focus, infobar.question button:checked:hover, infobar.question button:active:focus, infobar.question button:active:hover, infobar.question button.flat:checked:focus, infobar.question button.flat:checked:hover, infobar.question button.flat:active:focus, infobar.question button.flat:active:hover {
        border-color: mix(#30365f,rgba(27, 28, 54, 0.32),0.3); }
      infobar.question button:active:checked, infobar.question button:active:checked:hover, infobar.question button:active:checked:focus, infobar.question button:active:checked:hover:focus, infobar.question button.flat:active:checked, infobar.question button.flat:active:checked:hover, infobar.question button.flat:active:checked:focus, infobar.question button.flat:active:checked:hover:focus {
        border-color: rgba(19, 20, 38, 0.32); }
      infobar.question button:checked:disabled, infobar.question button:active:disabled, infobar.question button.flat:checked:disabled, infobar.question button.flat:active:disabled {
        border-color: rgba(23, 24, 46, 0.32); }
      infobar.question button:active:checked:disabled, infobar.question button.flat:active:checked:disabled {
        border-color: rgba(22, 22, 43, 0.32); }
      infobar.question button:checked:focus, infobar.question button:checked:hover, infobar.question button:active:focus, infobar.question button:active:hover, infobar.question button.flat:checked:focus, infobar.question button.flat:checked:hover, infobar.question button.flat:active:focus, infobar.question button.flat:active:hover {
        /*@include linear-gradient(shade($bg, .65), to top);*/
        background-color: #323964;
        background-image: none;
        color: #ffffff; }
    infobar.question button:focus, infobar.question button:hover, infobar.question button.flat:focus, infobar.question button.flat:hover {
      color: #1b1c36; }
    infobar.question button:disabled:disabled, infobar.question button.flat:disabled:disabled {
      background-color: alpha(mix(#0c12de,#1b1c36,0.2),0.4);
      background-image: none;
      /*border: 1px solid alpha($bg, .2);*/
      opacity: .6;
      color: mix(#0c12de,#1b1c36,0.6);
      box-shadow: none; }
      infobar.question button:disabled:disabled :disabled, infobar.question button.flat:disabled:disabled :disabled {
        color: mix(#0c12de,#1b1c36,0.6); }
    infobar.question button:active:disabled, infobar.question button:checked:disabled, infobar.question button.flat:active:disabled, infobar.question button.flat:checked:disabled {
      background-color: rgba(48, 54, 95, 0.6);
      background-image: none;
      color: rgba(255, 255, 255, 0.85);
      box-shadow: none; }
      infobar.question button:active:disabled :disabled, infobar.question button:checked:disabled :disabled, infobar.question button.flat:active:disabled :disabled, infobar.question button.flat:checked:disabled :disabled {
        color: rgba(255, 255, 255, 0.85); }
    infobar.question button:backdrop, infobar.question button.flat:backdrop {
      color: mix(#ffffff,mix(#ffffff,#1b1c36,0.5),0.8); }
    infobar.question button.separator, infobar.question button .separator {
      border: 1px solid currentColor;
      color: rgba(12, 18, 222, 0.9); }
      infobar.question button.separator:disabled, infobar.question button .separator:disabled {
        color: rgba(12, 18, 222, 0.85); }
    infobar.question button separator, infobar.question button.nautilus-circular-button.image-button separator {
      background-image: image(mix(#1b1c36,#0c12de,0.9)); }
  infobar.error, infobar.error:backdrop {
    background-color: #af0000;
    background-image: none;
    border: 1px solid #8c0000;
    caret-color: currentColor; }
    infobar.error label, infobar.error, infobar.error:backdrop label, infobar.error:backdrop {
      color: #1b1c36; }
  infobar.error button, infobar.error button.nautilus-circular-button.image-button {
    background-color: #af0000;
    background-image: none;
    border-color: rgba(22, 22, 43, 0.32);
    color: #1b1c36;
    box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22); }
    infobar.error button:focus, infobar.error button:hover {
      border-color: mix(#30365f,rgba(27, 28, 54, 0.32),0.3); }
    infobar.error button:active, infobar.error button:active:hover, infobar.error button:active:focus, infobar.error button:active:hover:focus, infobar.error button:checked, infobar.error button:checked:hover, infobar.error button:checked:focus, infobar.error button:checked:hover:focus {
      border-color: rgba(19, 20, 38, 0.32); }
    infobar.error button:disabled {
      border-color: rgba(23, 24, 46, 0.32); }
    infobar.error button:active:disabled, infobar.error button:checked:disabled {
      border-color: rgba(22, 22, 43, 0.32); }
    .linked:not(.vertical) > infobar.error button:not(:last-child):not(:only-child), .linked:not(.vertical) > :not(:last-child):not(:only-child) infobar.error button, viewswitcher:not(.vertical) > infobar.error button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > infobar.error button:not(:last-child):not(:only-child) {
      border-right-style: none; }
      .linked:not(.vertical) > infobar.error button:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) infobar.error button:hover, viewswitcher:not(.vertical) > infobar.error button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > infobar.error button:not(:last-child):not(:only-child):hover {
        border-color: mix(#30365f,rgba(27, 28, 54, 0.36),0.3);
        border-right-style: none;
        box-shadow: inset-1px 0 0 mix(#30365f,rgba(27, 28, 54, 0.36),0.3); }
    .linked:not(.vertical) > infobar.error button:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > :not(:last-child):not(:only-child) infobar.error button:checked, viewswitcher:not(.vertical) > infobar.error button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > infobar.error button:not(:last-child):not(:only-child):checked {
      border-right-style: none; }
      .linked:not(.vertical) > infobar.error button:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) infobar.error button:checked:hover, viewswitcher:not(.vertical) > infobar.error button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > infobar.error button:not(:last-child):not(:only-child):checked:hover {
        border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
        border-right-style: none;
        box-shadow: inset-1px 0 0 mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
    .linked.vertical > infobar.error button:not(:last-child):not(:only-child), .linked.vertical > :not(:last-child):not(:only-child) infobar.error button, stackswitcher.vertical > infobar.error button:not(:last-child):not(:only-child) {
      border-bottom-style: none; }
      .linked.vertical > infobar.error button:not(:last-child):not(:only-child):hover, .linked.vertical > :not(:last-child):not(:only-child) infobar.error button:hover, stackswitcher.vertical > infobar.error button:not(:last-child):not(:only-child):hover {
        border-color: mix(#30365f,rgba(27, 28, 54, 0.36),0.3);
        border-bottom-style: none;
        box-shadow: inset 0 -1px mix(#30365f,rgba(27, 28, 54, 0.36),0.3); }
    .linked.vertical > infobar.error button:not(:last-child):not(:only-child):checked, .linked.vertical > :not(:last-child):not(:only-child) infobar.error button:checked, stackswitcher.vertical > infobar.error button:not(:last-child):not(:only-child):checked {
      border-bottom-style: none; }
      .linked.vertical > infobar.error button:not(:last-child):not(:only-child):checked:hover, .linked.vertical > :not(:last-child):not(:only-child) infobar.error button:checked:hover, stackswitcher.vertical > infobar.error button:not(:last-child):not(:only-child):checked:hover {
        border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
        border-bottom-style: none;
        box-shadow: inset 0 -1px mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
    infobar.error button.flat {
      color: #1b1c36;
      border-color: rgba(175, 0, 0, 0);
      background-color: rgba(175, 0, 0, 0);
      background-image: none;
      box-shadow: none; }
    infobar.error button:hover, infobar.error button.flat:hover {
      background-color: #b80000;
      background-image: none;
      border-color: rgba(22, 22, 43, 0.4);
      color: #1b1c36;
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.32); }
      infobar.error button:hover:focus, infobar.error button:hover:hover, infobar.error button.flat:hover:focus, infobar.error button.flat:hover:hover {
        border-color: mix(#30365f,rgba(27, 28, 54, 0.4),0.3); }
      infobar.error button:hover:active, infobar.error button:hover:active:focus, infobar.error button.flat:hover:active:focus, infobar.error button:hover:checked, infobar.error button:hover:checked:focus, infobar.error button.flat:hover:checked:focus, infobar.error button.flat:hover:active, infobar.error button.flat:hover:active:hover:focus, infobar.error button.flat:hover:checked, infobar.error button.flat:hover:checked:hover:focus {
        border-color: rgba(19, 20, 38, 0.4); }
      infobar.error button:hover:disabled, infobar.error button.flat:hover:disabled {
        border-color: rgba(23, 24, 46, 0.4); }
      infobar.error button:hover:active:disabled, infobar.error button:hover:checked:disabled, infobar.error button.flat:hover:active:disabled, infobar.error button.flat:hover:checked:disabled {
        border-color: rgba(22, 22, 43, 0.4); }
    infobar.error button:focus, infobar.error button.flat:focus {
      background-color: #b80000;
      background-image: none;
      border-color: rgba(27, 28, 54, 0.32);
      outline-color: rgba(48, 54, 95, 0.5);
      outline-width: 3px;
      outline-style: solid;
      outline-offset: 10px;
      color: #1b1c36;
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
      infobar.error button:focus:hover, infobar.error button.flat:focus:hover {
        background-color: #c10000;
        background-image: none;
        border-color: rgba(22, 22, 43, 0.4);
        box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.48); }
        infobar.error button:focus:hover:hover, infobar.error button.flat:focus:hover:hover {
          border-color: mix(#30365f,rgba(27, 28, 54, 0.4),0.3); }
        infobar.error button:focus:hover:active, infobar.error button.flat:focus:hover:active, infobar.error button.flat:focus:hover:active:focus, infobar.error button:focus:hover:checked, infobar.error button.flat:focus:hover:checked, infobar.error button.flat:focus:hover:checked:focus, infobar.error button.flat:focus:hover:active:hover:focus, infobar.error button.flat:focus:hover:checked:hover:focus {
          border-color: rgba(19, 20, 38, 0.4); }
        infobar.error button:focus:hover:disabled, infobar.error button.flat:focus:hover:disabled {
          border-color: rgba(23, 24, 46, 0.4); }
        infobar.error button:focus:hover:active:disabled, infobar.error button:focus:hover:checked:disabled, infobar.error button.flat:focus:hover:active:disabled, infobar.error button.flat:focus:hover:checked:disabled {
          border-color: rgba(22, 22, 43, 0.4); }
    infobar.error button:checked, infobar.error button:active, infobar.error button.flat:checked, infobar.error button.flat:active {
      /*@include linear-gradient(shade($bg, .7), to top);*/
      background-color: #30365f;
      background-image: none;
      border-color: rgba(22, 22, 43, 0.32);
      color: #ffffff;
      box-shadow: inset 1px 0 rgba(27, 28, 54, 0.06), inset 0 1px rgba(27, 28, 54, 0.07), inset -1px 0 rgba(27, 28, 54, 0.06), inset 0 -1px rgba(27, 28, 54, 0.05); }
      infobar.error button:checked:focus, infobar.error button:checked:hover, infobar.error button:active:focus, infobar.error button:active:hover, infobar.error button.flat:checked:focus, infobar.error button.flat:checked:hover, infobar.error button.flat:active:focus, infobar.error button.flat:active:hover {
        border-color: mix(#30365f,rgba(27, 28, 54, 0.32),0.3); }
      infobar.error button:active:checked, infobar.error button:active:checked:hover, infobar.error button:active:checked:focus, infobar.error button:active:checked:hover:focus, infobar.error button.flat:active:checked, infobar.error button.flat:active:checked:hover, infobar.error button.flat:active:checked:focus, infobar.error button.flat:active:checked:hover:focus {
        border-color: rgba(19, 20, 38, 0.32); }
      infobar.error button:checked:disabled, infobar.error button:active:disabled, infobar.error button.flat:checked:disabled, infobar.error button.flat:active:disabled {
        border-color: rgba(23, 24, 46, 0.32); }
      infobar.error button:active:checked:disabled, infobar.error button.flat:active:checked:disabled {
        border-color: rgba(22, 22, 43, 0.32); }
      infobar.error button:checked:focus, infobar.error button:checked:hover, infobar.error button:active:focus, infobar.error button:active:hover, infobar.error button.flat:checked:focus, infobar.error button.flat:checked:hover, infobar.error button.flat:active:focus, infobar.error button.flat:active:hover {
        /*@include linear-gradient(shade($bg, .65), to top);*/
        background-color: #323964;
        background-image: none;
        color: #ffffff; }
    infobar.error button:focus, infobar.error button:hover, infobar.error button.flat:focus, infobar.error button.flat:hover {
      color: #1b1c36; }
    infobar.error button:disabled:disabled, infobar.error button.flat:disabled:disabled {
      background-color: alpha(mix(#af0000,#1b1c36,0.2),0.4);
      background-image: none;
      /*border: 1px solid alpha($bg, .2);*/
      opacity: .6;
      color: mix(#af0000,#1b1c36,0.6);
      box-shadow: none; }
      infobar.error button:disabled:disabled :disabled, infobar.error button.flat:disabled:disabled :disabled {
        color: mix(#af0000,#1b1c36,0.6); }
    infobar.error button:active:disabled, infobar.error button:checked:disabled, infobar.error button.flat:active:disabled, infobar.error button.flat:checked:disabled {
      background-color: rgba(48, 54, 95, 0.6);
      background-image: none;
      color: rgba(255, 255, 255, 0.85);
      box-shadow: none; }
      infobar.error button:active:disabled :disabled, infobar.error button:checked:disabled :disabled, infobar.error button.flat:active:disabled :disabled, infobar.error button.flat:checked:disabled :disabled {
        color: rgba(255, 255, 255, 0.85); }
    infobar.error button:backdrop, infobar.error button.flat:backdrop {
      color: mix(#ffffff,mix(#ffffff,#1b1c36,0.5),0.8); }
    infobar.error button.separator, infobar.error button .separator {
      border: 1px solid currentColor;
      color: rgba(175, 0, 0, 0.9); }
      infobar.error button.separator:disabled, infobar.error button .separator:disabled {
        color: rgba(175, 0, 0, 0.85); }
    infobar.error button separator, infobar.error button.nautilus-circular-button.image-button separator {
      background-image: image(mix(#1b1c36,#af0000,0.9)); }

/*********
 ! Entry *
**********/
.linked:not(.vertical) > entry {
  border-width: 1px;
  border-radius: 0;
  border-right-width: 0;
  border-left-width: 0; }
  .linked:not(.vertical) > entry:first-child {
    border-width: 1px;
    border-radius: 8px;
    border-right-width: 0;
    border-bottom-right-radius: 0;
    border-top-right-radius: 0; }
    .linked:not(.vertical) > entry:first-child:dir(rtl) {
      border-left-width: 0;
      border-right-width: 1px; }
  .linked:not(.vertical) > entry:last-child {
    border-width: 1px;
    border-radius: 8px;
    border-left-width: 0;
    border-bottom-left-radius: 0;
    border-top-left-radius: 0; }
    .linked:not(.vertical) > entry:last-child:dir(rtl) {
      border-left-width: 1px;
      border-right-width: 0; }
  .linked:not(.vertical) > entry:only-child {
    border-width: 1px; }
  .linked:not(.vertical) > entry:only-child {
    border-radius: 8px; }

.linked.vertical > entry {
  border-width: 1px;
  border-radius: 0;
  border-top-width: 0;
  border-bottom-width: 0; }
  .linked.vertical > entry:first-child {
    border-width: 1px;
    border-radius: 8px;
    border-top-width: 1px;
    border-bottom-width: 0;
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0; }
    .linked.vertical > entry:first-child:dir(rtl) {
      border-top-width: 0;
      border-bottom-width: 1px; }
  .linked.vertical > entry:last-child {
    border-width: 1px;
    border-radius: 8px;
    border-top-width: 0;
    border-bottom-width: 1px;
    border-top-left-radius: 0;
    border-top-right-radius: 0; }
    .linked.vertical > entry:last-child:dir(rtl) {
      border-top-width: 1px;
      border-bottom-width: 0; }
  .linked.vertical > entry:only-child {
    border-width: 1px; }
  .linked.vertical > entry:only-child {
    border-radius: 8px; }

#login_window entry, .osd entry,
#XfceNotifyWindow entry, popover.background entry, menuitem entry, entry {
  border-width: 1px;
  border-style: solid;
  border-radius: 8px;
  transition: border 100ms ease-out;
  box-shadow: inset 1px 0 rgba(51, 51, 51, 0.1), inset 0 1px rgba(51, 51, 51, 0.12), inset -1px 0 rgba(51, 51, 51, 0.1), inset 0 -1px rgba(51, 51, 51, 0.05); }
  #login_window entry:focus,
  #XfceNotifyWindow entry:focus, popover.background entry:focus, entry:focus, #login_window entry:hover,
  #XfceNotifyWindow entry:hover, popover.background entry:hover, entry:hover, #login_window entry:active,
  #XfceNotifyWindow entry:active, popover.background entry:active, entry:active {
    transition: border 100ms ease-in; }
  #login_window entry:selected,
  #XfceNotifyWindow entry:selected, popover.background entry:selected, entry:selected {
    background-color: #30365f;
    color: #ffffff; }
  #login_window entry:disabled,
  #XfceNotifyWindow entry:disabled, popover.background entry:disabled, entry:disabled {
    box-shadow: none; }
  #login_window entry progress, .osd entry progress,
  #XfceNotifyWindow entry progress, popover.background entry progress, entry progress {
    background-color: #30365f;
    background-image: none;
    border-width: 0;
    border-radius: 8px;
    color: #ffffff; }
  #login_window entry image.left,
  #XfceNotifyWindow entry image.left, entry image.left {
    padding-right: 4px; }
  #login_window entry image.right,
  #XfceNotifyWindow entry image.right, entry image.right {
    padding-left: 4px; }
  #login_window entry.warning,
  #XfceNotifyWindow entry.warning, popover.background entry.warning, entry.warning {
    color: #1b1c36;
    border-color: #8c9100;
    background-color: mix(#1b1c36,#afb500,0.6); }
    #login_window entry.warning image,
    #XfceNotifyWindow entry.warning image, entry.warning image {
      color: #1b1c36; }
    #login_window entry.warning:focus,
    #XfceNotifyWindow entry.warning:focus, entry.warning:focus {
      color: #1b1c36;
      border-color: mix(#30365f,#afb500,0.3);
      background-color: #afb500;
      box-shadow: none; }
    #login_window entry.warning selection,
    #XfceNotifyWindow entry.warning selection, entry.warning selection {
      background-color: #1b1c36;
      color: #afb500; }
  #login_window entry.error,
  #XfceNotifyWindow entry.error, popover.background entry.error, entry.error {
    color: #1b1c36;
    border-color: #8c0000;
    background-color: mix(#1b1c36,#af0000,0.6); }
    #login_window entry.error image,
    #XfceNotifyWindow entry.error image, entry.error image {
      color: #1b1c36; }
    #login_window entry.error:focus,
    #XfceNotifyWindow entry.error:focus, entry.error:focus {
      color: #1b1c36;
      border-color: mix(#30365f,#af0000,0.3);
      background-color: #af0000;
      box-shadow: none; }
    #login_window entry.error selection,
    #XfceNotifyWindow entry.error selection, entry.error selection {
      background-color: #1b1c36;
      color: #af0000; }
  #login_window entry.search-missing,
  #XfceNotifyWindow entry.search-missing, popover.background entry.search-missing, entry.search-missing {
    color: #1b1c36;
    border-color: #8c0000;
    background-color: mix(#1b1c36,#af0000,0.6); }
    #login_window entry.search-missing image,
    #XfceNotifyWindow entry.search-missing image, entry.search-missing image {
      color: #1b1c36; }
    #login_window entry.search-missing:focus,
    #XfceNotifyWindow entry.search-missing:focus, entry.search-missing:focus {
      color: #1b1c36;
      border-color: mix(#30365f,#af0000,0.3);
      background-color: #af0000;
      box-shadow: none; }
    #login_window entry.search-missing selection,
    #XfceNotifyWindow entry.search-missing selection, entry.search-missing selection {
      background-color: #1b1c36;
      color: #af0000; }

/*********
 ! Menubar
**********/
menubar, .menubar {
  -GtkWidget-window-dragging: true;
  padding: 0;
  border: 0;
  background-color: #16172d;
  background-image: none;
  color: #ffffff; }
  menubar > menuitem, .menubar > menuitem {
    min-height: 18px;
    padding: 6px 8px;
    border: 1px solid transparent;
    background-color: transparent;
    background-image: none;
    color: #ffffff; }
    menubar > menuitem:hover, .menubar > menuitem:hover {
      border-color: mix(#16172d,#ffffff,0.21);
      background-color: mix(#16172d,#ffffff,0.21);
      background-image: none;
      color: white; }
    menubar > menuitem *:hover, .menubar > menuitem *:hover {
      color: white; }

/******
 ! Menu
*******/
menu,
.menu,
.context-menu {
  border-radius: 0;
  padding: 4px;
  background-color: #16172d;
  color: #ffffff;
  border: 1px solid mix(#16172d,#ffffff,0.21); }
  .csd menu, .csd .menu, .csd .context-menu {
    border: 0; }
  menu:selected,
  .menu:selected,
  .context-menu:selected {
    background-color: #30365f;
    color: #ffffff; }
  menu separator, .csd menu separator,
  .menu separator, .csd .menu separator,
  .context-menu separator, .csd .context-menu separator {
    background-image: image(mix(#16172d,#ffffff,0.18));
    margin: 2px 0; }
  menu .separator, .csd menu .separator,
  .menu .separator, .csd .menu .separator,
  .context-menu .separator, .csd .context-menu .separator {
    color: mix(#16172d,#ffffff,0.18); }
  menu menuitem,
  .menu menuitem,
  .context-menu menuitem {
    min-height: 18px;
    min-width: 40px;
    padding: 6px;
    border-radius: 0; }
    menu menuitem:active, menu menuitem:hover,
    .menu menuitem:active,
    .menu menuitem:hover,
    .context-menu menuitem:active,
    .context-menu menuitem:hover {
      border: 0;
      background-color: #30365f;
      background-image: none;
      color: #ffffff; }
      menu menuitem:active accelerator, menu menuitem:hover accelerator,
      .menu menuitem:active accelerator,
      .menu menuitem:hover accelerator,
      .context-menu menuitem:active accelerator,
      .context-menu menuitem:hover accelerator {
        color: rgba(255, 255, 255, 0.6); }
    menu menuitem *:active, menu menuitem *:hover,
    .menu menuitem *:active,
    .menu menuitem *:hover,
    .context-menu menuitem *:active,
    .context-menu menuitem *:hover {
      color: #ffffff; }
    menu menuitem:disabled, menu menuitem *:disabled,
    .menu menuitem:disabled,
    .menu menuitem *:disabled,
    .context-menu menuitem:disabled,
    .context-menu menuitem *:disabled {
      color: mix(#ffffff,#16172d,0.5); }
    menu menuitem arrow,
    .menu menuitem arrow,
    .context-menu menuitem arrow {
      min-height: 16px;
      min-width: 16px; }
      menu menuitem arrow:dir(ltr),
      .menu menuitem arrow:dir(ltr),
      .context-menu menuitem arrow:dir(ltr) {
        -gtk-icon-source: -gtk-icontheme("pan-end-symbolic");
        margin-left: 10px; }
      menu menuitem arrow:dir(rtl),
      .menu menuitem arrow:dir(rtl),
      .context-menu menuitem arrow:dir(rtl) {
        -gtk-icon-source: -gtk-icontheme("pan-end-symbolic-rtl");
        margin-right: 10px; }
    menu menuitem.button, menu menuitem.button:focus, menu menuitem.button:active, menu menuitem.button:disabled, menu menuitem.button:active:disabled, menu menuitem.button.flat, menu menuitem.button.flat:focus, menu menuitem.button.flat:active, menu menuitem.button.flat:disabled, menu menuitem.button.flat:active:disabled,
    .menu menuitem.button,
    .menu menuitem.button:focus,
    .menu menuitem.button:active,
    .menu menuitem.button:disabled,
    .menu menuitem.button:active:disabled,
    .menu menuitem.button.flat,
    .menu menuitem.button.flat:focus,
    .menu menuitem.button.flat:active,
    .menu menuitem.button.flat:disabled,
    .menu menuitem.button.flat:active:disabled,
    .context-menu menuitem.button,
    .context-menu menuitem.button:focus,
    .context-menu menuitem.button:active,
    .context-menu menuitem.button:disabled,
    .context-menu menuitem.button:active:disabled,
    .context-menu menuitem.button.flat,
    .context-menu menuitem.button.flat:focus,
    .context-menu menuitem.button.flat:active,
    .context-menu menuitem.button.flat:disabled,
    .context-menu menuitem.button.flat:active:disabled {
      background-color: transparent;
      background-image: none;
      border: 0;
      box-shadow: none;
      color: currentColor; }
    menu menuitem.button:hover, menu menuitem.button:focus:hover, menu menuitem.button:active:hover, menu menuitem.button:selected, menu menuitem.button.flat:hover, menu menuitem.button.flat:focus:hover, menu menuitem.button.flat:active:hover, menu menuitem.button.flat:selected,
    .menu menuitem.button:hover,
    .menu menuitem.button:focus:hover,
    .menu menuitem.button:active:hover,
    .menu menuitem.button:selected,
    .menu menuitem.button.flat:hover,
    .menu menuitem.button.flat:focus:hover,
    .menu menuitem.button.flat:active:hover,
    .menu menuitem.button.flat:selected,
    .context-menu menuitem.button:hover,
    .context-menu menuitem.button:focus:hover,
    .context-menu menuitem.button:active:hover,
    .context-menu menuitem.button:selected,
    .context-menu menuitem.button.flat:hover,
    .context-menu menuitem.button.flat:focus:hover,
    .context-menu menuitem.button.flat:active:hover,
    .context-menu menuitem.button.flat:selected {
      background-image: none;
      background-color: #30365f;
      color: #ffffff; }
    menu menuitem calendar,
    .menu menuitem calendar,
    .context-menu menuitem calendar {
      color: #ffffff; }
      menu menuitem calendar.header,
      .menu menuitem calendar.header,
      .context-menu menuitem calendar.header {
        border-bottom: 1px solid #141529;
        border-radius: 0; }
        menu menuitem calendar.header:backdrop,
        .menu menuitem calendar.header:backdrop,
        .context-menu menuitem calendar.header:backdrop {
          border-color: #141529; }
      menu menuitem calendar.button,
      .menu menuitem calendar.button,
      .context-menu menuitem calendar.button {
        color: rgba(255, 255, 255, 0.55); }
        menu menuitem calendar.button:hover,
        .menu menuitem calendar.button:hover,
        .context-menu menuitem calendar.button:hover {
          color: #ffffff; }
      menu menuitem calendar:indeterminate, menu menuitem calendar:indeterminate:backdrop,
      .menu menuitem calendar:indeterminate,
      .menu menuitem calendar:indeterminate:backdrop,
      .context-menu menuitem calendar:indeterminate,
      .context-menu menuitem calendar:indeterminate:backdrop {
        color: mix(#ffffff,#16172d,0.5); }
    menu menuitem label:dir(rtl), menu menuitem label:dir(ltr),
    .menu menuitem label:dir(rtl),
    .menu menuitem label:dir(ltr),
    .context-menu menuitem label:dir(rtl),
    .context-menu menuitem label:dir(ltr) {
      color: inherit; }
  menu > arrow,
  .menu > arrow,
  .context-menu > arrow {
    min-height: 16px;
    min-width: 16px;
    padding: 4px;
    background-color: #16172d;
    border-radius: 0; }
    menu > arrow.top,
    .menu > arrow.top,
    .context-menu > arrow.top {
      margin-top: -6px;
      border-bottom: 1px solid mix(#16172d,#ffffff,0.18);
      -gtk-icon-source: -gtk-icontheme("pan-up-symbolic"); }
    menu > arrow.bottom,
    .menu > arrow.bottom,
    .context-menu > arrow.bottom {
      margin-bottom: -6px;
      border-top: 1px solid mix(#16172d,#ffffff,0.18);
      -gtk-icon-source: -gtk-icontheme("pan-down-symbolic"); }
    menu > arrow:hover,
    .menu > arrow:hover,
    .context-menu > arrow:hover {
      background-color: mix(#16172d,#ffffff,0.1); }
    menu > arrow:backdrop,
    .menu > arrow:backdrop,
    .context-menu > arrow:backdrop {
      background-color: #1b1c36; }
    menu > arrow:disabled,
    .menu > arrow:disabled,
    .context-menu > arrow:disabled {
      color: transparent;
      background-color: transparent;
      border-color: transparent; }

.context-menu {
  font: initial; }

.monospace {
  font-family: monospace; }

menuitem accelerator {
  color: rgba(255, 255, 255, 0.6); }
  menuitem accelerator:hover {
    color: rgba(255, 255, 255, 0.8); }
  menuitem accelerator:disabled {
    color: alpha(mix(#ffffff,#16172d,0.5),0.4); }

menuitem check, menuitem radio {
  min-height: 16px;
  min-width: 16px; }
  menuitem check:dir(ltr), menuitem radio:dir(ltr) {
    margin-right: 7px; }
  menuitem check:dir(rtl), menuitem radio:dir(rtl) {
    margin-left: 7px; }

menuitem window decoration {
  box-shadow: 0 2px 3px rgba(102, 102, 102, 0.2); }

menuitem entry {
  background-color: #16172d;
  background-image: none;
  border-color: mix(#ffffff,#16172d,0.8);
  padding: 6px 6.2857142857px;
  color: #ffffff;
  caret-color: #c1c3cc;
  -gtk-secondary-caret-color: #ff0007; }
  menuitem entry:focus, menuitem entry:hover {
    border-color: mix(#30365f,mix(#ffffff,#16172d,0.7),0.3); }
  menuitem entry:active, menuitem entry:active:hover, menuitem entry:active:focus, menuitem entry:active:hover:focus, menuitem entry:checked, menuitem entry:checked:hover, menuitem entry:checked:focus, menuitem entry:checked:hover:focus {
    border-color: mix(#ffffff,#16172d,0.32); }
  menuitem entry:disabled {
    border-color: mix(#ffffff,#16172d,0.84); }
  menuitem entry:active:disabled, menuitem entry:checked:disabled {
    border-color: mix(#ffffff,#16172d,0.8); }
  menuitem entry:focus, menuitem entry:active {
    border-color: mix(#30365f,mix(#1b1c36,#ffffff,0.18),0.3); }
  menuitem entry:disabled {
    background-color: mix(#16172d,#ffffff,0.07);
    background-image: none;
    opacity: .9;
    color: mix(#16172d,#ffffff,0.9); }

/*********
 ! Popover
**********/
popover.background {
  padding: 1px;
  border-radius: 8px;
  background-clip: border-box;
  background-color: #16172d;
  background-image: none;
  color: #ffffff;
  box-shadow: 0 3px 6px rgba(102, 102, 102, 0.16); }
  .csd popover.background, popover.background {
    border-color: mix(#ffffff,#16172d,0.64);
    border-width: 1px;
    border-style: solid; }
    .csd popover.background:focus, .csd popover.background:hover, popover.background:focus, popover.background:hover {
      border-color: mix(#30365f,mix(#ffffff,#16172d,0.5),0.3); }
    .csd popover.background:active, .csd popover.background:active:hover, .csd popover.background:active:focus, .csd popover.background:active:hover:focus, .csd popover.background:checked, .csd popover.background:checked:hover, .csd popover.background:checked:focus, .csd popover.background:checked:hover:focus, popover.background:active, popover.background:active:hover, popover.background:active:focus, popover.background:active:hover:focus, popover.background:checked, popover.background:checked:hover, popover.background:checked:focus, popover.background:checked:hover:focus {
      border-color: mix(#ffffff,#16172d,0.16); }
    .csd popover.background:disabled, popover.background:disabled {
      border-color: mix(#ffffff,#16172d,0.68); }
    .csd popover.background:active:disabled, .csd popover.background:checked:disabled, popover.background:active:disabled, popover.background:checked:disabled {
      border-color: mix(#ffffff,#16172d,0.64); }
  popover.background:backdrop {
    box-shadow: none; }
  popover.background treeview.view:hover, popover.background treeview.view:selected, popover.background treeview.view:selected:focus, popover.background treeview.view:backdrop:selected, popover.background treeview.view:backdrop:selected:focus {
    border-top-color: #30365f; }
  popover.background treeview.view, popover.background treeview.view:backdrop {
    border-top-color: #1a1c36; }
  popover.background view:hover, popover.background .view:hover, popover.background iconview:hover, popover.background list:hover {
    background-image: none;
    background-color: #30365f;
    color: #ffffff; }
  popover.background view, popover.background view:backdrop, popover.background .view, popover.background iconview, popover.background .view:backdrop, popover.background list, popover.background list:backdrop {
    background-color: mix(#16172d,#ffffff,1.3);
    background-image: none;
    color: #ffffff;
    border-color: mix(#ffffff,#16172d,0.8); }
  popover.background list row, popover.background list row .button {
    background-color: transparent;
    background-image: none;
    color: #ffffff; }
    popover.background list row:focus, popover.background list row:hover, popover.background list row:active, popover.background list row .button:focus, popover.background list row .button:hover, popover.background list row .button:active {
      background-image: none;
      background-color: #30365f;
      color: #ffffff; }
  popover.background .frame {
    border-color: mix(#ffffff,#16172d,0.8);
    border-radius: 8px; }
  popover.background entry {
    background-color: #1b1c36;
    background-image: none;
    border-color: mix(#c1c3cc,#1b1c36,0.8);
    padding: 6px 6.2857142857px;
    color: #c1c3cc;
    caret-color: #c1c3cc;
    -gtk-secondary-caret-color: #ff0007; }
    popover.background entry:focus, popover.background entry:hover {
      border-color: mix(#30365f,mix(#c1c3cc,#1b1c36,0.7),0.3); }
    popover.background entry:active, popover.background entry:active:hover, popover.background entry:active:focus, popover.background entry:active:hover:focus, popover.background entry:checked, popover.background entry:checked:hover, popover.background entry:checked:focus, popover.background entry:checked:hover:focus {
      border-color: mix(#c1c3cc,#1b1c36,0.32); }
    popover.background entry:disabled {
      border-color: mix(#c1c3cc,#1b1c36,0.84); }
    popover.background entry:active:disabled, popover.background entry:checked:disabled {
      border-color: mix(#c1c3cc,#1b1c36,0.8); }
    popover.background entry:focus, popover.background entry:active {
      border-color: mix(#30365f,mix(#1b1c36,#ffffff,0.18),0.3); }
    popover.background entry:disabled {
      background-color: mix(#1b1c36,#c1c3cc,0.07);
      background-image: none;
      opacity: .9;
      color: mix(#1b1c36,#c1c3cc,0.9); }
  popover.background button, popover.background button.nautilus-circular-button.image-button {
    background-color: #30365f;
    background-image: none;
    border-color: rgba(157, 173, 193, 0.22);
    color: #d3dae3;
    box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22); }
    popover.background button:focus, popover.background button:hover {
      border-color: mix(#30365f,rgba(211, 218, 227, 0.22),0.3); }
    popover.background button:active, popover.background button:active:hover, popover.background button:active:focus, popover.background button:active:hover:focus, popover.background button:checked, popover.background button:checked:hover, popover.background button:checked:focus, popover.background button:checked:hover:focus {
      border-color: rgba(131, 150, 176, 0.22); }
    popover.background button:disabled {
      border-color: rgba(171, 184, 201, 0.22); }
    popover.background button:active:disabled, popover.background button:checked:disabled {
      border-color: rgba(157, 173, 193, 0.22); }
    .linked:not(.vertical) > popover.background button:not(:last-child):not(:only-child), .linked:not(.vertical) > :not(:last-child):not(:only-child) popover.background button, viewswitcher:not(.vertical) > popover.background button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > popover.background button:not(:last-child):not(:only-child) {
      border-right-style: none; }
      .linked:not(.vertical) > popover.background button:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) popover.background button:hover, viewswitcher:not(.vertical) > popover.background button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > popover.background button:not(:last-child):not(:only-child):hover {
        border-color: mix(#30365f,rgba(211, 218, 227, 0.36),0.3);
        border-right-style: none;
        box-shadow: inset-1px 0 0 mix(#30365f,rgba(211, 218, 227, 0.36),0.3); }
    .linked:not(.vertical) > popover.background button:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > :not(:last-child):not(:only-child) popover.background button:checked, viewswitcher:not(.vertical) > popover.background button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > popover.background button:not(:last-child):not(:only-child):checked {
      border-right-style: none; }
      .linked:not(.vertical) > popover.background button:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) popover.background button:checked:hover, viewswitcher:not(.vertical) > popover.background button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > popover.background button:not(:last-child):not(:only-child):checked:hover {
        border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
        border-right-style: none;
        box-shadow: inset-1px 0 0 mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
    .linked.vertical > popover.background button:not(:last-child):not(:only-child), .linked.vertical > :not(:last-child):not(:only-child) popover.background button, stackswitcher.vertical > popover.background button:not(:last-child):not(:only-child) {
      border-bottom-style: none; }
      .linked.vertical > popover.background button:not(:last-child):not(:only-child):hover, .linked.vertical > :not(:last-child):not(:only-child) popover.background button:hover, stackswitcher.vertical > popover.background button:not(:last-child):not(:only-child):hover {
        border-color: mix(#30365f,rgba(211, 218, 227, 0.36),0.3);
        border-bottom-style: none;
        box-shadow: inset 0 -1px mix(#30365f,rgba(211, 218, 227, 0.36),0.3); }
    .linked.vertical > popover.background button:not(:last-child):not(:only-child):checked, .linked.vertical > :not(:last-child):not(:only-child) popover.background button:checked, stackswitcher.vertical > popover.background button:not(:last-child):not(:only-child):checked {
      border-bottom-style: none; }
      .linked.vertical > popover.background button:not(:last-child):not(:only-child):checked:hover, .linked.vertical > :not(:last-child):not(:only-child) popover.background button:checked:hover, stackswitcher.vertical > popover.background button:not(:last-child):not(:only-child):checked:hover {
        border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
        border-bottom-style: none;
        box-shadow: inset 0 -1px mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
    popover.background button.flat {
      color: #d3dae3;
      border-color: rgba(48, 54, 95, 0);
      background-color: rgba(48, 54, 95, 0);
      background-image: none;
      box-shadow: none; }
    popover.background button:hover, popover.background button.flat:hover {
      background-color: #323964;
      background-image: none;
      border-color: rgba(157, 173, 193, 0.3);
      color: #d3dae3;
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.32); }
      popover.background button:hover:focus, popover.background button:hover:hover, popover.background button.flat:hover:focus, popover.background button.flat:hover:hover {
        border-color: mix(#30365f,rgba(211, 218, 227, 0.3),0.3); }
      popover.background button:hover:active, popover.background button:hover:active:focus, popover.background button.flat:hover:active:focus, popover.background button:hover:checked, popover.background button:hover:checked:focus, popover.background button.flat:hover:checked:focus, popover.background button.flat:hover:active, popover.background button.flat:hover:active:hover:focus, popover.background button.flat:hover:checked, popover.background button.flat:hover:checked:hover:focus {
        border-color: rgba(131, 150, 176, 0.3); }
      popover.background button:hover:disabled, popover.background button.flat:hover:disabled {
        border-color: rgba(171, 184, 201, 0.3); }
      popover.background button:hover:active:disabled, popover.background button:hover:checked:disabled, popover.background button.flat:hover:active:disabled, popover.background button.flat:hover:checked:disabled {
        border-color: rgba(157, 173, 193, 0.3); }
    popover.background button:focus, popover.background button.flat:focus {
      background-color: #323964;
      background-image: none;
      border-color: rgba(211, 218, 227, 0.22);
      outline-color: rgba(48, 54, 95, 0.5);
      outline-width: 3px;
      outline-style: solid;
      outline-offset: 10px;
      color: #d3dae3;
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
      popover.background button:focus:hover, popover.background button.flat:focus:hover {
        background-color: #353b69;
        background-image: none;
        border-color: rgba(157, 173, 193, 0.3);
        box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.48); }
        popover.background button:focus:hover:hover, popover.background button.flat:focus:hover:hover {
          border-color: mix(#30365f,rgba(211, 218, 227, 0.3),0.3); }
        popover.background button:focus:hover:active, popover.background button.flat:focus:hover:active, popover.background button.flat:focus:hover:active:focus, popover.background button:focus:hover:checked, popover.background button.flat:focus:hover:checked, popover.background button.flat:focus:hover:checked:focus, popover.background button.flat:focus:hover:active:hover:focus, popover.background button.flat:focus:hover:checked:hover:focus {
          border-color: rgba(131, 150, 176, 0.3); }
        popover.background button:focus:hover:disabled, popover.background button.flat:focus:hover:disabled {
          border-color: rgba(171, 184, 201, 0.3); }
        popover.background button:focus:hover:active:disabled, popover.background button:focus:hover:checked:disabled, popover.background button.flat:focus:hover:active:disabled, popover.background button.flat:focus:hover:checked:disabled {
          border-color: rgba(157, 173, 193, 0.3); }
    popover.background button:checked, popover.background button:active, popover.background button.flat:checked, popover.background button.flat:active {
      /*@include linear-gradient(shade($bg, .7), to top);*/
      background-color: #30365f;
      background-image: none;
      border-color: rgba(157, 173, 193, 0.22);
      color: #ffffff;
      box-shadow: inset 1px 0 rgba(211, 218, 227, 0.06), inset 0 1px rgba(211, 218, 227, 0.07), inset -1px 0 rgba(211, 218, 227, 0.06), inset 0 -1px rgba(211, 218, 227, 0.05); }
      popover.background button:checked:focus, popover.background button:checked:hover, popover.background button:active:focus, popover.background button:active:hover, popover.background button.flat:checked:focus, popover.background button.flat:checked:hover, popover.background button.flat:active:focus, popover.background button.flat:active:hover {
        border-color: mix(#30365f,rgba(211, 218, 227, 0.22),0.3); }
      popover.background button:active:checked, popover.background button:active:checked:hover, popover.background button:active:checked:focus, popover.background button:active:checked:hover:focus, popover.background button.flat:active:checked, popover.background button.flat:active:checked:hover, popover.background button.flat:active:checked:focus, popover.background button.flat:active:checked:hover:focus {
        border-color: rgba(131, 150, 176, 0.22); }
      popover.background button:checked:disabled, popover.background button:active:disabled, popover.background button.flat:checked:disabled, popover.background button.flat:active:disabled {
        border-color: rgba(171, 184, 201, 0.22); }
      popover.background button:active:checked:disabled, popover.background button.flat:active:checked:disabled {
        border-color: rgba(157, 173, 193, 0.22); }
      popover.background button:checked:focus, popover.background button:checked:hover, popover.background button:active:focus, popover.background button:active:hover, popover.background button.flat:checked:focus, popover.background button.flat:checked:hover, popover.background button.flat:active:focus, popover.background button.flat:active:hover {
        /*@include linear-gradient(shade($bg, .65), to top);*/
        background-color: #323964;
        background-image: none;
        color: #ffffff; }
    popover.background button:focus, popover.background button:hover, popover.background button.flat:focus, popover.background button.flat:hover {
      color: #d3dae3; }
    popover.background button:disabled:disabled, popover.background button.flat:disabled:disabled {
      background-color: alpha(mix(#30365f,#d3dae3,0.2),0.4);
      background-image: none;
      /*border: 1px solid alpha($bg, .2);*/
      opacity: .6;
      color: mix(#30365f,#d3dae3,0.6);
      box-shadow: none; }
      popover.background button:disabled:disabled :disabled, popover.background button.flat:disabled:disabled :disabled {
        color: mix(#30365f,#d3dae3,0.6); }
    popover.background button:active:disabled, popover.background button:checked:disabled, popover.background button.flat:active:disabled, popover.background button.flat:checked:disabled {
      background-color: rgba(48, 54, 95, 0.6);
      background-image: none;
      color: rgba(255, 255, 255, 0.85);
      box-shadow: none; }
      popover.background button:active:disabled :disabled, popover.background button:checked:disabled :disabled, popover.background button.flat:active:disabled :disabled, popover.background button.flat:checked:disabled :disabled {
        color: rgba(255, 255, 255, 0.85); }
    popover.background button:backdrop, popover.background button.flat:backdrop {
      color: mix(#ffffff,mix(#ffffff,#1b1c36,0.5),0.8); }
    popover.background button.separator, popover.background button .separator {
      border: 1px solid currentColor;
      color: rgba(48, 54, 95, 0.9); }
      popover.background button.separator:disabled, popover.background button .separator:disabled {
        color: rgba(48, 54, 95, 0.85); }
    popover.background button separator, popover.background button.nautilus-circular-button.image-button separator {
      background-image: image(mix(#d3dae3,#30365f,0.9)); }
    popover.background button.flat:not(:hover) {
      color: #ffffff; }
  popover.background .linked > button {
    box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22); }
    popover.background .linked > button:focus, popover.background .linked > button:hover {
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
    popover.background .linked > button:active, popover.background .linked > button:active:hover, popover.background .linked > button:active:focus, popover.background .linked > button:active:hover:focus, popover.background .linked > button:checked, popover.background .linked > button:checked:hover, popover.background .linked > button:checked:focus, popover.background .linked > button:checked:hover:focus {
      box-shadow: inset 0 1px rgba(51, 51, 51, 0.07), inset 0 -1px rgba(51, 51, 51, 0.05); }
    popover.background .linked > button:disabled {
      box-shadow: inset -1px 0 #262b4c; }
    popover.background .linked > button:last-child, popover.background .linked > button:only-child {
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22); }
    popover.background .linked > button:last-child:hover, popover.background .linked > button:only-child:hover {
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
    popover.background .linked > button:disabled:last-child, popover.background .linked > button:disabled:only-child, popover.background .linked > button:active:disabled:last-child, popover.background .linked > button:active:disabled:only-child, popover.background .linked > button:checked:disabled:last-child, popover.background .linked > button:checked:disabled:only-child {
      box-shadow: none; }
    popover.background .linked > button:active:last-child, popover.background .linked > button:active:last-child:focus, popover.background .linked > button:active:last-child:hover, popover.background .linked > button:active:last-child:hover:focus, popover.background .linked > button:checked:last-child, popover.background .linked > button:checked:last-child:focus, popover.background .linked > button:checked:last-child:hover, popover.background .linked > button:checked:last-child:hover:focus {
      box-shadow: inset 0 1px rgba(51, 51, 51, 0.07), inset -1px 0 rgba(51, 51, 51, 0.06); }
    popover.background .linked > button:active:only-child, popover.background .linked > button:active:only-child:focus, popover.background .linked > button:active:only-child:hover, popover.background .linked > button:active:only-child:hover:focus, popover.background .linked > button:checked:only-child, popover.background .linked > button:checked:only-child:focus, popover.background .linked > button:checked:only-child:hover, popover.background .linked > button:checked:only-child:hover:focus {
      box-shadow: inset 1px 0 rgba(51, 51, 51, 0.06), inset 0 1px rgba(51, 51, 51, 0.07), inset -1px 0 rgba(51, 51, 51, 0.06); }
  popover.background > list, popover.background > .view, popover.background > iconview, popover.background > toolbar {
    border-style: none;
    background-color: transparent; }

modelbutton.flat,
menuitem.button.flat {
  padding: 4px;
  padding-left: 8px;
  transition: none; }
  modelbutton.flat:hover,
  menuitem.button.flat:hover {
    border-radius: 8px;
    background-color: #30365f;
    color: #ffffff; }
  modelbutton.flat:checked,
  menuitem.button.flat:checked {
    color: #ffffff; }
  modelbutton.flat arrow.left,
  menuitem.button.flat arrow.left {
    -gtk-icon-source: -gtk-icontheme("pan-start-symbolic"); }
  modelbutton.flat arrow.right,
  menuitem.button.flat arrow.right {
    -gtk-icon-source: -gtk-icontheme("pan-end-symbolic"); }
  modelbutton.flat check:last-child,
  modelbutton.flat radio:last-child,
  menuitem.button.flat check:last-child,
  menuitem.button.flat radio:last-child {
    margin-left: 8px; }
  modelbutton.flat check:first-child,
  modelbutton.flat radio:first-child,
  menuitem.button.flat check:first-child,
  menuitem.button.flat radio:first-child {
    margin-right: 8px; }

/***************
! Dimmed label *
****************/
.dim-label, label.separator {
  opacity: .5;
  text-shadow: none; }

/***********
 ! Tooltip *
************/
.tooltip.background, .tooltip.background.csd,
tooltip.background,
tooltip.background.csd {
  background-color: #1b1c36;
  background-clip: padding-box;
  border: 1px solid #16162b;
  border-radius: 8px;
  color: #ffffff; }

.tooltip *,
tooltip * {
  background-color: transparent;
  color: inherit; }

/***********
 ! Dialogs *
************/
messagedialog, .message-dialog, .prompt {
  -GtkDialog-content-area-border: 0;
  -GtkDialog-action-area-border: 0;
  -GtkDialog-button-spacing: 4px;
  margin: 0;
  padding: 0; }
  messagedialog .dialog-action-box, .message-dialog .dialog-action-box, .prompt .dialog-action-box {
    margin: 8px; }

printdialog paper {
  color: #ffffff;
  border: 1px solid mix(#1b1c36,#ffffff,0.18);
  background: #1c1d38;
  padding: 0; }
  printdialog paper:backdrop {
    color: mix(#ffffff,#1b1c36,0.5);
    border-color: mix(#1b1c36,mix(#1b1c36,#ffffff,0.18),0.9); }

printdialog .dialog-action-box {
  margin: 8px; }

/*********************
 ! App notifications *
**********************/
frame.app-notification {
  border-style: solid;
  border-color: rgba(18, 18, 36, 0.8);
  border-width: 0 1px 1px;
  border-radius: 0 0 8px 8px;
  padding: 8px;
  background-color: rgba(22, 23, 45, 0.8);
  background-image: none;
  color: #ffffff; }
  frame.app-notification button, frame.app-notification button.nautilus-circular-button.image-button {
    background-color: rgba(22, 23, 45, 0.8);
    background-image: none;
    border-color: rgba(204, 204, 204, 0.22);
    color: #ffffff;
    box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22); }
    frame.app-notification button:focus, frame.app-notification button:hover {
      border-color: mix(#30365f,rgba(255, 255, 255, 0.22),0.3); }
    frame.app-notification button:active, frame.app-notification button:active:hover, frame.app-notification button:active:focus, frame.app-notification button:active:hover:focus, frame.app-notification button:checked, frame.app-notification button:checked:hover, frame.app-notification button:checked:focus, frame.app-notification button:checked:hover:focus {
      border-color: rgba(179, 179, 179, 0.22); }
    frame.app-notification button:disabled {
      border-color: rgba(217, 217, 217, 0.22); }
    frame.app-notification button:active:disabled, frame.app-notification button:checked:disabled {
      border-color: rgba(204, 204, 204, 0.22); }
    .linked:not(.vertical) > frame.app-notification button:not(:last-child):not(:only-child), .linked:not(.vertical) > :not(:last-child):not(:only-child) frame.app-notification button, viewswitcher:not(.vertical) > frame.app-notification button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > frame.app-notification button:not(:last-child):not(:only-child) {
      border-right-style: none; }
      .linked:not(.vertical) > frame.app-notification button:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) frame.app-notification button:hover, viewswitcher:not(.vertical) > frame.app-notification button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > frame.app-notification button:not(:last-child):not(:only-child):hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.36),0.3);
        border-right-style: none;
        box-shadow: inset-1px 0 0 mix(#30365f,rgba(255, 255, 255, 0.36),0.3); }
    .linked:not(.vertical) > frame.app-notification button:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > :not(:last-child):not(:only-child) frame.app-notification button:checked, viewswitcher:not(.vertical) > frame.app-notification button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > frame.app-notification button:not(:last-child):not(:only-child):checked {
      border-right-style: none; }
      .linked:not(.vertical) > frame.app-notification button:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) frame.app-notification button:checked:hover, viewswitcher:not(.vertical) > frame.app-notification button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > frame.app-notification button:not(:last-child):not(:only-child):checked:hover {
        border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
        border-right-style: none;
        box-shadow: inset-1px 0 0 mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
    .linked.vertical > frame.app-notification button:not(:last-child):not(:only-child), .linked.vertical > :not(:last-child):not(:only-child) frame.app-notification button, stackswitcher.vertical > frame.app-notification button:not(:last-child):not(:only-child) {
      border-bottom-style: none; }
      .linked.vertical > frame.app-notification button:not(:last-child):not(:only-child):hover, .linked.vertical > :not(:last-child):not(:only-child) frame.app-notification button:hover, stackswitcher.vertical > frame.app-notification button:not(:last-child):not(:only-child):hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.36),0.3);
        border-bottom-style: none;
        box-shadow: inset 0 -1px mix(#30365f,rgba(255, 255, 255, 0.36),0.3); }
    .linked.vertical > frame.app-notification button:not(:last-child):not(:only-child):checked, .linked.vertical > :not(:last-child):not(:only-child) frame.app-notification button:checked, stackswitcher.vertical > frame.app-notification button:not(:last-child):not(:only-child):checked {
      border-bottom-style: none; }
      .linked.vertical > frame.app-notification button:not(:last-child):not(:only-child):checked:hover, .linked.vertical > :not(:last-child):not(:only-child) frame.app-notification button:checked:hover, stackswitcher.vertical > frame.app-notification button:not(:last-child):not(:only-child):checked:hover {
        border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
        border-bottom-style: none;
        box-shadow: inset 0 -1px mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
    frame.app-notification button.flat {
      color: #ffffff;
      border-color: rgba(22, 23, 45, 0);
      background-color: rgba(22, 23, 45, 0);
      background-image: none;
      box-shadow: none; }
    frame.app-notification button:hover, frame.app-notification button.flat:hover {
      background-color: rgba(23, 24, 47, 0.8);
      background-image: none;
      border-color: rgba(204, 204, 204, 0.3);
      color: #ffffff;
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.32); }
      frame.app-notification button:hover:focus, frame.app-notification button:hover:hover, frame.app-notification button.flat:hover:focus, frame.app-notification button.flat:hover:hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.3),0.3); }
      frame.app-notification button:hover:active, frame.app-notification button:hover:active:focus, frame.app-notification button.flat:hover:active:focus, frame.app-notification button:hover:checked, frame.app-notification button:hover:checked:focus, frame.app-notification button.flat:hover:checked:focus, frame.app-notification button.flat:hover:active, frame.app-notification button.flat:hover:active:hover:focus, frame.app-notification button.flat:hover:checked, frame.app-notification button.flat:hover:checked:hover:focus {
        border-color: rgba(179, 179, 179, 0.3); }
      frame.app-notification button:hover:disabled, frame.app-notification button.flat:hover:disabled {
        border-color: rgba(217, 217, 217, 0.3); }
      frame.app-notification button:hover:active:disabled, frame.app-notification button:hover:checked:disabled, frame.app-notification button.flat:hover:active:disabled, frame.app-notification button.flat:hover:checked:disabled {
        border-color: rgba(204, 204, 204, 0.3); }
    frame.app-notification button:focus, frame.app-notification button.flat:focus {
      background-color: rgba(23, 24, 47, 0.8);
      background-image: none;
      border-color: rgba(255, 255, 255, 0.22);
      outline-color: rgba(48, 54, 95, 0.5);
      outline-width: 3px;
      outline-style: solid;
      outline-offset: 10px;
      color: #ffffff;
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
      frame.app-notification button:focus:hover, frame.app-notification button.flat:focus:hover {
        background-color: rgba(24, 25, 50, 0.8);
        background-image: none;
        border-color: rgba(204, 204, 204, 0.3);
        box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.48); }
        frame.app-notification button:focus:hover:hover, frame.app-notification button.flat:focus:hover:hover {
          border-color: mix(#30365f,rgba(255, 255, 255, 0.3),0.3); }
        frame.app-notification button:focus:hover:active, frame.app-notification button.flat:focus:hover:active, frame.app-notification button.flat:focus:hover:active:focus, frame.app-notification button:focus:hover:checked, frame.app-notification button.flat:focus:hover:checked, frame.app-notification button.flat:focus:hover:checked:focus, frame.app-notification button.flat:focus:hover:active:hover:focus, frame.app-notification button.flat:focus:hover:checked:hover:focus {
          border-color: rgba(179, 179, 179, 0.3); }
        frame.app-notification button:focus:hover:disabled, frame.app-notification button.flat:focus:hover:disabled {
          border-color: rgba(217, 217, 217, 0.3); }
        frame.app-notification button:focus:hover:active:disabled, frame.app-notification button:focus:hover:checked:disabled, frame.app-notification button.flat:focus:hover:active:disabled, frame.app-notification button.flat:focus:hover:checked:disabled {
          border-color: rgba(204, 204, 204, 0.3); }
    frame.app-notification button:checked, frame.app-notification button:active, frame.app-notification button.flat:checked, frame.app-notification button.flat:active {
      /*@include linear-gradient(shade($bg, .7), to top);*/
      background-color: #30365f;
      background-image: none;
      border-color: rgba(204, 204, 204, 0.22);
      color: #ffffff;
      box-shadow: inset 1px 0 rgba(255, 255, 255, 0.06), inset 0 1px rgba(255, 255, 255, 0.07), inset -1px 0 rgba(255, 255, 255, 0.06), inset 0 -1px rgba(255, 255, 255, 0.05); }
      frame.app-notification button:checked:focus, frame.app-notification button:checked:hover, frame.app-notification button:active:focus, frame.app-notification button:active:hover, frame.app-notification button.flat:checked:focus, frame.app-notification button.flat:checked:hover, frame.app-notification button.flat:active:focus, frame.app-notification button.flat:active:hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.22),0.3); }
      frame.app-notification button:active:checked, frame.app-notification button:active:checked:hover, frame.app-notification button:active:checked:focus, frame.app-notification button:active:checked:hover:focus, frame.app-notification button.flat:active:checked, frame.app-notification button.flat:active:checked:hover, frame.app-notification button.flat:active:checked:focus, frame.app-notification button.flat:active:checked:hover:focus {
        border-color: rgba(179, 179, 179, 0.22); }
      frame.app-notification button:checked:disabled, frame.app-notification button:active:disabled, frame.app-notification button.flat:checked:disabled, frame.app-notification button.flat:active:disabled {
        border-color: rgba(217, 217, 217, 0.22); }
      frame.app-notification button:active:checked:disabled, frame.app-notification button.flat:active:checked:disabled {
        border-color: rgba(204, 204, 204, 0.22); }
      frame.app-notification button:checked:focus, frame.app-notification button:checked:hover, frame.app-notification button:active:focus, frame.app-notification button:active:hover, frame.app-notification button.flat:checked:focus, frame.app-notification button.flat:checked:hover, frame.app-notification button.flat:active:focus, frame.app-notification button.flat:active:hover {
        /*@include linear-gradient(shade($bg, .65), to top);*/
        background-color: #323964;
        background-image: none;
        color: #ffffff; }
    frame.app-notification button:focus, frame.app-notification button:hover, frame.app-notification button.flat:focus, frame.app-notification button.flat:hover {
      color: #ffffff; }
    frame.app-notification button:disabled:disabled, frame.app-notification button.flat:disabled:disabled {
      background-color: alpha(mix(rgba(22, 23, 45, 0.8),#ffffff,0.2),0.4);
      background-image: none;
      /*border: 1px solid alpha($bg, .2);*/
      opacity: .6;
      color: mix(rgba(22, 23, 45, 0.8),#ffffff,0.6);
      box-shadow: none; }
      frame.app-notification button:disabled:disabled :disabled, frame.app-notification button.flat:disabled:disabled :disabled {
        color: mix(rgba(22, 23, 45, 0.8),#ffffff,0.6); }
    frame.app-notification button:active:disabled, frame.app-notification button:checked:disabled, frame.app-notification button.flat:active:disabled, frame.app-notification button.flat:checked:disabled {
      background-color: rgba(48, 54, 95, 0.6);
      background-image: none;
      color: rgba(255, 255, 255, 0.85);
      box-shadow: none; }
      frame.app-notification button:active:disabled :disabled, frame.app-notification button:checked:disabled :disabled, frame.app-notification button.flat:active:disabled :disabled, frame.app-notification button.flat:checked:disabled :disabled {
        color: rgba(255, 255, 255, 0.85); }
    frame.app-notification button:backdrop, frame.app-notification button.flat:backdrop {
      color: mix(#ffffff,mix(#ffffff,#1b1c36,0.5),0.8); }
    frame.app-notification button.separator, frame.app-notification button .separator {
      border: 1px solid currentColor;
      color: rgba(22, 23, 45, 0.7); }
      frame.app-notification button.separator:disabled, frame.app-notification button .separator:disabled {
        color: rgba(22, 23, 45, 0.65); }
    frame.app-notification button separator, frame.app-notification button.nautilus-circular-button.image-button separator {
      background-image: image(mix(#ffffff,rgba(22, 23, 45, 0.8),0.9)); }
  frame.app-notification border {
    border: 0; }

/*************
 ! Expanders *
**************/
expander arrow {
  min-width: 16px;
  min-height: 16px;
  -gtk-icon-source: -gtk-icontheme("pan-end-symbolic"); }
  expander arrow:dir(rtl) {
    -gtk-icon-source: -gtk-icontheme("pan-end-symbolic-rtl"); }
  expander arrow:hover {
    color: alpha(currentColor,0.8); }
  expander arrow:checked {
    -gtk-icon-source: -gtk-icontheme("pan-down-symbolic"); }

/*******************
 ! Symbolic images *
********************/
.image {
  color: alpha(currentColor,0.5); }
  .image:hover {
    color: alpha(currentColor,0.9); }
  .image:selected, .image:selected:hover {
    color: #ffffff; }

/****************
 ! Floating bar *
*****************/
.floating-bar {
  background-color: #1b1c36;
  background-image: none;
  border: 1px solid #16162b;
  border-radius: 8px;
  color: #ffffff; }
  .floating-bar.top {
    border-top-width: 0;
    border-top-right-radius: 0;
    border-top-left-radius: 0; }
  .floating-bar.right {
    border-right-width: 0;
    border-top-right-radius: 0;
    border-bottom-right-radius: 0; }
  .floating-bar.bottom {
    border-bottom-width: 0;
    border-bottom-right-radius: 0;
    border-bottom-left-radius: 0; }
  .floating-bar.left {
    border-left-width: 0;
    border-bottom-left-radius: 0;
    border-top-left-radius: 0; }
  .floating-bar button, .floating-bar button.nautilus-circular-button.image-button {
    border: 0;
    background-color: transparent;
    background-image: none; }

/*************************
 ! Touch text selections *
**************************/
GtkBubbleWindow {
  border-radius: 8px;
  background-clip: border-box; }
  GtkBubbleWindow.osd.background {
    background-color: rgba(22, 23, 45, 0.8); }
  GtkBubbleWindow .toolbar {
    background-color: transparent; }

/***************
 ! Font-viewer *
****************/
SushiFontWidget {
  padding: 4px 8px; }

/*************
 ! Gucharmap *
**************/
GucharmapChartable {
  background-color: #1b1c36;
  color: #c1c3cc; }

/*************
 ! Evolution *
**************/
EPreviewPane .entry {
  background-color: #1b1c36;
  color: #c1c3cc; }

/*******************
 ! Gnome Bluetooth *
********************/
entry.entry.pin-entry {
  font-style: normal;
  font-size: 50px;
  padding-left: 20px;
  padding-right: 20px; }

label.pin-label {
  font-style: normal;
  font-size: 50px; }

/************************
 ! Shortcut window keys *
*************************/
.keycap {
  min-width: 20px;
  min-height: 24px;
  margin-top: 2px;
  padding-bottom: 2px;
  padding-left: 4px;
  padding-right: 4px;
  color: #ffffff;
  background-color: #1b1c36;
  border: 1px solid;
  border-color: mix(mix(#1b1c36,#ffffff,0.18),#1b1c36,0.5);
  border-radius: 8px;
  box-shadow: inset 0 -3px mix(#1b1c36,#1b1c36,0.2);
  font-size: smaller; }
  .keycap:backdrop {
    background-color: #1b1c36;
    color: mix(#ffffff,#1b1c36,0.5);
    transition: 200ms ease-out; }

/*****************
 ! Stackswitcher *
******************/
stackswitcher button.text-button, stackswitcher button.text-button.nautilus-circular-button.image-button {
  min-width: 80px; }

stackswitcher button.circular, stackswitcher button.nautilus-circular-button.image-button {
  min-width: 28px;
  min-height: 28px;
  padding: 0; }

/*******************
 ! Selected Items  *
********************/
row:selected label:disabled, label:disabled:selected, .background:not(.csd):not(.solid-csd) > box.vertical > notebook.frame > stack > scrolledwindow > viewport > box.vertical > frame > box.vertical iconview.view:disabled:selected, .background:not(.csd):not(.solid-csd) > box.vertical > notebook.frame > stack > scrolledwindow > viewport > box.vertical > frame > box.vertical iconview:disabled:selected, .nemo-window .sidebar .nemo-places-sidebar .view:disabled:selected, .nemo-window .sidebar .nemo-places-sidebar iconview:disabled:selected, .cs-category-view:disabled:selected, .cs-category-view .view:disabled:selected, .cs-category-view iconview:disabled:selected, treeview.view:disabled:selected, .view text selection:disabled, iconview text selection:disabled,
textview text selection:disabled:focus,
textview text selection:disabled, #login_window entry selection:disabled, .osd entry selection:disabled,
#XfceNotifyWindow entry selection:disabled, entry selection:disabled, calendar:disabled:selected, row:disabled:selected, flowbox flowboxchild:disabled:selected, modelbutton.flat:disabled:active, modelbutton.flat:active arrow:disabled, modelbutton.flat:disabled:selected, modelbutton.flat:selected arrow:disabled,
menuitem.button.flat:disabled:active,
menuitem.button.flat:active arrow:disabled,
menuitem.button.flat:disabled:selected,
menuitem.button.flat:selected arrow:disabled, label:disabled selection {
  color: mix(#ffffff,#30365f,0.5); }

row:selected label:backdrop, label:backdrop:selected, .background:not(.csd):not(.solid-csd) > box.vertical > notebook.frame > stack > scrolledwindow > viewport > box.vertical > frame > box.vertical iconview.view:backdrop:selected, .background:not(.csd):not(.solid-csd) > box.vertical > notebook.frame > stack > scrolledwindow > viewport > box.vertical > frame > box.vertical iconview:backdrop:selected, .nemo-window .sidebar .nemo-places-sidebar .view:backdrop:selected, .nemo-window .sidebar .nemo-places-sidebar iconview:backdrop:selected, .cs-category-view:backdrop:selected, .cs-category-view .view:backdrop:selected, .cs-category-view iconview:backdrop:selected, treeview.view:backdrop:selected, .view text selection:backdrop, iconview text selection:backdrop,
textview text selection:backdrop:focus,
textview text selection:backdrop, #login_window entry selection:backdrop, .osd entry selection:backdrop,
#XfceNotifyWindow entry selection:backdrop, entry selection:backdrop, calendar:backdrop:selected, row:backdrop:selected, flowbox flowboxchild:backdrop:selected, modelbutton.flat:backdrop:active, modelbutton.flat:active arrow:backdrop, modelbutton.flat:backdrop:selected, modelbutton.flat:selected arrow:backdrop,
menuitem.button.flat:backdrop:active,
menuitem.button.flat:active arrow:backdrop,
menuitem.button.flat:backdrop:selected,
menuitem.button.flat:selected arrow:backdrop, label:backdrop selection {
  background-color: #30365f;
  color: mix(#30365f,#ffffff,0.66); }
  row:selected label:disabled:backdrop, label:disabled:backdrop:selected, .background:not(.csd):not(.solid-csd) > box.vertical > notebook.frame > stack > scrolledwindow > viewport > box.vertical > frame > box.vertical iconview:disabled:backdrop:selected, .nemo-window .sidebar .nemo-places-sidebar .view:disabled:backdrop:selected, .nemo-window .sidebar .nemo-places-sidebar iconview:disabled:backdrop:selected, .cs-category-view:disabled:backdrop:selected, .cs-category-view .view:disabled:backdrop:selected, .cs-category-view iconview:disabled:backdrop:selected, treeview.view:disabled:backdrop:selected, .view text selection:disabled:backdrop, iconview text selection:disabled:backdrop,
  textview text selection:disabled:backdrop, #login_window entry selection:disabled:backdrop,
  #XfceNotifyWindow entry selection:disabled:backdrop, entry selection:disabled:backdrop, calendar:disabled:backdrop:selected, row:disabled:backdrop:selected, flowbox flowboxchild:disabled:backdrop:selected, modelbutton.flat:disabled:backdrop:active, modelbutton.flat:active arrow:disabled:backdrop, modelbutton.flat:disabled:backdrop:selected, modelbutton.flat:selected arrow:disabled:backdrop,
  menuitem.button.flat:disabled:backdrop:active,
  menuitem.button.flat:active arrow:disabled:backdrop,
  menuitem.button.flat:disabled:backdrop:selected,
  menuitem.button.flat:selected arrow:disabled:backdrop, label:backdrop selection:disabled {
    color: mix(mix(#30365f,#ffffff,0.66),#30365f,0.3); }

.background:not(.csd):not(.solid-csd) > box.vertical > notebook.frame > stack > scrolledwindow > viewport > box.vertical > frame > box.vertical iconview.view:selected:focus, .background:not(.csd):not(.solid-csd) > box.vertical > notebook.frame > stack > scrolledwindow > viewport > box.vertical > frame > box.vertical iconview.view:selected, .background:not(.csd):not(.solid-csd) > box.vertical > notebook.frame > stack > scrolledwindow > viewport > box.vertical > frame > box.vertical iconview:selected, .nemo-window .sidebar .nemo-places-sidebar .view:selected:focus, .nemo-window .sidebar .nemo-places-sidebar .view:selected, .nemo-window .sidebar .nemo-places-sidebar iconview:selected, .cs-category-view:selected:focus, .cs-category-view:selected, .cs-category-view .view:selected:focus, .cs-category-view .view:selected, .cs-category-view iconview:selected, treeview.view:selected:focus, treeview.view:selected, .view text selection:focus, iconview text selection:focus, .view text selection, iconview text selection,
textview text selection:focus,
textview text selection, #login_window entry selection, .osd entry selection,
#XfceNotifyWindow entry selection, entry selection, calendar:selected, row:selected, flowbox flowboxchild:selected, menuitem entry selection, popover.background entry selection, modelbutton.flat:active, modelbutton.flat:active arrow, modelbutton.flat:selected, modelbutton.flat:selected arrow,
menuitem.button.flat:active,
menuitem.button.flat:active arrow,
menuitem.button.flat:selected,
menuitem.button.flat:selected arrow {
  background-color: #30365f; }
  row:selected label, label:selected, .background:not(.csd):not(.solid-csd) > box.vertical > notebook.frame > stack > scrolledwindow > viewport > box.vertical > frame > box.vertical iconview.view:selected:focus, .background:not(.csd):not(.solid-csd) > box.vertical > notebook.frame > stack > scrolledwindow > viewport > box.vertical > frame > box.vertical iconview.view:selected, .background:not(.csd):not(.solid-csd) > box.vertical > notebook.frame > stack > scrolledwindow > viewport > box.vertical > frame > box.vertical iconview:selected, .nemo-window .sidebar .nemo-places-sidebar .view:selected:focus, .nemo-window .sidebar .nemo-places-sidebar .view:selected, .nemo-window .sidebar .nemo-places-sidebar iconview:selected, .cs-category-view:selected:focus, .cs-category-view:selected, .cs-category-view .view:selected:focus, .cs-category-view .view:selected, .cs-category-view iconview:selected, treeview.view:selected:focus, treeview.view:selected, .view text selection:focus, iconview text selection:focus, .view text selection, iconview text selection,
  textview text selection:focus,
  textview text selection, #login_window entry selection, .osd entry selection,
  #XfceNotifyWindow entry selection, entry selection, calendar:selected, row:selected, flowbox flowboxchild:selected, menuitem entry selection, popover.background entry selection, modelbutton.flat:active, modelbutton.flat:active arrow, modelbutton.flat:selected, modelbutton.flat:selected arrow,
  menuitem.button.flat:active,
  menuitem.button.flat:active arrow,
  menuitem.button.flat:selected,
  menuitem.button.flat:selected arrow {
    color: #ffffff;
    outline-color: rgba(255, 255, 255, 0.3); }

/*********
 ! Buttons
**********/
/******************
! ComboBoxes *
*******************/
/**********
 ! Notebook
***********/
notebook {
  padding: 0; }
  notebook.frame {
    border: 1px solid mix(#1b1c36,#ffffff,0.18); }
    notebook.frame > header {
      margin: -1px; }
      notebook.frame > header.top {
        margin-bottom: 0; }
      notebook.frame > header.bottom {
        margin-top: 0; }
      notebook.frame > header.left {
        margin-right: 0; }
      notebook.frame > header.right {
        margin-left: 0; }
      notebook.frame > header.top, notebook.frame > header.bottom {
        padding-left: 0;
        padding-right: 0; }
      notebook.frame > header.left, notebook.frame > header.right {
        padding-top: 0;
        padding-bottom: 0; }
  notebook > stack:not(:only-child) {
    background-color: #1b1c36; }
  notebook > header {
    padding: 4px;
    background-color: #1b1c36; }
    notebook > header.top {
      box-shadow: inset 0 -1px mix(#1b1c36,#ffffff,0.18); }
    notebook > header.bottom {
      box-shadow: inset 0 1px mix(#1b1c36,#ffffff,0.18); }
    notebook > header.right {
      box-shadow: inset 1px 0 mix(#1b1c36,#ffffff,0.18); }
    notebook > header.left {
      box-shadow: inset -1px 0 mix(#1b1c36,#ffffff,0.18); }
    notebook > header.top > tabs > arrow.up, notebook > header.bottom > tabs > arrow.up {
      -gtk-icon-source: -gtk-icontheme("pan-end-symbolic"); }
      notebook > header.top > tabs > arrow.up:last-child, notebook > header.bottom > tabs > arrow.up:last-child {
        margin-left: 2px; }
    notebook > header.top > tabs > arrow.down, notebook > header.bottom > tabs > arrow.down {
      -gtk-icon-source: -gtk-icontheme("pan-start-symbolic"); }
      notebook > header.top > tabs > arrow.down:first-child, notebook > header.bottom > tabs > arrow.down:first-child {
        margin-right: 2px; }
    notebook > header.left > tabs > arrow.up, notebook > header.right > tabs > arrow.up {
      -gtk-icon-source: -gtk-icontheme("pan-down-symbolic"); }
      notebook > header.left > tabs > arrow.up:last-child, notebook > header.right > tabs > arrow.up:last-child {
        margin-top: 2px; }
    notebook > header.left > tabs > arrow.down, notebook > header.right > tabs > arrow.down {
      -gtk-icon-source: -gtk-icontheme("pan-up-symbolic"); }
      notebook > header.left > tabs > arrow.down:first-child, notebook > header.right > tabs > arrow.down:first-child {
        margin-bottom: 2px; }
    notebook > header > tabs > arrow {
      color: mix(#ffffff,#1b1c36,0.5); }
      notebook > header > tabs > arrow:hover {
        color: mix(#ffffff,mix(#ffffff,#1b1c36,0.5),0.5); }
      notebook > header > tabs > arrow:active {
        color: #ffffff; }
      notebook > header > tabs > arrow:disabled {
        color: alpha(mix(#ffffff,#1b1c36,0.5),0.3); }
    notebook > header > tabs > tab {
      background-color: alpha(mix(#1b1c36,#ffffff,0.1),0.7);
      background-image: none;
      border-color: mix(mix(#1b1c36,#ffffff,0.18),mix(#ffffff,#1b1c36,0.5),0.15);
      color: rgba(255, 255, 255, 0.8);
      padding: 4px 12px;
      min-width: 20px;
      min-height: 20px;
      outline-offset: -4px;
      border-width: 1px;
      border-style: solid; }
      notebook > header > tabs > tab:hover:not(:checked) {
        background-color: mix(#1b1c36,#ffffff,0.04);
        background-image: none;
        color: mix(#ffffff,mix(#ffffff,#1b1c36,0.5),0.5); }
      notebook > header > tabs > tab:checked, notebook > header > tabs > tab:checked:hover {
        background: #1b1c36;
        border-color: mix(#1b1c36,#ffffff,0.18);
        color: #ffffff; }
      notebook > header > tabs > tab button.flat, notebook > header > tabs > tab button.flat.nautilus-circular-button.image-button {
        min-height: 22px;
        min-width: 22px;
        padding: 0;
        color: mix(#1b1c36,#ffffff,0.35); }
        notebook > header > tabs > tab button.flat:hover {
          color: #fc0000; }
        notebook > header > tabs > tab button.flat:active, notebook > header > tabs > tab button.flat:active:hover {
          color: #30365f; }
    notebook > header.top > tabs > tab:hover:not(:checked) {
      box-shadow: inset 0 -1px mix(#1b1c36,#ffffff,0.18); }
    notebook > header.bottom > tabs > tab:hover:not(:checked) {
      box-shadow: inset 0 1px mix(#1b1c36,#ffffff,0.18); }
    notebook > header.left > tabs > tab:hover:not(:checked) {
      box-shadow: inset -1px 0 mix(#1b1c36,#ffffff,0.18); }
    notebook > header.right > tabs > tab:hover:not(:checked) {
      box-shadow: inset 1px 0 mix(#1b1c36,#ffffff,0.18); }
    notebook > header.top {
      padding-bottom: 0; }
      notebook > header.top > tabs > tab {
        border-bottom: none;
        -gtk-outline-radius: 0; }
        notebook > header.top > tabs > tab + tab {
          margin-left: -1px; }
        notebook > header.top > tabs > tab:first-child {
          border-radius: 8px 0 0;
          -gtk-outline-radius: 8px 0 0; }
        notebook > header.top > tabs > tab:last-child {
          border-radius: 0 8px 0 0;
          -gtk-outline-radius: 0 8px 0 0; }
        notebook > header.top > tabs > tab:hover:not(:checked), notebook > header.top > tabs > tab:checked {
          border-top-width: 3px;
          border-top-color: #30365f;
          margin-top: 0;
          padding-top: 2px; }
        notebook > header.top > tabs > tab:hover:not(:checked) {
          border-top-color: mix(#30365f,mix(#1b1c36,#ffffff,0.2),0.66); }
    notebook > header.bottom {
      padding-top: 0; }
      notebook > header.bottom > tabs > tab {
        border-top: none;
        -gtk-outline-radius: 0; }
        notebook > header.bottom > tabs > tab + tab {
          margin-left: -1px; }
        notebook > header.bottom > tabs > tab:first-child {
          border-radius: 0 0 0 8px;
          -gtk-outline-radius: 0 0 0 8px; }
        notebook > header.bottom > tabs > tab:last-child {
          border-radius: 0 0 8px;
          -gtk-outline-radius: 0 0 8px; }
        notebook > header.bottom > tabs > tab:hover:not(:checked), notebook > header.bottom > tabs > tab:checked {
          border-bottom-width: 3px;
          border-bottom-color: #30365f;
          margin-bottom: 0;
          padding-bottom: 2px; }
        notebook > header.bottom > tabs > tab:hover:not(:checked) {
          border-bottom-color: mix(#30365f,mix(#1b1c36,#ffffff,0.2),0.66); }
    notebook > header.right {
      padding-left: 0; }
      notebook > header.right > tabs > tab {
        border-left: none;
        -gtk-outline-radius: 0; }
        notebook > header.right > tabs > tab + tab {
          margin-top: -1px; }
        notebook > header.right > tabs > tab:first-child {
          border-radius: 0 8px 0 0;
          -gtk-outline-radius: 0 8px 0 0; }
        notebook > header.right > tabs > tab:last-child {
          border-radius: 0 0 8px;
          -gtk-outline-radius: 0 0 8px; }
        notebook > header.right > tabs > tab:hover:not(:checked), notebook > header.right > tabs > tab:checked {
          border-right-width: 3px;
          border-right-color: #30365f;
          margin-right: 0;
          padding-right: 10px; }
        notebook > header.right > tabs > tab:hover:not(:checked) {
          border-right-color: mix(#30365f,mix(#1b1c36,#ffffff,0.2),0.66); }
    notebook > header.left {
      padding-right: 0; }
      notebook > header.left > tabs > tab {
        border-right: none;
        -gtk-outline-radius: 0; }
        notebook > header.left > tabs > tab + tab {
          margin-top: -1px; }
        notebook > header.left > tabs > tab:first-child {
          border-radius: 8px 0 0;
          -gtk-outline-radius: 8px 0 0; }
        notebook > header.left > tabs > tab:last-child {
          border-radius: 0 0 0 8px;
          -gtk-outline-radius: 0 0 0 8px; }
        notebook > header.left > tabs > tab:hover:not(:checked), notebook > header.left > tabs > tab:checked {
          border-left-width: 3px;
          border-left-color: #30365f;
          margin-left: 0;
          padding-left: 10px; }
        notebook > header.left > tabs > tab:hover:not(:checked) {
          border-left-color: mix(#30365f,mix(#1b1c36,#ffffff,0.2),0.66); }

/*********
 ! Buttons
**********/
/******************
! ComboBoxes *
*******************/
/*******
 ! OSD *
********/
overlay.osd {
  background-color: transparent; }

colorchooser .popover.osd {
  border-radius: 8px; }

button.color .osd colorswatch:only-child {
  box-shadow: none; }

.osd button.color:disabled colorswatch:only-child, .osd button.color:backdrop colorswatch:only-child, .osd button.color:active colorswatch:only-child, .osd button.color:checked colorswatch:only-child {
  box-shadow: none; }

button.osd, button.osd.nautilus-circular-button.image-button,
#XfceNotifyWindow button {
  background-color: rgba(22, 23, 45, 0.8);
  background-image: none;
  border-color: rgba(204, 204, 204, 0.22);
  color: #ffffff;
  box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22); }
  button.osd:focus, button.osd:hover,
  #XfceNotifyWindow button:focus,
  #XfceNotifyWindow button:hover {
    border-color: mix(#30365f,rgba(255, 255, 255, 0.22),0.3); }
  button.osd:active, button.osd:active:hover, button.osd:active:focus, button.osd:active:hover:focus, button.osd:checked, button.osd:checked:hover, button.osd:checked:focus, button.osd:checked:hover:focus,
  #XfceNotifyWindow button:active,
  #XfceNotifyWindow button:active:hover,
  #XfceNotifyWindow button:active:focus,
  #XfceNotifyWindow button:active:hover:focus,
  #XfceNotifyWindow button:checked,
  #XfceNotifyWindow button:checked:hover,
  #XfceNotifyWindow button:checked:focus,
  #XfceNotifyWindow button:checked:hover:focus {
    border-color: rgba(179, 179, 179, 0.22); }
  button.osd:disabled,
  #XfceNotifyWindow button:disabled {
    border-color: rgba(217, 217, 217, 0.22); }
  button.osd:active:disabled, button.osd:checked:disabled,
  #XfceNotifyWindow button:active:disabled,
  #XfceNotifyWindow button:checked:disabled {
    border-color: rgba(204, 204, 204, 0.22); }
  .linked:not(.vertical) > button.osd:not(:last-child):not(:only-child), .linked:not(.vertical) > :not(:last-child):not(:only-child) button.osd, viewswitcher:not(.vertical) > button.osd:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > button.osd:not(:last-child):not(:only-child), .linked:not(.vertical) > #XfceNotifyWindow button:not(:last-child):not(:only-child), .linked:not(.vertical) > :not(:last-child):not(:only-child) #XfceNotifyWindow button, viewswitcher:not(.vertical) > #XfceNotifyWindow button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > #XfceNotifyWindow button:not(:last-child):not(:only-child) {
    border-right-style: none; }
    .linked:not(.vertical) > button.osd:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) button.osd:hover, viewswitcher:not(.vertical) > button.osd:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > button.osd:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > #XfceNotifyWindow button:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) #XfceNotifyWindow button:hover, viewswitcher:not(.vertical) > #XfceNotifyWindow button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > #XfceNotifyWindow button:not(:last-child):not(:only-child):hover {
      border-color: mix(#30365f,rgba(255, 255, 255, 0.36),0.3);
      border-right-style: none;
      box-shadow: inset-1px 0 0 mix(#30365f,rgba(255, 255, 255, 0.36),0.3); }
  .linked:not(.vertical) > button.osd:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > :not(:last-child):not(:only-child) button.osd:checked, viewswitcher:not(.vertical) > button.osd:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > button.osd:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > #XfceNotifyWindow button:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > :not(:last-child):not(:only-child) #XfceNotifyWindow button:checked, viewswitcher:not(.vertical) > #XfceNotifyWindow button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > #XfceNotifyWindow button:not(:last-child):not(:only-child):checked {
    border-right-style: none; }
    .linked:not(.vertical) > button.osd:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) button.osd:checked:hover, viewswitcher:not(.vertical) > button.osd:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > button.osd:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > #XfceNotifyWindow button:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) #XfceNotifyWindow button:checked:hover, viewswitcher:not(.vertical) > #XfceNotifyWindow button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > #XfceNotifyWindow button:not(:last-child):not(:only-child):checked:hover {
      border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
      border-right-style: none;
      box-shadow: inset-1px 0 0 mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
  .linked.vertical > button.osd:not(:last-child):not(:only-child), .linked.vertical > :not(:last-child):not(:only-child) button.osd, stackswitcher.vertical > button.osd:not(:last-child):not(:only-child), .linked.vertical > #XfceNotifyWindow button:not(:last-child):not(:only-child), .linked.vertical > :not(:last-child):not(:only-child) #XfceNotifyWindow button, stackswitcher.vertical > #XfceNotifyWindow button:not(:last-child):not(:only-child) {
    border-bottom-style: none; }
    .linked.vertical > button.osd:not(:last-child):not(:only-child):hover, .linked.vertical > :not(:last-child):not(:only-child) button.osd:hover, stackswitcher.vertical > button.osd:not(:last-child):not(:only-child):hover, .linked.vertical > #XfceNotifyWindow button:not(:last-child):not(:only-child):hover, .linked.vertical > :not(:last-child):not(:only-child) #XfceNotifyWindow button:hover, stackswitcher.vertical > #XfceNotifyWindow button:not(:last-child):not(:only-child):hover {
      border-color: mix(#30365f,rgba(255, 255, 255, 0.36),0.3);
      border-bottom-style: none;
      box-shadow: inset 0 -1px mix(#30365f,rgba(255, 255, 255, 0.36),0.3); }
  .linked.vertical > button.osd:not(:last-child):not(:only-child):checked, .linked.vertical > :not(:last-child):not(:only-child) button.osd:checked, stackswitcher.vertical > button.osd:not(:last-child):not(:only-child):checked, .linked.vertical > #XfceNotifyWindow button:not(:last-child):not(:only-child):checked, .linked.vertical > :not(:last-child):not(:only-child) #XfceNotifyWindow button:checked, stackswitcher.vertical > #XfceNotifyWindow button:not(:last-child):not(:only-child):checked {
    border-bottom-style: none; }
    .linked.vertical > button.osd:not(:last-child):not(:only-child):checked:hover, .linked.vertical > :not(:last-child):not(:only-child) button.osd:checked:hover, stackswitcher.vertical > button.osd:not(:last-child):not(:only-child):checked:hover, .linked.vertical > #XfceNotifyWindow button:not(:last-child):not(:only-child):checked:hover, .linked.vertical > :not(:last-child):not(:only-child) #XfceNotifyWindow button:checked:hover, stackswitcher.vertical > #XfceNotifyWindow button:not(:last-child):not(:only-child):checked:hover {
      border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
      border-bottom-style: none;
      box-shadow: inset 0 -1px mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
  button.osd.flat,
  #XfceNotifyWindow button.flat {
    color: #ffffff;
    border-color: rgba(22, 23, 45, 0);
    background-color: rgba(22, 23, 45, 0);
    background-image: none;
    box-shadow: none; }
  button.osd:hover, button.osd.flat:hover,
  #XfceNotifyWindow button:hover,
  #XfceNotifyWindow button.flat:hover {
    background-color: rgba(23, 24, 47, 0.8);
    background-image: none;
    border-color: rgba(204, 204, 204, 0.3);
    color: #ffffff;
    box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.32); }
    button.osd:hover:focus, button.osd:hover:hover, button.osd.flat:hover:focus, button.osd.flat:hover:hover,
    #XfceNotifyWindow button:hover:focus,
    #XfceNotifyWindow button:hover:hover,
    #XfceNotifyWindow button.flat:hover:focus,
    #XfceNotifyWindow button.flat:hover:hover {
      border-color: mix(#30365f,rgba(255, 255, 255, 0.3),0.3); }
    button.osd:hover:active, button.osd:hover:active:focus, button.osd.flat:hover:active:focus, button.osd:hover:checked, button.osd:hover:checked:focus, button.osd.flat:hover:checked:focus, button.osd.flat:hover:active, button.osd.flat:hover:active:hover:focus, button.osd.flat:hover:checked, button.osd.flat:hover:checked:hover:focus,
    #XfceNotifyWindow button:hover:active,
    #XfceNotifyWindow button:hover:active:focus,
    #XfceNotifyWindow button.flat:hover:active:focus,
    #XfceNotifyWindow button:hover:checked,
    #XfceNotifyWindow button:hover:checked:focus,
    #XfceNotifyWindow button.flat:hover:checked:focus,
    #XfceNotifyWindow button.flat:hover:active,
    #XfceNotifyWindow button.flat:hover:active:hover:focus,
    #XfceNotifyWindow button.flat:hover:checked,
    #XfceNotifyWindow button.flat:hover:checked:hover:focus {
      border-color: rgba(179, 179, 179, 0.3); }
    button.osd:hover:disabled, button.osd.flat:hover:disabled,
    #XfceNotifyWindow button:hover:disabled,
    #XfceNotifyWindow button.flat:hover:disabled {
      border-color: rgba(217, 217, 217, 0.3); }
    button.osd:hover:active:disabled, button.osd:hover:checked:disabled, button.osd.flat:hover:active:disabled, button.osd.flat:hover:checked:disabled,
    #XfceNotifyWindow button:hover:active:disabled,
    #XfceNotifyWindow button:hover:checked:disabled,
    #XfceNotifyWindow button.flat:hover:active:disabled,
    #XfceNotifyWindow button.flat:hover:checked:disabled {
      border-color: rgba(204, 204, 204, 0.3); }
  button.osd:focus, button.osd.flat:focus,
  #XfceNotifyWindow button:focus,
  #XfceNotifyWindow button.flat:focus {
    background-color: rgba(23, 24, 47, 0.8);
    background-image: none;
    border-color: rgba(255, 255, 255, 0.22);
    outline-color: rgba(48, 54, 95, 0.5);
    outline-width: 3px;
    outline-style: solid;
    outline-offset: 10px;
    color: #ffffff;
    box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
    button.osd:focus:hover, button.osd.flat:focus:hover,
    #XfceNotifyWindow button:focus:hover,
    #XfceNotifyWindow button.flat:focus:hover {
      background-color: rgba(24, 25, 50, 0.8);
      background-image: none;
      border-color: rgba(204, 204, 204, 0.3);
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.48); }
      button.osd:focus:hover:hover, button.osd.flat:focus:hover:hover,
      #XfceNotifyWindow button:focus:hover:hover,
      #XfceNotifyWindow button.flat:focus:hover:hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.3),0.3); }
      button.osd:focus:hover:active, button.osd.flat:focus:hover:active, button.osd.flat:focus:hover:active:focus, button.osd:focus:hover:checked, button.osd.flat:focus:hover:checked, button.osd.flat:focus:hover:checked:focus, button.osd.flat:focus:hover:active:hover:focus, button.osd.flat:focus:hover:checked:hover:focus,
      #XfceNotifyWindow button:focus:hover:active,
      #XfceNotifyWindow button.flat:focus:hover:active,
      #XfceNotifyWindow button.flat:focus:hover:active:focus,
      #XfceNotifyWindow button:focus:hover:checked,
      #XfceNotifyWindow button.flat:focus:hover:checked,
      #XfceNotifyWindow button.flat:focus:hover:checked:focus,
      #XfceNotifyWindow button.flat:focus:hover:active:hover:focus,
      #XfceNotifyWindow button.flat:focus:hover:checked:hover:focus {
        border-color: rgba(179, 179, 179, 0.3); }
      button.osd:focus:hover:disabled, button.osd.flat:focus:hover:disabled,
      #XfceNotifyWindow button:focus:hover:disabled,
      #XfceNotifyWindow button.flat:focus:hover:disabled {
        border-color: rgba(217, 217, 217, 0.3); }
      button.osd:focus:hover:active:disabled, button.osd:focus:hover:checked:disabled, button.osd.flat:focus:hover:active:disabled, button.osd.flat:focus:hover:checked:disabled,
      #XfceNotifyWindow button:focus:hover:active:disabled,
      #XfceNotifyWindow button:focus:hover:checked:disabled,
      #XfceNotifyWindow button.flat:focus:hover:active:disabled,
      #XfceNotifyWindow button.flat:focus:hover:checked:disabled {
        border-color: rgba(204, 204, 204, 0.3); }
  button.osd:checked, button.osd:active, button.osd.flat:checked, button.osd.flat:active,
  #XfceNotifyWindow button:checked,
  #XfceNotifyWindow button:active,
  #XfceNotifyWindow button.flat:checked,
  #XfceNotifyWindow button.flat:active {
    /*@include linear-gradient(shade($bg, .7), to top);*/
    background-color: #30365f;
    background-image: none;
    border-color: rgba(204, 204, 204, 0.22);
    color: #ffffff;
    box-shadow: inset 1px 0 rgba(255, 255, 255, 0.06), inset 0 1px rgba(255, 255, 255, 0.07), inset -1px 0 rgba(255, 255, 255, 0.06), inset 0 -1px rgba(255, 255, 255, 0.05); }
    button.osd:checked:focus, button.osd:checked:hover, button.osd:active:focus, button.osd:active:hover, button.osd.flat:checked:focus, button.osd.flat:checked:hover, button.osd.flat:active:focus, button.osd.flat:active:hover,
    #XfceNotifyWindow button:checked:focus,
    #XfceNotifyWindow button:checked:hover,
    #XfceNotifyWindow button:active:focus,
    #XfceNotifyWindow button:active:hover,
    #XfceNotifyWindow button.flat:checked:focus,
    #XfceNotifyWindow button.flat:checked:hover,
    #XfceNotifyWindow button.flat:active:focus,
    #XfceNotifyWindow button.flat:active:hover {
      border-color: mix(#30365f,rgba(255, 255, 255, 0.22),0.3); }
    button.osd:checked:active, button.osd.nautilus-circular-button.image-button:checked:active, button.osd:checked:active:hover, button.osd.nautilus-circular-button.image-button:checked:active:hover, button.osd:checked:active:focus, button.osd.nautilus-circular-button.image-button:checked:active:focus, button.osd:checked:active:hover:focus, button.osd.nautilus-circular-button.image-button:checked:active:hover:focus, button.osd:checked:checked, button.osd.nautilus-circular-button.image-button:checked:checked, button.osd:checked:checked:hover, button.osd.nautilus-circular-button.image-button:checked:checked:hover, button.osd:checked:checked:focus, button.osd.nautilus-circular-button.image-button:checked:checked:focus, button.osd:checked:checked:hover:focus, button.osd.nautilus-circular-button.image-button:checked:checked:hover:focus, button.osd:active:active, button.osd.nautilus-circular-button.image-button:active:active, button.osd:active:active:hover, button.osd.nautilus-circular-button.image-button:active:active:hover, button.osd:active:active:focus, button.osd.nautilus-circular-button.image-button:active:active:focus, button.osd:active:active:hover:focus, button.osd.nautilus-circular-button.image-button:active:active:hover:focus, button.osd:active:checked, button.osd.nautilus-circular-button.image-button:active:checked, button.osd:active:checked:hover, button.osd.nautilus-circular-button.image-button:active:checked:hover, button.osd:active:checked:focus, button.osd.nautilus-circular-button.image-button:active:checked:focus, button.osd:active:checked:hover:focus, button.osd.nautilus-circular-button.image-button:active:checked:hover:focus, button.osd.flat:checked:active, button.osd.flat.nautilus-circular-button.image-button:checked:active, button.osd.flat:checked:active:hover, button.osd.flat.nautilus-circular-button.image-button:checked:active:hover, button.osd.flat:checked:active:focus, button.osd.flat.nautilus-circular-button.image-button:checked:active:focus, button.osd.flat:checked:active:hover:focus, button.osd.flat.nautilus-circular-button.image-button:checked:active:hover:focus, button.osd.flat:checked:checked, button.osd.flat.nautilus-circular-button.image-button:checked:checked, button.osd.flat:checked:checked:hover, button.osd.flat.nautilus-circular-button.image-button:checked:checked:hover, button.osd.flat:checked:checked:focus, button.osd.flat.nautilus-circular-button.image-button:checked:checked:focus, button.osd.flat:checked:checked:hover:focus, button.osd.flat.nautilus-circular-button.image-button:checked:checked:hover:focus, button.osd.flat:active:active, button.osd.flat.nautilus-circular-button.image-button:active:active, button.osd.flat:active:active:hover, button.osd.flat.nautilus-circular-button.image-button:active:active:hover, button.osd.flat:active:active:focus, button.osd.flat.nautilus-circular-button.image-button:active:active:focus, button.osd.flat:active:active:hover:focus, button.osd.flat.nautilus-circular-button.image-button:active:active:hover:focus, button.osd.flat:active:checked, button.osd.flat.nautilus-circular-button.image-button:active:checked, button.osd.flat:active:checked:hover, button.osd.flat.nautilus-circular-button.image-button:active:checked:hover, button.osd.flat:active:checked:focus, button.osd.flat.nautilus-circular-button.image-button:active:checked:focus, button.osd.flat:active:checked:hover:focus, button.osd.flat.nautilus-circular-button.image-button:active:checked:hover:focus,
    #XfceNotifyWindow button:checked:active,
    #XfceNotifyWindow button.nautilus-circular-button.image-button:checked:active,
    #XfceNotifyWindow button:checked:active:hover,
    #XfceNotifyWindow button.nautilus-circular-button.image-button:checked:active:hover,
    #XfceNotifyWindow button:checked:active:focus,
    #XfceNotifyWindow button.nautilus-circular-button.image-button:checked:active:focus,
    #XfceNotifyWindow button:checked:active:hover:focus,
    #XfceNotifyWindow button.nautilus-circular-button.image-button:checked:active:hover:focus,
    #XfceNotifyWindow button:checked:checked,
    #XfceNotifyWindow button.nautilus-circular-button.image-button:checked:checked,
    #XfceNotifyWindow button:checked:checked:hover,
    #XfceNotifyWindow button.nautilus-circular-button.image-button:checked:checked:hover,
    #XfceNotifyWindow button:checked:checked:focus,
    #XfceNotifyWindow button.nautilus-circular-button.image-button:checked:checked:focus,
    #XfceNotifyWindow button:checked:checked:hover:focus,
    #XfceNotifyWindow button.nautilus-circular-button.image-button:checked:checked:hover:focus,
    #XfceNotifyWindow button:active:active,
    #XfceNotifyWindow button.nautilus-circular-button.image-button:active:active,
    #XfceNotifyWindow button:active:active:hover,
    #XfceNotifyWindow button.nautilus-circular-button.image-button:active:active:hover,
    #XfceNotifyWindow button:active:active:focus,
    #XfceNotifyWindow button.nautilus-circular-button.image-button:active:active:focus,
    #XfceNotifyWindow button:active:active:hover:focus,
    #XfceNotifyWindow button.nautilus-circular-button.image-button:active:active:hover:focus,
    #XfceNotifyWindow button:active:checked,
    #XfceNotifyWindow button.nautilus-circular-button.image-button:active:checked,
    #XfceNotifyWindow button:active:checked:hover,
    #XfceNotifyWindow button.nautilus-circular-button.image-button:active:checked:hover,
    #XfceNotifyWindow button:active:checked:focus,
    #XfceNotifyWindow button.nautilus-circular-button.image-button:active:checked:focus,
    #XfceNotifyWindow button:active:checked:hover:focus,
    #XfceNotifyWindow button.nautilus-circular-button.image-button:active:checked:hover:focus,
    #XfceNotifyWindow button.flat:checked:active,
    #XfceNotifyWindow button.flat.nautilus-circular-button.image-button:checked:active,
    #XfceNotifyWindow button.flat:checked:active:hover,
    #XfceNotifyWindow button.flat.nautilus-circular-button.image-button:checked:active:hover,
    #XfceNotifyWindow button.flat:checked:active:focus,
    #XfceNotifyWindow button.flat.nautilus-circular-button.image-button:checked:active:focus,
    #XfceNotifyWindow button.flat:checked:active:hover:focus,
    #XfceNotifyWindow button.flat.nautilus-circular-button.image-button:checked:active:hover:focus,
    #XfceNotifyWindow button.flat:checked:checked,
    #XfceNotifyWindow button.flat.nautilus-circular-button.image-button:checked:checked,
    #XfceNotifyWindow button.flat:checked:checked:hover,
    #XfceNotifyWindow button.flat.nautilus-circular-button.image-button:checked:checked:hover,
    #XfceNotifyWindow button.flat:checked:checked:focus,
    #XfceNotifyWindow button.flat.nautilus-circular-button.image-button:checked:checked:focus,
    #XfceNotifyWindow button.flat:checked:checked:hover:focus,
    #XfceNotifyWindow button.flat.nautilus-circular-button.image-button:checked:checked:hover:focus,
    #XfceNotifyWindow button.flat:active:active,
    #XfceNotifyWindow button.flat.nautilus-circular-button.image-button:active:active,
    #XfceNotifyWindow button.flat:active:active:hover,
    #XfceNotifyWindow button.flat.nautilus-circular-button.image-button:active:active:hover,
    #XfceNotifyWindow button.flat:active:active:focus,
    #XfceNotifyWindow button.flat.nautilus-circular-button.image-button:active:active:focus,
    #XfceNotifyWindow button.flat:active:active:hover:focus,
    #XfceNotifyWindow button.flat.nautilus-circular-button.image-button:active:active:hover:focus,
    #XfceNotifyWindow button.flat:active:checked,
    #XfceNotifyWindow button.flat.nautilus-circular-button.image-button:active:checked,
    #XfceNotifyWindow button.flat:active:checked:hover,
    #XfceNotifyWindow button.flat.nautilus-circular-button.image-button:active:checked:hover,
    #XfceNotifyWindow button.flat:active:checked:focus,
    #XfceNotifyWindow button.flat.nautilus-circular-button.image-button:active:checked:focus,
    #XfceNotifyWindow button.flat:active:checked:hover:focus,
    #XfceNotifyWindow button.flat.nautilus-circular-button.image-button:active:checked:hover:focus {
      border-color: rgba(179, 179, 179, 0.22); }
    button.osd:checked:disabled, button.osd:active:disabled, button.osd.flat:checked:disabled, button.osd.flat:active:disabled,
    #XfceNotifyWindow button:checked:disabled,
    #XfceNotifyWindow button:active:disabled,
    #XfceNotifyWindow button.flat:checked:disabled,
    #XfceNotifyWindow button.flat:active:disabled {
      border-color: rgba(217, 217, 217, 0.22); }
    button.osd:active:checked:disabled, button.osd.flat:active:checked:disabled,
    #XfceNotifyWindow button:active:checked:disabled,
    #XfceNotifyWindow button.flat:active:checked:disabled {
      border-color: rgba(204, 204, 204, 0.22); }
    button.osd:checked:focus, button.osd:checked:hover, button.osd:active:focus, button.osd:active:hover, button.osd.flat:checked:focus, button.osd.flat:checked:hover, button.osd.flat:active:focus, button.osd.flat:active:hover,
    #XfceNotifyWindow button:checked:focus,
    #XfceNotifyWindow button:checked:hover,
    #XfceNotifyWindow button:active:focus,
    #XfceNotifyWindow button:active:hover,
    #XfceNotifyWindow button.flat:checked:focus,
    #XfceNotifyWindow button.flat:checked:hover,
    #XfceNotifyWindow button.flat:active:focus,
    #XfceNotifyWindow button.flat:active:hover {
      /*@include linear-gradient(shade($bg, .65), to top);*/
      background-color: #323964;
      background-image: none;
      color: #ffffff; }
  button.osd:focus, button.osd:hover, button.osd.flat:focus, button.osd.flat:hover,
  #XfceNotifyWindow button:focus,
  #XfceNotifyWindow button:hover,
  #XfceNotifyWindow button.flat:focus,
  #XfceNotifyWindow button.flat:hover {
    color: #ffffff; }
  button.osd:disabled:disabled, button.osd.flat:disabled:disabled,
  #XfceNotifyWindow button:disabled:disabled,
  #XfceNotifyWindow button.flat:disabled:disabled {
    background-color: alpha(mix(rgba(22, 23, 45, 0.8),#ffffff,0.2),0.4);
    background-image: none;
    /*border: 1px solid alpha($bg, .2);*/
    opacity: .6;
    color: mix(rgba(22, 23, 45, 0.8),#ffffff,0.6);
    box-shadow: none; }
    button.osd:disabled:disabled :disabled, button.osd.flat:disabled:disabled :disabled,
    #XfceNotifyWindow button:disabled:disabled :disabled,
    #XfceNotifyWindow button.flat:disabled:disabled :disabled {
      color: mix(rgba(22, 23, 45, 0.8),#ffffff,0.6); }
  button.osd:active:disabled, button.osd:checked:disabled, button.osd.flat:active:disabled, button.osd.flat:checked:disabled,
  #XfceNotifyWindow button:active:disabled,
  #XfceNotifyWindow button:checked:disabled,
  #XfceNotifyWindow button.flat:active:disabled,
  #XfceNotifyWindow button.flat:checked:disabled {
    background-color: rgba(48, 54, 95, 0.6);
    background-image: none;
    color: rgba(255, 255, 255, 0.85);
    box-shadow: none; }
    button.osd:active:disabled :disabled, button.osd:checked:disabled :disabled, button.osd.flat:active:disabled :disabled, button.osd.flat:checked:disabled :disabled,
    #XfceNotifyWindow button:active:disabled :disabled,
    #XfceNotifyWindow button:checked:disabled :disabled,
    #XfceNotifyWindow button.flat:active:disabled :disabled,
    #XfceNotifyWindow button.flat:checked:disabled :disabled {
      color: rgba(255, 255, 255, 0.85); }
  button.osd:backdrop, button.osd.flat:backdrop,
  #XfceNotifyWindow button:backdrop,
  #XfceNotifyWindow button.flat:backdrop {
    color: mix(#ffffff,mix(#ffffff,#1b1c36,0.5),0.8); }
  button.osd.separator, button.osd .separator,
  #XfceNotifyWindow button.separator,
  #XfceNotifyWindow button .separator {
    border: 1px solid currentColor;
    color: rgba(22, 23, 45, 0.7); }
    button.osd.separator:disabled, button.osd .separator:disabled,
    #XfceNotifyWindow button.separator:disabled,
    #XfceNotifyWindow button .separator:disabled {
      color: rgba(22, 23, 45, 0.65); }
  button.osd separator, button.osd.nautilus-circular-button.image-button separator,
  #XfceNotifyWindow button separator {
    background-image: image(mix(#ffffff,rgba(22, 23, 45, 0.8),0.9)); }
  button.osd.image-button,
  #XfceNotifyWindow button.image-button {
    padding: 0;
    min-height: 36px;
    min-width: 36px; }

toolbar.osd {
  -GtkToolbar-button-relief: normal;
  padding: 4px;
  border: 1px solid rgba(18, 18, 36, 0.8);
  border-radius: 8px;
  background-color: rgba(22, 23, 45, 0.8);
  background-image: none;
  color: #ffffff; }
  toolbar.osd separator {
    color: rgba(20, 21, 41, 0.8); }
  toolbar.osd.left, toolbar.osd.right, toolbar.osd.top, toolbar.osd.bottom {
    border-radius: 0; }

progressbar.osd {
  margin: 2px;
  min-height: 2px;
  min-width: 2px; }
  progressbar.osd trough {
    border-style: none;
    border-radius: 0;
    background-image: none;
    background-color: transparent; }
  progressbar.osd progress {
    border-style: none;
    border-radius: 0;
    background-color: #30365f;
    background-image: none; }

.osd,
#XfceNotifyWindow {
  background-color: rgba(22, 23, 45, 0.8);
  color: #ffffff;
  /* used by gnome-settings-daemon's media-keys OSD */
  /* used by Documents */ }
  .osd.background,
  #XfceNotifyWindow.background {
    background-color: rgba(22, 23, 45, 0.6);
    color: #ffffff; }
  .osd .frame,
  #XfceNotifyWindow .frame {
    background-clip: border-box;
    background-origin: border-box; }
  .osd button, .osd button.nautilus-circular-button.image-button,
  #XfceNotifyWindow button {
    background-color: rgba(22, 23, 45, 0.8);
    background-image: none;
    border-color: rgba(204, 204, 204, 0.22);
    color: #ffffff;
    box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22); }
    .osd button:focus, .osd button:hover,
    #XfceNotifyWindow button:focus,
    #XfceNotifyWindow button:hover {
      border-color: mix(#30365f,rgba(255, 255, 255, 0.22),0.3); }
    .osd button:active, .osd button:active:hover, .osd button:active:focus, .osd button:active:hover:focus, .osd button:checked, .osd button:checked:hover, .osd button:checked:focus, .osd button:checked:hover:focus,
    #XfceNotifyWindow button:active,
    #XfceNotifyWindow button:active:hover,
    #XfceNotifyWindow button:active:focus,
    #XfceNotifyWindow button:active:hover:focus,
    #XfceNotifyWindow button:checked,
    #XfceNotifyWindow button:checked:hover,
    #XfceNotifyWindow button:checked:focus,
    #XfceNotifyWindow button:checked:hover:focus {
      border-color: rgba(179, 179, 179, 0.22); }
    .osd button:disabled,
    #XfceNotifyWindow button:disabled {
      border-color: rgba(217, 217, 217, 0.22); }
    .osd button:active:disabled, .osd button:checked:disabled,
    #XfceNotifyWindow button:active:disabled,
    #XfceNotifyWindow button:checked:disabled {
      border-color: rgba(204, 204, 204, 0.22); }
    .linked:not(.vertical) > .osd button:not(:last-child):not(:only-child), .linked:not(.vertical) > :not(:last-child):not(:only-child) .osd button, viewswitcher:not(.vertical) > .osd button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > .osd button:not(:last-child):not(:only-child), .linked:not(.vertical) > #XfceNotifyWindow button:not(:last-child):not(:only-child), .linked:not(.vertical) > :not(:last-child):not(:only-child) #XfceNotifyWindow button, viewswitcher:not(.vertical) > #XfceNotifyWindow button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > #XfceNotifyWindow button:not(:last-child):not(:only-child) {
      border-right-style: none; }
      .linked:not(.vertical) > .osd button:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) .osd button:hover, viewswitcher:not(.vertical) > .osd button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > .osd button:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > #XfceNotifyWindow button:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) #XfceNotifyWindow button:hover, viewswitcher:not(.vertical) > #XfceNotifyWindow button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > #XfceNotifyWindow button:not(:last-child):not(:only-child):hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.36),0.3);
        border-right-style: none;
        box-shadow: inset-1px 0 0 mix(#30365f,rgba(255, 255, 255, 0.36),0.3); }
    .linked:not(.vertical) > .osd button:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > :not(:last-child):not(:only-child) .osd button:checked, viewswitcher:not(.vertical) > .osd button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > .osd button:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > #XfceNotifyWindow button:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > :not(:last-child):not(:only-child) #XfceNotifyWindow button:checked, viewswitcher:not(.vertical) > #XfceNotifyWindow button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > #XfceNotifyWindow button:not(:last-child):not(:only-child):checked {
      border-right-style: none; }
      .linked:not(.vertical) > .osd button:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) .osd button:checked:hover, viewswitcher:not(.vertical) > .osd button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > .osd button:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > #XfceNotifyWindow button:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) #XfceNotifyWindow button:checked:hover, viewswitcher:not(.vertical) > #XfceNotifyWindow button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > #XfceNotifyWindow button:not(:last-child):not(:only-child):checked:hover {
        border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
        border-right-style: none;
        box-shadow: inset-1px 0 0 mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
    .linked.vertical > .osd button:not(:last-child):not(:only-child), .linked.vertical > :not(:last-child):not(:only-child) .osd button, stackswitcher.vertical > .osd button:not(:last-child):not(:only-child), .linked.vertical > #XfceNotifyWindow button:not(:last-child):not(:only-child), .linked.vertical > :not(:last-child):not(:only-child) #XfceNotifyWindow button, stackswitcher.vertical > #XfceNotifyWindow button:not(:last-child):not(:only-child) {
      border-bottom-style: none; }
      .linked.vertical > .osd button:not(:last-child):not(:only-child):hover, .linked.vertical > :not(:last-child):not(:only-child) .osd button:hover, stackswitcher.vertical > .osd button:not(:last-child):not(:only-child):hover, .linked.vertical > #XfceNotifyWindow button:not(:last-child):not(:only-child):hover, .linked.vertical > :not(:last-child):not(:only-child) #XfceNotifyWindow button:hover, stackswitcher.vertical > #XfceNotifyWindow button:not(:last-child):not(:only-child):hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.36),0.3);
        border-bottom-style: none;
        box-shadow: inset 0 -1px mix(#30365f,rgba(255, 255, 255, 0.36),0.3); }
    .linked.vertical > .osd button:not(:last-child):not(:only-child):checked, .linked.vertical > :not(:last-child):not(:only-child) .osd button:checked, stackswitcher.vertical > .osd button:not(:last-child):not(:only-child):checked, .linked.vertical > #XfceNotifyWindow button:not(:last-child):not(:only-child):checked, .linked.vertical > :not(:last-child):not(:only-child) #XfceNotifyWindow button:checked, stackswitcher.vertical > #XfceNotifyWindow button:not(:last-child):not(:only-child):checked {
      border-bottom-style: none; }
      .linked.vertical > .osd button:not(:last-child):not(:only-child):checked:hover, .linked.vertical > :not(:last-child):not(:only-child) .osd button:checked:hover, stackswitcher.vertical > .osd button:not(:last-child):not(:only-child):checked:hover, .linked.vertical > #XfceNotifyWindow button:not(:last-child):not(:only-child):checked:hover, .linked.vertical > :not(:last-child):not(:only-child) #XfceNotifyWindow button:checked:hover, stackswitcher.vertical > #XfceNotifyWindow button:not(:last-child):not(:only-child):checked:hover {
        border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
        border-bottom-style: none;
        box-shadow: inset 0 -1px mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
    .osd button.flat,
    #XfceNotifyWindow button.flat {
      color: #ffffff;
      border-color: rgba(22, 23, 45, 0);
      background-color: rgba(22, 23, 45, 0);
      background-image: none;
      box-shadow: none; }
    .osd button:hover, .osd button.flat:hover,
    #XfceNotifyWindow button:hover,
    #XfceNotifyWindow button.flat:hover {
      background-color: rgba(23, 24, 47, 0.8);
      background-image: none;
      border-color: rgba(204, 204, 204, 0.3);
      color: #ffffff;
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.32); }
      .osd button:hover:focus, .osd button:hover:hover, .osd button.flat:hover:focus, .osd button.flat:hover:hover,
      #XfceNotifyWindow button:hover:focus,
      #XfceNotifyWindow button:hover:hover,
      #XfceNotifyWindow button.flat:hover:focus,
      #XfceNotifyWindow button.flat:hover:hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.3),0.3); }
      .osd button:hover:active, .osd button:hover:active:focus, .osd button.flat:hover:active:focus, .osd button:hover:checked, .osd button:hover:checked:focus, .osd button.flat:hover:checked:focus, .osd button.flat:hover:active, .osd button.flat:hover:active:hover:focus, .osd button.flat:hover:checked, .osd button.flat:hover:checked:hover:focus,
      #XfceNotifyWindow button:hover:active,
      #XfceNotifyWindow button:hover:active:focus,
      #XfceNotifyWindow button.flat:hover:active:focus,
      #XfceNotifyWindow button:hover:checked,
      #XfceNotifyWindow button:hover:checked:focus,
      #XfceNotifyWindow button.flat:hover:checked:focus,
      #XfceNotifyWindow button.flat:hover:active,
      #XfceNotifyWindow button.flat:hover:active:hover:focus,
      #XfceNotifyWindow button.flat:hover:checked,
      #XfceNotifyWindow button.flat:hover:checked:hover:focus {
        border-color: rgba(179, 179, 179, 0.3); }
      .osd button:hover:disabled, .osd button.flat:hover:disabled,
      #XfceNotifyWindow button:hover:disabled,
      #XfceNotifyWindow button.flat:hover:disabled {
        border-color: rgba(217, 217, 217, 0.3); }
      .osd button:hover:active:disabled, .osd button:hover:checked:disabled, .osd button.flat:hover:active:disabled, .osd button.flat:hover:checked:disabled,
      #XfceNotifyWindow button:hover:active:disabled,
      #XfceNotifyWindow button:hover:checked:disabled,
      #XfceNotifyWindow button.flat:hover:active:disabled,
      #XfceNotifyWindow button.flat:hover:checked:disabled {
        border-color: rgba(204, 204, 204, 0.3); }
    .osd button:focus, .osd button.flat:focus,
    #XfceNotifyWindow button:focus,
    #XfceNotifyWindow button.flat:focus {
      background-color: rgba(23, 24, 47, 0.8);
      background-image: none;
      border-color: rgba(255, 255, 255, 0.22);
      outline-color: rgba(48, 54, 95, 0.5);
      outline-width: 3px;
      outline-style: solid;
      outline-offset: 10px;
      color: #ffffff;
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
      .osd button:focus:hover, .osd button.flat:focus:hover,
      #XfceNotifyWindow button:focus:hover,
      #XfceNotifyWindow button.flat:focus:hover {
        background-color: rgba(24, 25, 50, 0.8);
        background-image: none;
        border-color: rgba(204, 204, 204, 0.3);
        box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.48); }
        .osd button:focus:hover:hover, .osd button.flat:focus:hover:hover,
        #XfceNotifyWindow button:focus:hover:hover,
        #XfceNotifyWindow button.flat:focus:hover:hover {
          border-color: mix(#30365f,rgba(255, 255, 255, 0.3),0.3); }
        .osd button:focus:hover:active, .osd button.flat:focus:hover:active, .osd button.flat:focus:hover:active:focus, .osd button:focus:hover:checked, .osd button.flat:focus:hover:checked, .osd button.flat:focus:hover:checked:focus, .osd button.flat:focus:hover:active:hover:focus, .osd button.flat:focus:hover:checked:hover:focus,
        #XfceNotifyWindow button:focus:hover:active,
        #XfceNotifyWindow button.flat:focus:hover:active,
        #XfceNotifyWindow button.flat:focus:hover:active:focus,
        #XfceNotifyWindow button:focus:hover:checked,
        #XfceNotifyWindow button.flat:focus:hover:checked,
        #XfceNotifyWindow button.flat:focus:hover:checked:focus,
        #XfceNotifyWindow button.flat:focus:hover:active:hover:focus,
        #XfceNotifyWindow button.flat:focus:hover:checked:hover:focus {
          border-color: rgba(179, 179, 179, 0.3); }
        .osd button:focus:hover:disabled, .osd button.flat:focus:hover:disabled,
        #XfceNotifyWindow button:focus:hover:disabled,
        #XfceNotifyWindow button.flat:focus:hover:disabled {
          border-color: rgba(217, 217, 217, 0.3); }
        .osd button:focus:hover:active:disabled, .osd button:focus:hover:checked:disabled, .osd button.flat:focus:hover:active:disabled, .osd button.flat:focus:hover:checked:disabled,
        #XfceNotifyWindow button:focus:hover:active:disabled,
        #XfceNotifyWindow button:focus:hover:checked:disabled,
        #XfceNotifyWindow button.flat:focus:hover:active:disabled,
        #XfceNotifyWindow button.flat:focus:hover:checked:disabled {
          border-color: rgba(204, 204, 204, 0.3); }
    .osd button:checked, .osd button:active, .osd button.flat:checked, .osd button.flat:active,
    #XfceNotifyWindow button:checked,
    #XfceNotifyWindow button:active,
    #XfceNotifyWindow button.flat:checked,
    #XfceNotifyWindow button.flat:active {
      /*@include linear-gradient(shade($bg, .7), to top);*/
      background-color: #30365f;
      background-image: none;
      border-color: rgba(204, 204, 204, 0.22);
      color: #ffffff;
      box-shadow: inset 1px 0 rgba(255, 255, 255, 0.06), inset 0 1px rgba(255, 255, 255, 0.07), inset -1px 0 rgba(255, 255, 255, 0.06), inset 0 -1px rgba(255, 255, 255, 0.05); }
      .osd button:checked:focus, .osd button:checked:hover, .osd button:active:focus, .osd button:active:hover, .osd button.flat:checked:focus, .osd button.flat:checked:hover, .osd button.flat:active:focus, .osd button.flat:active:hover,
      #XfceNotifyWindow button:checked:focus,
      #XfceNotifyWindow button:checked:hover,
      #XfceNotifyWindow button:active:focus,
      #XfceNotifyWindow button:active:hover,
      #XfceNotifyWindow button.flat:checked:focus,
      #XfceNotifyWindow button.flat:checked:hover,
      #XfceNotifyWindow button.flat:active:focus,
      #XfceNotifyWindow button.flat:active:hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.22),0.3); }
      .osd button:checked:active, .osd button.nautilus-circular-button.image-button:checked:active, .osd button:checked:active:hover, .osd button.nautilus-circular-button.image-button:checked:active:hover, .osd button:checked:active:focus, .osd button.nautilus-circular-button.image-button:checked:active:focus, .osd button:checked:active:hover:focus, .osd button.nautilus-circular-button.image-button:checked:active:hover:focus, .osd button:checked:checked, .osd button.nautilus-circular-button.image-button:checked:checked, .osd button:checked:checked:hover, .osd button.nautilus-circular-button.image-button:checked:checked:hover, .osd button:checked:checked:focus, .osd button.nautilus-circular-button.image-button:checked:checked:focus, .osd button:checked:checked:hover:focus, .osd button.nautilus-circular-button.image-button:checked:checked:hover:focus, .osd button:active:active, .osd button.nautilus-circular-button.image-button:active:active, .osd button:active:active:hover, .osd button.nautilus-circular-button.image-button:active:active:hover, .osd button:active:active:focus, .osd button.nautilus-circular-button.image-button:active:active:focus, .osd button:active:active:hover:focus, .osd button.nautilus-circular-button.image-button:active:active:hover:focus, .osd button:active:checked, .osd button.nautilus-circular-button.image-button:active:checked, .osd button:active:checked:hover, .osd button.nautilus-circular-button.image-button:active:checked:hover, .osd button:active:checked:focus, .osd button.nautilus-circular-button.image-button:active:checked:focus, .osd button:active:checked:hover:focus, .osd button.nautilus-circular-button.image-button:active:checked:hover:focus, .osd button.flat:checked:active, .osd button.flat.nautilus-circular-button.image-button:checked:active, .osd button.flat:checked:active:hover, .osd button.flat.nautilus-circular-button.image-button:checked:active:hover, .osd button.flat:checked:active:focus, .osd button.flat.nautilus-circular-button.image-button:checked:active:focus, .osd button.flat:checked:active:hover:focus, .osd button.flat.nautilus-circular-button.image-button:checked:active:hover:focus, .osd button.flat:checked:checked, .osd button.flat.nautilus-circular-button.image-button:checked:checked, .osd button.flat:checked:checked:hover, .osd button.flat.nautilus-circular-button.image-button:checked:checked:hover, .osd button.flat:checked:checked:focus, .osd button.flat.nautilus-circular-button.image-button:checked:checked:focus, .osd button.flat:checked:checked:hover:focus, .osd button.flat.nautilus-circular-button.image-button:checked:checked:hover:focus, .osd button.flat:active:active, .osd button.flat.nautilus-circular-button.image-button:active:active, .osd button.flat:active:active:hover, .osd button.flat.nautilus-circular-button.image-button:active:active:hover, .osd button.flat:active:active:focus, .osd button.flat.nautilus-circular-button.image-button:active:active:focus, .osd button.flat:active:active:hover:focus, .osd button.flat.nautilus-circular-button.image-button:active:active:hover:focus, .osd button.flat:active:checked, .osd button.flat.nautilus-circular-button.image-button:active:checked, .osd button.flat:active:checked:hover, .osd button.flat.nautilus-circular-button.image-button:active:checked:hover, .osd button.flat:active:checked:focus, .osd button.flat.nautilus-circular-button.image-button:active:checked:focus, .osd button.flat:active:checked:hover:focus, .osd button.flat.nautilus-circular-button.image-button:active:checked:hover:focus,
      #XfceNotifyWindow button:checked:active,
      #XfceNotifyWindow button.nautilus-circular-button.image-button:checked:active,
      #XfceNotifyWindow button:checked:active:hover,
      #XfceNotifyWindow button.nautilus-circular-button.image-button:checked:active:hover,
      #XfceNotifyWindow button:checked:active:focus,
      #XfceNotifyWindow button.nautilus-circular-button.image-button:checked:active:focus,
      #XfceNotifyWindow button:checked:active:hover:focus,
      #XfceNotifyWindow button.nautilus-circular-button.image-button:checked:active:hover:focus,
      #XfceNotifyWindow button:checked:checked,
      #XfceNotifyWindow button.nautilus-circular-button.image-button:checked:checked,
      #XfceNotifyWindow button:checked:checked:hover,
      #XfceNotifyWindow button.nautilus-circular-button.image-button:checked:checked:hover,
      #XfceNotifyWindow button:checked:checked:focus,
      #XfceNotifyWindow button.nautilus-circular-button.image-button:checked:checked:focus,
      #XfceNotifyWindow button:checked:checked:hover:focus,
      #XfceNotifyWindow button.nautilus-circular-button.image-button:checked:checked:hover:focus,
      #XfceNotifyWindow button:active:active,
      #XfceNotifyWindow button.nautilus-circular-button.image-button:active:active,
      #XfceNotifyWindow button:active:active:hover,
      #XfceNotifyWindow button.nautilus-circular-button.image-button:active:active:hover,
      #XfceNotifyWindow button:active:active:focus,
      #XfceNotifyWindow button.nautilus-circular-button.image-button:active:active:focus,
      #XfceNotifyWindow button:active:active:hover:focus,
      #XfceNotifyWindow button.nautilus-circular-button.image-button:active:active:hover:focus,
      #XfceNotifyWindow button:active:checked,
      #XfceNotifyWindow button.nautilus-circular-button.image-button:active:checked,
      #XfceNotifyWindow button:active:checked:hover,
      #XfceNotifyWindow button.nautilus-circular-button.image-button:active:checked:hover,
      #XfceNotifyWindow button:active:checked:focus,
      #XfceNotifyWindow button.nautilus-circular-button.image-button:active:checked:focus,
      #XfceNotifyWindow button:active:checked:hover:focus,
      #XfceNotifyWindow button.nautilus-circular-button.image-button:active:checked:hover:focus,
      #XfceNotifyWindow button.flat:checked:active,
      #XfceNotifyWindow button.flat.nautilus-circular-button.image-button:checked:active,
      #XfceNotifyWindow button.flat:checked:active:hover,
      #XfceNotifyWindow button.flat.nautilus-circular-button.image-button:checked:active:hover,
      #XfceNotifyWindow button.flat:checked:active:focus,
      #XfceNotifyWindow button.flat.nautilus-circular-button.image-button:checked:active:focus,
      #XfceNotifyWindow button.flat:checked:active:hover:focus,
      #XfceNotifyWindow button.flat.nautilus-circular-button.image-button:checked:active:hover:focus,
      #XfceNotifyWindow button.flat:checked:checked,
      #XfceNotifyWindow button.flat.nautilus-circular-button.image-button:checked:checked,
      #XfceNotifyWindow button.flat:checked:checked:hover,
      #XfceNotifyWindow button.flat.nautilus-circular-button.image-button:checked:checked:hover,
      #XfceNotifyWindow button.flat:checked:checked:focus,
      #XfceNotifyWindow button.flat.nautilus-circular-button.image-button:checked:checked:focus,
      #XfceNotifyWindow button.flat:checked:checked:hover:focus,
      #XfceNotifyWindow button.flat.nautilus-circular-button.image-button:checked:checked:hover:focus,
      #XfceNotifyWindow button.flat:active:active,
      #XfceNotifyWindow button.flat.nautilus-circular-button.image-button:active:active,
      #XfceNotifyWindow button.flat:active:active:hover,
      #XfceNotifyWindow button.flat.nautilus-circular-button.image-button:active:active:hover,
      #XfceNotifyWindow button.flat:active:active:focus,
      #XfceNotifyWindow button.flat.nautilus-circular-button.image-button:active:active:focus,
      #XfceNotifyWindow button.flat:active:active:hover:focus,
      #XfceNotifyWindow button.flat.nautilus-circular-button.image-button:active:active:hover:focus,
      #XfceNotifyWindow button.flat:active:checked,
      #XfceNotifyWindow button.flat.nautilus-circular-button.image-button:active:checked,
      #XfceNotifyWindow button.flat:active:checked:hover,
      #XfceNotifyWindow button.flat.nautilus-circular-button.image-button:active:checked:hover,
      #XfceNotifyWindow button.flat:active:checked:focus,
      #XfceNotifyWindow button.flat.nautilus-circular-button.image-button:active:checked:focus,
      #XfceNotifyWindow button.flat:active:checked:hover:focus,
      #XfceNotifyWindow button.flat.nautilus-circular-button.image-button:active:checked:hover:focus {
        border-color: rgba(179, 179, 179, 0.22); }
      .osd button:checked:disabled, .osd button:active:disabled, .osd button.flat:checked:disabled, .osd button.flat:active:disabled,
      #XfceNotifyWindow button:checked:disabled,
      #XfceNotifyWindow button:active:disabled,
      #XfceNotifyWindow button.flat:checked:disabled,
      #XfceNotifyWindow button.flat:active:disabled {
        border-color: rgba(217, 217, 217, 0.22); }
      .osd button:active:checked:disabled, .osd button.flat:active:checked:disabled,
      #XfceNotifyWindow button:active:checked:disabled,
      #XfceNotifyWindow button.flat:active:checked:disabled {
        border-color: rgba(204, 204, 204, 0.22); }
      .osd button:checked:focus, .osd button:checked:hover, .osd button:active:focus, .osd button:active:hover, .osd button.flat:checked:focus, .osd button.flat:checked:hover, .osd button.flat:active:focus, .osd button.flat:active:hover,
      #XfceNotifyWindow button:checked:focus,
      #XfceNotifyWindow button:checked:hover,
      #XfceNotifyWindow button:active:focus,
      #XfceNotifyWindow button:active:hover,
      #XfceNotifyWindow button.flat:checked:focus,
      #XfceNotifyWindow button.flat:checked:hover,
      #XfceNotifyWindow button.flat:active:focus,
      #XfceNotifyWindow button.flat:active:hover {
        /*@include linear-gradient(shade($bg, .65), to top);*/
        background-color: #323964;
        background-image: none;
        color: #ffffff; }
    .osd button:focus, .osd button:hover, .osd button.flat:focus, .osd button.flat:hover,
    #XfceNotifyWindow button:focus,
    #XfceNotifyWindow button:hover,
    #XfceNotifyWindow button.flat:focus,
    #XfceNotifyWindow button.flat:hover {
      color: #ffffff; }
    .osd button:disabled:disabled, .osd button.flat:disabled:disabled,
    #XfceNotifyWindow button:disabled:disabled,
    #XfceNotifyWindow button.flat:disabled:disabled {
      background-color: alpha(mix(rgba(22, 23, 45, 0.8),#ffffff,0.2),0.4);
      background-image: none;
      /*border: 1px solid alpha($bg, .2);*/
      opacity: .6;
      color: mix(rgba(22, 23, 45, 0.8),#ffffff,0.6);
      box-shadow: none; }
      .osd button:disabled:disabled :disabled, .osd button.flat:disabled:disabled :disabled,
      #XfceNotifyWindow button:disabled:disabled :disabled,
      #XfceNotifyWindow button.flat:disabled:disabled :disabled {
        color: mix(rgba(22, 23, 45, 0.8),#ffffff,0.6); }
    .osd button:active:disabled, .osd button:checked:disabled, .osd button.flat:active:disabled, .osd button.flat:checked:disabled,
    #XfceNotifyWindow button:active:disabled,
    #XfceNotifyWindow button:checked:disabled,
    #XfceNotifyWindow button.flat:active:disabled,
    #XfceNotifyWindow button.flat:checked:disabled {
      background-color: rgba(48, 54, 95, 0.6);
      background-image: none;
      color: rgba(255, 255, 255, 0.85);
      box-shadow: none; }
      .osd button:active:disabled :disabled, .osd button:checked:disabled :disabled, .osd button.flat:active:disabled :disabled, .osd button.flat:checked:disabled :disabled,
      #XfceNotifyWindow button:active:disabled :disabled,
      #XfceNotifyWindow button:checked:disabled :disabled,
      #XfceNotifyWindow button.flat:active:disabled :disabled,
      #XfceNotifyWindow button.flat:checked:disabled :disabled {
        color: rgba(255, 255, 255, 0.85); }
    .osd button:backdrop, .osd button.flat:backdrop,
    #XfceNotifyWindow button:backdrop,
    #XfceNotifyWindow button.flat:backdrop {
      color: mix(#ffffff,mix(#ffffff,#1b1c36,0.5),0.8); }
    .osd button.separator, .osd button .separator,
    #XfceNotifyWindow button.separator,
    #XfceNotifyWindow button .separator {
      border: 1px solid currentColor;
      color: rgba(22, 23, 45, 0.7); }
      .osd button.separator:disabled, .osd button .separator:disabled,
      #XfceNotifyWindow button.separator:disabled,
      #XfceNotifyWindow button .separator:disabled {
        color: rgba(22, 23, 45, 0.65); }
    .osd button separator, .osd button.nautilus-circular-button.image-button separator,
    #XfceNotifyWindow button separator {
      background-image: image(mix(#ffffff,rgba(22, 23, 45, 0.8),0.9)); }
  .osd entry,
  #XfceNotifyWindow entry {
    background-color: #16172d;
    background-image: none;
    border-color: mix(#ffffff,#16172d,0.8);
    padding: 6px 6.2857142857px;
    color: #ffffff;
    caret-color: #c1c3cc;
    -gtk-secondary-caret-color: #ff0007; }
    .osd entry:focus, .osd entry:hover,
    #XfceNotifyWindow entry:focus,
    #XfceNotifyWindow entry:hover {
      border-color: mix(#30365f,mix(#ffffff,#16172d,0.7),0.3); }
    .osd entry:active, .osd entry:active:hover, .osd entry:active:focus, .osd entry:active:hover:focus, .osd entry:checked, .osd entry:checked:hover, .osd entry:checked:focus, .osd entry:checked:hover:focus,
    #XfceNotifyWindow entry:active,
    #XfceNotifyWindow entry:active:hover,
    #XfceNotifyWindow entry:active:focus,
    #XfceNotifyWindow entry:active:hover:focus,
    #XfceNotifyWindow entry:checked,
    #XfceNotifyWindow entry:checked:hover,
    #XfceNotifyWindow entry:checked:focus,
    #XfceNotifyWindow entry:checked:hover:focus {
      border-color: mix(#ffffff,#16172d,0.32); }
    .osd entry:disabled,
    #XfceNotifyWindow entry:disabled {
      border-color: mix(#ffffff,#16172d,0.84); }
    .osd entry:active:disabled, .osd entry:checked:disabled,
    #XfceNotifyWindow entry:active:disabled,
    #XfceNotifyWindow entry:checked:disabled {
      border-color: mix(#ffffff,#16172d,0.8); }
    .osd entry:focus, .osd entry:active,
    #XfceNotifyWindow entry:focus,
    #XfceNotifyWindow entry:active {
      border-color: mix(#30365f,rgba(19, 20, 38, 0.8),0.3); }
    .osd entry:disabled,
    #XfceNotifyWindow entry:disabled {
      background-color: mix(#16172d,#ffffff,0.07);
      background-image: none;
      opacity: .9;
      color: mix(#16172d,#ffffff,0.9); }
  .osd trough, .osd.trough,
  #XfceNotifyWindow trough,
  #XfceNotifyWindow.trough {
    background-color: rgba(255, 255, 255, 0.3); }
  .osd progressbar, .osd.progressbar,
  #XfceNotifyWindow progressbar,
  #XfceNotifyWindow.progressbar {
    background-color: #ffffff; }
  .osd scale slider,
  #XfceNotifyWindow scale slider {
    background-color: rgba(24, 25, 49, 0.8);
    background-image: none;
    border-color: mix(#ffffff,rgba(22, 23, 45, 0.8),0.8); }
    .osd scale slider:focus, .osd scale slider:hover,
    #XfceNotifyWindow scale slider:focus,
    #XfceNotifyWindow scale slider:hover {
      border-color: mix(#30365f,mix(#ffffff,rgba(22, 23, 45, 0.8),0.7),0.3); }
    .osd scale slider:active, .osd scale slider:active:hover, .osd scale slider:active:focus, .osd scale slider:active:hover:focus, .osd scale slider:checked, .osd scale slider:checked:hover, .osd scale slider:checked:focus, .osd scale slider:checked:hover:focus,
    #XfceNotifyWindow scale slider:active,
    #XfceNotifyWindow scale slider:active:hover,
    #XfceNotifyWindow scale slider:active:focus,
    #XfceNotifyWindow scale slider:active:hover:focus,
    #XfceNotifyWindow scale slider:checked,
    #XfceNotifyWindow scale slider:checked:hover,
    #XfceNotifyWindow scale slider:checked:focus,
    #XfceNotifyWindow scale slider:checked:hover:focus {
      border-color: mix(#ffffff,rgba(22, 23, 45, 0.8),0.32); }
    .osd scale slider:disabled,
    #XfceNotifyWindow scale slider:disabled {
      border-color: mix(#ffffff,rgba(22, 23, 45, 0.8),0.84); }
    .osd scale slider:active:disabled, .osd scale slider:checked:disabled,
    #XfceNotifyWindow scale slider:active:disabled,
    #XfceNotifyWindow scale slider:checked:disabled {
      border-color: mix(#ffffff,rgba(22, 23, 45, 0.8),0.8); }
    .osd scale slider:disabled,
    #XfceNotifyWindow scale slider:disabled {
      background-color: rgba(20, 21, 41, 0.8);
      background-image: none; }
  .osd scale trough,
  #XfceNotifyWindow scale trough {
    border-color: rgba(18, 18, 36, 0.8);
    background-color: rgba(24, 25, 49, 0.8);
    background-image: none; }
    .osd scale trough.highlight,
    #XfceNotifyWindow scale trough.highlight {
      border-color: #30365f;
      background-color: #30365f;
      background-image: none; }
    .osd scale trough:disabled, .osd scale trough.highlight:disabled,
    #XfceNotifyWindow scale trough:disabled,
    #XfceNotifyWindow scale trough.highlight:disabled {
      border-color: rgba(19, 20, 38, 0.8);
      background-color: rgba(20, 21, 41, 0.8);
      background-image: none; }
  .osd scale trough,
  #XfceNotifyWindow scale trough {
    background-color: rgba(34, 35, 69, 0.8); }
    .osd scale trough highlight,
    #XfceNotifyWindow scale trough highlight {
      background-color: #30365f; }
  .osd scale slider,
  #XfceNotifyWindow scale slider {
    background-clip: border-box;
    background-color: #30365f;
    border-color: #30365f; }
    .osd scale slider:hover,
    #XfceNotifyWindow scale slider:hover {
      background-color: #414981;
      border-color: #414981; }
    .osd scale slider:active,
    #XfceNotifyWindow scale slider:active {
      background-color: #1f233d;
      border-color: #1f233d; }
  .osd.view, iconview.osd, .osd .view, .osd iconview, .osd view,
  #XfceNotifyWindow.view,
  iconview#XfceNotifyWindow,
  #XfceNotifyWindow .view,
  #XfceNotifyWindow iconview,
  #XfceNotifyWindow view {
    background-color: rgba(22, 23, 45, 0.8); }
  .osd scrollbar trough,
  #XfceNotifyWindow scrollbar trough {
    background-color: rgba(22, 23, 45, 0.8); }
  .osd scrollbar slider,
  #XfceNotifyWindow scrollbar slider {
    border: 1px solid mix(rgba(19, 20, 39, 0.8),#ffffff,0.21);
    border-radius: 0;
    background-color: mix(rgba(22, 23, 45, 0.8),#ffffff,0.21); }
    .osd scrollbar slider:hover,
    #XfceNotifyWindow scrollbar slider:hover {
      border-color: mix(rgba(19, 20, 39, 0.8),#ffffff,0.31);
      background-color: mix(rgba(22, 23, 45, 0.8),#ffffff,0.31); }
    .osd scrollbar slider:active,
    #XfceNotifyWindow scrollbar slider:active {
      border-color: #2b3156;
      background-color: #30365f; }
  .osd iconview.cell:selected, .osd iconview.cell:selected:focus,
  #XfceNotifyWindow iconview.cell:selected,
  #XfceNotifyWindow iconview.cell:selected:focus {
    background-color: transparent;
    border: 3px solid mix(rgba(19, 20, 39, 0.8),#ffffff,0.21);
    border-radius: 8px;
    outline-color: transparent; }
  .osd .page-thumbnail,
  #XfceNotifyWindow .page-thumbnail {
    border: 1px solid rgba(20, 21, 41, 0.8);
    /* when there's no pixbuf yet */
    background-color: rgba(22, 23, 45, 0.8); }
  .osd popover.background,
  #XfceNotifyWindow popover.background {
    box-shadow: 0 2px 7px 3px rgba(102, 102, 102, 0.5); }
    .osd popover.background > toolbar button,
    #XfceNotifyWindow popover.background > toolbar button {
      border-radius: 0;
      border-width: 0;
      background-color: transparent;
      background-image: none; }
  .osd spinbutton:not(.vertical),
  #XfceNotifyWindow spinbutton:not(.vertical) {
    background-color: #16172d;
    background-image: none;
    border-color: mix(#ffffff,#16172d,0.8);
    padding: 0;
    color: #ffffff;
    caret-color: #ffffff; }
    .osd spinbutton:not(.vertical):focus, .osd spinbutton:not(.vertical):hover,
    #XfceNotifyWindow spinbutton:not(.vertical):focus,
    #XfceNotifyWindow spinbutton:not(.vertical):hover {
      border-color: mix(#30365f,mix(#ffffff,#16172d,0.7),0.3); }
    .osd spinbutton:not(.vertical):active, .osd spinbutton:not(.vertical):active:hover, .osd spinbutton:not(.vertical):active:focus, .osd spinbutton:not(.vertical):active:hover:focus, .osd spinbutton:not(.vertical):checked, .osd spinbutton:not(.vertical):checked:hover, .osd spinbutton:not(.vertical):checked:focus, .osd spinbutton:not(.vertical):checked:hover:focus,
    #XfceNotifyWindow spinbutton:not(.vertical):active,
    #XfceNotifyWindow spinbutton:not(.vertical):active:hover,
    #XfceNotifyWindow spinbutton:not(.vertical):active:focus,
    #XfceNotifyWindow spinbutton:not(.vertical):active:hover:focus,
    #XfceNotifyWindow spinbutton:not(.vertical):checked,
    #XfceNotifyWindow spinbutton:not(.vertical):checked:hover,
    #XfceNotifyWindow spinbutton:not(.vertical):checked:focus,
    #XfceNotifyWindow spinbutton:not(.vertical):checked:hover:focus {
      border-color: mix(#ffffff,#16172d,0.32); }
    .osd spinbutton:not(.vertical):disabled,
    #XfceNotifyWindow spinbutton:not(.vertical):disabled {
      border-color: mix(#ffffff,#16172d,0.84); }
    .osd spinbutton:not(.vertical):active:disabled, .osd spinbutton:not(.vertical):checked:disabled,
    #XfceNotifyWindow spinbutton:not(.vertical):active:disabled,
    #XfceNotifyWindow spinbutton:not(.vertical):checked:disabled {
      border-color: mix(#ffffff,#16172d,0.8); }
    .osd spinbutton:not(.vertical):focus, .osd spinbutton:not(.vertical):active,
    #XfceNotifyWindow spinbutton:not(.vertical):focus,
    #XfceNotifyWindow spinbutton:not(.vertical):active {
      border-color: mix(#30365f,rgba(19, 20, 38, 0.8),0.3); }
    .osd spinbutton:not(.vertical):disabled,
    #XfceNotifyWindow spinbutton:not(.vertical):disabled {
      background-color: #141529;
      background-image: none;
      color: mix(#16172d,#ffffff,0.5); }
    .osd spinbutton:not(.vertical) button,
    #XfceNotifyWindow spinbutton:not(.vertical) button {
      background-color: rgba(22, 23, 45, 0.8);
      background-image: none;
      border-color: rgba(204, 204, 204, 0.22);
      color: #ffffff;
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22);
      border-radius: 0;
      border-color: rgba(19, 20, 38, 0.5);
      border-style: none none none solid;
      background-image: none;
      box-shadow: none; }
      .osd spinbutton:not(.vertical) button:focus, .osd spinbutton:not(.vertical) button:hover,
      #XfceNotifyWindow spinbutton:not(.vertical) button:focus,
      #XfceNotifyWindow spinbutton:not(.vertical) button:hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.22),0.3); }
      .osd spinbutton:not(.vertical) button:active, .osd spinbutton:not(.vertical) button:active:hover, .osd spinbutton:not(.vertical) button:active:focus, .osd spinbutton:not(.vertical) button:active:hover:focus, .osd spinbutton:not(.vertical) button:checked, .osd spinbutton:not(.vertical) button:checked:hover, .osd spinbutton:not(.vertical) button:checked:focus, .osd spinbutton:not(.vertical) button:checked:hover:focus,
      #XfceNotifyWindow spinbutton:not(.vertical) button:active,
      #XfceNotifyWindow spinbutton:not(.vertical) button:active:hover,
      #XfceNotifyWindow spinbutton:not(.vertical) button:active:focus,
      #XfceNotifyWindow spinbutton:not(.vertical) button:active:hover:focus,
      #XfceNotifyWindow spinbutton:not(.vertical) button:checked,
      #XfceNotifyWindow spinbutton:not(.vertical) button:checked:hover,
      #XfceNotifyWindow spinbutton:not(.vertical) button:checked:focus,
      #XfceNotifyWindow spinbutton:not(.vertical) button:checked:hover:focus {
        border-color: rgba(179, 179, 179, 0.22); }
      .osd spinbutton:not(.vertical) button:disabled,
      #XfceNotifyWindow spinbutton:not(.vertical) button:disabled {
        border-color: rgba(217, 217, 217, 0.22); }
      .osd spinbutton:not(.vertical) button:active:disabled, .osd spinbutton:not(.vertical) button:checked:disabled,
      #XfceNotifyWindow spinbutton:not(.vertical) button:active:disabled,
      #XfceNotifyWindow spinbutton:not(.vertical) button:checked:disabled {
        border-color: rgba(204, 204, 204, 0.22); }
      .linked:not(.vertical) > .osd spinbutton:not(.vertical) button:not(:last-child):not(:only-child), .linked:not(.vertical) > :not(:last-child):not(:only-child) .osd spinbutton:not(.vertical) button, viewswitcher:not(.vertical) > .osd spinbutton:not(.vertical) button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > .osd spinbutton:not(.vertical) button:not(:last-child):not(:only-child), .linked:not(.vertical) > #XfceNotifyWindow spinbutton:not(.vertical) button:not(:last-child):not(:only-child), .linked:not(.vertical) > :not(:last-child):not(:only-child) #XfceNotifyWindow spinbutton:not(.vertical) button, viewswitcher:not(.vertical) > #XfceNotifyWindow spinbutton:not(.vertical) button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > #XfceNotifyWindow spinbutton:not(.vertical) button:not(:last-child):not(:only-child) {
        border-right-style: none; }
        .linked:not(.vertical) > .osd spinbutton:not(.vertical) button:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) .osd spinbutton:not(.vertical) button:hover, viewswitcher:not(.vertical) > .osd spinbutton:not(.vertical) button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > .osd spinbutton:not(.vertical) button:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > #XfceNotifyWindow spinbutton:not(.vertical) button:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) #XfceNotifyWindow spinbutton:not(.vertical) button:hover, viewswitcher:not(.vertical) > #XfceNotifyWindow spinbutton:not(.vertical) button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > #XfceNotifyWindow spinbutton:not(.vertical) button:not(:last-child):not(:only-child):hover {
          border-color: mix(#30365f,rgba(255, 255, 255, 0.36),0.3);
          border-right-style: none;
          box-shadow: inset-1px 0 0 mix(#30365f,rgba(255, 255, 255, 0.36),0.3); }
      .linked:not(.vertical) > .osd spinbutton:not(.vertical) button:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > :not(:last-child):not(:only-child) .osd spinbutton:not(.vertical) button:checked, viewswitcher:not(.vertical) > .osd spinbutton:not(.vertical) button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > .osd spinbutton:not(.vertical) button:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > #XfceNotifyWindow spinbutton:not(.vertical) button:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > :not(:last-child):not(:only-child) #XfceNotifyWindow spinbutton:not(.vertical) button:checked, viewswitcher:not(.vertical) > #XfceNotifyWindow spinbutton:not(.vertical) button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > #XfceNotifyWindow spinbutton:not(.vertical) button:not(:last-child):not(:only-child):checked {
        border-right-style: none; }
        .linked:not(.vertical) > .osd spinbutton:not(.vertical) button:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) .osd spinbutton:not(.vertical) button:checked:hover, viewswitcher:not(.vertical) > .osd spinbutton:not(.vertical) button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > .osd spinbutton:not(.vertical) button:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > #XfceNotifyWindow spinbutton:not(.vertical) button:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) #XfceNotifyWindow spinbutton:not(.vertical) button:checked:hover, viewswitcher:not(.vertical) > #XfceNotifyWindow spinbutton:not(.vertical) button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > #XfceNotifyWindow spinbutton:not(.vertical) button:not(:last-child):not(:only-child):checked:hover {
          border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
          border-right-style: none;
          box-shadow: inset-1px 0 0 mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
      .linked.vertical > .osd spinbutton:not(.vertical) button:not(:last-child):not(:only-child), .linked.vertical > :not(:last-child):not(:only-child) .osd spinbutton:not(.vertical) button, stackswitcher.vertical > .osd spinbutton:not(.vertical) button:not(:last-child):not(:only-child), .linked.vertical > #XfceNotifyWindow spinbutton:not(.vertical) button:not(:last-child):not(:only-child), .linked.vertical > :not(:last-child):not(:only-child) #XfceNotifyWindow spinbutton:not(.vertical) button, stackswitcher.vertical > #XfceNotifyWindow spinbutton:not(.vertical) button:not(:last-child):not(:only-child) {
        border-bottom-style: none; }
        .linked.vertical > .osd spinbutton:not(.vertical) button:not(:last-child):not(:only-child):hover, .linked.vertical > :not(:last-child):not(:only-child) .osd spinbutton:not(.vertical) button:hover, stackswitcher.vertical > .osd spinbutton:not(.vertical) button:not(:last-child):not(:only-child):hover, .linked.vertical > #XfceNotifyWindow spinbutton:not(.vertical) button:not(:last-child):not(:only-child):hover, .linked.vertical > :not(:last-child):not(:only-child) #XfceNotifyWindow spinbutton:not(.vertical) button:hover, stackswitcher.vertical > #XfceNotifyWindow spinbutton:not(.vertical) button:not(:last-child):not(:only-child):hover {
          border-color: mix(#30365f,rgba(255, 255, 255, 0.36),0.3);
          border-bottom-style: none;
          box-shadow: inset 0 -1px mix(#30365f,rgba(255, 255, 255, 0.36),0.3); }
      .linked.vertical > .osd spinbutton:not(.vertical) button:not(:last-child):not(:only-child):checked, .linked.vertical > :not(:last-child):not(:only-child) .osd spinbutton:not(.vertical) button:checked, stackswitcher.vertical > .osd spinbutton:not(.vertical) button:not(:last-child):not(:only-child):checked, .linked.vertical > #XfceNotifyWindow spinbutton:not(.vertical) button:not(:last-child):not(:only-child):checked, .linked.vertical > :not(:last-child):not(:only-child) #XfceNotifyWindow spinbutton:not(.vertical) button:checked, stackswitcher.vertical > #XfceNotifyWindow spinbutton:not(.vertical) button:not(:last-child):not(:only-child):checked {
        border-bottom-style: none; }
        .linked.vertical > .osd spinbutton:not(.vertical) button:not(:last-child):not(:only-child):checked:hover, .linked.vertical > :not(:last-child):not(:only-child) .osd spinbutton:not(.vertical) button:checked:hover, stackswitcher.vertical > .osd spinbutton:not(.vertical) button:not(:last-child):not(:only-child):checked:hover, .linked.vertical > #XfceNotifyWindow spinbutton:not(.vertical) button:not(:last-child):not(:only-child):checked:hover, .linked.vertical > :not(:last-child):not(:only-child) #XfceNotifyWindow spinbutton:not(.vertical) button:checked:hover, stackswitcher.vertical > #XfceNotifyWindow spinbutton:not(.vertical) button:not(:last-child):not(:only-child):checked:hover {
          border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
          border-bottom-style: none;
          box-shadow: inset 0 -1px mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
      .osd spinbutton:not(.vertical) button.flat,
      #XfceNotifyWindow spinbutton:not(.vertical) button.flat {
        color: #ffffff;
        border-color: rgba(22, 23, 45, 0);
        background-color: rgba(22, 23, 45, 0);
        background-image: none;
        box-shadow: none; }
      .osd spinbutton:not(.vertical) button:hover, .osd spinbutton:not(.vertical) button.flat:hover,
      #XfceNotifyWindow spinbutton:not(.vertical) button:hover,
      #XfceNotifyWindow spinbutton:not(.vertical) button.flat:hover {
        background-color: rgba(23, 24, 47, 0.8);
        background-image: none;
        border-color: rgba(204, 204, 204, 0.3);
        color: #ffffff;
        box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.32); }
        .osd spinbutton:not(.vertical) button:hover:focus, .osd spinbutton:not(.vertical) button:hover:hover, .osd spinbutton:not(.vertical) button.flat:hover:focus, .osd spinbutton:not(.vertical) button.flat:hover:hover,
        #XfceNotifyWindow spinbutton:not(.vertical) button:hover:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button:hover:hover,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:hover:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:hover:hover {
          border-color: mix(#30365f,rgba(255, 255, 255, 0.3),0.3); }
        .osd spinbutton:not(.vertical) button:hover:active, .osd spinbutton:not(.vertical) button:hover:active:focus, .osd spinbutton:not(.vertical) button.flat:hover:active:focus, .osd spinbutton:not(.vertical) button:hover:checked, .osd spinbutton:not(.vertical) button:hover:checked:focus, .osd spinbutton:not(.vertical) button.flat:hover:checked:focus, .osd spinbutton:not(.vertical) button.flat:hover:active, .osd spinbutton:not(.vertical) button.flat:hover:active:hover:focus, .osd spinbutton:not(.vertical) button.flat:hover:checked, .osd spinbutton:not(.vertical) button.flat:hover:checked:hover:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button:hover:active,
        #XfceNotifyWindow spinbutton:not(.vertical) button:hover:active:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:hover:active:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button:hover:checked,
        #XfceNotifyWindow spinbutton:not(.vertical) button:hover:checked:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:hover:checked:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:hover:active,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:hover:active:hover:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:hover:checked,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:hover:checked:hover:focus {
          border-color: rgba(179, 179, 179, 0.3); }
        .osd spinbutton:not(.vertical) button:hover:disabled, .osd spinbutton:not(.vertical) button.flat:hover:disabled,
        #XfceNotifyWindow spinbutton:not(.vertical) button:hover:disabled,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:hover:disabled {
          border-color: rgba(217, 217, 217, 0.3); }
        .osd spinbutton:not(.vertical) button:hover:active:disabled, .osd spinbutton:not(.vertical) button:hover:checked:disabled, .osd spinbutton:not(.vertical) button.flat:hover:active:disabled, .osd spinbutton:not(.vertical) button.flat:hover:checked:disabled,
        #XfceNotifyWindow spinbutton:not(.vertical) button:hover:active:disabled,
        #XfceNotifyWindow spinbutton:not(.vertical) button:hover:checked:disabled,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:hover:active:disabled,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:hover:checked:disabled {
          border-color: rgba(204, 204, 204, 0.3); }
      .osd spinbutton:not(.vertical) button:focus, .osd spinbutton:not(.vertical) button.flat:focus,
      #XfceNotifyWindow spinbutton:not(.vertical) button:focus,
      #XfceNotifyWindow spinbutton:not(.vertical) button.flat:focus {
        background-color: rgba(23, 24, 47, 0.8);
        background-image: none;
        border-color: rgba(255, 255, 255, 0.22);
        outline-color: rgba(48, 54, 95, 0.5);
        outline-width: 3px;
        outline-style: solid;
        outline-offset: 10px;
        color: #ffffff;
        box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
        .osd spinbutton:not(.vertical) button:focus:hover, .osd spinbutton:not(.vertical) button.flat:focus:hover,
        #XfceNotifyWindow spinbutton:not(.vertical) button:focus:hover,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:focus:hover {
          background-color: rgba(24, 25, 50, 0.8);
          background-image: none;
          border-color: rgba(204, 204, 204, 0.3);
          box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.48); }
          .osd spinbutton:not(.vertical) button:focus:hover:hover, .osd spinbutton:not(.vertical) button.flat:focus:hover:hover,
          #XfceNotifyWindow spinbutton:not(.vertical) button:focus:hover:hover,
          #XfceNotifyWindow spinbutton:not(.vertical) button.flat:focus:hover:hover {
            border-color: mix(#30365f,rgba(255, 255, 255, 0.3),0.3); }
          .osd spinbutton:not(.vertical) button:focus:hover:active, .osd spinbutton:not(.vertical) button.flat:focus:hover:active, .osd spinbutton:not(.vertical) button.flat:focus:hover:active:focus, .osd spinbutton:not(.vertical) button:focus:hover:checked, .osd spinbutton:not(.vertical) button.flat:focus:hover:checked, .osd spinbutton:not(.vertical) button.flat:focus:hover:checked:focus, .osd spinbutton:not(.vertical) button.flat:focus:hover:active:hover:focus, .osd spinbutton:not(.vertical) button.flat:focus:hover:checked:hover:focus,
          #XfceNotifyWindow spinbutton:not(.vertical) button:focus:hover:active,
          #XfceNotifyWindow spinbutton:not(.vertical) button.flat:focus:hover:active,
          #XfceNotifyWindow spinbutton:not(.vertical) button.flat:focus:hover:active:focus,
          #XfceNotifyWindow spinbutton:not(.vertical) button:focus:hover:checked,
          #XfceNotifyWindow spinbutton:not(.vertical) button.flat:focus:hover:checked,
          #XfceNotifyWindow spinbutton:not(.vertical) button.flat:focus:hover:checked:focus,
          #XfceNotifyWindow spinbutton:not(.vertical) button.flat:focus:hover:active:hover:focus,
          #XfceNotifyWindow spinbutton:not(.vertical) button.flat:focus:hover:checked:hover:focus {
            border-color: rgba(179, 179, 179, 0.3); }
          .osd spinbutton:not(.vertical) button:focus:hover:disabled, .osd spinbutton:not(.vertical) button.flat:focus:hover:disabled,
          #XfceNotifyWindow spinbutton:not(.vertical) button:focus:hover:disabled,
          #XfceNotifyWindow spinbutton:not(.vertical) button.flat:focus:hover:disabled {
            border-color: rgba(217, 217, 217, 0.3); }
          .osd spinbutton:not(.vertical) button:focus:hover:active:disabled, .osd spinbutton:not(.vertical) button:focus:hover:checked:disabled, .osd spinbutton:not(.vertical) button.flat:focus:hover:active:disabled, .osd spinbutton:not(.vertical) button.flat:focus:hover:checked:disabled,
          #XfceNotifyWindow spinbutton:not(.vertical) button:focus:hover:active:disabled,
          #XfceNotifyWindow spinbutton:not(.vertical) button:focus:hover:checked:disabled,
          #XfceNotifyWindow spinbutton:not(.vertical) button.flat:focus:hover:active:disabled,
          #XfceNotifyWindow spinbutton:not(.vertical) button.flat:focus:hover:checked:disabled {
            border-color: rgba(204, 204, 204, 0.3); }
      .osd spinbutton:not(.vertical) button:checked, .osd spinbutton:not(.vertical) button:active, .osd spinbutton:not(.vertical) button.flat:checked, .osd spinbutton:not(.vertical) button.flat:active,
      #XfceNotifyWindow spinbutton:not(.vertical) button:checked,
      #XfceNotifyWindow spinbutton:not(.vertical) button:active,
      #XfceNotifyWindow spinbutton:not(.vertical) button.flat:checked,
      #XfceNotifyWindow spinbutton:not(.vertical) button.flat:active {
        /*@include linear-gradient(shade($bg, .7), to top);*/
        background-color: #30365f;
        background-image: none;
        border-color: rgba(204, 204, 204, 0.22);
        color: #ffffff;
        box-shadow: inset 1px 0 rgba(255, 255, 255, 0.06), inset 0 1px rgba(255, 255, 255, 0.07), inset -1px 0 rgba(255, 255, 255, 0.06), inset 0 -1px rgba(255, 255, 255, 0.05); }
        .osd spinbutton:not(.vertical) button:checked:focus, .osd spinbutton:not(.vertical) button:checked:hover, .osd spinbutton:not(.vertical) button:active:focus, .osd spinbutton:not(.vertical) button:active:hover, .osd spinbutton:not(.vertical) button.flat:checked:focus, .osd spinbutton:not(.vertical) button.flat:checked:hover, .osd spinbutton:not(.vertical) button.flat:active:focus, .osd spinbutton:not(.vertical) button.flat:active:hover,
        #XfceNotifyWindow spinbutton:not(.vertical) button:checked:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button:checked:hover,
        #XfceNotifyWindow spinbutton:not(.vertical) button:active:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button:active:hover,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:checked:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:checked:hover,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:active:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:active:hover {
          border-color: mix(#30365f,rgba(255, 255, 255, 0.22),0.3); }
        .osd spinbutton:not(.vertical) button:checked:active, .osd spinbutton:not(.vertical) button.nautilus-circular-button.image-button:checked:active, .osd spinbutton:not(.vertical) button:checked:active:hover, .osd spinbutton:not(.vertical) button.nautilus-circular-button.image-button:checked:active:hover, .osd spinbutton:not(.vertical) button:checked:active:focus, .osd spinbutton:not(.vertical) button.nautilus-circular-button.image-button:checked:active:focus, .osd spinbutton:not(.vertical) button:checked:active:hover:focus, .osd spinbutton:not(.vertical) button.nautilus-circular-button.image-button:checked:active:hover:focus, .osd spinbutton:not(.vertical) button:checked:checked, .osd spinbutton:not(.vertical) button.nautilus-circular-button.image-button:checked:checked, .osd spinbutton:not(.vertical) button:checked:checked:hover, .osd spinbutton:not(.vertical) button.nautilus-circular-button.image-button:checked:checked:hover, .osd spinbutton:not(.vertical) button:checked:checked:focus, .osd spinbutton:not(.vertical) button.nautilus-circular-button.image-button:checked:checked:focus, .osd spinbutton:not(.vertical) button:checked:checked:hover:focus, .osd spinbutton:not(.vertical) button.nautilus-circular-button.image-button:checked:checked:hover:focus, .osd spinbutton:not(.vertical) button:active:active, .osd spinbutton:not(.vertical) button.nautilus-circular-button.image-button:active:active, .osd spinbutton:not(.vertical) button:active:active:hover, .osd spinbutton:not(.vertical) button.nautilus-circular-button.image-button:active:active:hover, .osd spinbutton:not(.vertical) button:active:active:focus, .osd spinbutton:not(.vertical) button.nautilus-circular-button.image-button:active:active:focus, .osd spinbutton:not(.vertical) button:active:active:hover:focus, .osd spinbutton:not(.vertical) button.nautilus-circular-button.image-button:active:active:hover:focus, .osd spinbutton:not(.vertical) button:active:checked, .osd spinbutton:not(.vertical) button.nautilus-circular-button.image-button:active:checked, .osd spinbutton:not(.vertical) button:active:checked:hover, .osd spinbutton:not(.vertical) button.nautilus-circular-button.image-button:active:checked:hover, .osd spinbutton:not(.vertical) button:active:checked:focus, .osd spinbutton:not(.vertical) button.nautilus-circular-button.image-button:active:checked:focus, .osd spinbutton:not(.vertical) button:active:checked:hover:focus, .osd spinbutton:not(.vertical) button.nautilus-circular-button.image-button:active:checked:hover:focus, .osd spinbutton:not(.vertical) button.flat:checked:active, .osd spinbutton:not(.vertical) button.flat.nautilus-circular-button.image-button:checked:active, .osd spinbutton:not(.vertical) button.flat:checked:active:hover, .osd spinbutton:not(.vertical) button.flat.nautilus-circular-button.image-button:checked:active:hover, .osd spinbutton:not(.vertical) button.flat:checked:active:focus, .osd spinbutton:not(.vertical) button.flat.nautilus-circular-button.image-button:checked:active:focus, .osd spinbutton:not(.vertical) button.flat:checked:active:hover:focus, .osd spinbutton:not(.vertical) button.flat.nautilus-circular-button.image-button:checked:active:hover:focus, .osd spinbutton:not(.vertical) button.flat:checked:checked, .osd spinbutton:not(.vertical) button.flat.nautilus-circular-button.image-button:checked:checked, .osd spinbutton:not(.vertical) button.flat:checked:checked:hover, .osd spinbutton:not(.vertical) button.flat.nautilus-circular-button.image-button:checked:checked:hover, .osd spinbutton:not(.vertical) button.flat:checked:checked:focus, .osd spinbutton:not(.vertical) button.flat.nautilus-circular-button.image-button:checked:checked:focus, .osd spinbutton:not(.vertical) button.flat:checked:checked:hover:focus, .osd spinbutton:not(.vertical) button.flat.nautilus-circular-button.image-button:checked:checked:hover:focus, .osd spinbutton:not(.vertical) button.flat:active:active, .osd spinbutton:not(.vertical) button.flat.nautilus-circular-button.image-button:active:active, .osd spinbutton:not(.vertical) button.flat:active:active:hover, .osd spinbutton:not(.vertical) button.flat.nautilus-circular-button.image-button:active:active:hover, .osd spinbutton:not(.vertical) button.flat:active:active:focus, .osd spinbutton:not(.vertical) button.flat.nautilus-circular-button.image-button:active:active:focus, .osd spinbutton:not(.vertical) button.flat:active:active:hover:focus, .osd spinbutton:not(.vertical) button.flat.nautilus-circular-button.image-button:active:active:hover:focus, .osd spinbutton:not(.vertical) button.flat:active:checked, .osd spinbutton:not(.vertical) button.flat.nautilus-circular-button.image-button:active:checked, .osd spinbutton:not(.vertical) button.flat:active:checked:hover, .osd spinbutton:not(.vertical) button.flat.nautilus-circular-button.image-button:active:checked:hover, .osd spinbutton:not(.vertical) button.flat:active:checked:focus, .osd spinbutton:not(.vertical) button.flat.nautilus-circular-button.image-button:active:checked:focus, .osd spinbutton:not(.vertical) button.flat:active:checked:hover:focus, .osd spinbutton:not(.vertical) button.flat.nautilus-circular-button.image-button:active:checked:hover:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button:checked:active,
        #XfceNotifyWindow spinbutton:not(.vertical) button.nautilus-circular-button.image-button:checked:active,
        #XfceNotifyWindow spinbutton:not(.vertical) button:checked:active:hover,
        #XfceNotifyWindow spinbutton:not(.vertical) button.nautilus-circular-button.image-button:checked:active:hover,
        #XfceNotifyWindow spinbutton:not(.vertical) button:checked:active:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button.nautilus-circular-button.image-button:checked:active:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button:checked:active:hover:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button.nautilus-circular-button.image-button:checked:active:hover:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button:checked:checked,
        #XfceNotifyWindow spinbutton:not(.vertical) button.nautilus-circular-button.image-button:checked:checked,
        #XfceNotifyWindow spinbutton:not(.vertical) button:checked:checked:hover,
        #XfceNotifyWindow spinbutton:not(.vertical) button.nautilus-circular-button.image-button:checked:checked:hover,
        #XfceNotifyWindow spinbutton:not(.vertical) button:checked:checked:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button.nautilus-circular-button.image-button:checked:checked:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button:checked:checked:hover:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button.nautilus-circular-button.image-button:checked:checked:hover:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button:active:active,
        #XfceNotifyWindow spinbutton:not(.vertical) button.nautilus-circular-button.image-button:active:active,
        #XfceNotifyWindow spinbutton:not(.vertical) button:active:active:hover,
        #XfceNotifyWindow spinbutton:not(.vertical) button.nautilus-circular-button.image-button:active:active:hover,
        #XfceNotifyWindow spinbutton:not(.vertical) button:active:active:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button.nautilus-circular-button.image-button:active:active:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button:active:active:hover:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button.nautilus-circular-button.image-button:active:active:hover:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button:active:checked,
        #XfceNotifyWindow spinbutton:not(.vertical) button.nautilus-circular-button.image-button:active:checked,
        #XfceNotifyWindow spinbutton:not(.vertical) button:active:checked:hover,
        #XfceNotifyWindow spinbutton:not(.vertical) button.nautilus-circular-button.image-button:active:checked:hover,
        #XfceNotifyWindow spinbutton:not(.vertical) button:active:checked:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button.nautilus-circular-button.image-button:active:checked:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button:active:checked:hover:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button.nautilus-circular-button.image-button:active:checked:hover:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:checked:active,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat.nautilus-circular-button.image-button:checked:active,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:checked:active:hover,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat.nautilus-circular-button.image-button:checked:active:hover,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:checked:active:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat.nautilus-circular-button.image-button:checked:active:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:checked:active:hover:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat.nautilus-circular-button.image-button:checked:active:hover:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:checked:checked,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat.nautilus-circular-button.image-button:checked:checked,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:checked:checked:hover,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat.nautilus-circular-button.image-button:checked:checked:hover,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:checked:checked:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat.nautilus-circular-button.image-button:checked:checked:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:checked:checked:hover:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat.nautilus-circular-button.image-button:checked:checked:hover:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:active:active,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat.nautilus-circular-button.image-button:active:active,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:active:active:hover,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat.nautilus-circular-button.image-button:active:active:hover,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:active:active:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat.nautilus-circular-button.image-button:active:active:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:active:active:hover:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat.nautilus-circular-button.image-button:active:active:hover:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:active:checked,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat.nautilus-circular-button.image-button:active:checked,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:active:checked:hover,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat.nautilus-circular-button.image-button:active:checked:hover,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:active:checked:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat.nautilus-circular-button.image-button:active:checked:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:active:checked:hover:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat.nautilus-circular-button.image-button:active:checked:hover:focus {
          border-color: rgba(179, 179, 179, 0.22); }
        .osd spinbutton:not(.vertical) button:checked:disabled, .osd spinbutton:not(.vertical) button:active:disabled, .osd spinbutton:not(.vertical) button.flat:checked:disabled, .osd spinbutton:not(.vertical) button.flat:active:disabled,
        #XfceNotifyWindow spinbutton:not(.vertical) button:checked:disabled,
        #XfceNotifyWindow spinbutton:not(.vertical) button:active:disabled,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:checked:disabled,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:active:disabled {
          border-color: rgba(217, 217, 217, 0.22); }
        .osd spinbutton:not(.vertical) button:active:checked:disabled, .osd spinbutton:not(.vertical) button.flat:active:checked:disabled,
        #XfceNotifyWindow spinbutton:not(.vertical) button:active:checked:disabled,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:active:checked:disabled {
          border-color: rgba(204, 204, 204, 0.22); }
        .osd spinbutton:not(.vertical) button:checked:focus, .osd spinbutton:not(.vertical) button:checked:hover, .osd spinbutton:not(.vertical) button:active:focus, .osd spinbutton:not(.vertical) button:active:hover, .osd spinbutton:not(.vertical) button.flat:checked:focus, .osd spinbutton:not(.vertical) button.flat:checked:hover, .osd spinbutton:not(.vertical) button.flat:active:focus, .osd spinbutton:not(.vertical) button.flat:active:hover,
        #XfceNotifyWindow spinbutton:not(.vertical) button:checked:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button:checked:hover,
        #XfceNotifyWindow spinbutton:not(.vertical) button:active:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button:active:hover,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:checked:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:checked:hover,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:active:focus,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:active:hover {
          /*@include linear-gradient(shade($bg, .65), to top);*/
          background-color: #323964;
          background-image: none;
          color: #ffffff; }
      .osd spinbutton:not(.vertical) button:focus, .osd spinbutton:not(.vertical) button:hover, .osd spinbutton:not(.vertical) button.flat:focus, .osd spinbutton:not(.vertical) button.flat:hover,
      #XfceNotifyWindow spinbutton:not(.vertical) button:focus,
      #XfceNotifyWindow spinbutton:not(.vertical) button:hover,
      #XfceNotifyWindow spinbutton:not(.vertical) button.flat:focus,
      #XfceNotifyWindow spinbutton:not(.vertical) button.flat:hover {
        color: #ffffff; }
      .osd spinbutton:not(.vertical) button:disabled:disabled, .osd spinbutton:not(.vertical) button.flat:disabled:disabled,
      #XfceNotifyWindow spinbutton:not(.vertical) button:disabled:disabled,
      #XfceNotifyWindow spinbutton:not(.vertical) button.flat:disabled:disabled {
        background-color: alpha(mix(rgba(22, 23, 45, 0.8),#ffffff,0.2),0.4);
        background-image: none;
        /*border: 1px solid alpha($bg, .2);*/
        opacity: .6;
        color: mix(rgba(22, 23, 45, 0.8),#ffffff,0.6);
        box-shadow: none; }
        .osd spinbutton:not(.vertical) button:disabled:disabled :disabled, .osd spinbutton:not(.vertical) button.flat:disabled:disabled :disabled,
        #XfceNotifyWindow spinbutton:not(.vertical) button:disabled:disabled :disabled,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:disabled:disabled :disabled {
          color: mix(rgba(22, 23, 45, 0.8),#ffffff,0.6); }
      .osd spinbutton:not(.vertical) button:active:disabled, .osd spinbutton:not(.vertical) button:checked:disabled, .osd spinbutton:not(.vertical) button.flat:active:disabled, .osd spinbutton:not(.vertical) button.flat:checked:disabled,
      #XfceNotifyWindow spinbutton:not(.vertical) button:active:disabled,
      #XfceNotifyWindow spinbutton:not(.vertical) button:checked:disabled,
      #XfceNotifyWindow spinbutton:not(.vertical) button.flat:active:disabled,
      #XfceNotifyWindow spinbutton:not(.vertical) button.flat:checked:disabled {
        background-color: rgba(48, 54, 95, 0.6);
        background-image: none;
        color: rgba(255, 255, 255, 0.85);
        box-shadow: none; }
        .osd spinbutton:not(.vertical) button:active:disabled :disabled, .osd spinbutton:not(.vertical) button:checked:disabled :disabled, .osd spinbutton:not(.vertical) button.flat:active:disabled :disabled, .osd spinbutton:not(.vertical) button.flat:checked:disabled :disabled,
        #XfceNotifyWindow spinbutton:not(.vertical) button:active:disabled :disabled,
        #XfceNotifyWindow spinbutton:not(.vertical) button:checked:disabled :disabled,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:active:disabled :disabled,
        #XfceNotifyWindow spinbutton:not(.vertical) button.flat:checked:disabled :disabled {
          color: rgba(255, 255, 255, 0.85); }
      .osd spinbutton:not(.vertical) button:backdrop, .osd spinbutton:not(.vertical) button.flat:backdrop,
      #XfceNotifyWindow spinbutton:not(.vertical) button:backdrop,
      #XfceNotifyWindow spinbutton:not(.vertical) button.flat:backdrop {
        color: mix(#ffffff,mix(#ffffff,#1b1c36,0.5),0.8); }
      .osd spinbutton:not(.vertical) button.separator, .osd spinbutton:not(.vertical) button .separator,
      #XfceNotifyWindow spinbutton:not(.vertical) button.separator,
      #XfceNotifyWindow spinbutton:not(.vertical) button .separator {
        border: 1px solid currentColor;
        color: rgba(22, 23, 45, 0.7); }
        .osd spinbutton:not(.vertical) button.separator:disabled, .osd spinbutton:not(.vertical) button .separator:disabled,
        #XfceNotifyWindow spinbutton:not(.vertical) button.separator:disabled,
        #XfceNotifyWindow spinbutton:not(.vertical) button .separator:disabled {
          color: rgba(22, 23, 45, 0.65); }
      .osd spinbutton:not(.vertical) button separator,
      #XfceNotifyWindow spinbutton:not(.vertical) button separator {
        background-image: image(mix(#ffffff,rgba(22, 23, 45, 0.8),0.9)); }
      .osd spinbutton:not(.vertical) button:dir(rtl),
      #XfceNotifyWindow spinbutton:not(.vertical) button:dir(rtl) {
        border-style: none solid none none; }
      .osd spinbutton:not(.vertical) button:active, .osd spinbutton:not(.vertical) button:checked, .osd spinbutton:not(.vertical) button:hover,
      #XfceNotifyWindow spinbutton:not(.vertical) button:active,
      #XfceNotifyWindow spinbutton:not(.vertical) button:checked,
      #XfceNotifyWindow spinbutton:not(.vertical) button:hover {
        color: #ffffff; }
      .osd spinbutton:not(.vertical) button:disabled,
      #XfceNotifyWindow spinbutton:not(.vertical) button:disabled {
        color: alpha(mix(#ffffff,#16172d,0.6),0.8); }
      .osd spinbutton:not(.vertical) button:backdrop,
      #XfceNotifyWindow spinbutton:not(.vertical) button:backdrop {
        color: mix(#1b1c36,mix(#ffffff,#1b1c36,0.5),0.9); }
      .osd spinbutton:not(.vertical) button:active,
      #XfceNotifyWindow spinbutton:not(.vertical) button:active {
        box-shadow: inset 0 2px 3px -1px rgba(102, 102, 102, 0.2); }
      .osd spinbutton:not(.vertical) button:backdrop:disabled,
      #XfceNotifyWindow spinbutton:not(.vertical) button:backdrop:disabled {
        color: rgba(2, 2, 3, 0.8);
        border-style: none none none solid; }
        .osd spinbutton:not(.vertical) button:backdrop:disabled:dir(rtl),
        #XfceNotifyWindow spinbutton:not(.vertical) button:backdrop:disabled:dir(rtl) {
          border-style: none solid none none; }
      .osd spinbutton:not(.vertical) button:dir(rtl):first-child,
      #XfceNotifyWindow spinbutton:not(.vertical) button:dir(rtl):first-child {
        border-radius: 8px 0 0 8px; }
      .osd spinbutton:not(.vertical) button:dir(ltr):last-child,
      #XfceNotifyWindow spinbutton:not(.vertical) button:dir(ltr):last-child {
        border-radius: 0 8px 8px 0; }
  .osd spinbutton.vertical button:first-child,
  #XfceNotifyWindow spinbutton.vertical button:first-child {
    background-color: rgba(22, 23, 45, 0.8);
    background-image: none;
    border-color: rgba(204, 204, 204, 0.22);
    color: #ffffff;
    box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22); }
    .osd spinbutton.vertical button:first-child:focus, .osd spinbutton.vertical button:first-child:hover,
    #XfceNotifyWindow spinbutton.vertical button:first-child:focus,
    #XfceNotifyWindow spinbutton.vertical button:first-child:hover {
      border-color: mix(#30365f,rgba(255, 255, 255, 0.22),0.3); }
    .osd spinbutton.vertical button:first-child:active, .osd spinbutton.vertical button:first-child:active:hover, .osd spinbutton.vertical button:first-child:active:focus, .osd spinbutton.vertical button:first-child:active:hover:focus, .osd spinbutton.vertical button:first-child:checked, .osd spinbutton.vertical button:first-child:checked:hover, .osd spinbutton.vertical button:first-child:checked:focus, .osd spinbutton.vertical button:first-child:checked:hover:focus,
    #XfceNotifyWindow spinbutton.vertical button:first-child:active,
    #XfceNotifyWindow spinbutton.vertical button:first-child:active:hover,
    #XfceNotifyWindow spinbutton.vertical button:first-child:active:focus,
    #XfceNotifyWindow spinbutton.vertical button:first-child:active:hover:focus,
    #XfceNotifyWindow spinbutton.vertical button:first-child:checked,
    #XfceNotifyWindow spinbutton.vertical button:first-child:checked:hover,
    #XfceNotifyWindow spinbutton.vertical button:first-child:checked:focus,
    #XfceNotifyWindow spinbutton.vertical button:first-child:checked:hover:focus {
      border-color: rgba(179, 179, 179, 0.22); }
    .osd spinbutton.vertical button:first-child:disabled,
    #XfceNotifyWindow spinbutton.vertical button:first-child:disabled {
      border-color: rgba(217, 217, 217, 0.22); }
    .osd spinbutton.vertical button:first-child:active:disabled, .osd spinbutton.vertical button:first-child:checked:disabled,
    #XfceNotifyWindow spinbutton.vertical button:first-child:active:disabled,
    #XfceNotifyWindow spinbutton.vertical button:first-child:checked:disabled {
      border-color: rgba(204, 204, 204, 0.22); }
    .linked:not(.vertical) > .osd spinbutton.vertical button:first-child:not(:last-child):not(:only-child), .linked:not(.vertical) > :not(:last-child):not(:only-child) .osd spinbutton.vertical button:first-child, viewswitcher:not(.vertical) > .osd spinbutton.vertical button:first-child:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > .osd spinbutton.vertical button:first-child:not(:last-child):not(:only-child), .linked:not(.vertical) > #XfceNotifyWindow spinbutton.vertical button:first-child:not(:last-child):not(:only-child), .linked:not(.vertical) > :not(:last-child):not(:only-child) #XfceNotifyWindow spinbutton.vertical button:first-child, viewswitcher:not(.vertical) > #XfceNotifyWindow spinbutton.vertical button:first-child:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > #XfceNotifyWindow spinbutton.vertical button:first-child:not(:last-child):not(:only-child) {
      border-right-style: none; }
      .linked:not(.vertical) > .osd spinbutton.vertical button:first-child:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) .osd spinbutton.vertical button:first-child:hover, viewswitcher:not(.vertical) > .osd spinbutton.vertical button:first-child:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > .osd spinbutton.vertical button:first-child:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > #XfceNotifyWindow spinbutton.vertical button:first-child:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) #XfceNotifyWindow spinbutton.vertical button:first-child:hover, viewswitcher:not(.vertical) > #XfceNotifyWindow spinbutton.vertical button:first-child:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > #XfceNotifyWindow spinbutton.vertical button:first-child:not(:last-child):not(:only-child):hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.36),0.3);
        border-right-style: none;
        box-shadow: inset-1px 0 0 mix(#30365f,rgba(255, 255, 255, 0.36),0.3); }
    .linked:not(.vertical) > .osd spinbutton.vertical button:first-child:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > :not(:last-child):not(:only-child) .osd spinbutton.vertical button:first-child:checked, viewswitcher:not(.vertical) > .osd spinbutton.vertical button:first-child:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > .osd spinbutton.vertical button:first-child:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > #XfceNotifyWindow spinbutton.vertical button:first-child:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > :not(:last-child):not(:only-child) #XfceNotifyWindow spinbutton.vertical button:first-child:checked, viewswitcher:not(.vertical) > #XfceNotifyWindow spinbutton.vertical button:first-child:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > #XfceNotifyWindow spinbutton.vertical button:first-child:not(:last-child):not(:only-child):checked {
      border-right-style: none; }
      .linked:not(.vertical) > .osd spinbutton.vertical button:first-child:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) .osd spinbutton.vertical button:first-child:checked:hover, viewswitcher:not(.vertical) > .osd spinbutton.vertical button:first-child:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > .osd spinbutton.vertical button:first-child:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > #XfceNotifyWindow spinbutton.vertical button:first-child:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) #XfceNotifyWindow spinbutton.vertical button:first-child:checked:hover, viewswitcher:not(.vertical) > #XfceNotifyWindow spinbutton.vertical button:first-child:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > #XfceNotifyWindow spinbutton.vertical button:first-child:not(:last-child):not(:only-child):checked:hover {
        border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
        border-right-style: none;
        box-shadow: inset-1px 0 0 mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
    .linked.vertical > .osd spinbutton.vertical button:first-child:not(:last-child):not(:only-child), .linked.vertical > :not(:last-child):not(:only-child) .osd spinbutton.vertical button:first-child, stackswitcher.vertical > .osd spinbutton.vertical button:first-child:not(:last-child):not(:only-child), .linked.vertical > #XfceNotifyWindow spinbutton.vertical button:first-child:not(:last-child):not(:only-child), .linked.vertical > :not(:last-child):not(:only-child) #XfceNotifyWindow spinbutton.vertical button:first-child, stackswitcher.vertical > #XfceNotifyWindow spinbutton.vertical button:first-child:not(:last-child):not(:only-child) {
      border-bottom-style: none; }
      .linked.vertical > .osd spinbutton.vertical button:first-child:not(:last-child):not(:only-child):hover, .linked.vertical > :not(:last-child):not(:only-child) .osd spinbutton.vertical button:first-child:hover, stackswitcher.vertical > .osd spinbutton.vertical button:first-child:not(:last-child):not(:only-child):hover, .linked.vertical > #XfceNotifyWindow spinbutton.vertical button:first-child:not(:last-child):not(:only-child):hover, .linked.vertical > :not(:last-child):not(:only-child) #XfceNotifyWindow spinbutton.vertical button:first-child:hover, stackswitcher.vertical > #XfceNotifyWindow spinbutton.vertical button:first-child:not(:last-child):not(:only-child):hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.36),0.3);
        border-bottom-style: none;
        box-shadow: inset 0 -1px mix(#30365f,rgba(255, 255, 255, 0.36),0.3); }
    .linked.vertical > .osd spinbutton.vertical button:first-child:not(:last-child):not(:only-child):checked, .linked.vertical > :not(:last-child):not(:only-child) .osd spinbutton.vertical button:first-child:checked, stackswitcher.vertical > .osd spinbutton.vertical button:first-child:not(:last-child):not(:only-child):checked, .linked.vertical > #XfceNotifyWindow spinbutton.vertical button:first-child:not(:last-child):not(:only-child):checked, .linked.vertical > :not(:last-child):not(:only-child) #XfceNotifyWindow spinbutton.vertical button:first-child:checked, stackswitcher.vertical > #XfceNotifyWindow spinbutton.vertical button:first-child:not(:last-child):not(:only-child):checked {
      border-bottom-style: none; }
      .linked.vertical > .osd spinbutton.vertical button:first-child:not(:last-child):not(:only-child):checked:hover, .linked.vertical > :not(:last-child):not(:only-child) .osd spinbutton.vertical button:first-child:checked:hover, stackswitcher.vertical > .osd spinbutton.vertical button:first-child:not(:last-child):not(:only-child):checked:hover, .linked.vertical > #XfceNotifyWindow spinbutton.vertical button:first-child:not(:last-child):not(:only-child):checked:hover, .linked.vertical > :not(:last-child):not(:only-child) #XfceNotifyWindow spinbutton.vertical button:first-child:checked:hover, stackswitcher.vertical > #XfceNotifyWindow spinbutton.vertical button:first-child:not(:last-child):not(:only-child):checked:hover {
        border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
        border-bottom-style: none;
        box-shadow: inset 0 -1px mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
    .osd spinbutton.vertical button:first-child.flat,
    #XfceNotifyWindow spinbutton.vertical button:first-child.flat {
      color: #ffffff;
      border-color: rgba(22, 23, 45, 0);
      background-color: rgba(22, 23, 45, 0);
      background-image: none;
      box-shadow: none; }
    .osd spinbutton.vertical button:first-child:hover, .osd spinbutton.vertical button:first-child.flat:hover,
    #XfceNotifyWindow spinbutton.vertical button:first-child:hover,
    #XfceNotifyWindow spinbutton.vertical button:first-child.flat:hover {
      background-color: rgba(23, 24, 47, 0.8);
      background-image: none;
      border-color: rgba(204, 204, 204, 0.3);
      color: #ffffff;
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.32); }
      .osd spinbutton.vertical button:first-child:hover:focus, .osd spinbutton.vertical button:first-child:hover:hover, .osd spinbutton.vertical button:first-child.flat:hover:focus, .osd spinbutton.vertical button:first-child.flat:hover:hover,
      #XfceNotifyWindow spinbutton.vertical button:first-child:hover:focus,
      #XfceNotifyWindow spinbutton.vertical button:first-child:hover:hover,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:hover:focus,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:hover:hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.3),0.3); }
      .osd spinbutton.vertical button:first-child:hover:active, .osd spinbutton.vertical button:first-child:hover:active:focus, .osd spinbutton.vertical button:first-child.flat:hover:active:focus, .osd spinbutton.vertical button:first-child:hover:checked, .osd spinbutton.vertical button:first-child:hover:checked:focus, .osd spinbutton.vertical button:first-child.flat:hover:checked:focus, .osd spinbutton.vertical button:first-child.flat:hover:active, .osd spinbutton.vertical button:first-child.flat:hover:active:hover:focus, .osd spinbutton.vertical button:first-child.flat:hover:checked, .osd spinbutton.vertical button:first-child.flat:hover:checked:hover:focus,
      #XfceNotifyWindow spinbutton.vertical button:first-child:hover:active,
      #XfceNotifyWindow spinbutton.vertical button:first-child:hover:active:focus,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:hover:active:focus,
      #XfceNotifyWindow spinbutton.vertical button:first-child:hover:checked,
      #XfceNotifyWindow spinbutton.vertical button:first-child:hover:checked:focus,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:hover:checked:focus,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:hover:active,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:hover:active:hover:focus,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:hover:checked,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:hover:checked:hover:focus {
        border-color: rgba(179, 179, 179, 0.3); }
      .osd spinbutton.vertical button:first-child:hover:disabled, .osd spinbutton.vertical button:first-child.flat:hover:disabled,
      #XfceNotifyWindow spinbutton.vertical button:first-child:hover:disabled,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:hover:disabled {
        border-color: rgba(217, 217, 217, 0.3); }
      .osd spinbutton.vertical button:first-child:hover:active:disabled, .osd spinbutton.vertical button:first-child:hover:checked:disabled, .osd spinbutton.vertical button:first-child.flat:hover:active:disabled, .osd spinbutton.vertical button:first-child.flat:hover:checked:disabled,
      #XfceNotifyWindow spinbutton.vertical button:first-child:hover:active:disabled,
      #XfceNotifyWindow spinbutton.vertical button:first-child:hover:checked:disabled,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:hover:active:disabled,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:hover:checked:disabled {
        border-color: rgba(204, 204, 204, 0.3); }
    .osd spinbutton.vertical button:first-child:focus, .osd spinbutton.vertical button:first-child.flat:focus,
    #XfceNotifyWindow spinbutton.vertical button:first-child:focus,
    #XfceNotifyWindow spinbutton.vertical button:first-child.flat:focus {
      background-color: rgba(23, 24, 47, 0.8);
      background-image: none;
      border-color: rgba(255, 255, 255, 0.22);
      outline-color: rgba(48, 54, 95, 0.5);
      outline-width: 3px;
      outline-style: solid;
      outline-offset: 10px;
      color: #ffffff;
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
      .osd spinbutton.vertical button:first-child:focus:hover, .osd spinbutton.vertical button:first-child.flat:focus:hover,
      #XfceNotifyWindow spinbutton.vertical button:first-child:focus:hover,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:focus:hover {
        background-color: rgba(24, 25, 50, 0.8);
        background-image: none;
        border-color: rgba(204, 204, 204, 0.3);
        box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.48); }
        .osd spinbutton.vertical button:first-child:focus:hover:hover, .osd spinbutton.vertical button:first-child.flat:focus:hover:hover,
        #XfceNotifyWindow spinbutton.vertical button:first-child:focus:hover:hover,
        #XfceNotifyWindow spinbutton.vertical button:first-child.flat:focus:hover:hover {
          border-color: mix(#30365f,rgba(255, 255, 255, 0.3),0.3); }
        .osd spinbutton.vertical button:first-child:focus:hover:active, .osd spinbutton.vertical button:first-child.flat:focus:hover:active, .osd spinbutton.vertical button:first-child.flat:focus:hover:active:focus, .osd spinbutton.vertical button:first-child:focus:hover:checked, .osd spinbutton.vertical button:first-child.flat:focus:hover:checked, .osd spinbutton.vertical button:first-child.flat:focus:hover:checked:focus, .osd spinbutton.vertical button:first-child.flat:focus:hover:active:hover:focus, .osd spinbutton.vertical button:first-child.flat:focus:hover:checked:hover:focus,
        #XfceNotifyWindow spinbutton.vertical button:first-child:focus:hover:active,
        #XfceNotifyWindow spinbutton.vertical button:first-child.flat:focus:hover:active,
        #XfceNotifyWindow spinbutton.vertical button:first-child.flat:focus:hover:active:focus,
        #XfceNotifyWindow spinbutton.vertical button:first-child:focus:hover:checked,
        #XfceNotifyWindow spinbutton.vertical button:first-child.flat:focus:hover:checked,
        #XfceNotifyWindow spinbutton.vertical button:first-child.flat:focus:hover:checked:focus,
        #XfceNotifyWindow spinbutton.vertical button:first-child.flat:focus:hover:active:hover:focus,
        #XfceNotifyWindow spinbutton.vertical button:first-child.flat:focus:hover:checked:hover:focus {
          border-color: rgba(179, 179, 179, 0.3); }
        .osd spinbutton.vertical button:first-child:focus:hover:disabled, .osd spinbutton.vertical button:first-child.flat:focus:hover:disabled,
        #XfceNotifyWindow spinbutton.vertical button:first-child:focus:hover:disabled,
        #XfceNotifyWindow spinbutton.vertical button:first-child.flat:focus:hover:disabled {
          border-color: rgba(217, 217, 217, 0.3); }
        .osd spinbutton.vertical button:first-child:focus:hover:active:disabled, .osd spinbutton.vertical button:first-child:focus:hover:checked:disabled, .osd spinbutton.vertical button:first-child.flat:focus:hover:active:disabled, .osd spinbutton.vertical button:first-child.flat:focus:hover:checked:disabled,
        #XfceNotifyWindow spinbutton.vertical button:first-child:focus:hover:active:disabled,
        #XfceNotifyWindow spinbutton.vertical button:first-child:focus:hover:checked:disabled,
        #XfceNotifyWindow spinbutton.vertical button:first-child.flat:focus:hover:active:disabled,
        #XfceNotifyWindow spinbutton.vertical button:first-child.flat:focus:hover:checked:disabled {
          border-color: rgba(204, 204, 204, 0.3); }
    .osd spinbutton.vertical button:first-child:checked, .osd spinbutton.vertical button:first-child:active, .osd spinbutton.vertical button:first-child.flat:checked, .osd spinbutton.vertical button:first-child.flat:active,
    #XfceNotifyWindow spinbutton.vertical button:first-child:checked,
    #XfceNotifyWindow spinbutton.vertical button:first-child:active,
    #XfceNotifyWindow spinbutton.vertical button:first-child.flat:checked,
    #XfceNotifyWindow spinbutton.vertical button:first-child.flat:active {
      /*@include linear-gradient(shade($bg, .7), to top);*/
      background-color: #30365f;
      background-image: none;
      border-color: rgba(204, 204, 204, 0.22);
      color: #ffffff;
      box-shadow: inset 1px 0 rgba(255, 255, 255, 0.06), inset 0 1px rgba(255, 255, 255, 0.07), inset -1px 0 rgba(255, 255, 255, 0.06), inset 0 -1px rgba(255, 255, 255, 0.05); }
      .osd spinbutton.vertical button:first-child:checked:focus, .osd spinbutton.vertical button:first-child:checked:hover, .osd spinbutton.vertical button:first-child:active:focus, .osd spinbutton.vertical button:first-child:active:hover, .osd spinbutton.vertical button:first-child.flat:checked:focus, .osd spinbutton.vertical button:first-child.flat:checked:hover, .osd spinbutton.vertical button:first-child.flat:active:focus, .osd spinbutton.vertical button:first-child.flat:active:hover,
      #XfceNotifyWindow spinbutton.vertical button:first-child:checked:focus,
      #XfceNotifyWindow spinbutton.vertical button:first-child:checked:hover,
      #XfceNotifyWindow spinbutton.vertical button:first-child:active:focus,
      #XfceNotifyWindow spinbutton.vertical button:first-child:active:hover,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:checked:focus,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:checked:hover,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:active:focus,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:active:hover {
        border-color: mix(#30365f,rgba(255, 255, 255, 0.22),0.3); }
      .osd spinbutton.vertical button:first-child:checked:active, .osd spinbutton.vertical button.nautilus-circular-button.image-button:first-child:checked:active, .osd spinbutton.vertical button:first-child:checked:active:hover, .osd spinbutton.vertical button.nautilus-circular-button.image-button:first-child:checked:active:hover, .osd spinbutton.vertical button:first-child:checked:active:focus, .osd spinbutton.vertical button.nautilus-circular-button.image-button:first-child:checked:active:focus, .osd spinbutton.vertical button:first-child:checked:active:hover:focus, .osd spinbutton.vertical button.nautilus-circular-button.image-button:first-child:checked:active:hover:focus, .osd spinbutton.vertical button:first-child:checked:checked, .osd spinbutton.vertical button.nautilus-circular-button.image-button:first-child:checked:checked, .osd spinbutton.vertical button:first-child:checked:checked:hover, .osd spinbutton.vertical button.nautilus-circular-button.image-button:first-child:checked:checked:hover, .osd spinbutton.vertical button:first-child:checked:checked:focus, .osd spinbutton.vertical button.nautilus-circular-button.image-button:first-child:checked:checked:focus, .osd spinbutton.vertical button:first-child:checked:checked:hover:focus, .osd spinbutton.vertical button.nautilus-circular-button.image-button:first-child:checked:checked:hover:focus, .osd spinbutton.vertical button:first-child:active:active, .osd spinbutton.vertical button.nautilus-circular-button.image-button:first-child:active:active, .osd spinbutton.vertical button:first-child:active:active:hover, .osd spinbutton.vertical button.nautilus-circular-button.image-button:first-child:active:active:hover, .osd spinbutton.vertical button:first-child:active:active:focus, .osd spinbutton.vertical button.nautilus-circular-button.image-button:first-child:active:active:focus, .osd spinbutton.vertical button:first-child:active:active:hover:focus, .osd spinbutton.vertical button.nautilus-circular-button.image-button:first-child:active:active:hover:focus, .osd spinbutton.vertical button:first-child:active:checked, .osd spinbutton.vertical button.nautilus-circular-button.image-button:first-child:active:checked, .osd spinbutton.vertical button:first-child:active:checked:hover, .osd spinbutton.vertical button.nautilus-circular-button.image-button:first-child:active:checked:hover, .osd spinbutton.vertical button:first-child:active:checked:focus, .osd spinbutton.vertical button.nautilus-circular-button.image-button:first-child:active:checked:focus, .osd spinbutton.vertical button:first-child:active:checked:hover:focus, .osd spinbutton.vertical button.nautilus-circular-button.image-button:first-child:active:checked:hover:focus, .osd spinbutton.vertical button:first-child.flat:checked:active, .osd spinbutton.vertical button.nautilus-circular-button.image-button:first-child.flat:checked:active, .osd spinbutton.vertical button:first-child.flat:checked:active:hover, .osd spinbutton.vertical button.nautilus-circular-button.image-button:first-child.flat:checked:active:hover, .osd spinbutton.vertical button:first-child.flat:checked:active:focus, .osd spinbutton.vertical button.nautilus-circular-button.image-button:first-child.flat:checked:active:focus, .osd spinbutton.vertical button:first-child.flat:checked:active:hover:focus, .osd spinbutton.vertical button.nautilus-circular-button.image-button:first-child.flat:checked:active:hover:focus, .osd spinbutton.vertical button:first-child.flat:checked:checked, .osd spinbutton.vertical button.nautilus-circular-button.image-button:first-child.flat:checked:checked, .osd spinbutton.vertical button:first-child.flat:checked:checked:hover, .osd spinbutton.vertical button.nautilus-circular-button.image-button:first-child.flat:checked:checked:hover, .osd spinbutton.vertical button:first-child.flat:checked:checked:focus, .osd spinbutton.vertical button.nautilus-circular-button.image-button:first-child.flat:checked:checked:focus, .osd spinbutton.vertical button:first-child.flat:checked:checked:hover:focus, .osd spinbutton.vertical button.nautilus-circular-button.image-button:first-child.flat:checked:checked:hover:focus, .osd spinbutton.vertical button:first-child.flat:active:active, .osd spinbutton.vertical button.nautilus-circular-button.image-button:first-child.flat:active:active, .osd spinbutton.vertical button:first-child.flat:active:active:hover, .osd spinbutton.vertical button.nautilus-circular-button.image-button:first-child.flat:active:active:hover, .osd spinbutton.vertical button:first-child.flat:active:active:focus, .osd spinbutton.vertical button.nautilus-circular-button.image-button:first-child.flat:active:active:focus, .osd spinbutton.vertical button:first-child.flat:active:active:hover:focus, .osd spinbutton.vertical button.nautilus-circular-button.image-button:first-child.flat:active:active:hover:focus, .osd spinbutton.vertical button:first-child.flat:active:checked, .osd spinbutton.vertical button.nautilus-circular-button.image-button:first-child.flat:active:checked, .osd spinbutton.vertical button:first-child.flat:active:checked:hover, .osd spinbutton.vertical button.nautilus-circular-button.image-button:first-child.flat:active:checked:hover, .osd spinbutton.vertical button:first-child.flat:active:checked:focus, .osd spinbutton.vertical button.nautilus-circular-button.image-button:first-child.flat:active:checked:focus, .osd spinbutton.vertical button:first-child.flat:active:checked:hover:focus, .osd spinbutton.vertical button.nautilus-circular-button.image-button:first-child.flat:active:checked:hover:focus,
      #XfceNotifyWindow spinbutton.vertical button:first-child:checked:active,
      #XfceNotifyWindow spinbutton.vertical button.nautilus-circular-button.image-button:first-child:checked:active,
      #XfceNotifyWindow spinbutton.vertical button:first-child:checked:active:hover,
      #XfceNotifyWindow spinbutton.vertical button.nautilus-circular-button.image-button:first-child:checked:active:hover,
      #XfceNotifyWindow spinbutton.vertical button:first-child:checked:active:focus,
      #XfceNotifyWindow spinbutton.vertical button.nautilus-circular-button.image-button:first-child:checked:active:focus,
      #XfceNotifyWindow spinbutton.vertical button:first-child:checked:active:hover:focus,
      #XfceNotifyWindow spinbutton.vertical button.nautilus-circular-button.image-button:first-child:checked:active:hover:focus,
      #XfceNotifyWindow spinbutton.vertical button:first-child:checked:checked,
      #XfceNotifyWindow spinbutton.vertical button.nautilus-circular-button.image-button:first-child:checked:checked,
      #XfceNotifyWindow spinbutton.vertical button:first-child:checked:checked:hover,
      #XfceNotifyWindow spinbutton.vertical button.nautilus-circular-button.image-button:first-child:checked:checked:hover,
      #XfceNotifyWindow spinbutton.vertical button:first-child:checked:checked:focus,
      #XfceNotifyWindow spinbutton.vertical button.nautilus-circular-button.image-button:first-child:checked:checked:focus,
      #XfceNotifyWindow spinbutton.vertical button:first-child:checked:checked:hover:focus,
      #XfceNotifyWindow spinbutton.vertical button.nautilus-circular-button.image-button:first-child:checked:checked:hover:focus,
      #XfceNotifyWindow spinbutton.vertical button:first-child:active:active,
      #XfceNotifyWindow spinbutton.vertical button.nautilus-circular-button.image-button:first-child:active:active,
      #XfceNotifyWindow spinbutton.vertical button:first-child:active:active:hover,
      #XfceNotifyWindow spinbutton.vertical button.nautilus-circular-button.image-button:first-child:active:active:hover,
      #XfceNotifyWindow spinbutton.vertical button:first-child:active:active:focus,
      #XfceNotifyWindow spinbutton.vertical button.nautilus-circular-button.image-button:first-child:active:active:focus,
      #XfceNotifyWindow spinbutton.vertical button:first-child:active:active:hover:focus,
      #XfceNotifyWindow spinbutton.vertical button.nautilus-circular-button.image-button:first-child:active:active:hover:focus,
      #XfceNotifyWindow spinbutton.vertical button:first-child:active:checked,
      #XfceNotifyWindow spinbutton.vertical button.nautilus-circular-button.image-button:first-child:active:checked,
      #XfceNotifyWindow spinbutton.vertical button:first-child:active:checked:hover,
      #XfceNotifyWindow spinbutton.vertical button.nautilus-circular-button.image-button:first-child:active:checked:hover,
      #XfceNotifyWindow spinbutton.vertical button:first-child:active:checked:focus,
      #XfceNotifyWindow spinbutton.vertical button.nautilus-circular-button.image-button:first-child:active:checked:focus,
      #XfceNotifyWindow spinbutton.vertical button:first-child:active:checked:hover:focus,
      #XfceNotifyWindow spinbutton.vertical button.nautilus-circular-button.image-button:first-child:active:checked:hover:focus,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:checked:active,
      #XfceNotifyWindow spinbutton.vertical button.nautilus-circular-button.image-button:first-child.flat:checked:active,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:checked:active:hover,
      #XfceNotifyWindow spinbutton.vertical button.nautilus-circular-button.image-button:first-child.flat:checked:active:hover,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:checked:active:focus,
      #XfceNotifyWindow spinbutton.vertical button.nautilus-circular-button.image-button:first-child.flat:checked:active:focus,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:checked:active:hover:focus,
      #XfceNotifyWindow spinbutton.vertical button.nautilus-circular-button.image-button:first-child.flat:checked:active:hover:focus,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:checked:checked,
      #XfceNotifyWindow spinbutton.vertical button.nautilus-circular-button.image-button:first-child.flat:checked:checked,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:checked:checked:hover,
      #XfceNotifyWindow spinbutton.vertical button.nautilus-circular-button.image-button:first-child.flat:checked:checked:hover,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:checked:checked:focus,
      #XfceNotifyWindow spinbutton.vertical button.nautilus-circular-button.image-button:first-child.flat:checked:checked:focus,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:checked:checked:hover:focus,
      #XfceNotifyWindow spinbutton.vertical button.nautilus-circular-button.image-button:first-child.flat:checked:checked:hover:focus,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:active:active,
      #XfceNotifyWindow spinbutton.vertical button.nautilus-circular-button.image-button:first-child.flat:active:active,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:active:active:hover,
      #XfceNotifyWindow spinbutton.vertical button.nautilus-circular-button.image-button:first-child.flat:active:active:hover,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:active:active:focus,
      #XfceNotifyWindow spinbutton.vertical button.nautilus-circular-button.image-button:first-child.flat:active:active:focus,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:active:active:hover:focus,
      #XfceNotifyWindow spinbutton.vertical button.nautilus-circular-button.image-button:first-child.flat:active:active:hover:focus,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:active:checked,
      #XfceNotifyWindow spinbutton.vertical button.nautilus-circular-button.image-button:first-child.flat:active:checked,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:active:checked:hover,
      #XfceNotifyWindow spinbutton.vertical button.nautilus-circular-button.image-button:first-child.flat:active:checked:hover,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:active:checked:focus,
      #XfceNotifyWindow spinbutton.vertical button.nautilus-circular-button.image-button:first-child.flat:active:checked:focus,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:active:checked:hover:focus,
      #XfceNotifyWindow spinbutton.vertical button.nautilus-circular-button.image-button:first-child.flat:active:checked:hover:focus {
        border-color: rgba(179, 179, 179, 0.22); }
      .osd spinbutton.vertical button:first-child:checked:disabled, .osd spinbutton.vertical button:first-child:active:disabled, .osd spinbutton.vertical button:first-child.flat:checked:disabled, .osd spinbutton.vertical button:first-child.flat:active:disabled,
      #XfceNotifyWindow spinbutton.vertical button:first-child:checked:disabled,
      #XfceNotifyWindow spinbutton.vertical button:first-child:active:disabled,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:checked:disabled,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:active:disabled {
        border-color: rgba(217, 217, 217, 0.22); }
      .osd spinbutton.vertical button:first-child:active:checked:disabled, .osd spinbutton.vertical button:first-child.flat:active:checked:disabled,
      #XfceNotifyWindow spinbutton.vertical button:first-child:active:checked:disabled,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:active:checked:disabled {
        border-color: rgba(204, 204, 204, 0.22); }
      .osd spinbutton.vertical button:first-child:checked:focus, .osd spinbutton.vertical button:first-child:checked:hover, .osd spinbutton.vertical button:first-child:active:focus, .osd spinbutton.vertical button:first-child:active:hover, .osd spinbutton.vertical button:first-child.flat:checked:focus, .osd spinbutton.vertical button:first-child.flat:checked:hover, .osd spinbutton.vertical button:first-child.flat:active:focus, .osd spinbutton.vertical button:first-child.flat:active:hover,
      #XfceNotifyWindow spinbutton.vertical button:first-child:checked:focus,
      #XfceNotifyWindow spinbutton.vertical button:first-child:checked:hover,
      #XfceNotifyWindow spinbutton.vertical button:first-child:active:focus,
      #XfceNotifyWindow spinbutton.vertical button:first-child:active:hover,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:checked:focus,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:checked:hover,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:active:focus,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:active:hover {
        /*@include linear-gradient(shade($bg, .65), to top);*/
        background-color: #323964;
        background-image: none;
        color: #ffffff; }
    .osd spinbutton.vertical button:first-child:focus, .osd spinbutton.vertical button:first-child:hover, .osd spinbutton.vertical button:first-child.flat:focus, .osd spinbutton.vertical button:first-child.flat:hover,
    #XfceNotifyWindow spinbutton.vertical button:first-child:focus,
    #XfceNotifyWindow spinbutton.vertical button:first-child:hover,
    #XfceNotifyWindow spinbutton.vertical button:first-child.flat:focus,
    #XfceNotifyWindow spinbutton.vertical button:first-child.flat:hover {
      color: #ffffff; }
    .osd spinbutton.vertical button:first-child:disabled:disabled, .osd spinbutton.vertical button:first-child.flat:disabled:disabled,
    #XfceNotifyWindow spinbutton.vertical button:first-child:disabled:disabled,
    #XfceNotifyWindow spinbutton.vertical button:first-child.flat:disabled:disabled {
      background-color: alpha(mix(rgba(22, 23, 45, 0.8),#ffffff,0.2),0.4);
      background-image: none;
      /*border: 1px solid alpha($bg, .2);*/
      opacity: .6;
      color: mix(rgba(22, 23, 45, 0.8),#ffffff,0.6);
      box-shadow: none; }
      .osd spinbutton.vertical button:first-child:disabled:disabled :disabled, .osd spinbutton.vertical button:first-child.flat:disabled:disabled :disabled,
      #XfceNotifyWindow spinbutton.vertical button:first-child:disabled:disabled :disabled,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:disabled:disabled :disabled {
        color: mix(rgba(22, 23, 45, 0.8),#ffffff,0.6); }
    .osd spinbutton.vertical button:first-child:active:disabled, .osd spinbutton.vertical button:first-child:checked:disabled, .osd spinbutton.vertical button:first-child.flat:active:disabled, .osd spinbutton.vertical button:first-child.flat:checked:disabled,
    #XfceNotifyWindow spinbutton.vertical button:first-child:active:disabled,
    #XfceNotifyWindow spinbutton.vertical button:first-child:checked:disabled,
    #XfceNotifyWindow spinbutton.vertical button:first-child.flat:active:disabled,
    #XfceNotifyWindow spinbutton.vertical button:first-child.flat:checked:disabled {
      background-color: rgba(48, 54, 95, 0.6);
      background-image: none;
      color: rgba(255, 255, 255, 0.85);
      box-shadow: none; }
      .osd spinbutton.vertical button:first-child:active:disabled :disabled, .osd spinbutton.vertical button:first-child:checked:disabled :disabled, .osd spinbutton.vertical button:first-child.flat:active:disabled :disabled, .osd spinbutton.vertical button:first-child.flat:checked:disabled :disabled,
      #XfceNotifyWindow spinbutton.vertical button:first-child:active:disabled :disabled,
      #XfceNotifyWindow spinbutton.vertical button:first-child:checked:disabled :disabled,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:active:disabled :disabled,
      #XfceNotifyWindow spinbutton.vertical button:first-child.flat:checked:disabled :disabled {
        color: rgba(255, 255, 255, 0.85); }
    .osd spinbutton.vertical button:first-child:backdrop, .osd spinbutton.vertical button:first-child.flat:backdrop,
    #XfceNotifyWindow spinbutton.vertical button:first-child:backdrop,
    #XfceNotifyWindow spinbutton.vertical button:first-child.flat:backdrop {
      color: mix(#ffffff,mix(#ffffff,#1b1c36,0.5),0.8); }
    .osd spinbutton.vertical button:first-child.separator, .osd spinbutton.vertical button:first-child .separator,
    #XfceNotifyWindow spinbutton.vertical button:first-child.separator,
    #XfceNotifyWindow spinbutton.vertical button:first-child .separator {
      border: 1px solid currentColor;
      color: rgba(22, 23, 45, 0.7); }
      .osd spinbutton.vertical button:first-child.separator:disabled, .osd spinbutton.vertical button:first-child .separator:disabled,
      #XfceNotifyWindow spinbutton.vertical button:first-child.separator:disabled,
      #XfceNotifyWindow spinbutton.vertical button:first-child .separator:disabled {
        color: rgba(22, 23, 45, 0.65); }
    .osd spinbutton.vertical button:first-child separator,
    #XfceNotifyWindow spinbutton.vertical button:first-child separator {
      background-image: image(mix(#ffffff,rgba(22, 23, 45, 0.8),0.9)); }

scrolledwindow viewport.frame {
  border-style: none; }

scrolledwindow overshoot.top {
  background-image: -gtk-gradient(radial, center top, 0, center top, 0.5, to(rgba(48, 54, 95, 0.35)), to(rgba(48, 54, 95, 0.25))), -gtk-gradient(radial, center top, 0, center top, 0.6, from(rgba(48, 54, 95, 0.2)), to(rgba(48, 54, 95, 0)));
  background-size: 100% 5%, 100% 100%;
  background-repeat: no-repeat;
  background-position: center top;
  background-color: transparent;
  border: 0;
  box-shadow: none; }
  scrolledwindow overshoot.top:backdrop {
    background-image: -gtk-gradient(radial, center top, 0, center top, 0.5, to(rgba(48, 54, 95, 0.35)), to(rgba(48, 54, 95, 0.25)));
    background-size: 100% 5%;
    background-repeat: no-repeat;
    background-position: center top;
    background-color: transparent;
    border: 0;
    box-shadow: none; }

scrolledwindow overshoot.bottom {
  background-image: -gtk-gradient(radial, center bottom, 0, center bottom, 0.5, to(rgba(48, 54, 95, 0.35)), to(rgba(48, 54, 95, 0.25))), -gtk-gradient(radial, center bottom, 0, center bottom, 0.6, from(rgba(48, 54, 95, 0.2)), to(rgba(48, 54, 95, 0)));
  background-size: 100% 5%, 100% 100%;
  background-repeat: no-repeat;
  background-position: center bottom;
  background-color: transparent;
  border: 0;
  box-shadow: none; }
  scrolledwindow overshoot.bottom:backdrop {
    background-image: -gtk-gradient(radial, center bottom, 0, center bottom, 0.5, to(rgba(48, 54, 95, 0.35)), to(rgba(48, 54, 95, 0.25)));
    background-size: 100% 5%;
    background-repeat: no-repeat;
    background-position: center bottom;
    background-color: transparent;
    border: 0;
    box-shadow: none; }

scrolledwindow overshoot.left {
  background-image: -gtk-gradient(radial, left center, 0, left center, 0.5, to(rgba(48, 54, 95, 0.35)), to(rgba(48, 54, 95, 0.25))), -gtk-gradient(radial, left center, 0, left center, 0.6, from(rgba(48, 54, 95, 0.2)), to(rgba(48, 54, 95, 0)));
  background-size: 5% 100%, 100% 100%;
  background-repeat: no-repeat;
  background-position: left center;
  background-color: transparent;
  border: 0;
  box-shadow: none; }
  scrolledwindow overshoot.left:backdrop {
    background-image: -gtk-gradient(radial, left center, 0, left center, 0.5, to(rgba(48, 54, 95, 0.35)), to(rgba(48, 54, 95, 0.25)));
    background-size: 5% 100%;
    background-repeat: no-repeat;
    background-position: left center;
    background-color: transparent;
    border: 0;
    box-shadow: none; }

scrolledwindow overshoot.right {
  background-image: -gtk-gradient(radial, right center, 0, right center, 0.5, to(rgba(48, 54, 95, 0.35)), to(rgba(48, 54, 95, 0.25))), -gtk-gradient(radial, right center, 0, right center, 0.6, from(rgba(48, 54, 95, 0.2)), to(rgba(48, 54, 95, 0)));
  background-size: 5% 100%, 100% 100%;
  background-repeat: no-repeat;
  background-position: right center;
  background-color: transparent;
  border: 0;
  box-shadow: none; }
  scrolledwindow overshoot.right:backdrop {
    background-image: -gtk-gradient(radial, right center, 0, right center, 0.5, to(rgba(48, 54, 95, 0.35)), to(rgba(48, 54, 95, 0.25)));
    background-size: 5% 100%;
    background-repeat: no-repeat;
    background-position: right center;
    background-color: transparent;
    border: 0;
    box-shadow: none; }

scrolledwindow undershoot.top {
  background-color: transparent;
  /*background-image: linear-gradient(to $_gradient_dir, // this is the dashed line
                                         $_undershoot_color_light 50%,
                                         $_undershoot_color_dark 50%);*/
  padding-top: 1px;
  background-size: 10px 1px;
  background-repeat: repeat-x;
  background-origin: content-box;
  background-position: center top;
  border: 0;
  box-shadow: none; }

scrolledwindow undershoot.bottom {
  background-color: transparent;
  /*background-image: linear-gradient(to $_gradient_dir, // this is the dashed line
                                         $_undershoot_color_light 50%,
                                         $_undershoot_color_dark 50%);*/
  padding-bottom: 1px;
  background-size: 10px 1px;
  background-repeat: repeat-x;
  background-origin: content-box;
  background-position: center bottom;
  border: 0;
  box-shadow: none; }

scrolledwindow undershoot.left {
  background-color: transparent;
  /*background-image: linear-gradient(to $_gradient_dir, // this is the dashed line
                                         $_undershoot_color_light 50%,
                                         $_undershoot_color_dark 50%);*/
  padding-left: 1px;
  background-size: 1px 10px;
  background-repeat: repeat-y;
  background-origin: content-box;
  background-position: left center;
  border: 0;
  box-shadow: none; }

scrolledwindow undershoot.right {
  background-color: transparent;
  /*background-image: linear-gradient(to $_gradient_dir, // this is the dashed line
                                         $_undershoot_color_light 50%,
                                         $_undershoot_color_dark 50%);*/
  padding-right: 1px;
  background-size: 1px 10px;
  background-repeat: repeat-y;
  background-origin: content-box;
  background-position: right center;
  border: 0;
  box-shadow: none; }

scrolledwindow junction {
  border-color: transparent;
  border-image: linear-gradient(to bottom, mix(#1b1c36,#ffffff,0.18) 1px, transparent 1px) 0 0 0 1/0 1px stretch;
  background-color: #131325; }
  scrolledwindow junction:dir(rtl) {
    border-image-slice: 0 1 0 0; }
  scrolledwindow junction:backdrop {
    border-image-source: linear-gradient(to bottom, mix(#1b1c36,mix(#1b1c36,#ffffff,0.18),0.9) 1px, transparent 1px);
    background-color: #16172c;
    transition: 200ms ease-out; }

/*****************
 ! Progress bars *
******************/
progressbar {
  padding: 0;
  border-radius: 8px;
  font-size: smaller;
  color: rgba(255, 255, 255, 0.6); }
  progressbar.horizontal trough,
  progressbar.horizontal progress {
    min-height: 7px; }
  progressbar.vertical trough,
  progressbar.vertical progress {
    min-width: 7px; }
  progressbar trough {
    border: 1px solid mix(#1b1c36,#ffffff,0.17);
    background-color: mix(#1b1c36,#1b1c36,0.08);
    background-image: none;
    border-radius: 8px; }
  progressbar progress {
    background-color: #30365f;
    background-image: none;
    border-radius: 0; }
    progressbar progress.left {
      border-top-left-radius: 8px;
      border-bottom-left-radius: 8px; }
    progressbar progress.right {
      border-top-right-radius: 8px;
      border-bottom-right-radius: 8px; }
    progressbar progress.bottom {
      border-bottom-left-radius: 8px;
      border-bottom-right-radius: 8px; }
    progressbar progress.top {
      border-top-left-radius: 8px;
      border-top-right-radius: 8px; }

levelbar.horizontal block {
  min-width: 34px;
  min-height: 4px; }

levelbar.vertical block {
  min-width: 4px;
  min-height: 34px; }

levelbar:backdrop {
  transition: 200ms ease-out; }

levelbar trough {
  background-color: mix(#1b1c36,#1b1c36,0.08);
  border: 1px solid mix(#1b1c36,#ffffff,0.17);
  border-radius: 8px;
  padding: 2px; }

levelbar.horizontal.discrete block {
  margin: 0 1px; }
  levelbar.horizontal.discrete block:first-child {
    margin: 0; }

levelbar.vertical.discrete block {
  margin: 1px 0; }
  levelbar.vertical.discrete block:first-child {
    margin: 0; }

levelbar block {
  background-color: #30365f;
  border-color: transparent;
  border-radius: 8px; }
  levelbar block.low {
    background-color: #afb500;
    border-color: transparent; }
  levelbar block.high, levelbar block:not(.empty) {
    background-color: #00b500;
    border-color: transparent; }
  levelbar block.full {
    background-color: #262b4c;
    border-color: transparent; }
  levelbar block.empty {
    background-color: transparent;
    border-color: transparent;
    box-shadow: none; }

scale {
  min-height: 11px;
  min-width: 11px;
  padding: 4px; }
  scale.horizontal trough {
    padding: 0 3px; }
  scale.horizontal highlight, scale.horizontal fill {
    margin: 0 -4px; }
  scale.vertical trough {
    padding: 3px 0; }
  scale.vertical highlight, scale.vertical fill {
    margin: -4px 0; }
  scale slider {
    min-height: 17px;
    min-width: 17px;
    margin: -8px; }
  scale.fine-tune slider {
    margin: -8px; }
  scale.fine-tune highlight {
    background-color: #353b69; }
  scale.fine-tune fill,
  scale.fine-tune highlight,
  scale.fine-tune trough {
    border-radius: 6px;
    -gtk-outline-radius: 8px; }
  scale trough {
    outline-offset: 2px;
    -gtk-outline-radius: 4.5px;
    border-radius: 2.5px;
    background-color: mix(#1b1c36,#ffffff,0.2); }
    scale trough:disabled {
      background-color: mix(#1b1c36,#ffffff,0.1); }
    menuitem:hover scale trough, row:selected scale trough, infobar scale trough {
      background-color: rgba(102, 102, 102, 0.2); }
      menuitem:hover scale trough highlight, row:selected scale trough highlight, infobar scale trough highlight {
        background-color: #ffffff; }
        menuitem:hover scale trough highlight:disabled, row:selected scale trough highlight:disabled, infobar scale trough highlight:disabled {
          background-color: mix(#ffffff,#30365f,0.55); }
      menuitem:hover scale trough:disabled, row:selected scale trough:disabled, infobar scale trough:disabled {
        background-color: rgba(102, 102, 102, 0.1); }
  scale highlight {
    border-radius: 2.5px;
    background-color: #30365f; }
    scale highlight:disabled {
      background-color: rgba(48, 54, 95, 0.55); }
  scale fill {
    border-radius: 2.5px;
    background-color: rgba(48, 54, 95, 0.5); }
    scale fill:disabled {
      background-color: transparent; }
  scale slider {
    background-color: #30365F;
    border: 1px solid rgba(255, 255, 255, 0.16);
    border-radius: 100%;
    transition: all 200ms cubic-bezier(0.25, 0.46, 0.45, 0.94);
    transition-property: background, border; }
    scale slider:hover {
      background-color: #394070; }
    scale slider:active {
      background-clip: border-box;
      background-color: #30365f;
      border-color: #30365f; }
    scale slider:disabled {
      background-color: mix(#30365F,#1b1c36,0.55);
      border-color: mix(#ffffff,#1b1c36,0.92); }
    menuitem:hover scale slider, row:selected scale slider, infobar scale slider {
      background-clip: border-box;
      background-color: #ffffff;
      border-color: #ffffff; }
      menuitem:hover scale slider:hover, row:selected scale slider:hover, infobar scale slider:hover {
        background-color: mix(#ffffff,#30365f,0.85);
        border-color: mix(#ffffff,#30365f,0.85); }
      menuitem:hover scale slider:active, row:selected scale slider:active, infobar scale slider:active {
        background-color: mix(#ffffff,#30365f,0.5);
        border-color: mix(#ffffff,#30365f,0.5); }
      menuitem:hover scale slider:disabled, row:selected scale slider:disabled, infobar scale slider:disabled {
        background-color: mix(#ffffff,#30365f,0.55);
        border-color: mix(#ffffff,#30365f,0.55); }
  scale value {
    color: alpha(currentColor,0.4); }
  scale marks {
    color: alpha(currentColor,0.4); }
    scale marks.top {
      margin-bottom: 1px;
      margin-top: -4px; }
    scale marks.bottom {
      margin-top: 1px;
      margin-bottom: -4px; }
    scale marks.top {
      margin-right: 1px;
      margin-left: -4px; }
    scale marks.bottom {
      margin-left: 1px;
      margin-right: -4px; }
  scale.fine-tune marks.top {
    margin-bottom: 0px;
    margin-top: -2px; }
  scale.fine-tune marks.bottom {
    margin-top: 0px;
    margin-bottom: -2px; }
  scale.fine-tune marks.top {
    margin-right: 0px;
    margin-left: -2px; }
  scale.fine-tune marks.bottom {
    margin-left: 0px;
    margin-right: -2px; }
  scale.horizontal indicator {
    min-height: 3px;
    min-width: 1px; }
  scale.horizontal.fine-tune indicator {
    min-height: 2px; }
  scale.vertical indicator {
    min-height: 1px;
    min-width: 3px; }
  scale.vertical.fine-tune indicator {
    min-width: 2px; }
  scale.color trough {
    padding: 0;
    border: 0;
    background-image: none; }
  scale.color highlight, scale.color fill {
    margin: 0; }
  scale.color.horizontal {
    padding: 0 0 7px; }
    scale.color.horizontal trough {
      border-top-left-radius: 0;
      border-top-right-radius: 0; }
    scale.color.horizontal slider:hover, scale.color.horizontal slider:backdrop, scale.color.horizontal slider:disabled, scale.color.horizontal slider:backdrop:disabled, scale.color.horizontal slider {
      margin-bottom: 0;
      margin-top: 0; }
  scale.color.vertical:dir(ltr) {
    padding: 0 0 0 7px; }
    scale.color.vertical:dir(ltr) trough {
      border-bottom-right-radius: 0;
      border-top-right-radius: 0; }
    scale.color.vertical:dir(ltr) slider:hover, scale.color.vertical:dir(ltr) slider:backdrop, scale.color.vertical:dir(ltr) slider:disabled, scale.color.vertical:dir(ltr) slider:backdrop:disabled, scale.color.vertical:dir(ltr) slider {
      margin-left: 0;
      margin-right: 0; }
  scale.color.vertical:dir(rtl) {
    padding: 0 7px 0 0; }
    scale.color.vertical:dir(rtl) trough {
      border-bottom-left-radius: 0;
      border-top-left-radius: 0; }
    scale.color.vertical:dir(rtl) slider:hover, scale.color.vertical:dir(rtl) slider:backdrop, scale.color.vertical:dir(rtl) slider:disabled, scale.color.vertical:dir(rtl) slider:backdrop:disabled, scale.color.vertical:dir(rtl) slider {
      margin-right: 0;
      margin-left: 0; }

/***********
 ! Scrollbar
************/
scrollbar {
  background-color: #131325;
  transition: 300ms ease-out; }
  * {
    -GtkScrollbar-has-backward-stepper: false;
    -GtkScrollbar-has-forward-stepper: false; }
  scrollbar.top {
    border-bottom: 1px solid mix(#1b1c36,#ffffff,0.18); }
  scrollbar.bottom {
    border-top: 1px solid mix(#1b1c36,#ffffff,0.18); }
  scrollbar.left {
    border-right: 1px solid mix(#1b1c36,#ffffff,0.18); }
  scrollbar.right {
    border-left: 1px solid mix(#1b1c36,#ffffff,0.18); }
  scrollbar:backdrop {
    background-color: #16172c;
    border-color: mix(#1b1c36,mix(#1b1c36,#ffffff,0.18),0.9);
    transition: 400ms ease-in; }
  scrollbar slider {
    min-width: 7px;
    min-height: 7px;
    border: 1px solid transparent;
    border-radius: 8px;
    background-clip: padding-box;
    background-color: mix(#1b1c36,#ffffff,0.5); }
    scrollbar slider:hover {
      background-color: mix(#1b1c36,#ffffff,0.7); }
    scrollbar slider:hover:active {
      background-color: #272c4e; }
    scrollbar slider:backdrop {
      background-color: mix(mix(#ffffff,#1b1c36,0.5),#1b1c36,0.4); }
    scrollbar slider:disabled {
      background-color: transparent; }
  scrollbar.horizontal slider {
    min-width: 40px; }
  scrollbar.vertical slider {
    min-height: 40px; }
  scrollbar.fine-tune slider:active {
    background-color: #394070; }
  scrollbar.overlay-indicator {
    opacity: .8; }
    scrollbar.overlay-indicator:not(.dragging):not(.hovering) {
      border-color: transparent;
      opacity: .4;
      background-color: transparent; }
      scrollbar.overlay-indicator:not(.dragging):not(.hovering) slider {
        min-width: 4px;
        min-height: 4px;
        background-color: #ffffff;
        border: 1px solid #1c1d38; }
      scrollbar.overlay-indicator:not(.dragging):not(.hovering) button {
        min-width: 4px;
        min-height: 4px;
        border-color: transparent;
        -gtk-icon-source: none; }
      scrollbar.overlay-indicator:not(.dragging):not(.hovering).horizontal slider {
        min-width: 40px; }
      scrollbar.overlay-indicator:not(.dragging):not(.hovering).horizontal button {
        min-width: 7px; }
      scrollbar.overlay-indicator:not(.dragging):not(.hovering).vertical slider {
        min-height: 40px; }
      scrollbar.overlay-indicator:not(.dragging):not(.hovering).vertical button {
        min-height: 7px; }
  scrollbar button, scrollbar button.nautilus-circular-button.image-button {
    min-width: 7px;
    min-height: 7px;
    padding: 0;
    border: 0;
    border-radius: 0;
    border-color: mix(#1b1c36,#ffffff,0.18);
    background-color: transparent;
    box-shadow: none;
    color: mix(#1b1c36,#ffffff,0.5); }
    scrollbar button:hover, scrollbar button.nautilus-circular-button.image-button:hover {
      color: mix(#1b1c36,#ffffff,0.7); }
    scrollbar button:active, scrollbar button.nautilus-circular-button.image-button:active, scrollbar button:checked, scrollbar button.nautilus-circular-button.image-button:checked {
      color: #272c4e; }
    scrollbar button:backdrop, scrollbar button.nautilus-circular-button.image-button:backdrop {
      color: mix(mix(#ffffff,#1b1c36,0.5),#1b1c36,0.4); }
  scrollbar.vertical button.down {
    -gtk-icon-source: -gtk-icontheme("pan-down-symbolic");
    border-top: 1px solid mix(#1b1c36,#ffffff,0.18); }
  scrollbar.vertical button.up {
    -gtk-icon-source: -gtk-icontheme("pan-up-symbolic");
    border-bottom: 1px solid mix(#1b1c36,#ffffff,0.18); }
  scrollbar.horizontal button.down {
    -gtk-icon-source: -gtk-icontheme("pan-end-symbolic");
    border-left: 1px solid mix(#1b1c36,#ffffff,0.18); }
  scrollbar.horizontal button.up {
    -gtk-icon-source: -gtk-icontheme("pan-start-symbolic");
    border-right: 1px solid mix(#1b1c36,#ffffff,0.18); }

/*********
 ! Sidebar
**********/
.sidebar {
  border-style: none;
  background-color: mix(#1b1c36,#1b1c36,0.5); }
  stacksidebar.sidebar:dir(ltr) list, stacksidebar.sidebar.left list, stacksidebar.sidebar.left:dir(rtl) list, .sidebar:dir(ltr), .sidebar.left {
    border-right: 1px solid mix(#1b1c36,#ffffff,0.18);
    border-left-style: none; }
  stacksidebar.sidebar:dir(rtl) list .sidebar:dir(rtl), stacksidebar.sidebar.right list .sidebar:dir(rtl), .sidebar.right {
    border-left: 1px solid mix(#1b1c36,#ffffff,0.18);
    border-right-style: none; }
  .sidebar:backdrop {
    background-color: mix(#1b1c36,#1b1c36,0.5);
    border-color: mix(#1b1c36,mix(#1b1c36,#ffffff,0.18),0.9);
    transition: 200ms ease-out; }
  .sidebar .frame, .sidebar frame {
    border-width: 0; }
  paned .sidebar.left, paned .sidebar.right, paned .sidebar.left:dir(rtl), paned .sidebar:dir(rtl), paned .sidebar:dir(ltr), paned .sidebar {
    border-style: none; }

stacksidebar row {
  padding: 8px 4px; }
  stacksidebar row > label {
    padding-left: 4px;
    padding-right: 4px; }
  stacksidebar row.needs-attention > label {
    background-size: 6px 6px, 0 0; }

placessidebar > viewport.frame {
  border-style: none; }

placessidebar row {
  min-height: 32px;
  padding: 0; }
  placessidebar row > revealer {
    padding: 0 8px; }
  placessidebar row:selected {
    color: #ffffff; }
  placessidebar row:disabled {
    color: mix(#ffffff,#1b1c36,0.5); }
  placessidebar row:backdrop {
    color: mix(#ffffff,#1b1c36,0.5); }
    placessidebar row:backdrop:selected {
      color: mix(#30365f,#ffffff,0.66); }
    placessidebar row:backdrop:disabled {
      color: #020203; }
  placessidebar row image.sidebar-icon {
    opacity: 0.7; }
    placessidebar row image.sidebar-icon:dir(ltr) {
      padding-right: 10px;
      padding-left: 4px; }
    placessidebar row image.sidebar-icon:dir(rtl) {
      padding-left: 10px;
      padding-right: 4px; }
  placessidebar row label.sidebar-label:dir(ltr) {
    padding-right: 2px; }
  placessidebar row label.sidebar-label:dir(rtl) {
    padding-left: 2px; }
  button.sidebar-button, button.sidebar-button.nautilus-circular-button.image-button {
    min-height: 20px;
    min-width: 20px;
    margin-top: 2px;
    margin-bottom: 2px;
    padding: 0;
    border-radius: 100%;
    -gtk-outline-radius: 100%; }
    button.sidebar-button:not(:hover):not(:active) > image, button.sidebar-button:backdrop > image {
      opacity: 0.7; }
  placessidebar row:selected:active {
    box-shadow: none; }
  placessidebar row.sidebar-placeholder-row {
    padding: 0 8px;
    min-height: 2px;
    background-image: image(#30365f);
    background-clip: content-box; }
  placessidebar row.sidebar-new-bookmark-row {
    color: #30365f; }
  placessidebar row:drop(active):not(:disabled) {
    color: #30365f;
    box-shadow: inset 0 1px #30365f, inset 0 -1px #30365f; }
    placessidebar row:drop(active):not(:disabled):selected {
      color: #ffffff;
      background-color: #30365f; }

/******
! Paned
*******/
paned > separator {
  min-width: 1px;
  min-height: 1px;
  -gtk-icon-source: none;
  border-style: none;
  background-color: transparent;
  background-image: image(#181931);
  background-size: 1px 1px;
  background-position: center center; }
  paned > separator:selected {
    background-image: image(#30365f); }
  paned > separator:backdrop {
    background-image: image(mix(#1b1c36,mix(#1b1c36,#ffffff,0.18),0.9)); }
  paned > separator.wide {
    min-width: 5px;
    min-height: 5px;
    background-color: #1b1c36;
    background-image: image(#16162b), image(#16162b);
    background-size: 1px 1px, 1px 1px; }
    paned > separator.wide:backdrop {
      background-color: #1b1c36;
      background-image: image(mix(#1b1c36,mix(#1b1c36,#ffffff,0.18),0.9)), image(mix(#1b1c36,mix(#1b1c36,#ffffff,0.18),0.9)); }

paned.horizontal > separator {
  background-repeat: repeat-y;
  padding: 0 2px;
  margin: 0 -2px; }
  paned.horizontal > separator.wide {
    margin: 0;
    padding: 0;
    background-repeat: repeat-y, repeat-y;
    background-position: left, right; }

paned.vertical > separator {
  background-repeat: repeat-x;
  padding: 2px 0;
  margin: -2px 0; }
  paned.vertical > separator.wide {
    margin: 0;
    padding: 0;
    background-repeat: repeat-x, repeat-x;
    background-position: bottom, top; }

paned.titlebar > separator {
  background-image: image(#141529); }

/*******************
 ! Spinner animation
********************/
@keyframes spin {
  to {
    -gtk-icon-transform: rotate(1turn); } }

spinner {
  background-image: none;
  color: #30365f;
  opacity: 0;
  -gtk-icon-source: -gtk-icontheme("process-working-symbolic"); }
  spinner:checked {
    opacity: 1;
    animation: spin 1s linear infinite; }
    spinner:checked:disabled {
      opacity: .5; }

/***********************
 ! Check and Radio items
************************/
radio {
  background-image: none;
  min-width: 18px;
  min-height: 18px;
  margin-right: 4px; }
  radio:disabled {
    -gtk-icon-source: url("../assets/radio-unchecked-insensitive.svg"); }
  radio:checked, radio:active {
    -gtk-icon-source: url("../assets/radio-checked.svg"); }
    radio:checked:disabled, radio:active:disabled {
      -gtk-icon-source: url("../assets/radio-checked-insensitive.svg"); }
  radio:indeterminate {
    -gtk-icon-source: url("../assets/radio-mixed.svg"); }
    radio:indeterminate:disabled {
      -gtk-icon-source: url("../assets/radio-mixed-insensitive.svg"); }
  menuitem radio, modelbutton radio {
    -gtk-icon-source: url("../assets/menuitem-radio-unchecked.svg"); }
    menuitem radio:disabled, modelbutton radio:disabled {
      -gtk-icon-source: url("../assets/menuitem-radio-checked-insensitive.svg"); }
    menuitem radio:checked, menuitem radio:active, modelbutton radio:checked, modelbutton radio:active {
      -gtk-icon-source: url("../assets/menuitem-radio-checked.svg"); }
      menuitem radio:checked:hover, menuitem radio:active:hover, modelbutton radio:checked:hover, modelbutton radio:active:hover {
        -gtk-icon-source: url("../assets/menuitem-radio-checked-hover.svg"); }
      menuitem radio:checked:disabled, menuitem radio:active:disabled, modelbutton radio:checked:disabled, modelbutton radio:active:disabled {
        -gtk-icon-source: url("../assets/menuitem-radio-checked-insensitive.svg"); }
    menuitem radio:indeterminate, modelbutton radio:indeterminate {
      -gtk-icon-source: url("../assets/menuitem-radio-mixed.svg"); }
      menuitem radio:indeterminate:hover, modelbutton radio:indeterminate:hover {
        -gtk-icon-source: url("../assets/menuitem-radio-mixed-hover.svg"); }
      menuitem radio:indeterminate:disabled, modelbutton radio:indeterminate:disabled {
        -gtk-icon-source: url("../assets/menuitem-radio-mixed-insensitive.svg"); }

check {
  background-image: none;
  min-width: 18px;
  min-height: 18px;
  margin-right: 4px; }
  check:disabled {
    -gtk-icon-source: url("../assets/checkbox-unchecked-insensitive.svg"); }
  check:checked, check:active {
    -gtk-icon-source: url("../assets/checkbox-checked.svg"); }
    check:checked:disabled, check:active:disabled {
      -gtk-icon-source: url("../assets/checkbox-checked-insensitive.svg"); }
  check:indeterminate {
    -gtk-icon-source: url("../assets/checkbox-mixed.svg"); }
    check:indeterminate:disabled {
      -gtk-icon-source: url("../assets/checkbox-mixed-insensitive.svg"); }
  menuitem check, modelbutton check {
    -gtk-icon-source: url("../assets/menuitem-checkbox-unchecked.svg"); }
    menuitem check:disabled, modelbutton check:disabled {
      -gtk-icon-source: url("../assets/menuitem-checkbox-checked-insensitive.svg"); }
    menuitem check:checked, menuitem check:active, modelbutton check:checked, modelbutton check:active {
      -gtk-icon-source: url("../assets/menuitem-checkbox-checked.svg"); }
      menuitem check:checked:hover, menuitem check:active:hover, modelbutton check:checked:hover, modelbutton check:active:hover {
        -gtk-icon-source: url("../assets/menuitem-checkbox-checked-hover.svg"); }
      menuitem check:checked:disabled, menuitem check:active:disabled, modelbutton check:checked:disabled, modelbutton check:active:disabled {
        -gtk-icon-source: url("../assets/menuitem-checkbox-checked-insensitive.svg"); }
    menuitem check:indeterminate, modelbutton check:indeterminate {
      -gtk-icon-source: url("../assets/menuitem-checkbox-mixed.svg"); }
      menuitem check:indeterminate:hover, modelbutton check:indeterminate:hover {
        -gtk-icon-source: url("../assets/menuitem-checkbox-mixed-hover.svg"); }
      menuitem check:indeterminate:disabled, modelbutton check:indeterminate:disabled {
        -gtk-icon-source: url("../assets/menuitem-checkbox-mixed-insensitive.svg"); }

check, radio {
  box-shadow: -1px 0 mix(#1b1c36,#ffffff,0.3) inset, 1px 0 mix(#1b1c36,#ffffff,0.3) inset, 0 -1px mix(#1b1c36,#ffffff,0.3) inset, 0 1px mix(#1b1c36,#ffffff,0.3) inset;
  border-radius: 4px;
  background-color: #1b1c36; }
  check:disabled, radio:disabled {
    box-shadow: -1px 0 mix(#1b1c36,#ffffff,0.15) inset, 1px 0 mix(#1b1c36,#ffffff,0.15) inset, 0 -1px mix(#1b1c36,#ffffff,0.15) inset, 0 1px mix(#1b1c36,#ffffff,0.15) inset;
    background-color: rgba(27, 28, 54, 0.25); }
  menuitem check:disabled, modelbutton check:disabled, menuitem check, modelbutton check, menuitem radio:disabled, modelbutton radio:disabled, menuitem radio, modelbutton radio {
    box-shadow: none;
    border-radius: 0;
    background-color: transparent;
    border: 0; }
  textview check:focus, .view check:focus, iconview check:focus, view check:focus, treeview check:focus, textview radio:focus, .view radio:focus, iconview radio:focus, view radio:focus, treeview radio:focus {
    background-color: #1b1c36; }

radio {
  border-radius: 999px; }

radio:dir(rtl), check:dir(rtl) {
  margin-right: 0;
  margin-left: 4px; }

.view.content-view.check:not(list), iconview.content-view.check:not(list) {
  -gtk-icon-shadow: none;
  -gtk-icon-source: url("../assets/grid-selection-unchecked.svg");
  background-color: transparent; }

.view.content-view.check:hover:not(list), iconview.content-view.check:hover:not(list) {
  -gtk-icon-shadow: none;
  -gtk-icon-source: url("../assets/grid-selection-unchecked.svg");
  background-color: transparent; }

.view.content-view.check:active:not(list), iconview.content-view.check:active:not(list) {
  -gtk-icon-shadow: none;
  -gtk-icon-source: url("../assets/grid-selection-checked.svg");
  background-color: transparent; }

.view.content-view.check:backdrop:not(list), iconview.content-view.check:backdrop:not(list) {
  -gtk-icon-shadow: none;
  -gtk-icon-source: url("../assets/grid-selection-unchecked.svg");
  background-color: transparent; }

.view.content-view.check:checked:not(list), iconview.content-view.check:checked:not(list) {
  -gtk-icon-shadow: none;
  -gtk-icon-source: url("../assets/grid-selection-checked.svg");
  background-color: transparent; }

.view.content-view.check:checked:hover:not(list), iconview.content-view.check:checked:hover:not(list) {
  -gtk-icon-shadow: none;
  -gtk-icon-source: url("../assets/grid-selection-checked.svg");
  background-color: transparent; }

.view.content-view.check:checked:active:not(list), iconview.content-view.check:checked:active:not(list) {
  -gtk-icon-shadow: none;
  -gtk-icon-source: url("../assets/grid-selection-checked.svg");
  background-color: transparent; }

.view.content-view.check:backdrop:checked:not(list), iconview.content-view.check:backdrop:checked:not(list) {
  -gtk-icon-shadow: none;
  -gtk-icon-source: url("../assets/grid-selection-checked.svg");
  background-color: transparent; }

/********
 ! Switch
*********/
switch {
  border-radius: 8px;
  padding: 3px;
  border: 0;
  outline: none;
  transition: background-color .3s linear;
  min-width: 82px;
  min-height: 26px;
  background-color: mix(#1b1c36,#1b1c36,0.3);
  color: #c1c3cc;
  box-shadow: inset 1px -1px 0 rgba(51, 51, 51, 0.06), inset -1px 1px 0 rgba(51, 51, 51, 0.06);
  font-size: 90%; }
  switch slider {
    background-color: mix(#c1c3cc,#1b1c36,0.5);
    transition: all .3s ease-in;
    box-shadow: 0 1px 2px 0 rgba(51, 51, 51, 0.07), 1px 0 2px 0 rgba(51, 51, 51, 0.07);
    border-radius: 8px; }
  switch:checked {
    background-color: #30365f;
    background-image: none;
    border-color: #30365f;
    color: #1b1c36; }
    switch:checked slider {
      background-color: #1c1d38;
      box-shadow: 0 1px 3px 0 rgba(51, 51, 51, 0.1); }
  switch:disabled {
    background-color: mix(#1b1c36,#1b1c36,0.5);
    background-image: none;
    border-color: #1b1c36;
    color: #1b1c36;
    box-shadow: none; }
    switch:disabled slider {
      background-color: #1b1c36; }
  list row:selected switch {
    background-color: #1b1c36;
    color: mix(#1b1c36,#1b1c36,0.5); }
    list row:selected switch slider {
      background-color: mix(mix(#1b1c36,#1b1c36,0.5),#1b1c36,0.4); }
    list row:selected switch:checked {
      color: #30365f;
      background-color: mix(#c1c3cc,#1b1c36,0.5); }
      list row:selected switch:checked slider {
        background-color: #30365f; }

/*********
 ! Buttons
**********/
/******************
! ComboBoxes *
*******************/
/*********
 ! Toolbar
**********/
/***************
 ! Generic views
****************/
.view, iconview,
.view text,
iconview text,
textview text {
  color: #c1c3cc;
  background-color: #1b1c36;
  caret-color: #c1c3cc;
  -gtk-secondary-caret-color: #ff0007; }
  .view:backdrop, iconview:backdrop,
  .view text:backdrop,
  iconview text:backdrop,
  textview text:backdrop {
    color: mix(#1b1c36,#c1c3cc,0.8);
    background-color: #1b1c36; }
  .view separator, iconview separator,
  textview text separator {
    background-image: image(mix(#c1c3cc,#1b1c36,0.9)); }

textview border {
  background-color: mix(#1b1c36,#1b1c36,0.5); }

iconview :selected {
  border-radius: 8px; }

/************
! Treeview
*************/
.rubberband,
rubberband,
treeview.view rubberband,
flowbox rubberband {
  border: 1px solid mix(#30365f,#ffffff,0.1);
  background-color: rgba(48, 54, 95, 0.2); }

treeview entry:focus:dir(rtl), treeview entry:focus:dir(ltr) {
  background-color: #1b1c36;
  transition-property: color, background; }

treeview entry.flat, treeview entry {
  border-radius: 0;
  background-image: none;
  background-color: #1b1c36; }
  treeview entry.flat:focus, treeview entry:focus {
    border-color: #30365f; }

treeview.view header button:active, treeview.view header button:hover, treeview.view header button, treeview.view header button.nautilus-circular-button.image-button {
  padding: 2px 5px;
  border-radius: 0;
  text-shadow: none;
  border-top-color: transparent;
  border-left-color: transparent; }
  treeview.view header button:disabled {
    color: mix(#ffffff,#1b1c36,0.5); }
  treeview.view header button:backdrop {
    color: mix(#ffffff,mix(#ffffff,#1b1c36,0.5),0.5);
    background-image: none;
    background-color: mix(#30365F,#1b1c36,0.5); }
    treeview.view header button:backdrop:disabled {
      border-color: #1b1c36;
      background-image: none; }

treeview.view {
  -GtkTreeView-grid-line-width: 1;
  -GtkTreeView-grid-line-pattern: "";
  -GtkTreeView-tree-line-width: 1;
  -GtkTreeView-tree-line-pattern: "";
  border-left-color: mix(#ffffff,#1b1c36,0.7);
  border-top-color: mix(#ffffff,#1b1c36,0.9); }
  treeview.view:selected:focus, treeview.view:selected {
    border-radius: 0; }
  treeview.view:selected:backdrop, treeview.view:selected {
    border-left-color: mix(#ffffff,#30365f,0.5);
    border-top-color: rgba(255, 255, 255, 0.1); }
  treeview.view:disabled {
    color: mix(#ffffff,#1b1c36,0.5); }
    treeview.view:disabled:selected {
      color: mix(#ffffff,#30365f,0.4); }
      treeview.view:disabled:selected:backdrop {
        color: mix(mix(#30365f,#ffffff,0.66),#30365f,0.3); }
    treeview.view:disabled:backdrop {
      color: #020203; }
  treeview.view.separator {
    min-height: 2px;
    color: #1b1c36; }
    treeview.view.separator:backdrop {
      color: rgba(27, 28, 54, 0.1); }
  treeview.view:backdrop {
    border-left-color: mix(mix(#ffffff,#1b1c36,0.5),#1b1c36,0.5);
    border-top: #1b1c36; }
  treeview.view:drop(active) {
    border-style: solid none;
    border-width: 1px;
    border-color: mix(#30365f,#ffffff,0.3); }
    treeview.view:drop(active).after {
      border-top-style: none; }
    treeview.view:drop(active).before {
      border-bottom-style: none; }
  treeview.view.expander {
    -gtk-icon-source: -gtk-icontheme("pan-end-symbolic");
    color: mix(#1b1c36,#ffffff,0.7); }
    treeview.view.expander:dir(rtl) {
      -gtk-icon-source: -gtk-icontheme("pan-end-symbolic-rtl"); }
    treeview.view.expander:hover {
      color: #ffffff; }
    treeview.view.expander:selected {
      color: mix(#30365f,#ffffff,0.7); }
      treeview.view.expander:selected:hover {
        color: #ffffff; }
      treeview.view.expander:selected:backdrop {
        color: mix(#30365f,mix(#30365f,#ffffff,0.66),0.7); }
    treeview.view.expander:checked {
      -gtk-icon-source: -gtk-icontheme("pan-down-symbolic"); }
    treeview.view.expander:backdrop {
      color: mix(#1b1c36,mix(#ffffff,#1b1c36,0.5),0.7); }
  treeview.view.progressbar {
    background-color: #30365f;
    background-image: none;
    color: #1b1c36;
    border-radius: 8px;
    border: 1px solid mix(#30365f,#ffffff,0.3); }
    treeview.view.progressbar:selected {
      border: 1px solid mix(#30365f,#ffffff,0.2); }
      treeview.view.progressbar:selected:focus, treeview.view.progressbar:selected {
        color: #ffffff;
        box-shadow: none;
        background-color: #30365f;
        background-image: none;
        border-radius: 8px; }
        treeview.view.progressbar:selected:focus:backdrop, treeview.view.progressbar:selected:backdrop {
          color: mix(#30365f,#ffffff,0.66);
          border-color: mix(#30365f,#ffffff,0.3);
          background-color: mix(#1b1c36,#30365f,0.9); }
    treeview.view.progressbar:disabled {
      background-color: #1b1c36;
      background-image: none;
      border-color: mix(#ffffff,#1b1c36,0.84); }
    treeview.view.progressbar:backdrop {
      color: #1b1c36;
      background-image: none;
      box-shadow: none; }
  treeview.view.trough {
    background-color: rgba(255, 255, 255, 0.1);
    border-radius: 8px; }
    treeview.view.trough:selected:focus, treeview.view.trough:selected {
      background-color: rgba(255, 255, 255, 0.3);
      border-width: 1px 0;
      border-style: solid;
      border-color: #30365f;
      border-radius: 8px; }
  treeview.view header button, treeview.view header button.nautilus-circular-button.image-button {
    font-weight: normal;
    text-shadow: none;
    box-shadow: none; }
    treeview.view header button:hover {
      border-top-color: mix(#30365f,#ffffff,0.3);
      border-left-color: mix(#30365f,#ffffff,0.3);
      box-shadow: none;
      transition: none; }
    treeview.view header button:active {
      border-top-color: mix(#30365f,#ffffff,0.3);
      border-left-color: mix(#30365f,#ffffff,0.3);
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
    background-color: #30365f;
    color: #1b1c36;
    border-radius: 0;
    border-style: none;
    box-shadow: inset 0 0 0 1px #1b1c36;
    text-shadow: none; }
  treeview.view acceleditor > label {
    background-color: #30365f; }

/***********
 ! Separator
************/
separator {
  background-image: image(mix(#ffffff,#1b1c36,0.9));
  min-width: 1px;
  min-height: 1px; }

/**********
 ! Frames *
***********/
frame > border, .frame {
  border: 1px solid mix(#1b1c36,#ffffff,0.18); }
  frame > border.flat, .frame.flat {
    border-style: none; }
  frame > border:backdrop, .frame:backdrop {
    border-color: mix(#1b1c36,mix(#1b1c36,#ffffff,0.18),0.9); }

frame.border-inset > border,
frame.border-outset > border,
frame.border-groove > border,
frame.border-ridge > border {
  border: 1px solid alpha(mix(#1b1c36,#ffffff,0.18),0.3588235294); }

.content-view {
  background-color: mix(#1b1c36,#1b1c36,0.28);
  color: mix(#c1c3cc,#ffffff,0.18);
  border: 1px solid shade(mix(#1b1c36,#1b1c36,0.78),0.8); }

viewport separator {
  background-image: image(mix(#c1c3cc,#1b1c36,0.9)); }

viewport menu separator {
  background-image: image(mix(#16172d,#ffffff,0.18)); }

/***************
 ! Places view *
****************/
placesview .server-list-button > image {
  transition: 200ms cubic-bezier(0.25, 0.46, 0.45, 0.94);
  -gtk-icon-transform: rotate(0turn); }

placesview .server-list-button:checked > image {
  transition: 200ms cubic-bezier(0.25, 0.46, 0.45, 0.94);
  -gtk-icon-transform: rotate(-0.5turn); }

placesview row.activatable:hover {
  background-color: transparent; }

placesview > actionbar > revealer > box > label {
  padding-left: 8px;
  padding-right: 8px; }

/**************
 ! Window frame
***************/
decoration {
  background-color: #16172d;
  background-image: none;
  border-radius: 8px 8px 0 0;
  border-width: 0;
  box-shadow: 0 3px 9px 1px rgba(102, 102, 102, 0.7), 0 0 0 0px #00a3cc;
  /* this is used for the resize cursor area */
  margin: 12px; }
  decoration:backdrop {
    box-shadow: 0 3px 9px 1px transparent, 0 2px 6px 2px rgba(102, 102, 102, 0.4), 0 0 0 0px #16172d;
    transition: 200ms ease-out; }
  .maximized decoration, .fullscreen decoration, .tiled decoration {
    border-radius: 0; }
  .popup decoration {
    box-shadow: none; }
  .ssd decoration {
    box-shadow: 0 0 0 1px #00a3cc; }
    .ssd decoration:backdrop {
      box-shadow: 0 0 0 1px #16172d; }
  .solid-csd decoration {
    border-radius: 0;
    margin: 0;
    box-shadow: none; }
  .csd.popup decoration {
    border-radius: 0;
    box-shadow: 0 1px 2px rgba(102, 102, 102, 0.2), 0 0 0 1px rgba(22, 23, 45, 0.13); }
  tooltip.csd decoration {
    border-radius: 8px;
    box-shadow: none; }
  messagedialog.csd decoration {
    border-radius: 8px;
    box-shadow: 0 1px 2px rgba(102, 102, 102, 0.2), 0 0 0 1px rgba(22, 23, 45, 0.13); }

/***********************
 ! Fallback mode panel *
************************/
UnityPanelWidget, .unity-panel, .xfce4-panel, .mate-panel-menu-bar, wnck-pager, wnck-tasklist, clock-box menuitem, clock-box:backdrop menuitem,
panel-applet > menubar menuitem,
panel-applet > menubar:backdrop menuitem,
panel-toplevel .gnome-panel-menu-bar menuitem, clock-box, clock-box:backdrop,
panel-applet > menubar,
panel-applet > menubar:backdrop,
panel-toplevel .gnome-panel-menu-bar, panel-plug,
panel-toplevel.background {
  background-color: #16172d;
  background-image: none;
  color: #ffffff; }

gp-calendar-window label,
#tasklist-button label,
#clock-applet-button label,
#showdesktop-button label, clock-box menuitem label, clock-box:backdrop menuitem label,
panel-applet > menubar menuitem label,
panel-applet > menubar:backdrop menuitem label,
panel-toplevel .gnome-panel-menu-bar menuitem label {
  font-weight: normal;
  color: #ffffff; }

#login_window, #shutdown_dialog, #restart_dialog, .xfce4-panel button, .xfce4-panel button.nautilus-circular-button.image-button, panel-applet button, panel-applet button.nautilus-circular-button.image-button, panel-applet button:backdrop, #clock-applet-button, #clock-applet-button:backdrop {
  border-width: 0 1px;
  border-radius: 0;
  border-color: transparent;
  background-color: transparent;
  background-image: none;
  color: #ffffff; }
  #login_window:hover, #shutdown_dialog:hover, #restart_dialog:hover, .xfce4-panel button:hover, panel-applet button:hover, panel-applet button.nautilus-circular-button.image-button:hover, #clock-applet-button:hover {
    background-color: mix(#16172d,#ffffff,0.11);
    background-image: none;
    border-color: mix(#16172d,#ffffff,0.11);
    color: white; }
  #login_window:active, #shutdown_dialog:active, #restart_dialog:active, .xfce4-panel button:active, panel-applet button:active, panel-applet button.nautilus-circular-button.image-button:active, #clock-applet-button:active, #login_window:checked, #shutdown_dialog:checked, #restart_dialog:checked, .xfce4-panel button:checked, panel-applet button:checked, panel-applet button.nautilus-circular-button.image-button:checked, #clock-applet-button:checked {
    background-color: mix(#16172d,#ffffff,0.21);
    background-image: none;
    border-color: mix(#16172d,#ffffff,0.21);
    color: white; }
    #login_window:active:hover, #shutdown_dialog:active:hover, #restart_dialog:active:hover, .xfce4-panel button:active:hover, panel-applet button:active:hover, #clock-applet-button:active:hover, #login_window:checked:hover, #shutdown_dialog:checked:hover, #restart_dialog:checked:hover, .xfce4-panel button:checked:hover, panel-applet button:checked:hover, #clock-applet-button:checked:hover {
      background-color: mix(#16172d,#ffffff,0.31);
      background-image: none;
      border-color: mix(#16172d,#ffffff,0.31); }

panel-plug,
panel-toplevel.background {
  padding: 0; }

.gp-text-color {
  color: #666666; }

panel-applet {
  border: 0; }

clock-box menuitem, clock-box:backdrop menuitem,
panel-applet > menubar menuitem,
panel-applet > menubar:backdrop menuitem,
panel-toplevel .gnome-panel-menu-bar menuitem,
panel-toplevel .gnome-panel-menu-bar:backdrop menuitem {
  border: 0; }

/****************
 ! MATE styles *
*****************/
.mate-panel-menu-bar {
  border: 0;
  padding: 0;
  text-shadow: none; }

#PanelApplet label,
.mate-panel-menu-bar menubar > menuitem {
  color: #ffffff; }

PanelSeparator, MatePanelAppletFrameDBus {
  border-width: 0;
  color: transparent;
  background-image: -gtk-scaled(url("../assets/pane-handle.png"), url("../assets/pane-handle@2.png"));
  background-color: transparent;
  background-repeat: no-repeat;
  background-position: left; }

#PanelApplet button,
#PanelApplet button.flat,
#PanelApplet button.toggle
#PanelApplet button.flat.toggle {
  background-image: none;
  background-color: transparent;
  border-color: transparent;
  border-style: solid;
  border-radius: 0;
  border-width: 1px;
  color: #ffffff;
  text-shadow: none;
  box-shadow: none;
  padding: 2px; }

#PanelApplet button:hover:active,
#PanelApplet button:checked,
#PanelApplet button:checked:hover,
#PanelApplet button.flat:hover:active,
#PanelApplet button.flat:checked,
#PanelApplet button.flat:checked:hover,
#PanelApplet button.toggle:hover:active,
#PanelApplet button.toggle:checked,
#PanelApplet button.toggle:checked:hover,
#PanelApplet button.flat.toggle:hover:active,
#PanelApplet button.flat.toggle:checked,
#PanelApplet button.flat.toggle:checked:hover {
  background-image: none;
  background-color: darker(#16172d);
  border-color: transparent;
  border-radius: 0;
  border-width: 1px;
  color: lighter(#ffffff);
  text-shadow: none;
  padding: 2px; }

#PanelApplet button:hover,
#PanelApplet button.flat:hover,
#PanelApplet button.toggle:hover,
#PanelApplet button.flat.toggle:hover {
  background-image: none;
  background-color: #1d1e3b;
  border-color: transparent;
  border-radius: 0;
  border-width: 1px;
  color: #ffffff;
  text-shadow: none;
  padding: 2px; }

.mate-panel-menu-bar menubar > menuitem {
  padding: 3px 7px; }

/*********************
 ! Cinnamon Settings *
**********************/
.cs-category-view, .cs-category-view:backdrop, .cs-category-view .view, .cs-category-view iconview, .cs-category-view .view:backdrop {
  background-color: transparent; }

/****************
 ! Gnome clocks *
*****************/
.clocks-analog-frame.trough {
  color: mix(#ffffff,#1b1c36,0.85); }

.clocks-analog-frame.progress {
  color: mix(#1b1c36,#30365f,0.5); }

.clocks-analog-frame.progress-fast {
  color: #222643; }

/*****************
 ! Gnome Builder *
******************/
workbench.csd > stack.titlebar:not(headerbar) {
  padding: 0;
  background: none;
  border: 0;
  box-shadow: none; }
  workbench.csd > stack.titlebar:not(headerbar) headerbar, workbench.csd > stack.titlebar:not(headerbar) headerbar:first-child, workbench.csd > stack.titlebar:not(headerbar) headerbar:last-child {
    border-radius: 8px 8px 0 0; }

/****************
 ! Geary *
*****************/
.geary-expanded .geary-message-summary {
  background-color: #1a1b33; }

.geary-folder-popover-list-row {
  border-color: #1a1c36;
  box-shadow: None; }
  .geary-folder-popover-list-row > label {
    color: #1b1c36; }

/***********************
 ! Unity Greeter *
 ***********************/
@keyframes dashentry_spinner {
  to {
    -gtk-icon-transform: rotate(1turn); } }

.lightdm-combo.combobox-entry .button, .lightdm-combo .cell, .lightdm-combo .button, .lightdm-combo .entry, .lightdm.button {
  background-image: none;
  background-color: rgba(102, 102, 102, 0.3);
  border-color: rgba(28, 29, 56, 0.9);
  border-radius: 17px;
  padding: 4px;
  color: #1c1d38; }

.lightdm.menu {
  background-image: none;
  background-color: rgba(102, 102, 102, 0.6);
  border-color: rgba(28, 29, 56, 0.2);
  border-radius: 16px;
  padding: 1px;
  color: #1c1d38; }
  .lightdm.menu .menuitem *, .lightdm.menu .menuitem.check:active, .lightdm.menu .menuitem.radio:active {
    color: #1c1d38; }

.lightdm.menubar *, .lightdm.menubar.menuitem {
  padding: 1px; }

.lightdm.option-button {
  padding: 4px;
  background: none;
  border: 0; }

.lightdm.toggle-button {
  background: none;
  border-width: 0; }
  .lightdm.toggle-button.selected {
    background-color: rgba(102, 102, 102, 0.3);
    border-color: rgba(28, 29, 56, 0.3);
    border-width: 1px; }
    .lightdm.toggle-button.selected:hover {
      background-color: rgba(28, 29, 56, 0.3); }

.lightdm.button:hover {
  background-color: rgba(28, 29, 56, 0.3);
  border-color: rgba(28, 29, 56, 0.6);
  text-shadow: none; }

.lightdm.entry, .lightdm.button:active, .lightdm.button:active:focus, .lightdm.button:focus {
  background-image: none;
  background-color: rgba(102, 102, 102, 0.3);
  border-color: rgba(28, 29, 56, 0.6);
  border-radius: 17px;
  padding: 6px;
  color: #1c1d38;
  text-shadow: none; }

.lightdm.entry:hover, .lightdm.entry:active, .lightdm.entry:active:focus {
  background-image: none;
  border-image: none; }

.lightdm.entry:active {
  -gtk-icon-source: -gtk-icontheme("process-working-symbolic");
  animation: dashentry_spinner 1s infinite linear; }

.lightdm.entry:focus {
  border-color: rgba(28, 29, 56, 0.6);
  border-width: 1px;
  border-style: solid;
  color: #1c1d38; }

.lightdm.entry:selected {
  background-color: rgba(28, 29, 56, 0.2); }

.lightdm-combo.menu {
  background-color: #181931;
  border-radius: 0;
  padding: 0;
  color: #1c1d38; }

/*********
 ! Gedit *
**********/
GeditWindow .pane-separator {
  border-width: 0 1px 0 0;
  border-style: solid; }
  GeditWindow .pane-separator, GeditWindow .pane-separator:hover {
    border-color: #181931;
    background-color: #1b1c36; }

.gedit-document-panel {
  background-color: #1b1c36;
  color: mix(#ffffff,#1b1c36,0.1); }
  .gedit-document-panel list row {
    padding: 4px; }
    .gedit-document-panel list row button, .gedit-document-panel list row button.nautilus-circular-button.image-button {
      padding: 1px;
      border-radius: 8px;
      border-style: solid;
      border-color: transparent;
      border-width: 1px;
      background-color: transparent;
      background-image: none;
      color: transparent;
      -gtk-icon-shadow: none; }
  .gedit-document-panel .prelight-row button {
    border-color: rgba(102, 102, 102, 0.1);
    color: rgba(28, 29, 56, 0.8); }
    .gedit-document-panel .prelight-row button:active {
      border-color: rgba(102, 102, 102, 0.2);
      background-color: rgba(102, 102, 102, 0.08);
      color: #1c1d38; }
  .gedit-document-panel list row button:hover, .gedit-document-panel .prelight-row button:hover {
    border-color: rgba(102, 102, 102, 0.1);
    color: #1c1d38; }

.gedit-document-panel-group-row, .gedit-document-panel-group-row:hover {
  border-top: 1px solid #181931;
  background-color: #1b1c36; }

.gedit-document-panel-document-row:hover {
  background-color: #1c1d39; }

.gedit-document-panel-dragged-row {
  border: 1px solid rgba(102, 102, 102, 0.1);
  background-color: rgba(102, 102, 102, 0.5);
  color: #1c1d38; }

.gedit-document-panel-placeholder-row {
  border: 0;
  background-color: rgba(102, 102, 102, 0.08);
  transition: all 200ms ease-in; }

statusbar GeditSmallButton, GeditStatusMenuButton {
  text-shadow: none; }
  statusbar GeditSmallButton button, statusbar GeditSmallButton button.nautilus-circular-button.image-button, GeditStatusMenuButton button, GeditStatusMenuButton button.nautilus-circular-button.image-button {
    border-style: solid;
    border-width: 0 1px;
    border-color: transparent;
    border-radius: 0;
    padding: 1px 6px 2px 4px; }
    statusbar GeditSmallButton button:hover, statusbar GeditSmallButton button.nautilus-circular-button.image-button:hover, statusbar GeditSmallButton button:active, statusbar GeditSmallButton button.nautilus-circular-button.image-button:active, statusbar GeditSmallButton button:active:hover, GeditStatusMenuButton button:hover, GeditStatusMenuButton button.nautilus-circular-button.image-button:hover, GeditStatusMenuButton button:active, GeditStatusMenuButton button.nautilus-circular-button.image-button:active, GeditStatusMenuButton button:active:hover {
      border-color: #16162b; }
    statusbar GeditSmallButton button:active, statusbar GeditSmallButton button.nautilus-circular-button.image-button:active, GeditStatusMenuButton button:active, GeditStatusMenuButton button.nautilus-circular-button.image-button:active {
      background-color: #1a1b33;
      color: #ffffff; }

GeditViewFrame .gedit-search-slider {
  padding: 4px;
  border-radius: 0 0 8px 8px;
  border-width: 0 1px 1px;
  border-style: solid;
  border-color: #16162b;
  background-color: #1b1c36; }
  GeditViewFrame .gedit-search-slider .not-found {
    background-color: #af0000;
    background-image: none;
    color: #1b1c36; }

GeditFileBrowserWidget .toolbar {
  padding: 2px;
  border-top: 0;
  background-color: #1b1c36;
  background-image: none; }

.gedit-search-entry-occurrences-tag {
  margin: 2px;
  padding: 2px;
  color: mix(#c1c3cc,#1b1c36,0.5); }

.gedit-bottom-panel-paned,
.gedit-side-panel-paned,
paned.titlebar {
  margin-right: 0; }

.gedit-bottom-panel-paned notebook {
  border-top: 0; }

/************
 ! Nautilus *
*************/
.nautilus-desktop, .nautilus-desktop:backdrop, .nautilus-desktop *, .nautilus-desktop *:backdrop {
  color: #1c1d38;
  text-shadow: 1px 1px #666666; }
  .nautilus-desktop:active, .nautilus-desktop:backdrop:active, .nautilus-desktop *:active, .nautilus-desktop *:backdrop:active {
    color: #ffffff; }
  .nautilus-desktop:selected, .nautilus-desktop:backdrop:selected, .nautilus-desktop *:selected, .nautilus-desktop *:backdrop:selected {
    color: #ffffff; }
  .nautilus-desktop:active, .nautilus-desktop:hover, .nautilus-desktop:selected, .nautilus-desktop:backdrop:active, .nautilus-desktop:backdrop:hover, .nautilus-desktop:backdrop:selected, .nautilus-desktop *:active, .nautilus-desktop *:hover, .nautilus-desktop *:selected, .nautilus-desktop *:backdrop:active, .nautilus-desktop *:backdrop:hover, .nautilus-desktop *:backdrop:selected {
    text-shadow: none; }

.nautilus-window toolbar {
  border-width: 0 0 1px;
  border-style: solid;
  border-color: #16162b; }

.nautilus-window .sidebar {
  border: 0; }
  .nautilus-window .sidebar frame {
    border: 0; }

.nautilus-window notebook {
  background-color: #1b1c36;
  border: 0; }
  .nautilus-window notebook frame {
    border: 0; }

.nautilus-window .searchbar-container {
  margin-top: -1px; }
  .nautilus-window .searchbar-container searchbar {
    padding-top: 1px;
    padding-bottom: 2px;
    border-bottom: 1px solid mix(#1b1c36,#ffffff,0.18); }

.disk-space-display {
  border-style: solid;
  border-width: 1px; }
  .disk-space-display.unknown {
    background-color: rgba(255, 255, 255, 0.5);
    border-color: rgba(230, 230, 230, 0.5); }
  .disk-space-display.used {
    background-color: rgba(48, 54, 95, 0.8);
    border-color: rgba(43, 49, 86, 0.8); }
  .disk-space-display.free {
    background-color: #1a1b33;
    border-color: #17182e; }

.conflict-row.activatable, .conflict-row.activatable:active {
  color: #1b1c36;
  background-color: #af0000; }

.conflict-row.activatable:hover {
  background-color: #c10000; }

.conflict-row.activatable:selected {
  color: #ffffff;
  background-color: #30365f; }

/********
 ! Nemo *
*********/
.nemo-desktop, .nemo-desktop:backdrop, .nemo-desktop *, .nemo-desktop *:backdrop {
  color: #1c1d38;
  text-shadow: 1px 1px #666666; }
  .nemo-desktop:active, .nemo-desktop:backdrop:active, .nemo-desktop *:active, .nemo-desktop *:backdrop:active {
    color: #ffffff; }
  .nemo-desktop:selected, .nemo-desktop:backdrop:selected, .nemo-desktop *:selected, .nemo-desktop *:backdrop:selected {
    color: #ffffff; }
  .nemo-desktop:active, .nemo-desktop:hover, .nemo-desktop:selected, .nemo-desktop:backdrop:active, .nemo-desktop:backdrop:hover, .nemo-desktop:backdrop:selected, .nemo-desktop *:active, .nemo-desktop *:hover, .nemo-desktop *:selected, .nemo-desktop *:backdrop:active, .nemo-desktop *:backdrop:hover, .nemo-desktop *:backdrop:selected {
    text-shadow: none; }

.nemo-window {
  /* Status Bar */ }
  .nemo-window .nemo-inactive-pane .view, .nemo-window .nemo-inactive-pane iconview {
    background-color: mix(#1b1c36,#c1c3cc,0.12);
    color: #c1c3cc; }
  .nemo-window toolbar {
    border-width: 0 0 1px;
    border-style: solid;
    border-color: #16162b;
    /* Path Bar */ }
    .nemo-window toolbar separator, .nemo-window toolbar separator:disabled {
      color: mix(#1b1c36,#ffffff,0.88);
      border-color: currentColor;
      -GtkWidget-window-dragging: true; }
    .nemo-window toolbar.primary-toolbar button.image-button {
      padding: 0 9px; }
    .nemo-window toolbar combobox, .nemo-window toolbar button, .nemo-window toolbar button.nautilus-circular-button.image-button {
      padding: 4px; }
      .nemo-window toolbar combobox.text-button, .nemo-window toolbar button.text-button {
        padding: 4px; }
      .nemo-window toolbar combobox.image-button, .nemo-window toolbar button.image-button {
        padding: 4px; }
    .nemo-window toolbar toolitem stack {
      margin-left: 15px; }
      .nemo-window toolbar toolitem stack widget button, .nemo-window toolbar toolitem stack widget button.nautilus-circular-button.image-button {
        box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22);
        -NemoPathbarButton-border-radius: 8px; }
        .nemo-window toolbar toolitem stack widget button:focus, .nemo-window toolbar toolitem stack widget button:hover {
          box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
        .nemo-window toolbar toolitem stack widget button:active, .nemo-window toolbar toolitem stack widget button:active:hover, .nemo-window toolbar toolitem stack widget button:active:focus, .nemo-window toolbar toolitem stack widget button:active:hover:focus, .nemo-window toolbar toolitem stack widget button:checked, .nemo-window toolbar toolitem stack widget button:checked:hover, .nemo-window toolbar toolitem stack widget button:checked:focus, .nemo-window toolbar toolitem stack widget button:checked:hover:focus {
          box-shadow: inset 0 1px rgba(51, 51, 51, 0.07), inset 0 -1px rgba(51, 51, 51, 0.05); }
        .nemo-window toolbar toolitem stack widget button:disabled {
          box-shadow: inset -1px 0 #16162b; }
        .nemo-window toolbar toolitem stack widget button:last-child, .nemo-window toolbar toolitem stack widget button:only-child {
          box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22); }
        .nemo-window toolbar toolitem stack widget button:last-child:hover, .nemo-window toolbar toolitem stack widget button:only-child:hover {
          box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
        .nemo-window toolbar toolitem stack widget button:disabled:last-child, .nemo-window toolbar toolitem stack widget button:disabled:only-child, .nemo-window toolbar toolitem stack widget button:active:disabled:last-child, .nemo-window toolbar toolitem stack widget button:active:disabled:only-child, .nemo-window toolbar toolitem stack widget button:checked:disabled:last-child, .nemo-window toolbar toolitem stack widget button:checked:disabled:only-child {
          box-shadow: none; }
        .nemo-window toolbar toolitem stack widget button:active:last-child, .nemo-window toolbar toolitem stack widget button:active:last-child:focus, .nemo-window toolbar toolitem stack widget button:active:last-child:hover, .nemo-window toolbar toolitem stack widget button:active:last-child:hover:focus, .nemo-window toolbar toolitem stack widget button:checked:last-child, .nemo-window toolbar toolitem stack widget button:checked:last-child:focus, .nemo-window toolbar toolitem stack widget button:checked:last-child:hover, .nemo-window toolbar toolitem stack widget button:checked:last-child:hover:focus {
          box-shadow: inset 0 1px rgba(51, 51, 51, 0.07), inset -1px 0 rgba(51, 51, 51, 0.06); }
        .nemo-window toolbar toolitem stack widget button:active:only-child, .nemo-window toolbar toolitem stack widget button:active:only-child:focus, .nemo-window toolbar toolitem stack widget button:active:only-child:hover, .nemo-window toolbar toolitem stack widget button:active:only-child:hover:focus, .nemo-window toolbar toolitem stack widget button:checked:only-child, .nemo-window toolbar toolitem stack widget button:checked:only-child:focus, .nemo-window toolbar toolitem stack widget button:checked:only-child:hover, .nemo-window toolbar toolitem stack widget button:checked:only-child:hover:focus {
          box-shadow: inset 1px 0 rgba(51, 51, 51, 0.06), inset 0 1px rgba(51, 51, 51, 0.07), inset -1px 0 rgba(51, 51, 51, 0.06); }
  .nemo-window grid > widget:last-child button {
    min-height: 16px;
    min-width: 16px;
    padding: 3px 6px; }
  .nemo-window grid > widget:last-child button:first-child + button {
    margin-right: 72px; }
  .nemo-window grid > widget:last-child > box > scale {
    margin-right: 12px; }
  .nemo-window grid > widget:last-child statusbar {
    border: 0; }
  .nemo-window .sidebar {
    /* Nemo Query Editor (File Search Bar) */ }
    .nemo-window .sidebar .frame {
      border: 0; }
    .nemo-window .sidebar image {
      padding-left: 4px;
      padding-right: 4px; }
    .nemo-window .sidebar .nemo-places-sidebar, .nemo-window .sidebar .nemo-places-sidebar .view, .nemo-window .sidebar .nemo-places-sidebar iconview {
      background-color: mix(#1b1c36,#1b1c36,0.5); }
    .nemo-window .sidebar .nemo-places-sidebar .view, .nemo-window .sidebar .nemo-places-sidebar iconview {
      -NemoPlacesTreeView-disk-full-bg-color: #16162b;
      -NemoPlacesTreeView-disk-full-fg-color: #30365f;
      -NemoPlacesTreeView-disk-full-bar-width: 2px;
      -NemoPlacesTreeView-disk-full-bar-radius: 1px;
      -NemoPlacesTreeView-disk-full-bottom-padding: 0;
      -NemoPlacesTreeView-disk-full-max-length: 75px; }
      .nemo-window .sidebar .nemo-places-sidebar .view:selected, .nemo-window .sidebar .nemo-places-sidebar iconview:selected {
        -NemoPlacesTreeView-disk-full-bg-color: #ffffff;
        -NemoPlacesTreeView-disk-full-fg-color: #3a4172; }
    .nemo-window .sidebar + separator + box .primary-toolbar {
      background-color: #1a1b35;
      background-image: none;
      padding-top: 1px;
      padding-bottom: 1px;
      border-bottom: 1px solid mix(#1b1c36,#ffffff,0.18); }
      .nemo-window .sidebar + separator + box .primary-toolbar button:nth-child(2), .nemo-window .sidebar + separator + box .primary-toolbar button.nautilus-circular-button.image-button:nth-child(2) {
        border-right: 0;
        border-top-right-radius: 0;
        border-bottom-right-radius: 0; }
      .nemo-window .sidebar + separator + box .primary-toolbar button:nth-child(3), .nemo-window .sidebar + separator + box .primary-toolbar button.nautilus-circular-button.image-button:nth-child(3) {
        margin-left: -6px;
        border-left: 0;
        border-top-left-radius: 0;
        border-bottom-left-radius: 0; }
      .nemo-window .sidebar + separator + box .primary-toolbar button.flat, .nemo-window .sidebar + separator + box .primary-toolbar button.flat.nautilus-circular-button.image-button {
        background-color: #1b1c36;
        background-image: none;
        color: #ffffff;
        box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22);
        padding: 5px 6px; }
  .nemo-window notebook {
    background-color: #1b1c36;
    border-width: 0; }
    .nemo-window notebook tabs {
      border: 0; }

/***********************
 ! Fallback mode panel *
************************/
/************
 ! Synaptic *
*************/
GtkWindow > GtkVBox > .dock, GtkWindow > GtkVBox > .dock > GtkHBox > GtkToolbar {
  background-color: #1b1c36;
  background-image: none;
  padding: 4px;
  border: 0;
  color: #ffffff; }

/***********************
 ! Fallback mode panel *
************************/
/***************
 ! Xfce styles *
****************/
.XfceHeading {
  margin: 0;
  padding: 0;
  border: 0;
  background-image: none;
  background-color: #1b1c36;
  color: #c1c3cc; }

.xfce4-panel {
  font: inherit; }
  .xfce4-panel menu {
    -gtk-icon-effect: none;
    text-shadow: none; }

/***********************
 ! Fallback mode panel *
************************/
/****************
 ! Unity styles *
*****************/
UnityDecoration {
  -UnityDecoration-extents: 24px 1px 1px 1px;
  -UnityDecoration-input-extents: 10px;
  -UnityDecoration-shadow-offset-x: 1px;
  -UnityDecoration-shadow-offset-y: 1px;
  -UnityDecoration-active-shadow-color: rgba(102, 102, 102, 0.3);
  -UnityDecoration-active-shadow-radius: 8px;
  -UnityDecoration-inactive-shadow-color: rgba(102, 102, 102, 0.5);
  -UnityDecoration-inactive-shadow-radius: 5px;
  -UnityDecoration-glow-size: 10px;
  -UnityDecoration-glow-color: #30365f;
  -UnityDecoration-title-indent: 10px;
  -UnityDecoration-title-fade: 35px;
  -UnityDecoration-title-alignment: 0; }
  UnityDecoration .top {
    border: 1px solid #00a3cc;
    border-bottom: 0;
    border-radius: 8px 8px 0 0;
    padding: 1px 7px 0;
    background-color: #16172d;
    color: #ffffff;
    text-shadow: none; }
    UnityDecoration .top:hover {
      border-radius: 0;
      border-color: mix(#16172d,#ffffff,0.21);
      background-color: mix(#16172d,#ffffff,0.21);
      background-image: none;
      color: white; }
    UnityDecoration .top:backdrop {
      border: 1px solid #16172d;
      color: mix(#ffffff,#1b1c36,0.4); }
  UnityDecoration .left, UnityDecoration .right, UnityDecoration .bottom {
    background-color: #16172d; }
    UnityDecoration .left:backdrop, UnityDecoration .right:backdrop, UnityDecoration .bottom:backdrop {
      background-color: mix(#131426,mix(#ffffff,#1b1c36,0.4),0.21); }

UnityPanelWidget, .unity-panel {
  border: 0; }

.unity-panel.menuitem, .unity-panel .menuitem {
  border-width: 0 1px;
  color: #ffffff; }
  .unity-panel.menuitem:hover, .unity-panel.menuitem *:hover, .unity-panel .menuitem:hover, .unity-panel .menuitem *:hover {
    border-color: mix(#16172d,#ffffff,0.21);
    background-color: mix(#16172d,#ffffff,0.21);
    background-image: none;
    color: white; }

SheetStyleDialog.unity-force-quit {
  background-color: #1b1c36; }

/************************
 ! Unity-Control-Center *
*************************/
.background:not(.csd):not(.solid-csd) > box.vertical > notebook.frame {
  border: 0 none transparent; }
  .background:not(.csd):not(.solid-csd) > box.vertical > notebook.frame > stack > scrolledwindow > viewport > box.vertical > frame > box.vertical iconview.view, .background:not(.csd):not(.solid-csd) > box.vertical > notebook.frame > stack > scrolledwindow > viewport > box.vertical > frame > box.vertical iconview, .background:not(.csd):not(.solid-csd) > box.vertical > notebook.frame > stack > scrolledwindow > viewport > box.vertical > frame > box.vertical iconview.view:backdrop {
    background-color: transparent; }

/***********************
 ! LightDM GTK Greeter *
 ***********************/
#panel_window {
  background-color: #16172d;
  background-image: none;
  color: #ffffff;
  font-weight: bold;
  text-shadow: 0 1px rgba(102, 102, 102, 0.5);
  -gtk-icon-shadow: 0 1px rgba(102, 102, 102, 0.5); }
  #panel_window menubar {
    padding-left: 4px; }
    #panel_window menubar, #panel_window menubar > menuitem {
      background-color: transparent;
      background-image: none;
      border-style: none;
      color: #ffffff;
      text-shadow: 0 1px rgba(102, 102, 102, 0.5);
      -gtk-icon-shadow: 0 1px rgba(102, 102, 102, 0.5); }
      #panel_window menubar:hover, #panel_window menubar > menuitem:hover {
        background-color: rgba(255, 255, 255, 0.2);
        background-image: none;
        color: #ffffff; }
      #panel_window menubar *:hover, #panel_window menubar > menuitem *:hover {
        color: #ffffff; }
      #panel_window menubar:disabled, #panel_window menubar > menuitem:disabled {
        color: rgba(255, 255, 255, 0.7); }
    #panel_window menubar menu > menuitem {
      font-weight: normal; }

#content_frame {
  padding-bottom: 12px; }

#login_window, #shutdown_dialog, #restart_dialog {
  border-style: none;
  border-radius: 8px;
  background-color: #16172d;
  color: #ffffff;
  /* draw border using box-shadow */
  box-shadow: inset 1px 0 mix(#0f1020,#ffffff,0.21), inset -1px 0 mix(#0f1020,#ffffff,0.21), inset 0 1px mix(#0f1020,#ffffff,0.21), inset 0 -1px mix(#0f1020,#ffffff,0.21); }

#login_window menu {
  border-radius: 0; }

#login_window button {
  background-color: #30365f;
  background-image: none;
  border-color: rgba(157, 173, 193, 0.22);
  color: #d3dae3;
  box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22); }
  #login_window button:focus, #login_window button:hover {
    border-color: mix(#30365f,rgba(211, 218, 227, 0.22),0.3); }
  #login_window button:active, #login_window button:active:hover, #login_window button:active:focus, #login_window button:active:hover:focus, #login_window button:checked, #login_window button:checked:hover, #login_window button:checked:focus, #login_window button:checked:hover:focus {
    border-color: rgba(131, 150, 176, 0.22); }
  #login_window button:disabled {
    border-color: rgba(171, 184, 201, 0.22); }
  #login_window button:active:disabled, #login_window button:checked:disabled {
    border-color: rgba(157, 173, 193, 0.22); }
  .linked:not(.vertical) > #login_window button:not(:last-child):not(:only-child), .linked:not(.vertical) > :not(:last-child):not(:only-child) #login_window button, viewswitcher:not(.vertical) > #login_window button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > #login_window button:not(:last-child):not(:only-child) {
    border-right-style: none; }
    .linked:not(.vertical) > #login_window button:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) #login_window button:hover, viewswitcher:not(.vertical) > #login_window button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > #login_window button:not(:last-child):not(:only-child):hover {
      border-color: mix(#30365f,rgba(211, 218, 227, 0.36),0.3);
      border-right-style: none;
      box-shadow: inset-1px 0 0 mix(#30365f,rgba(211, 218, 227, 0.36),0.3); }
  .linked:not(.vertical) > #login_window button:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > :not(:last-child):not(:only-child) #login_window button:checked, viewswitcher:not(.vertical) > #login_window button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > #login_window button:not(:last-child):not(:only-child):checked {
    border-right-style: none; }
    .linked:not(.vertical) > #login_window button:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) #login_window button:checked:hover, viewswitcher:not(.vertical) > #login_window button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > #login_window button:not(:last-child):not(:only-child):checked:hover {
      border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
      border-right-style: none;
      box-shadow: inset-1px 0 0 mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
  .linked.vertical > #login_window button:not(:last-child):not(:only-child), .linked.vertical > :not(:last-child):not(:only-child) #login_window button, stackswitcher.vertical > #login_window button:not(:last-child):not(:only-child) {
    border-bottom-style: none; }
    .linked.vertical > #login_window button:not(:last-child):not(:only-child):hover, .linked.vertical > :not(:last-child):not(:only-child) #login_window button:hover, stackswitcher.vertical > #login_window button:not(:last-child):not(:only-child):hover {
      border-color: mix(#30365f,rgba(211, 218, 227, 0.36),0.3);
      border-bottom-style: none;
      box-shadow: inset 0 -1px mix(#30365f,rgba(211, 218, 227, 0.36),0.3); }
  .linked.vertical > #login_window button:not(:last-child):not(:only-child):checked, .linked.vertical > :not(:last-child):not(:only-child) #login_window button:checked, stackswitcher.vertical > #login_window button:not(:last-child):not(:only-child):checked {
    border-bottom-style: none; }
    .linked.vertical > #login_window button:not(:last-child):not(:only-child):checked:hover, .linked.vertical > :not(:last-child):not(:only-child) #login_window button:checked:hover, stackswitcher.vertical > #login_window button:not(:last-child):not(:only-child):checked:hover {
      border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
      border-bottom-style: none;
      box-shadow: inset 0 -1px mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
  #login_window button.flat {
    color: #d3dae3;
    border-color: rgba(48, 54, 95, 0);
    background-color: rgba(48, 54, 95, 0);
    background-image: none;
    box-shadow: none; }
  #login_window button:hover, #login_window button.flat:hover {
    background-color: #323964;
    background-image: none;
    border-color: rgba(157, 173, 193, 0.3);
    color: #d3dae3;
    box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.32); }
    #login_window button:hover:focus, #login_window button:hover:hover, #login_window button.flat:hover:focus, #login_window button.flat:hover:hover {
      border-color: mix(#30365f,rgba(211, 218, 227, 0.3),0.3); }
    #login_window button:hover:active, #login_window button:hover:active:focus, #login_window button.flat:hover:active:focus, #login_window button:hover:checked, #login_window button:hover:checked:focus, #login_window button.flat:hover:checked:focus, #login_window button.flat:hover:active, #login_window button.flat:hover:active:hover:focus, #login_window button.flat:hover:checked, #login_window button.flat:hover:checked:hover:focus {
      border-color: rgba(131, 150, 176, 0.3); }
    #login_window button:hover:disabled, #login_window button.flat:hover:disabled {
      border-color: rgba(171, 184, 201, 0.3); }
    #login_window button:hover:active:disabled, #login_window button:hover:checked:disabled, #login_window button.flat:hover:active:disabled, #login_window button.flat:hover:checked:disabled {
      border-color: rgba(157, 173, 193, 0.3); }
  #login_window button:focus, #login_window button.flat:focus {
    background-color: #323964;
    background-image: none;
    border-color: rgba(211, 218, 227, 0.22);
    outline-color: rgba(48, 54, 95, 0.5);
    outline-width: 3px;
    outline-style: solid;
    outline-offset: 10px;
    color: #d3dae3;
    box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
    #login_window button:focus:hover, #login_window button.flat:focus:hover {
      background-color: #353b69;
      background-image: none;
      border-color: rgba(157, 173, 193, 0.3);
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.48); }
      #login_window button:focus:hover:hover, #login_window button.flat:focus:hover:hover {
        border-color: mix(#30365f,rgba(211, 218, 227, 0.3),0.3); }
      #login_window button:focus:hover:active, #login_window button.flat:focus:hover:active, #login_window button.flat:focus:hover:active:focus, #login_window button:focus:hover:checked, #login_window button.flat:focus:hover:checked, #login_window button.flat:focus:hover:checked:focus, #login_window button.flat:focus:hover:active:hover:focus, #login_window button.flat:focus:hover:checked:hover:focus {
        border-color: rgba(131, 150, 176, 0.3); }
      #login_window button:focus:hover:disabled, #login_window button.flat:focus:hover:disabled {
        border-color: rgba(171, 184, 201, 0.3); }
      #login_window button:focus:hover:active:disabled, #login_window button:focus:hover:checked:disabled, #login_window button.flat:focus:hover:active:disabled, #login_window button.flat:focus:hover:checked:disabled {
        border-color: rgba(157, 173, 193, 0.3); }
  #login_window button:checked, #login_window button:active, #login_window button.flat:checked, #login_window button.flat:active {
    /*@include linear-gradient(shade($bg, .7), to top);*/
    background-color: #30365f;
    background-image: none;
    border-color: rgba(157, 173, 193, 0.22);
    color: #ffffff;
    box-shadow: inset 1px 0 rgba(211, 218, 227, 0.06), inset 0 1px rgba(211, 218, 227, 0.07), inset -1px 0 rgba(211, 218, 227, 0.06), inset 0 -1px rgba(211, 218, 227, 0.05); }
    #login_window button:checked:focus, #login_window button:checked:hover, #login_window button:active:focus, #login_window button:active:hover, #login_window button.flat:checked:focus, #login_window button.flat:checked:hover, #login_window button.flat:active:focus, #login_window button.flat:active:hover {
      border-color: mix(#30365f,rgba(211, 218, 227, 0.22),0.3); }
    #login_window button:active:checked, #login_window button:active:checked:hover, #login_window button:active:checked:focus, #login_window button:active:checked:hover:focus, #login_window button.flat:active:checked, #login_window button.flat:active:checked:hover, #login_window button.flat:active:checked:focus, #login_window button.flat:active:checked:hover:focus {
      border-color: rgba(131, 150, 176, 0.22); }
    #login_window button:checked:disabled, #login_window button:active:disabled, #login_window button.flat:checked:disabled, #login_window button.flat:active:disabled {
      border-color: rgba(171, 184, 201, 0.22); }
    #login_window button:active:checked:disabled, #login_window button.flat:active:checked:disabled {
      border-color: rgba(157, 173, 193, 0.22); }
    #login_window button:checked:focus, #login_window button:checked:hover, #login_window button:active:focus, #login_window button:active:hover, #login_window button.flat:checked:focus, #login_window button.flat:checked:hover, #login_window button.flat:active:focus, #login_window button.flat:active:hover {
      /*@include linear-gradient(shade($bg, .65), to top);*/
      background-color: #323964;
      background-image: none;
      color: #ffffff; }
  #login_window button:focus, #login_window button:hover, #login_window button.flat:focus, #login_window button.flat:hover {
    color: #d3dae3; }
  #login_window button:disabled:disabled, #login_window button.flat:disabled:disabled {
    background-color: alpha(mix(#30365f,#d3dae3,0.2),0.4);
    background-image: none;
    /*border: 1px solid alpha($bg, .2);*/
    opacity: .6;
    color: mix(#30365f,#d3dae3,0.6);
    box-shadow: none; }
    #login_window button:disabled:disabled :disabled, #login_window button.flat:disabled:disabled :disabled {
      color: mix(#30365f,#d3dae3,0.6); }
  #login_window button:active:disabled, #login_window button:checked:disabled, #login_window button.flat:active:disabled, #login_window button.flat:checked:disabled {
    background-color: rgba(48, 54, 95, 0.6);
    background-image: none;
    color: rgba(255, 255, 255, 0.85);
    box-shadow: none; }
    #login_window button:active:disabled :disabled, #login_window button:checked:disabled :disabled, #login_window button.flat:active:disabled :disabled, #login_window button.flat:checked:disabled :disabled {
      color: rgba(255, 255, 255, 0.85); }
  #login_window button:backdrop, #login_window button.flat:backdrop {
    color: mix(#ffffff,mix(#ffffff,#1b1c36,0.5),0.8); }
  #login_window button.separator, #login_window button .separator {
    border: 1px solid currentColor;
    color: rgba(48, 54, 95, 0.9); }
    #login_window button.separator:disabled, #login_window button .separator:disabled {
      color: rgba(48, 54, 95, 0.85); }
  #login_window button separator {
    background-image: image(mix(#d3dae3,#30365f,0.9)); }

#login_window entry {
  background-color: #16172d;
  background-image: none;
  border-color: mix(#ffffff,#16172d,0.8);
  padding: 6px 6.2857142857px;
  color: #ffffff;
  caret-color: #c1c3cc;
  -gtk-secondary-caret-color: #ff0007; }
  #login_window entry:focus, #login_window entry:hover {
    border-color: mix(#30365f,mix(#ffffff,#16172d,0.7),0.3); }
  #login_window entry:active, #login_window entry:active:hover, #login_window entry:active:focus, #login_window entry:active:hover:focus, #login_window entry:checked, #login_window entry:checked:hover, #login_window entry:checked:focus, #login_window entry:checked:hover:focus {
    border-color: mix(#ffffff,#16172d,0.32); }
  #login_window entry:disabled {
    border-color: mix(#ffffff,#16172d,0.84); }
  #login_window entry:active:disabled, #login_window entry:checked:disabled {
    border-color: mix(#ffffff,#16172d,0.8); }
  #login_window entry:focus, #login_window entry:active {
    border-color: mix(#30365f,mix(#1b1c36,#ffffff,0.18),0.3); }
  #login_window entry:disabled {
    background-color: mix(#16172d,#ffffff,0.07);
    background-image: none;
    opacity: .9;
    color: mix(#16172d,#ffffff,0.9); }

#user_combobox {
  color: #ffffff;
  font-size: 18px; }
  #user_combobox menu {
    font-weight: normal; }
  #user_combobox arrow {
    color: mix(#ffffff,#16172d,0.5); }

#user_image {
  border-radius: 8px;
  /* draw border using box-shadow */
  box-shadow: inset 1px 0 #0f1020, inset -1px 0 #0f1020, inset 0 1px #0f1020, inset 0 -1px #0f1020; }

#user_image_border {
  border-radius: 8px;
  background-color: #141529;
  background-image: none;
  box-shadow: inset 1px 0 rgba(51, 51, 51, 0.07), inset 0 1px rgba(51, 51, 51, 0.08), inset -1px 0 rgba(51, 51, 51, 0.07), inset 0 -1px rgba(51, 51, 51, 0.05); }

#buttonbox_frame {
  padding-top: 8px;
  padding-bottom: 0;
  border-style: none;
  border-bottom-left-radius: 8px;
  border-bottom-right-radius: 8px;
  background-color: transparent;
  background-image: none;
  box-shadow: none; }

/* shutdown button */
#shutdown_button button {
  background-color: #af0000;
  background-image: none;
  border-color: rgba(22, 22, 43, 0.32);
  color: #1b1c36;
  box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22); }
  #shutdown_button button:focus, #shutdown_button button:hover {
    border-color: mix(#30365f,rgba(27, 28, 54, 0.32),0.3); }
  #shutdown_button button:active, #shutdown_button button:active:hover, #shutdown_button button:active:focus, #shutdown_button button:active:hover:focus, #shutdown_button button:checked, #shutdown_button button:checked:hover, #shutdown_button button:checked:focus, #shutdown_button button:checked:hover:focus {
    border-color: rgba(19, 20, 38, 0.32); }
  #shutdown_button button:disabled {
    border-color: rgba(23, 24, 46, 0.32); }
  #shutdown_button button:active:disabled, #shutdown_button button:checked:disabled {
    border-color: rgba(22, 22, 43, 0.32); }
  .linked:not(.vertical) > #shutdown_button button:not(:last-child):not(:only-child), .linked:not(.vertical) > :not(:last-child):not(:only-child) #shutdown_button button, viewswitcher:not(.vertical) > #shutdown_button button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > #shutdown_button button:not(:last-child):not(:only-child) {
    border-right-style: none; }
    .linked:not(.vertical) > #shutdown_button button:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) #shutdown_button button:hover, viewswitcher:not(.vertical) > #shutdown_button button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > #shutdown_button button:not(:last-child):not(:only-child):hover {
      border-color: mix(#30365f,rgba(27, 28, 54, 0.36),0.3);
      border-right-style: none;
      box-shadow: inset-1px 0 0 mix(#30365f,rgba(27, 28, 54, 0.36),0.3); }
  .linked:not(.vertical) > #shutdown_button button:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > :not(:last-child):not(:only-child) #shutdown_button button:checked, viewswitcher:not(.vertical) > #shutdown_button button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > #shutdown_button button:not(:last-child):not(:only-child):checked {
    border-right-style: none; }
    .linked:not(.vertical) > #shutdown_button button:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) #shutdown_button button:checked:hover, viewswitcher:not(.vertical) > #shutdown_button button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > #shutdown_button button:not(:last-child):not(:only-child):checked:hover {
      border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
      border-right-style: none;
      box-shadow: inset-1px 0 0 mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
  .linked.vertical > #shutdown_button button:not(:last-child):not(:only-child), .linked.vertical > :not(:last-child):not(:only-child) #shutdown_button button, stackswitcher.vertical > #shutdown_button button:not(:last-child):not(:only-child) {
    border-bottom-style: none; }
    .linked.vertical > #shutdown_button button:not(:last-child):not(:only-child):hover, .linked.vertical > :not(:last-child):not(:only-child) #shutdown_button button:hover, stackswitcher.vertical > #shutdown_button button:not(:last-child):not(:only-child):hover {
      border-color: mix(#30365f,rgba(27, 28, 54, 0.36),0.3);
      border-bottom-style: none;
      box-shadow: inset 0 -1px mix(#30365f,rgba(27, 28, 54, 0.36),0.3); }
  .linked.vertical > #shutdown_button button:not(:last-child):not(:only-child):checked, .linked.vertical > :not(:last-child):not(:only-child) #shutdown_button button:checked, stackswitcher.vertical > #shutdown_button button:not(:last-child):not(:only-child):checked {
    border-bottom-style: none; }
    .linked.vertical > #shutdown_button button:not(:last-child):not(:only-child):checked:hover, .linked.vertical > :not(:last-child):not(:only-child) #shutdown_button button:checked:hover, stackswitcher.vertical > #shutdown_button button:not(:last-child):not(:only-child):checked:hover {
      border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
      border-bottom-style: none;
      box-shadow: inset 0 -1px mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
  #shutdown_button button.flat {
    color: #1b1c36;
    border-color: rgba(175, 0, 0, 0);
    background-color: rgba(175, 0, 0, 0);
    background-image: none;
    box-shadow: none; }
  #shutdown_button button:hover, #shutdown_button button.flat:hover {
    background-color: #b80000;
    background-image: none;
    border-color: rgba(22, 22, 43, 0.4);
    color: #1b1c36;
    box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.32); }
    #shutdown_button button:hover:focus, #shutdown_button button:hover:hover, #shutdown_button button.flat:hover:focus, #shutdown_button button.flat:hover:hover {
      border-color: mix(#30365f,rgba(27, 28, 54, 0.4),0.3); }
    #shutdown_button button:hover:active, #shutdown_button button:hover:active:focus, #shutdown_button button.flat:hover:active:focus, #shutdown_button button:hover:checked, #shutdown_button button:hover:checked:focus, #shutdown_button button.flat:hover:checked:focus, #shutdown_button button.flat:hover:active, #shutdown_button button.flat:hover:active:hover:focus, #shutdown_button button.flat:hover:checked, #shutdown_button button.flat:hover:checked:hover:focus {
      border-color: rgba(19, 20, 38, 0.4); }
    #shutdown_button button:hover:disabled, #shutdown_button button.flat:hover:disabled {
      border-color: rgba(23, 24, 46, 0.4); }
    #shutdown_button button:hover:active:disabled, #shutdown_button button:hover:checked:disabled, #shutdown_button button.flat:hover:active:disabled, #shutdown_button button.flat:hover:checked:disabled {
      border-color: rgba(22, 22, 43, 0.4); }
  #shutdown_button button:focus, #shutdown_button button.flat:focus {
    background-color: #b80000;
    background-image: none;
    border-color: rgba(27, 28, 54, 0.32);
    outline-color: rgba(48, 54, 95, 0.5);
    outline-width: 3px;
    outline-style: solid;
    outline-offset: 10px;
    color: #1b1c36;
    box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
    #shutdown_button button:focus:hover, #shutdown_button button.flat:focus:hover {
      background-color: #c10000;
      background-image: none;
      border-color: rgba(22, 22, 43, 0.4);
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.48); }
      #shutdown_button button:focus:hover:hover, #shutdown_button button.flat:focus:hover:hover {
        border-color: mix(#30365f,rgba(27, 28, 54, 0.4),0.3); }
      #shutdown_button button:focus:hover:active, #shutdown_button button.flat:focus:hover:active, #shutdown_button button.flat:focus:hover:active:focus, #shutdown_button button:focus:hover:checked, #shutdown_button button.flat:focus:hover:checked, #shutdown_button button.flat:focus:hover:checked:focus, #shutdown_button button.flat:focus:hover:active:hover:focus, #shutdown_button button.flat:focus:hover:checked:hover:focus {
        border-color: rgba(19, 20, 38, 0.4); }
      #shutdown_button button:focus:hover:disabled, #shutdown_button button.flat:focus:hover:disabled {
        border-color: rgba(23, 24, 46, 0.4); }
      #shutdown_button button:focus:hover:active:disabled, #shutdown_button button:focus:hover:checked:disabled, #shutdown_button button.flat:focus:hover:active:disabled, #shutdown_button button.flat:focus:hover:checked:disabled {
        border-color: rgba(22, 22, 43, 0.4); }
  #shutdown_button button:checked, #shutdown_button button:active, #shutdown_button button.flat:checked, #shutdown_button button.flat:active {
    /*@include linear-gradient(shade($bg, .7), to top);*/
    background-color: #30365f;
    background-image: none;
    border-color: rgba(22, 22, 43, 0.32);
    color: #ffffff;
    box-shadow: inset 1px 0 rgba(27, 28, 54, 0.06), inset 0 1px rgba(27, 28, 54, 0.07), inset -1px 0 rgba(27, 28, 54, 0.06), inset 0 -1px rgba(27, 28, 54, 0.05); }
    #shutdown_button button:checked:focus, #shutdown_button button:checked:hover, #shutdown_button button:active:focus, #shutdown_button button:active:hover, #shutdown_button button.flat:checked:focus, #shutdown_button button.flat:checked:hover, #shutdown_button button.flat:active:focus, #shutdown_button button.flat:active:hover {
      border-color: mix(#30365f,rgba(27, 28, 54, 0.32),0.3); }
    #shutdown_button button:active:checked, #shutdown_button button:active:checked:hover, #shutdown_button button:active:checked:focus, #shutdown_button button:active:checked:hover:focus, #shutdown_button button.flat:active:checked, #shutdown_button button.flat:active:checked:hover, #shutdown_button button.flat:active:checked:focus, #shutdown_button button.flat:active:checked:hover:focus {
      border-color: rgba(19, 20, 38, 0.32); }
    #shutdown_button button:checked:disabled, #shutdown_button button:active:disabled, #shutdown_button button.flat:checked:disabled, #shutdown_button button.flat:active:disabled {
      border-color: rgba(23, 24, 46, 0.32); }
    #shutdown_button button:active:checked:disabled, #shutdown_button button.flat:active:checked:disabled {
      border-color: rgba(22, 22, 43, 0.32); }
    #shutdown_button button:checked:focus, #shutdown_button button:checked:hover, #shutdown_button button:active:focus, #shutdown_button button:active:hover, #shutdown_button button.flat:checked:focus, #shutdown_button button.flat:checked:hover, #shutdown_button button.flat:active:focus, #shutdown_button button.flat:active:hover {
      /*@include linear-gradient(shade($bg, .65), to top);*/
      background-color: #323964;
      background-image: none;
      color: #ffffff; }
  #shutdown_button button:focus, #shutdown_button button:hover, #shutdown_button button.flat:focus, #shutdown_button button.flat:hover {
    color: #1b1c36; }
  #shutdown_button button:disabled:disabled, #shutdown_button button.flat:disabled:disabled {
    background-color: alpha(mix(#af0000,#1b1c36,0.2),0.4);
    background-image: none;
    /*border: 1px solid alpha($bg, .2);*/
    opacity: .6;
    color: mix(#af0000,#1b1c36,0.6);
    box-shadow: none; }
    #shutdown_button button:disabled:disabled :disabled, #shutdown_button button.flat:disabled:disabled :disabled {
      color: mix(#af0000,#1b1c36,0.6); }
  #shutdown_button button:active:disabled, #shutdown_button button:checked:disabled, #shutdown_button button.flat:active:disabled, #shutdown_button button.flat:checked:disabled {
    background-color: rgba(48, 54, 95, 0.6);
    background-image: none;
    color: rgba(255, 255, 255, 0.85);
    box-shadow: none; }
    #shutdown_button button:active:disabled :disabled, #shutdown_button button:checked:disabled :disabled, #shutdown_button button.flat:active:disabled :disabled, #shutdown_button button.flat:checked:disabled :disabled {
      color: rgba(255, 255, 255, 0.85); }
  #shutdown_button button:backdrop, #shutdown_button button.flat:backdrop {
    color: mix(#ffffff,mix(#ffffff,#1b1c36,0.5),0.8); }
  #shutdown_button button.separator, #shutdown_button button .separator {
    border: 1px solid currentColor;
    color: rgba(175, 0, 0, 0.9); }
    #shutdown_button button.separator:disabled, #shutdown_button button .separator:disabled {
      color: rgba(175, 0, 0, 0.85); }
  #shutdown_button button separator {
    background-image: image(mix(#1b1c36,#af0000,0.9)); }

/* restart button */
#restart_button button {
  background-color: #afb500;
  background-image: none;
  border-color: rgba(22, 22, 43, 0.32);
  color: #1b1c36;
  box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.22); }
  #restart_button button:focus, #restart_button button:hover {
    border-color: mix(#30365f,rgba(27, 28, 54, 0.32),0.3); }
  #restart_button button:active, #restart_button button:active:hover, #restart_button button:active:focus, #restart_button button:active:hover:focus, #restart_button button:checked, #restart_button button:checked:hover, #restart_button button:checked:focus, #restart_button button:checked:hover:focus {
    border-color: rgba(19, 20, 38, 0.32); }
  #restart_button button:disabled {
    border-color: rgba(23, 24, 46, 0.32); }
  #restart_button button:active:disabled, #restart_button button:checked:disabled {
    border-color: rgba(22, 22, 43, 0.32); }
  .linked:not(.vertical) > #restart_button button:not(:last-child):not(:only-child), .linked:not(.vertical) > :not(:last-child):not(:only-child) #restart_button button, viewswitcher:not(.vertical) > #restart_button button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > #restart_button button:not(:last-child):not(:only-child) {
    border-right-style: none; }
    .linked:not(.vertical) > #restart_button button:not(:last-child):not(:only-child):hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) #restart_button button:hover, viewswitcher:not(.vertical) > #restart_button button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > #restart_button button:not(:last-child):not(:only-child):hover {
      border-color: mix(#30365f,rgba(27, 28, 54, 0.36),0.3);
      border-right-style: none;
      box-shadow: inset-1px 0 0 mix(#30365f,rgba(27, 28, 54, 0.36),0.3); }
  .linked:not(.vertical) > #restart_button button:not(:last-child):not(:only-child):checked, .linked:not(.vertical) > :not(:last-child):not(:only-child) #restart_button button:checked, viewswitcher:not(.vertical) > #restart_button button:not(:last-child):not(:only-child), stackswitcher:not(.vertical) > #restart_button button:not(:last-child):not(:only-child):checked {
    border-right-style: none; }
    .linked:not(.vertical) > #restart_button button:not(:last-child):not(:only-child):checked:hover, .linked:not(.vertical) > :not(:last-child):not(:only-child) #restart_button button:checked:hover, viewswitcher:not(.vertical) > #restart_button button:not(:last-child):not(:only-child):hover, stackswitcher:not(.vertical) > #restart_button button:not(:last-child):not(:only-child):checked:hover {
      border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
      border-right-style: none;
      box-shadow: inset-1px 0 0 mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
  .linked.vertical > #restart_button button:not(:last-child):not(:only-child), .linked.vertical > :not(:last-child):not(:only-child) #restart_button button, stackswitcher.vertical > #restart_button button:not(:last-child):not(:only-child) {
    border-bottom-style: none; }
    .linked.vertical > #restart_button button:not(:last-child):not(:only-child):hover, .linked.vertical > :not(:last-child):not(:only-child) #restart_button button:hover, stackswitcher.vertical > #restart_button button:not(:last-child):not(:only-child):hover {
      border-color: mix(#30365f,rgba(27, 28, 54, 0.36),0.3);
      border-bottom-style: none;
      box-shadow: inset 0 -1px mix(#30365f,rgba(27, 28, 54, 0.36),0.3); }
  .linked.vertical > #restart_button button:not(:last-child):not(:only-child):checked, .linked.vertical > :not(:last-child):not(:only-child) #restart_button button:checked, stackswitcher.vertical > #restart_button button:not(:last-child):not(:only-child):checked {
    border-bottom-style: none; }
    .linked.vertical > #restart_button button:not(:last-child):not(:only-child):checked:hover, .linked.vertical > :not(:last-child):not(:only-child) #restart_button button:checked:hover, stackswitcher.vertical > #restart_button button:not(:last-child):not(:only-child):checked:hover {
      border-color: mix(#30365f,rgba(48, 54, 95, 0.36),0.3);
      border-bottom-style: none;
      box-shadow: inset 0 -1px mix(#30365f,rgba(48, 54, 95, 0.36),0.3); }
  #restart_button button.flat {
    color: #1b1c36;
    border-color: rgba(175, 181, 0, 0);
    background-color: rgba(175, 181, 0, 0);
    background-image: none;
    box-shadow: none; }
  #restart_button button:hover, #restart_button button.flat:hover {
    background-color: #b8be00;
    background-image: none;
    border-color: rgba(22, 22, 43, 0.4);
    color: #1b1c36;
    box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.32); }
    #restart_button button:hover:focus, #restart_button button:hover:hover, #restart_button button.flat:hover:focus, #restart_button button.flat:hover:hover {
      border-color: mix(#30365f,rgba(27, 28, 54, 0.4),0.3); }
    #restart_button button:hover:active, #restart_button button:hover:active:focus, #restart_button button.flat:hover:active:focus, #restart_button button:hover:checked, #restart_button button:hover:checked:focus, #restart_button button.flat:hover:checked:focus, #restart_button button.flat:hover:active, #restart_button button.flat:hover:active:hover:focus, #restart_button button.flat:hover:checked, #restart_button button.flat:hover:checked:hover:focus {
      border-color: rgba(19, 20, 38, 0.4); }
    #restart_button button:hover:disabled, #restart_button button.flat:hover:disabled {
      border-color: rgba(23, 24, 46, 0.4); }
    #restart_button button:hover:active:disabled, #restart_button button:hover:checked:disabled, #restart_button button.flat:hover:active:disabled, #restart_button button.flat:hover:checked:disabled {
      border-color: rgba(22, 22, 43, 0.4); }
  #restart_button button:focus, #restart_button button.flat:focus {
    background-color: #b8be00;
    background-image: none;
    border-color: rgba(27, 28, 54, 0.32);
    outline-color: rgba(48, 54, 95, 0.5);
    outline-width: 3px;
    outline-style: solid;
    outline-offset: 10px;
    color: #1b1c36;
    box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.42); }
    #restart_button button:focus:hover, #restart_button button.flat:focus:hover {
      background-color: #c1c700;
      background-image: none;
      border-color: rgba(22, 22, 43, 0.4);
      box-shadow: 0 1px 2px -1px rgba(51, 51, 51, 0.48); }
      #restart_button button:focus:hover:hover, #restart_button button.flat:focus:hover:hover {
        border-color: mix(#30365f,rgba(27, 28, 54, 0.4),0.3); }
      #restart_button button:focus:hover:active, #restart_button button.flat:focus:hover:active, #restart_button button.flat:focus:hover:active:focus, #restart_button button:focus:hover:checked, #restart_button button.flat:focus:hover:checked, #restart_button button.flat:focus:hover:checked:focus, #restart_button button.flat:focus:hover:active:hover:focus, #restart_button button.flat:focus:hover:checked:hover:focus {
        border-color: rgba(19, 20, 38, 0.4); }
      #restart_button button:focus:hover:disabled, #restart_button button.flat:focus:hover:disabled {
        border-color: rgba(23, 24, 46, 0.4); }
      #restart_button button:focus:hover:active:disabled, #restart_button button:focus:hover:checked:disabled, #restart_button button.flat:focus:hover:active:disabled, #restart_button button.flat:focus:hover:checked:disabled {
        border-color: rgba(22, 22, 43, 0.4); }
  #restart_button button:checked, #restart_button button:active, #restart_button button.flat:checked, #restart_button button.flat:active {
    /*@include linear-gradient(shade($bg, .7), to top);*/
    background-color: #30365f;
    background-image: none;
    border-color: rgba(22, 22, 43, 0.32);
    color: #ffffff;
    box-shadow: inset 1px 0 rgba(27, 28, 54, 0.06), inset 0 1px rgba(27, 28, 54, 0.07), inset -1px 0 rgba(27, 28, 54, 0.06), inset 0 -1px rgba(27, 28, 54, 0.05); }
    #restart_button button:checked:focus, #restart_button button:checked:hover, #restart_button button:active:focus, #restart_button button:active:hover, #restart_button button.flat:checked:focus, #restart_button button.flat:checked:hover, #restart_button button.flat:active:focus, #restart_button button.flat:active:hover {
      border-color: mix(#30365f,rgba(27, 28, 54, 0.32),0.3); }
    #restart_button button:active:checked, #restart_button button:active:checked:hover, #restart_button button:active:checked:focus, #restart_button button:active:checked:hover:focus, #restart_button button.flat:active:checked, #restart_button button.flat:active:checked:hover, #restart_button button.flat:active:checked:focus, #restart_button button.flat:active:checked:hover:focus {
      border-color: rgba(19, 20, 38, 0.32); }
    #restart_button button:checked:disabled, #restart_button button:active:disabled, #restart_button button.flat:checked:disabled, #restart_button button.flat:active:disabled {
      border-color: rgba(23, 24, 46, 0.32); }
    #restart_button button:active:checked:disabled, #restart_button button.flat:active:checked:disabled {
      border-color: rgba(22, 22, 43, 0.32); }
    #restart_button button:checked:focus, #restart_button button:checked:hover, #restart_button button:active:focus, #restart_button button:active:hover, #restart_button button.flat:checked:focus, #restart_button button.flat:checked:hover, #restart_button button.flat:active:focus, #restart_button button.flat:active:hover {
      /*@include linear-gradient(shade($bg, .65), to top);*/
      background-color: #323964;
      background-image: none;
      color: #ffffff; }
  #restart_button button:focus, #restart_button button:hover, #restart_button button.flat:focus, #restart_button button.flat:hover {
    color: #1b1c36; }
  #restart_button button:disabled:disabled, #restart_button button.flat:disabled:disabled {
    background-color: alpha(mix(#afb500,#1b1c36,0.2),0.4);
    background-image: none;
    /*border: 1px solid alpha($bg, .2);*/
    opacity: .6;
    color: mix(#afb500,#1b1c36,0.6);
    box-shadow: none; }
    #restart_button button:disabled:disabled :disabled, #restart_button button.flat:disabled:disabled :disabled {
      color: mix(#afb500,#1b1c36,0.6); }
  #restart_button button:active:disabled, #restart_button button:checked:disabled, #restart_button button.flat:active:disabled, #restart_button button.flat:checked:disabled {
    background-color: rgba(48, 54, 95, 0.6);
    background-image: none;
    color: rgba(255, 255, 255, 0.85);
    box-shadow: none; }
    #restart_button button:active:disabled :disabled, #restart_button button:checked:disabled :disabled, #restart_button button.flat:active:disabled :disabled, #restart_button button.flat:checked:disabled :disabled {
      color: rgba(255, 255, 255, 0.85); }
  #restart_button button:backdrop, #restart_button button.flat:backdrop {
    color: mix(#ffffff,mix(#ffffff,#1b1c36,0.5),0.8); }
  #restart_button button.separator, #restart_button button .separator {
    border: 1px solid currentColor;
    color: rgba(175, 181, 0, 0.9); }
    #restart_button button.separator:disabled, #restart_button button .separator:disabled {
      color: rgba(175, 181, 0, 0.85); }
  #restart_button button separator {
    background-image: image(mix(#1b1c36,#afb500,0.9)); }

/* password warning */
#greeter_infobar {
  font-weight: bold; }

/**********************
 ! Genome Terminal *
***********************/
VteTerminal {
  background-color: #16172d;
  color: #ffffff; }

terminal-window junction, terminal-window scrollbar trough {
  background-color: #16172d;
  border-color: #121224; }

terminal-window scrollbar.vertical slider {
  background-color: mix(#16172d,#ffffff,0.2); }
  terminal-window scrollbar.vertical slider:hover {
    background-color: mix(#16172d,#ffffff,0.3); }
  terminal-window scrollbar.vertical slider:hover:active {
    background-color: #30365f; }
  terminal-window scrollbar.vertical slider:disabled {
    background-color: transparent; }

/******************
 ! Budgie Desktop *
*******************/
.budgie-container {
  background-color: transparent; }

.raven {
  background-color: rgba(27, 28, 54, 0.93); }
  .raven .raven-header {
    background-color: #1b1c36;
    border: solid mix(#1b1c36,#ffffff,0.18);
    border-width: 1px 0; }
  .raven .raven-background {
    background-color: rgba(27, 28, 54, 0.93); }

.raven-mpris {
  background-color: rgba(27, 28, 54, 0.7); }

  '';
}