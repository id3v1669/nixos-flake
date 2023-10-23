{config, lib, pkgs, ...}:
{
  home.file.".themes/dynamic-colors-theme/gtk-3.0/gtk.css".text = ''
/* Ant palet */
@define-color lime #${config.colorScheme.colors.base0B};
@define-color cyan #${config.colorScheme.colors.base0C};
@define-color yellow #${config.colorScheme.colors.base0A};
@define-color orange ${config.colorScheme.colors.base09};
@define-color purple #${config.colorScheme.colors.base0D};
@define-color red #${config.colorScheme.colors.base08};

/* default color scheme */
@define-color bg_color #${config.colorScheme.colors.base00};
@define-color fg_color #${config.colorScheme.colors.base06};
@define-color base_color #${config.colorScheme.colors.base01};
@define-color text_color #${config.colorScheme.colors.base06};
@define-color borders transparent;
@define-color header_bg_color #${config.colorScheme.colors.base00};
@define-color header_fg_color #${config.colorScheme.colors.base06};
/*@define-color selected_bg_color #00b0ff;*/
@define-color selected_bg_color #${config.colorScheme.colors.base02};
/*@define-color selected_bg_color #${config.colorScheme.colors.base0C};
*/
@define-color selected_fg_color #${config.colorScheme.colors.base06};
@define-color tooltip_bg_color #${config.colorScheme.colors.base06};
@define-color tooltip_fg_color #${config.colorScheme.colors.base02};

/* colormap actually used by the theme, to be overridden in other css files */
@define-color theme_bg_color @bg_color;
@define-color theme_fg_color @fg_color;
@define-color theme_base_color @base_color;
@define-color theme_text_color @text_color;
@define-color theme_selected_bg_color @selected_bg_color;
@define-color theme_selected_fg_color @selected_fg_color;
@define-color theme_tooltip_bg_color @tooltip_bg_color;
@define-color theme_tooltip_fg_color @tooltip_fg_color;

/* shadow effects */
@define-color light_shadow #fff;
@define-color dark_shadow #000;

/* misc colors used by gtk+ */
@define-color info_fg_color #31363D;
@define-color info_bg_color #${config.colorScheme.colors.base06};
@define-color warning_fg_color #${config.colorScheme.colors.base06};
@define-color warning_bg_color @orange;
@define-color question_fg_color #${config.colorScheme.colors.base06};
@define-color question_bg_color @cyan;
@define-color error_fg_color #${config.colorScheme.colors.base06};
@define-color error_bg_color @red;
@define-color link_color #${config.colorScheme.colors.base0C};
@define-color success_color #${config.colorScheme.colors.base0B};
@define-color warning_color #${config.colorScheme.colors.base0A};
@define-color error_color @red;
@define-color light_grey #${config.colorScheme.colors.base04};

/* widget colors */
@define-color button_bg_color @theme_base_color;
@define-color menubar_bg_color @theme_bg_color;
@define-color menubar_fg_color @theme_fg_color;
@define-color toolbar_bg_color @theme_bg_color;
@define-color toolbar_fg_color @theme_fg_color;
@define-color menu_bg_color @theme_base_color;
@define-color menu_fg_color @theme_text_color;
@define-color panel_bg_color shade(@header_fg_color, 0.8);
@define-color panel_fg_color @selected_fg_color;
@define-color menu_selected_bg_color @selected_bg_color;
@define-color menu_selected_fg_color @selected_fg_color;
@define-color titlebar_bg_color @theme_bg_color;
@define-color titlebar_fg_color @theme_fg_color;

/* osd */
@define-color osd_base @base_color;
@define-color osd_fg @fg_color;
@define-color osd_bg @bg_color;

/* window manager colors */
@define-color wm_bg @header_bg_color;
@define-color wm_border_focused @header_bg_color;
@define-color wm_border_unfocused @header_bg_color;
@define-color wm_title_focused @header_fg_color;
@define-color wm_title_unfocused alpha(@theme_fg_color, 0.75);
@define-color wm_icons_focused @theme_fg_color;
@define-color wm_icons_focused_prelight shade(@theme_selected_bg_color, 1.15);
@define-color wm_icons_focused_pressed @theme_selected_bg_color;
@define-color wm_icons_unfocused alpha(@theme_fg_color, 0.95);
@define-color wm_icons_unfocused_prelight shade(@theme_selected_bg_color, 1.15);
@define-color wm_icons_unfocused_pressed @theme_selected_bg_color;

@import url("gtk-widgets.css");
@import url("gtk-widgets-assets.css");

@import url("widgets/app-notifications.css");
@import url("widgets/assistant.css");
@import url("widgets/button.css");
@import url("widgets/cell-row.css");
@import url("widgets/check-radio.css");
@import url("widgets/column-header.css");
@import url("widgets/content-view.css");
@import url("widgets/calendar.css");
@import url("widgets/dialogs.css");
@import url("widgets/entry.css");
@import url("widgets/infobar.css");
@import url("widgets/list-boxes.css");
@import url("widgets/menu.css");
@import url("widgets/notebook.css");
@import url("widgets/progress-scale.css");
@import url("widgets/scrollbar.css");
@import url("widgets/search-bar.css");
@import url("widgets/separator.css");
@import url("widgets/sidebar.css");
@import url("widgets/spinbutton.css");
@import url("widgets/spinner.css");
@import url("widgets/switch.css");
@import url("widgets/color-chooser.css");
@import url("widgets/toolbar.css");
@import url("widgets/osd.css");
@import url("widgets/csd.css");
@import url("widgets/combobox.css");
@import url("widgets/selection-mode.css");
@import url("widgets/popover.css");


@import url("apps/budgie.css");
@import url("apps/corebird.css");
@import url("apps/solus-applications.css");
@import url("apps/gala.css");
@import url("apps/gnome-applications.css");
@import url("apps/unity.css");
@import url("apps/mate-applications.css");
  '';
  home.file.".themes/dynamic-colors-theme/gtk-3.0/gtk-widgets-assets.css".text = ''
.selection-mode.titlebar .titlebutton.minimize,
.titlebar .titlebutton.minimize {
    color: transparent;
    border:none;
    box-shadow: none;
    background-position: center;
    background-repeat: no-repeat;
    background-image: -gtk-scaled(url("../assets/min.svg"));
}

.selection-mode.titlebar .titlebutton.minimize:backdrop,
.titlebar .titlebutton.minimize:backdrop {
    background-image: -gtk-scaled(url("../assets/min_unfocused.png"));
    color: transparent;
}

.selection-mode.titlebar .titlebutton.minimize:hover,
.selection-mode.titlebar .titlebutton.minimize:active,
.selection-mode.titlebar .titlebutton.minimize:checked,
.titlebar .titlebutton.minimize:hover,
.titlebar .titlebutton.minimize:active,
.titlebar .titlebutton.minimize:checked {
    color: transparent;
    border: none;
    box-shadow: none;
    background-color: transparent;
    background-position: center;
    background-repeat: no-repeat;
    background-image: -gtk-scaled(url("../assets/min_prelight.svg"));
}

.selection-mode.titlebar .titlebutton.maximize,
.titlebar .titlebutton.maximize {
   color: transparent;
    border: none;
    box-shadow: none;
    background-position: center;
    background-repeat: no-repeat;
    background-image: -gtk-scaled(url("../assets/maximize.svg"));
}

.selection-mode.titlebar .titlebutton.maximize:backdrop,
.titlebar .titlebutton.maximize:backdrop {
    background-image: -gtk-scaled(url("../assets/maximize_unfocused.png"));
    color: transparent;
}

.selection-mode.titlebar .titlebutton.maximize:hover,
.selection-mode.titlebar .titlebutton.maximize:active,
.selection-mode.titlebar .titlebutton.maximize:checked,
.titlebar .titlebutton.maximize:hover,
.titlebar .titlebutton.maximize:active,
.titlebar .titlebutton.maximize:checked  {
    color: transparent;
    border: none;
    box-shadow: none;
    background-color: transparent;
    background-position: center;
    background-repeat: no-repeat;
    background-image: -gtk-scaled(url("../assets/maximize_prelight.svg"));
}

.selection-mode.titlebar .titlebutton.close,
.titlebar .titlebutton.close {
   color: transparent;
    border: none;
    box-shadow: none;
    background-position: center;
    background-repeat: no-repeat;
    background-image: -gtk-scaled(url("../assets/close.svg"));
}

.selection-mode.titlebar .titlebutton.close:backdrop,
.titlebar .titlebutton.close:backdrop {
    background-image: -gtk-scaled(url("../assets/close_unfocused.png"));
    color: transparent;
}

.selection-mode.titlebar .titlebutton.close:hover,
.selection-mode.titlebar .titlebutton.close:active,
.selection-mode.titlebar .titlebutton.close:checked,
.titlebar .titlebutton.close:hover,
.titlebar .titlebutton.close:active,
.titlebar .titlebutton.close:checked  {
   color: transparent;
    border: none;
    box-shadow: none;
    background-color: transparent;
    background-position: center;
    background-repeat: no-repeat;
    background-image: -gtk-scaled(url("../assets/close_prelight.svg"));
}

/*******************
 * check and radio *
 *******************/
/* draw regular check and radio items using our assets */

.check,
.check:focus {
    -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-unchecked.png"),url("../assets/checkbox-unchecked@2.png"));
}

.check:hover {
    -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-unchecked-hover.png"),url("../assets/checkbox-unchecked-hover@2.png"));
}

.check:insensitive,
.check row:selected:insensitive,
.check row:selected:focus:insensitive {
    -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-unchecked-insensitive.png"),url("../assets/checkbox-unchecked-insensitive@2.png"));
}

.check:active,
.check:checked,
.check row:selected:active,
.check row:selected:focus:active {
    -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-checked.png"),url("../assets/checkbox-checked@2.svg"));
}

.check:active:insensitive,
.check:checked:insensitive,
.check row:selected:active:insensitive,
.check row:selected:focus:active:insensitive {
    -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-checked-insensitive.png"),url("../assets/checkbox-checked-insensitive@2.png"));
}

.check:inconsistent,
.check row:selected:inconsistent,
.check row:selected:focus:inconsistent {
    -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-mixed.png"),url("../assets/checkbox-mixed@2.png"));
}

.check:inconsistent:insensitive,
.check row:selected:inconsistent:insensitive,
.check row:selected:focus:inconsistent:insensitive {
    -gtk-icon-source: -gtk-scaled(url("../assets/checkbox-mixed-insensitive.png"),url("../assets/checkbox-mixed-insensitive@2.png"));
}

.radio,
.radio:hover,
.radio row:selected,
.radio row:selected:focus {
    -gtk-icon-source: -gtk-scaled(url("../assets/radio-unchecked.png"),url("../assets/radio-unselected@2.png"));
}

.radio:insensitive,
.radio row:selected:insensitive,
.radio row:selected:focus:insensitive {
    -gtk-icon-source: -gtk-scaled(url("../assets/radio-unchecked-insensitive.png"),url("../assets/radio-unselected-insensitive@2.png"));
}

.radio:active,
.radio:active:hover,
.radio:checked,
.radio row:selected:active,
.radio row:selected:focus:active {
    -gtk-icon-source: -gtk-scaled(url("../assets/radio-checked.png"),url("../assets/radio-selected@2.png"));
}

.radio:active:insensitive,
.radio:checked:insensitive,
.radio row:selected:active:insensitive,
.radio row:selected:focus:active:insensitive {
    -gtk-icon-source: -gtk-scaled(url("../assets/radio-checked-insensitive.png"),url("../assets/radio-selected-insensitive@2.png"));
}

.radio:inconsistent,
.radio row:selected:inconsistent,
.radio row:selected:focus:inconsistent {
    -gtk-icon-source: -gtk-scaled(url("../assets/radio-mixed.png"),url("../assets/radio-mixed@2.png"));
}

.radio:inconsistent:insensitive,
.radio row:selected:inconsistent:insensitive,
.radio row:selected:focus:inconsistent:insensitive {
    -gtk-icon-source: -gtk-scaled(url("../assets/radio-mixed-insensitive.png"),url("../assets/radio-mixed-insensitive@2.png"));
}

.menuitem.check {
    -gtk-icon-source: none;
}

.menuitem.check:active,
.menuitem.check:checked {
    -gtk-icon-source: -gtk-scaled(url("../assets/menuitem-checkbox-checked.png"),url("../assets/menuitem-checkbox-checked@2.png"));
}

.menuitem.check:active:hover,
.menuitem.check:checked:hover {
    -gtk-icon-source: -gtk-scaled(url("../assets/menuitem-checkbox-checked-hover.png"),url("../assets/menuitem-checkbox-checked-hover@2.png"));
}

.menuitem.check:active:insensitive,
.menuitem.check:checked:insensitive {
    -gtk-icon-source: -gtk-scaled(url("../assets/menuitem-checkbox-checked-insensitive.png"),url("../assets/menuitem-checkbox-checked-insensitive@2.png"));
}

.menuitem.check:inconsistent,
.menuitem.radio:inconsistent {
    -gtk-icon-source: -gtk-scaled(url("../assets/menuitem-checkbox-mixed.png"),url("../assets/menuitem-checkbox-mixed@2.png"));
}

.menuitem.check:inconsistent:insensitive,
.menuitem.radio:inconsistent:insensitive {
    -gtk-icon-source: -gtk-scaled(url("../assets/menuitem-checkbox-mixed-insensitive.png"),url("../assets/menuitem-checkbox-mixed-insensitive@2.png"));
}

.menuitem.radio {
    -gtk-icon-source: none;
}

.menuitem.radio:active,
.menuitem.radio:checked {
    -gtk-icon-source: -gtk-scaled(url("../assets/menuitem-radio-checked.png"),url("../assets/menuitem-radio-checked@2.png"));
}

.menuitem.radio:active:hover,
.menuitem.radio:checked:hover {
    -gtk-icon-source: -gtk-scaled(url("../assets/menuitem-radio-checked-hover.png"),url("../assets/menuitem-radio-checked-hover@2.png"));
}

.menuitem.radio:active:insensitive,
.menuitem.radio:checked:insensitive {
    -gtk-icon-source: -gtk-scaled(url("../assets/menuitem-radio-checked-insensitive.png"),url("../assets/menuitem-radio-checked-insensitive@2.png"));
}

GtkIconView.content-view.cell.check {
    -gtk-icon-source: -gtk-scaled(url("../assets/grid-selection-unchecked.png"),url("../assets/grid-selection-unchecked@2.png"));
}

GtkIconView.content-view.cell.check:checked {
    -gtk-icon-source: -gtk-scaled(url("../assets/grid-selection-checked.svg"),url("../assets/grid-selection-checked@2.svg"));
}

/******************
 * pane separator *
 ******************/
.pane-separator.horizontal {
    background-image: -gtk-scaled(url("../assets/pane-handle.png"),url("../assets/pane-handle@2.png"));
    background-repeat: no-repeat;
    background-position: center center;
}

.pane-separator.vertical {
    background-image: -gtk-scaled(url("../assets/pane-handle-vertical.png"),url("../assets/pane-handle-vertical@2.png"));
    background-repeat: no-repeat;
    background-position: center center;
}

/*************
 * GtkSwitch *
 *************/
GtkSwitch.trough {
    background-image: -gtk-scaled(url("../assets/switch-off.svg"),url("../assets/switch-off@2.svg"));
}

GtkSwitch.trough:active {
    background-image: -gtk-scaled(url("../assets/switch-on.svg"),url("../assets/switch-on@2.svg"));
}

GtkSwitch.trough:insensitive,
GtkSwitch.trough:active:insensitive {
    background-image: -gtk-scaled(url("../assets/switch-insensitive.svg"),url("../assets/switch-insensitive@2.svg"));
}

GtkSwitch.slider {
    background-image: -gtk-scaled(url("../assets/switch-slider-off.svg"),url("../assets/switch-slider-off@2.svg"));
}

GtkSwitch.slider:active {
    background-image: -gtk-scaled(url("../assets/switch-slider-on.svg"),url("../assets/switch-slider-on@2.svg"));
}

GtkSwitch.slider:insensitive,
GtkSwitch.slider:active:insensitive {
    background-image: -gtk-scaled(url("../assets/switch-slider-insensitive.svg"),url("../assets/switch-slider-insensitive@2.svg"));
}

/*******************
 * GtkScale slider *
 *******************/
.scale.slider {
    background: -gtk-scaled(url("../assets/scale-slider.svg"),url("../assets/scale-slider@2.png"));
}

.scale.slider:hover {
    background: -gtk-scaled(url("../assets/scale-slider-hover.svg"),url("../assets/scale-slider-hover@2.png"));
}

.scale.slider:insensitive {
    background: -gtk-scaled(url("../assets/scale-slider-insensitive.png"),url("../assets/scale-slider-insensitive@2.png"));
}
  '';
  home.file.".themes/dynamic-colors-theme/gtk-3.0/gtk-widgets.css".text = ''

/* default */
* {
    engine: none;
    -GtkArrow-arrow-scaling: 0.55;
    -GtkButton-child-displacement-x: 0;
    -GtkButton-child-displacement-y: 0;
    -GtkButton-default-border: 0;
    -GtkButton-image-spacing: 0;
    -GtkButton-inner-border: 1;
    -GtkButton-interior-focus: true;
    -GtkCheckButton-indicator-size: 16;
    -GtkCheckMenuItem-indicator-size: 12;
    -GtkExpander-expander-size: 8;
    -GtkHTML-link-color: @link_color;
    -GtkIMHtml-hyperlink-color: @link_color;
    -GtkMenu-horizontal-padding: 0;
    -GtkMenu-vertical-padding: 0;
    -GtkNotebook-initial-gap: 0;
    -GtkPaned-handle-size: 5;
    -GtkProgressBar-min-horizontal-bar-height: 5;
    -GtkProgressBar-min-vertical-bar-width: 5;
    -GtkRange-slider-width: 12;
    -GtkRange-stepper-spacing: 0;
    -GtkRange-trough-border: 0;
    -GtkRange-trough-under-steppers: 1;
    -GtkScrollbar-has-backward-stepper: false;
    -GtkScrollbar-has-forward-stepper: false;
    -GtkScrollbar-min-slider-length: 50;
    -GtkScrolledWindow-scrollbar-spacing: 0;
    -GtkScrolledWindow-scrollbars-within-bevel: 0;
    -GtkStatusbar-shadow-type: none;
    -GtkTextView-error-underline-color: @error_color;
    -GtkToolButton-icon-spacing: 6;
    -GtkToolItemGroup-expander-size: 8;
    -GtkTreeView-expander-size: 8;
    -GtkWidget-focus-line-width: 1;
    -GtkWidget-focus-padding: 2;
    -GtkWidget-link-color: @link_color;
    -GtkWidget-visited-link-color: @link_color;
    -GtkWindow-resize-grip-height: 0;
    -GtkWindow-resize-grip-width: 0;
    -WnckTasklist-fade-overlay-rect: 0;
    outline-color: alpha(@selected_bg_color, 0.5);
    outline-style: solid;
    outline-offset: 0;
}

/***************
 * base states *
 ***************/
.background {
    background-color: @bg_color;
    color: @fg_color;
}

* {
    /* inherit colors from parent */
    background-color: inherit;
    color: inherit;
}

*:selected,
*:selected:focus {
    background-color: @selected_bg_color;
    color: @selected_fg_color;
}

*:insensitive,
*:insensitive:insensitive {
    color: mix(@fg_color, @bg_color, 0.3);
}

/* apply effects to insensitive and prelit images */
*:insensitive {
    -gtk-image-effect: dim;
}

*:hover {
    -gtk-image-effect: highlight;
}

.gtkstyle-fallback {
    background-color: @bg_color;
    color: @fg_color;
}

.gtkstyle-fallback:prelight {
    background-color: shade(@bg_color, 1.1);
    color: @fg_color;
}

.gtkstyle-fallback:active {
    background-color: shade(@_color, 0.9);
    color: @fg_color;
}

.gtkstyle-fallback:insensitive {
    background-color: shade(shade(@bg_color, 0.95), 1.05);
    color: mix(@fg_color, @bg_color, 0.7);
}

.gtkstyle-fallback:selected {
    background-color: @selected_bg_color;
    color: @selected_fg_color;
}

GtkImage,
GtkImage:insensitive,
GtkLabel,
GtkLabel:insensitive,
GtkBox,
GtkBox:insensitive,
GtkOverlay,
GtkGrid,
GtkGrid:insensitive {
    background-color: transparent;
}

/***********
 * gtkhtml *
 ***********/
GtkHTML {
    background-color: @base_color;
    color: @text_color;
}

/************
 * expander *
 ************/
.expander {
    color: alpha(@fg_color, 0.7);
}

.expander:hover {
    color: alpha(@fg_color, 0.8);
}

.expander:active {
    color: alpha(currentColor, 0.9);
}


/*********
 * frame *
 *********/
.frame {
    border-color: shade(@theme_bg_color, 0.8);
}


.frame.flat {
	border: none;
}

/*******************
 * scrolled window *
 *******************/
GtkScrolledWindow.frame {
    border-width: 1px;
    border-style: solid;
    border-color: @bg_color;
    border-radius: 0;
}

/* avoid double borders when a viewport is 
 * packed into a GtkScrolledWindow */
GtkScrolledWindow GtkViewport.frame {
    border-style: none;
}

/************
 * iconview *
 ************/
GtkIconView.view.cell:hover {
    border: none;
    border-radius: 5px;
    background-color: shade(@bg_color, 0.9);
    background-image: none;
    color: @fg_color;
}

GtkIconView.view.cell:selected,
GtkIconView.view.cell:selected:focus {
    border-width: 1px;
    border-style: solid;
    border-color: shade(@bg_color, 0.8);
    border-radius: 5px;
    background-color: shade(@bg_color, 0.8);
    background-image: none;
    color: @fg_color;
}

.content-view.view.rubberband,
.view.rubberband,
.rubberband {
    border-width: 1px;
    border-style: solid;
    border-color: shade(@selected_fg_color, 0.9);
    border-radius: 0;
    background-color: alpha(@selected_fg_color, 0.3);
}
/*****************
 * miscellaneous *
 *****************/
.floating-bar {
    border-width: 1px;
    border-style: solid;
    border-color: @bg_color;
    border-radius: 0px;
    background-color: @bg_color;
    background-image: none;
    color: @fg_color;
}

.floating-bar.top {
    border-top-width: 0;
    border-top-right-radius: 0;
    border-top-left-radius: 0;
}

.floating-bar.right {
    border-right-width: 0;
    border-top-right-radius: 0;
    border-bottom-right-radius: 0;
}

.floating-bar.bottom {
    border-bottom-width: 0;
    border-bottom-right-radius: 0;
    border-bottom-left-radius: 0;
}

.floating-bar.left {
    border-left-width: 0;
    border-bottom-left-radius: 0;
    border-top-left-radius: 0;
}

.floating-bar .button {
    -GtkButton-image-spacing: 0;
    -GtkButton-inner-border: 0;

    border-style: none;
    background-color: transparent;
    background-image: none;
}

.view.dim-label,
.dim-label {
    color: alpha(currentColor, 0.5);
}

.dnd {
    border-width: 1px;
    border-style: solid;
    border-color: shade(@selected_fg_color, 0.9);
}

.grip {
    background-color: transparent;
}

.arrow {
    color: alpha(@fg_color, 0.9);
}

/*************
 * statusbar *
 *************/
GtkStatusbar {
    padding: 4px;
    color: @fg_color;
}

GtkStatusbar .button {
    color: @fg_color;
    border: none;
}

GtkStatusbar .button:hover,
GtkStatusbar .button:active,
GtkStatusbar .button:active:hover {
    transition: none;
    color: @selected_fg_color;
    background-color: @bg_color;
}

/************
 * textview *
 ************/
GtkTextView {
    background-color: @base_color;
    color: @text_color;
}

/***********
 * tooltip *
 ***********/
.tooltip {
    border-width: 1px;
    border-style: solid;
    border-color: @tooltip_bg_color;
    border-radius: 3px;
    background-color: @tooltip_bg_color;
    background-image: none;
    color: @tooltip_fg_color;
}

.tooltip.background {
    background-color: alpha(@tooltip_bg_color,0.8);
    background-clip: padding-box;
}

.tooltip.window-frame.csd {
    border-radius: 3px;
    background-color: transparent;
    box-shadow: 0 1px 2px 1px rgba(0, 0, 0, 0.15);
}

.tooltip * {
    padding: 2px;
    background-color: transparent;
    color: inherit;
}

/************
 * treeview *
 ************/
GtkTreeView {
    -GtkTreeView-vertical-separator: 6;
    -GtkWidget-focus-line-width: 1;
    -GtkWidget-focus-padding: 1;
}

GtkTreeView {
    border: 1px solid @bg_color;
}

GtkTreeView.view:selected {
    border: none; 
}

GtkTreeView.dnd {
    padding: 6px 6px;
    border-width: 1px;
    border-style: solid;
    border-color: shade(@selected_bg_color, 0.9);
    border-radius: 0;
}

GtkTreeView .entry {
    padding: 6px 6px;
    border-radius: 0;
    background-color: @base_color;
    background-image: none;
}

/************
 * viewport *
 ************/
GtkViewport.frame {
    border-width: 0;
}

.view {
    background-color: @base_color;
    color: @text_color;
}

.view:insensitive,
.view:insensitive:insensitive {
    color: mix(@bg_color,@text_color, 0.4);
}

.view:selected,
.view:selected:focus {
    background-color: @selected_bg_color; 
    color: @selected_fg_color; /*TreeView selected for dconf and sidebars and stuff*/
}

/*************************
 * touch text selections *
 *************************/
GtkBubbleWindow {
    border-radius: 0px;
    background-clip: border-box;
}

GtkBubbleWindow.osd.background {
    background-color: @osd_bg;
}

GtkBubbleWindow .toolbar {
    background-color: transparent;
}

.overshoot.top {
    background-image: -gtk-gradient(radial, center top, 0, center top, 0.6, from(rgba(55, 93, 114, 0.20)), to(rgba(255,93,115, 0)));
    background-size: 100% 60%;
    background-repeat: no-repeat;
    background-position: center top;
    background-color: transparent;
    border: none;
    box-shadow: none; }
  
  .overshoot.bottom {
    background-image: -gtk-gradient(radial, center bottom, 0, center bottom, 0.6, from(rgba(255,93,115,0.2)), to(rgba(255,93,115, 0)));
    background-size: 100% 60%;
    background-repeat: no-repeat;
    background-position: center bottom;
    background-color: transparent;
    border: none;
    box-shadow: none; }
  
  .overshoot.left {
    background-image: -gtk-gradient(radial, left center, 0, left center, 0.6, from(rgba(255,93,115,0.2)), to(rgba(255,93,115, 0)));
    background-size: 60% 100%;
    background-repeat: no-repeat;
    background-position: left center;
    background-color: transparent;
    border: none;
    box-shadow: none; }
  
  .overshoot.right {
    background-image: -gtk-gradient(radial, right center, 0, right center, 0.6, from(rgba(255,93,115,0.2)), to(rgba(255,93,115, 0)));
    background-size: 60% 100%;
    background-repeat: no-repeat;
    background-position: right center;
    background-color: transparent;
    border: none;
    box-shadow: none; }
  
  .undershoot.top {
    background-color: transparent;
    background-image: linear-gradient(to left, rgba(255, 255, 255, 0.2) 50%, rgba(0, 0, 0, 0.2) 50%);
    padding-top: 1px;
    background-size: 10px 1px;
    background-repeat: repeat-x;
    background-origin: content-box;
    background-position: center top; }
  
  .undershoot.bottom {
    background-color: transparent;
    background-image: linear-gradient(to left, rgba(255, 255, 255, 0.2) 50%, rgba(0, 0, 0, 0.2) 50%);
    padding-bottom: 1px;
    background-size: 10px 1px;
    background-repeat: repeat-x;
    background-origin: content-box;
    background-position: center bottom; }
  
  .undershoot.left {
    background-color: transparent;
    background-image: linear-gradient(to top, rgba(255, 255, 255, 0.2) 50%, rgba(0, 0, 0, 0.2) 50%);
    padding-left: 1px;
    background-size: 1px 10px;
    background-repeat: repeat-y;
    background-origin: content-box;
    background-position: left center; }
  
  .undershoot.right {
    background-color: transparent;
    background-image: linear-gradient(to top, rgba(255, 255, 255, 0.2) 50%, rgba(0, 0, 0, 0.2) 50%);
    padding-right: 1px;
    background-size: 1px 10px;
    background-repeat: repeat-y;
    background-origin: content-box;
    background-position: right center; }

  '';
}