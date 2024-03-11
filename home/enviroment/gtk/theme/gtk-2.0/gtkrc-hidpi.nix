{config, lib, pkgs, ...}:
{
  home.file.".themes/dynamic-color-theme/gtk-2.0/gtkrc.hidpi".text = ''
  # Oomox GTK Theme (Numix Fork)

gtk-color-scheme =
"base_color:#${config.colorScheme.palette.base00}\nbg_color:#${config.colorScheme.palette.base00}\ntooltip_bg_color:#${config.colorScheme.palette.base00}\nselected_bg_color:#${config.colorScheme.palette.base02}\ntext_color:#${config.colorScheme.palette.base06}\nfg_color:#${config.colorScheme.palette.base06}\ntooltip_fg_color:#${config.colorScheme.palette.base06}\nselected_fg_color:#${config.colorScheme.palette.base07}\nmenubar_bg_color:#${config.colorScheme.palette.base00}\nmenubar_fg_color:#${config.colorScheme.palette.base06}\ntoolbar_bg_color:#${config.colorScheme.palette.base00}\ntoolbar_fg_color:#${config.colorScheme.palette.base06}\nmenu_bg_color:#${config.colorScheme.palette.base00}\nmenu_fg_color:#${config.colorScheme.palette.base06}\npanel_bg_color:#${config.colorScheme.palette.base00}\npanel_fg_color:#${config.colorScheme.palette.base06}\nlink_color:#6a06cd\nbtn_bg_color:#${config.colorScheme.palette.base00}\nbtn_fg_color:#${config.colorScheme.palette.base06}\ntitlebar_bg_color:#${config.colorScheme.palette.base00}\ntitlebar_fg_color:#${config.colorScheme.palette.base06}\nprimary_caret_color:#${config.colorScheme.palette.base06}\nsecondary_caret_color:#${config.colorScheme.palette.base06}\naccent_bg_color:#${config.colorScheme.palette.base08}\n"
# Default Style

style "murrine-default" {
	GtkArrow::arrow-scaling= 1.0

	GtkButton::child-displacement-x = 0
	GtkButton::child-displacement-y = 0

	#GtkButton::default-border = { 0, 0, 0, 0 }
    GtkButton::inner-border        = { 0, 0, 1, 0 }
    GtkButton::focus-line-width    = 2
    #GtkButton::focus-padding       = 4
    GtkButton::focus-padding       = 2
    #GtkButton::interior-focus = 1

    GtkEntry::inner-border        = { 4, 4, 5, 4 }
    GtkComboBox::inner-border        = { 4, 4, 6, 5 }
    GtkComboBoxText::inner-border        = { 4, 4, 6, 5 }

	#GtkButtonBox::child-min-height = 52

	GtkCheckButton::indicator-size = 30

	# The following line hints to gecko (and possibly other appliations)
	# that the entry should be drawn transparently on the canvas.
	# Without this, gecko will fill in the background of the entry.
	GtkEntry::honors-transparent-bg-hint = 1
	GtkEntry::state-hint = 0

	GtkExpander::expander-size = 30

	GtkImage::x-ayatana-indicator-dynamic = 1

	GtkMenu::horizontal-padding = 2
	GtkMenu::vertical-padding = 2

	GtkMenuBar::internal-padding = 1
	GtkMenuBar::window-dragging = 1

	GtkMenuItem::arrow-scaling= 0.5

	GtkPaned::handle-size = 1

	GtkProgressBar::min-horizontal-bar-height = 14
	GtkProgressBar::min-vertical-bar-width = 14

	GtkRange::trough-border = 0
	GtkRange::slider-width = 24
	GtkRange::stepper-size = 24
	GtkRange::stepper_spacing = 0
	GtkRange::trough-under-steppers = 1

	GtkScale::slider-length = 30
	GtkScale::slider-width = 30
	GtkScale::trough-side-details = 1

	GtkScrollbar::activate-slider = 1
	GtkScrollbar::has-backward-stepper = 0
	GtkScrollbar::has-forward-stepper = 0
	GtkScrollbar::has-secondary-backward-stepper = 0
	GtkScrollbar::has-secondary-forward-stepper = 0
	GtkScrollbar::min-slider-length = 160
	GtkScrollbar::slider-width = 24
	GtkScrollbar::trough-border = 0

	GtkScrolledWindow::scrollbar-spacing = 0
	GtkScrolledWindow::scrollbars-within-bevel = 1

	GtkSeparatorMenuItem::horizontal-padding = 0

	GtkToolbar::internal-padding = 0

	GtkTreeView::expander-size = 22
	GtkTreeView::vertical-separator = 0

	GtkWidget::focus-line-width = 2
	# The following line prevents the Firefox tabs
	# from jumping a few pixels when you create a new tab
	GtkWidget::focus-padding = 0

	GtkWidget::wide-separators = 1
	GtkWidget::separator-width = 2
	GtkWidget::separator-height = 2

	GtkWindow::resize-grip-height = 2
	GtkWindow::resize-grip-width = 2

	WnckTasklist::fade-overlay-rect = 0

	GnomeHRef::link_color = @link_color
	GtkHTML::link-color = @link_color
 	GtkIMHtmlr::hyperlink-color = @link_color
	GtkIMHtml::hyperlink-color = @link_color
	GtkWidget::link-color = @link_color
	GtkWidget::visited-link-color = @text_color

	GtkToolbar::shadow-type = GTK_SHADOW_NONE # Makes toolbars flat and unified
	GtkMenuBar::shadow-type = GTK_SHADOW_NONE # Makes menubars flat and unified

	xthickness = 2
	ythickness = 2

	fg[NORMAL] = @fg_color
	fg[PRELIGHT] = @fg_color
	fg[SELECTED] = @selected_fg_color
	fg[ACTIVE] = @fg_color
	fg[INSENSITIVE] = mix (0.5, @bg_color, @fg_color)

	bg[NORMAL] = @bg_color
	bg[PRELIGHT] = shade (1.02, @bg_color)
	bg[SELECTED] = @selected_bg_color
	bg[ACTIVE] = shade (0.9, @bg_color)
	bg[INSENSITIVE] = @bg_color

	base[NORMAL] = @base_color
	base[PRELIGHT] = shade (0.95, @base_color)
	base[SELECTED] = @selected_bg_color
	base[ACTIVE] = @selected_bg_color
	base[INSENSITIVE] = shade (0.85, @base_color)

	text[NORMAL] = @text_color
	text[PRELIGHT] = @text_color
	text[SELECTED] = @selected_fg_color
	text[ACTIVE] = @selected_fg_color
	text[INSENSITIVE] = mix (0.5, @base_color, @text_color)

	engine "murrine" {
		animation = FALSE
		arrowstyle = 1 # 0 = normal arrows, 1 = filled arrows
		border_shades = { 1.0, 1.0 } # gradient to draw on border
		border_colors = { mix(0.2, @fg_color, @bg_color), mix(0.2, @fg_color, @bg_color) }
		colorize_scrollbar = FALSE
		comboboxstyle = 0 # 0 = normal combobox, 1 = colorized combobox below arrow
		contrast = 0.8 # overal contrast with borders
		focusstyle = 3 # 0 = none, 1 = grey dotted, 2 = colored with fill, 3 = colored glow
		glazestyle = 0 # 0 = flat highlight, 1 = curved highlight, 2 = concave, 3 = top curved highlight, 4 = beryl highlight
		glowstyle = 0 # 0 = glow on top, 1 = glow on bottom, 2 = glow on top and bottom, 3 = glow on middle vertically, 4 = glow on middle horizontally, 5 = glow on all sides
		glow_shade = 1.0 # amount of glow
		gradient_shades = { 1.0, 1.0, 1.0, 1.0 } # gradient to draw on widgets
		highlight_shade = 1.0 # amount of highlight
		lightborder_shade = 1.0 # amount of inset light border
		lightborderstyle = 1 # 0 = lightborder on top side, 1 = lightborder on all sides
		listviewheaderstyle = 0 # 0 = flat, 1 = glassy, 2 = raised
		listviewstyle = 0 # 0 = none, 1 = dotted, 2 = line
		menubaritemstyle = 0 # 0 = menuitem look, 1 = button look
		menubarstyle = 0 # 0 = flat, 1 = glassy, 2 = gradient, 3 = striped
		menuitemstyle = 0 # 0 = flat, 1 = glassy, 2 = striped
		menustyle = 0 # 0 = none, 1 = vertical striped
		progressbarstyle = 0 # 0 = none, 1 = diagonal striped, 2 = vertical striped
		reliefstyle = 0 # 0 = flat, 1 = inset, 2 = shadow, 3 = shadow with gradient, 4 = stronger shadow with gradient
		roundness = 40# roundness of widgets
		scrollbarstyle = 0 # 0 = none, 1 = circles, 2 = handles, 3 = diagonal stripes, 4 = diagonal stripes and handles, 5 = horizontal stripes, 6 = horizontal stripes and handles
		sliderstyle = 0 # 0 = none, 1 = handles
		stepperstyle = 1 # 0 = standard, 1 = integrated stepper handles
		toolbarstyle = 0 # 0 = flat, 1 = glassy, 2 = gradient
   }
}

style "murrine-wide" {
	xthickness = 6
	ythickness = 6
}

style "murrine-wider" {
	xthickness = 10
	ythickness = 10
}

style "murrine-thin" {
	xthickness = 1
	ythickness = 1
}

# Notebook

style "clearlooks-notebook-bg" {
	bg[NORMAL] = @bg_color
	bg[ACTIVE] = shade (0.80, @bg_color)
}

style "clearlooks-notebook" = "clearlooks-notebook-bg" {
	xthickness = 8
	ythickness = 4

	engine "clearlooks" {
		radius = 0.1
	}
}

# Various Standard Widgets

style "murrine-button"  = "murrine-wider" {
	bg[NORMAL] = @btn_bg_color
	bg[PRELIGHT] = shade (1.04, @btn_bg_color)
	bg[SELECTED] = mix (0.5, @selected_bg_color, @bg_color)
	bg[ACTIVE] = shade (0.95, @btn_bg_color)
	bg[INSENSITIVE] = shade (0.75, @btn_bg_color)
    xthickness = 10
    ythickness = 10
    #xthickness = 5
    #ythickness = 5

	engine "murrine" {
		border_colors = { mix(0.25, @btn_fg_color, @btn_bg_color), mix(0.25, @btn_fg_color, @btn_bg_color) }
		roundness = 40
		gradient_shades = { 1.0, 1.0, 1.0, 1.0 }
	}
}

style "murrine-buttonlabel" {
	fg[NORMAL] = @btn_fg_color
	fg[PRELIGHT] = @btn_fg_color
	fg[SELECTED] = @btn_fg_color
	fg[ACTIVE] = @btn_fg_color
    fg[INSENSITIVE] = mix (0.4, @btn_bg_color, @btn_fg_color)

    text[NORMAL] = @btn_fg_color
    text[PRELIGHT] = @btn_fg_color
    text[SELECTED] = @btn_fg_color
    text[ACTIVE] = @btn_fg_color
    text[INSENSITIVE] = @btn_fg_color
    text[INSENSITIVE] = mix (0.4, @btn_bg_color, @btn_fg_color)

	engine "murrine" {
	}
}

style "murrine-comboboxtext" = "murrine-buttonlabel" {
    xthickness = 10
    ythickness = 10
}

style "murrine-togglebutton" = "murrine-buttonlabel" {
    xthickness = 10
    ythickness = 10
}

style "murrine-radiocheck" = "murrine-togglebutton" {
	text[NORMAL] = @accent_bg_color
	text[PRELIGHT] = @accent_bg_color
}

style "murrine-scrollbar" {
	bg[NORMAL] = mix (0.21, @fg_color, @bg_color)
	bg[PRELIGHT] = mix (0.31, @fg_color, @bg_color)
	bg[ACTIVE] = @selected_bg_color

	engine "murrine" {
		roundness = 40
		contrast = 0.0
		border_shades = { 0.9, 0.9 }
		trough_shades = { 0.97, 0.97 }
		trough_border_shades = { 1.0, 1.0 }
	}
}

style "murrine-overlay-scrollbar" {
	bg[ACTIVE] = shade (0.8, @bg_color)
	bg[INSENSITIVE] = shade (0.97, @bg_color)

	base[SELECTED] = shade (0.6, @bg_color)
	base[INSENSITIVE] = shade (0.85, @bg_color)
}

style "murrine-scale" = "murrine-thin" {
	bg[NORMAL] = @btn_bg_color
	bg[ACTIVE] = mix(0.2, @fg_color, @bg_color)
	bg[SELECTED] = @selected_bg_color
	bg[INSENSITIVE] = mix(0.95, @bg_color, @btn_bg_color)

	engine "murrine" {
        roundness = 25
		#roundness = 40
		gradient_shades = { 1.08, 1.08, 1.08, 1.08 }
		#border_shades = { 0.5, 0.5 }
		border_colors = { mix(0.25, @btn_fg_color, @btn_bg_color), mix(0.25, @btn_fg_color, @btn_bg_color) }
        #trough_shades = { 1.08, 1.08 }
        trough_border_shades = { 0.8, 0.8 }
	}
}

style "murrine-progressbar" = "murrine-thin" {
	bg[NORMAL] = @bg_color
	bg[ACTIVE] = mix(0.08, @bg_color, @base_color)

	fg[PRELIGHT] = @selected_fg_color

	engine "murrine" {
		roundness = 40
		border_shades = { 1.2, 1.2 }
		trough_border_shades = { 0.8, 0.8 }
	}
}

style "murrine-treeview-header" = "murrine-button" {
	fg[NORMAL] = @fg_color
	fg[PRELIGHT] = @fg_color
	fg[SELECTED] = @fg_color
	fg[ACTIVE] = @fg_color
	fg[INSENSITIVE] = mix(0.20, @bg_color, @fg_color)
  	engine "murrine" {
		roundness = 0
	}
}

style "murrine-treeview" {
  	engine "murrine" {
		roundness = 0
	}
}

style "murrine-frame" = "murrine-wide" {
	bg[NORMAL] = mix(0.08, @fg_color, @bg_color)
}

style "murrine-frame-title" {
	fg[NORMAL] = lighter (@fg_color)
}

style "murrine-tooltips" {
	xthickness = 10
	ythickness = 10

	bg[NORMAL] = @tooltip_bg_color
	bg[SELECTED] = @tooltip_bg_color

	fg[NORMAL] = @tooltip_fg_color

	engine "murrine" {
		textstyle = 0
		roundness = 40
		rgba = FALSE
	}
}

style "murrine-spinbutton" = "murrine-button" {
    xthickness = 10
    ythickness = 10
	engine "murrine" {
	}
}

style "clearlooks-radiocheck" = "murrine-default" {
	bg[SELECTED] = @base_color
	bg[PRELIGHT] = @bg_color

	text[NORMAL] = @accent_bg_color
	text[PRELIGHT] = @accent_bg_color

	engine "clearlooks" {
		radius = 40.0
	}
}

style "clearlooks-base-radiocheck" = "clearlooks-radiocheck" {
	bg[PRELIGHT] = @bg_color
}

style "clearlooks-radiocheck-label" = "clearlooks-radiocheck" {
    fg[NORMAL] = @fg_color
    fg[PRELIGHT] = @fg_color
    fg[SELECTED] = @fg_color
    fg[ACTIVE] = @fg_color
    fg[INSENSITIVE] = mix (0.5, @bg_color, @fg_color)
}

style "murrine-entry" = "murrine-wider" {
    text[NORMAL] = @text_color
    text[PRELIGHT] = @text_color
    text[SELECTED] = @text_color
    text[ACTIVE] = @text_color
    text[INSENSITIVE] = mix (0.5, @base_color, @text_color)

	xthickness = 10
	ythickness = 10
	engine "murrine" {
		#border_shades = { 1.15, 1.15 }
		border_colors = { mix(0.22, @text_color, @base_color), mix(0.22, @text_color, @base_color) }
		roundness = 40
	}
}

style "metacity-frame" = "murrine-default" {
	bg[SELECTED] = @selected_bg_color
}

style "murrine-statusbar" { }
style "murrine-comboboxentry" = "murrine-entry" { }
style "murrine-hscale" = "murrine-scale" { }
style "murrine-vscale" = "murrine-scale" { }
style "murrine-hscrollbar" = "murrine-scrollbar" { }
style "murrine-vscrollbar" = "murrine-scrollbar" { }

# Menus

style "murrine-menu" = "murrine-thin" {
	bg[NORMAL] = @menu_bg_color
	bg[PRELIGHT] = @selected_bg_color
	bg[SELECTED] = @selected_bg_color
	bg[ACTIVE] = @menu_bg_color
	bg[INSENSITIVE] = @menu_bg_color

	fg[NORMAL] = @menu_fg_color
	fg[PRELIGHT] = @selected_fg_color
	fg[SELECTED] = @selected_fg_color
	fg[ACTIVE] = @selected_fg_color
	fg[INSENSITIVE] = mix (0.5, @menu_bg_color, @menu_fg_color)

	text[NORMAL] = @menu_fg_color
	text[PRELIGHT] = @selected_fg_color
	text[SELECTED] = @selected_fg_color
	text[ACTIVE] = @selected_fg_color
	text[INSENSITIVE] = mix (0.5, @menu_bg_color, @menu_fg_color)

	engine "murrine" {
		roundness = 0
	}
}

style "murrine-menu-item" = "murrine-wider" {
	bg[PRELIGHT] = @selected_bg_color
	bg[SELECTED] = @selected_bg_color
	bg[ACTIVE] = @selected_bg_color

	fg[NORMAL] = @menu_fg_color # Fix for XFCE menu text
	fg[PRELIGHT] = @selected_fg_color
	fg[SELECTED] = @selected_fg_color
	fg[ACTIVE] = @selected_fg_color
	fg[INSENSITIVE] = mix (0.5, @menu_bg_color, @menu_fg_color)

	engine "murrine" {
		textstyle = 0
		border_shades = { 1.2, 1.2 }
	}
}

style "murrine-separator-menu-item" = "murrine-thin" { }

style "murrine-menubar" {
	bg[NORMAL] = @menubar_bg_color
	bg[PRELIGHT] =  mix (0.21, @menubar_fg_color, @menubar_bg_color)
	bg[SELECTED] =  mix (0.21, @menubar_fg_color, @menubar_bg_color)
	bg[ACTIVE] = shade (0.9, @menubar_bg_color)
	bg[INSENSITIVE] = @menubar_bg_color

	fg[NORMAL] = @menubar_fg_color
	fg[PRELIGHT] = shade (1.08, @menubar_fg_color)
	fg[SELECTED] = shade (1.08, @menubar_fg_color)
	fg[ACTIVE] = @menubar_fg_color
	fg[INSENSITIVE] = mix (0.5, @menubar_bg_color, @menubar_fg_color)

	engine "murrine" {
		roundness = 0
	}
}

style "murrine-menubaritem" {
	bg[NORMAL] = @menubar_bg_color
	bg[PRELIGHT] =  mix (0.21, @menubar_fg_color, @menubar_bg_color)
	bg[SELECTED] =  mix (0.21, @menubar_fg_color, @menubar_bg_color)
	bg[ACTIVE] = shade (0.9, @menubar_bg_color)
	bg[INSENSITIVE] = @menubar_bg_color

	fg[NORMAL] = @menubar_fg_color
	fg[PRELIGHT] = shade (1.08, @menubar_fg_color)
	fg[SELECTED] = shade (1.08, @menubar_fg_color)
	fg[ACTIVE] = @menubar_fg_color
	fg[INSENSITIVE] = mix (0.5, @menubar_bg_color, @menubar_fg_color)

	engine "murrine" {
		roundness = 0
	}
}

# Toolbars

style "murrine-toolbar" = "murrine-thin" {
	bg[NORMAL] = @toolbar_bg_color
	bg[PRELIGHT] = shade (1.02, @toolbar_bg_color)
	bg[SELECTED] = @selected_bg_color
	bg[ACTIVE] = shade (0.9, @toolbar_bg_color)
	bg[INSENSITIVE] = @toolbar_bg_color

	fg[NORMAL] = @toolbar_fg_color
	fg[PRELIGHT] = @toolbar_fg_color
	fg[SELECTED] = @selected_fg_color
	fg[ACTIVE] = @toolbar_fg_color
	fg[INSENSITIVE] = mix (0.5, @toolbar_bg_color, @toolbar_fg_color)

	engine "murrine" {
	}
}

style "murrine-toolbutton" = "murrine-button" {
	bg[NORMAL] = shade (1.08, @toolbar_bg_color)
	bg[PRELIGHT] = shade (1.10, @toolbar_bg_color)
	bg[SELECTED] = @selected_bg_color
	bg[ACTIVE] = shade (0.95, @toolbar_bg_color)
	bg[INSENSITIVE] = shade (0.85, @toolbar_bg_color)

	fg[NORMAL] = @toolbar_fg_color
	fg[PRELIGHT] = @toolbar_fg_color
	fg[SELECTED] = @selected_fg_color
	fg[ACTIVE] = @toolbar_fg_color
	fg[INSENSITIVE] = mix (0.5, @toolbar_bg_color, @toolbar_fg_color)

	engine "murrine" {
	}
}

style "murrine-toolbutton-label" = "murrine-toolbutton" {
	fg[NORMAL] = @toolbar_fg_color
	fg[PRELIGHT] = @toolbar_fg_color
	fg[SELECTED] = @selected_fg_color
	fg[ACTIVE] = @toolbar_fg_color
	fg[INSENSITIVE] = mix (0.5, @toolbar_bg_color, @toolbar_fg_color)

	engine "murrine" {
	}
}

class "GtkToolbar" style "murrine-toolbar"
class "GtkHandleBox" style "murrine-toolbar"
widget_class "*Toolbar*.*Separator*" style "murrine-toolbar"

# Panels

style "murrine-panel" = "murrine-thin" {
	xthickness = 2

	bg[NORMAL] = @panel_bg_color
	bg[PRELIGHT] =  mix (0.21, @panel_fg_color, @panel_bg_color)
	bg[SELECTED] =  mix (0.21, @panel_fg_color, @panel_bg_color)
	bg[ACTIVE] = shade (0.8, @panel_bg_color)
	bg[INSENSITIVE] = @panel_bg_color

	fg[NORMAL] = @panel_fg_color
	fg[PRELIGHT] = shade (1.08, @panel_fg_color)
	fg[SELECTED] = shade (1.08, @panel_fg_color)
	fg[ACTIVE] = @panel_fg_color
	fg[INSENSITIVE] = mix (0.5, @panel_bg_color, @panel_fg_color)

	base[NORMAL] = @panel_bg_color
	base[PRELIGHT] =  mix (0.21, @panel_fg_color, @panel_bg_color)
	base[SELECTED] =  mix (0.21, @panel_fg_color, @panel_bg_color)
	base[ACTIVE] = shade (0.9, @panel_bg_color)
	base[INSENSITIVE] = @panel_bg_color

	text[NORMAL] = @panel_fg_color
	text[PRELIGHT] = shade (1.08, @panel_fg_color)
	text[SELECTED] = shade (1.08, @panel_fg_color)
	text[ACTIVE] = @panel_fg_color
	text[INSENSITIVE] = mix (0.5, @panel_bg_color, @panel_fg_color)

	engine "murrine" {
		roundness = 0
		contrast = 0.0
	}
}

widget "*PanelWidget*" style "murrine-panel"
widget "*PanelApplet*" style "murrine-panel"
widget "*fast-user-switch*" style "murrine-panel"
widget "*CPUFreq*Applet*" style "murrine-panel"
widget "*indicator-applet*" style "murrine-panel"
class "PanelApp*" style "murrine-panel"
class "PanelToplevel*" style "murrine-panel"
widget_class "*PanelToplevel*" style "murrine-panel"
widget_class "*notif*" style "murrine-panel"
widget_class "*Notif*" style "murrine-panel"
widget_class "*Tray*" style "murrine-panel"
widget_class "*tray*" style "murrine-panel"
widget_class "*computertemp*" style "murrine-panel"
widget_class "*Applet*Tomboy*" style "murrine-panel"
widget_class "*Applet*Netstatus*" style "murrine-panel"
widget "*gdm-user-switch-menubar*" style "murrine-panel"

# LXPanel (code based on Lubuntu-default theme's gtkrc file)
widget "*.tclock.*" style "murrine-panel"
widget "*.taskbar.*" style "murrine-panel"
widget_class "*GtkBgbox*" style "murrine-panel"

style "bold-panel-item" {
	font_name = "Bold"

	engine "murrine" {
		roundness = 0
	}
}

widget "*Panel*MenuBar*" style "bold-panel-item"
widget "*gimmie*" style "bold-panel-item"

# widget_class "*Mail*" style "murrine-panel" # Disabled to fix Evolution bug
# class "*Panel*" style "murrine-panel" # Disabled to fix bug

# XFCE Styles

style "workspace-switcher" = "murrine-panel" {
	bg[ACTIVE] = @selected_bg_color
	bg[SELECTED] = @selected_bg_color
}

style "xfce-header" {
	bg[NORMAL] = shade (0.9, @bg_color)
	base[NORMAL] = shade (1.18, @bg_color)
}

style "xfdesktop-windowlist" {
	bg[NORMAL] = @base_color
	fg[INSENSITIVE] = shade (0.95, @base_color)
	text[INSENSITIVE] = shade (0.95, @base_color)
}

style "xfdesktop-icon-view" {
       XfdesktopIconView::label-alpha = 0
       XfdesktopIconView::selected-label-alpha = 60
       XfdesktopIconView::shadow-x-offset = 0
       XfdesktopIconView::shadow-y-offset = 1
       XfdesktopIconView::selected-shadow-x-offset = 0
       XfdesktopIconView::selected-shadow-y-offset = 1
       XfdesktopIconView::shadow-color = @fg_color
       XfdesktopIconView::selected-shadow-color = @fg_color
       XfdesktopIconView::shadow-blur-radius = 2
       XfdesktopIconView::cell-spacing = 2
       XfdesktopIconView::cell-padding = 6
       XfdesktopIconView::cell-text-width-proportion = 1.9

       fg[NORMAL] = @bg_color
       fg[ACTIVE] = @bg_color

}

style "xfwm-tabwin" {
	Xfwm4TabwinWidget::border-width = 1
        Xfwm4TabwinWidget::border-alpha = 1.0
	Xfwm4TabwinWidget::icon-size = 64
        Xfwm4TabwinWidget::alpha = 1.0
        Xfwm4TabwinWidget::border-radius = 2

	bg[NORMAL] = @menu_bg_color
	bg[SELECTED] = @menu_bg_color

	fg[NORMAL] = @menu_fg_color

	engine "murrine" {
		contrast = 0.0
		border_shades = { 0.9, 0.9 }
	}
}

style "xfwm-tabwin-button" {
        font_name = "bold"

	bg[SELECTED] = @selected_bg_color
}

style "xfsm-logout" {
	bg[NORMAL] = @menu_bg_color
	bg[ACTIVE] = @menu_bg_color
	bg[PRELIGHT] = shade (1.1, @menu_bg_color)
	bg[SELECTED] = shade (0.5, @menu_bg_color)
	bg[INSENSITIVE] = shade (1.3, @menu_bg_color)

	fg[NORMAL] = @menu_fg_color
	fg[PRELIGHT] = @menu_fg_color

	text[NORMAL] = @menu_fg_color

	engine "murrine" {
	}
}

style "xfsm-logout-button" {
	bg[NORMAL] = shade (1.2, @menu_bg_color)
	bg[PRELIGHT] = shade (1.4, @menu_bg_color)

	engine "murrine" {
	}
}

widget "*Pager*" style "workspace-switcher"

widget "*Xfce*Panel*" style "murrine-panel"
class "*Xfce*Panel*" style "murrine-panel"

# Thunar Styles

style "sidepane" {
	base[NORMAL] = @bg_color
	base[INSENSITIVE] = mix (0.4, shade (1.35, @selected_bg_color), shade (0.9, @base_color))
	bg[NORMAL] = @bg_color
	text[NORMAL] = mix (0.9, @fg_color, @bg_color)
}

widget_class "*ThunarShortcutsView*" style "sidepane"
widget_class "*ThunarTreeView*" style "sidepane"
widget_class "*ThunarLocationEntry*" style "murrine-entry"

style "whiskermenu" {
	bg[NORMAL] = @menu_bg_color
	bg[ACTIVE] = mix (0.21, @menubar_fg_color, @menubar_bg_color)
	bg[PRELIGHT] = @selected_bg_color

	fg[NORMAL] = @menu_fg_color
	fg[ACTIVE] = @menu_fg_color
	fg[PRELIGHT] = @menu_fg_color
}

style "whiskermenu-scrollbar" = "murrine-scrollbar" {
	bg[NORMAL] = mix (0.21, @fg_color, @bg_color)
	bg[PRELIGHT] = mix (0.31, @fg_color, @bg_color)
	bg[ACTIVE] = @selected_bg_color

	engine "murrine" {
		trough_shades = { 4.97, 4.97 }
		trough_border_shades = { 5.0, 5.0 }
	}
}

widget "whiskermenu-window*" style "whiskermenu"
widget "*whisker*GtkVScrollbar" style "whiskermenu-scrollbar"

# Gtk2 Open-File Dialog

widget_class "*GtkFileChooserWidget.GtkFileChooserDefault.GtkVBox.GtkHPaned.GtkVBox.GtkScrolledWindow.GtkTreeView*" style "sidepane"
widget_class "*GtkFileChooserWidget.GtkFileChooserDefault.GtkVBox.GtkHPaned.GtkVBox.GtkScrolledWindow.<GtkTreeView>.<GtkButton>" style "murrine-treeview-header"

# Google Chrome/Chromium Styles (requires 9.0.597 or newer)

style "chromium-toolbar-button" {
	engine "murrine" {
		roundness = 40
		textstyle = 0
	}
}

style "chrome-gtk-frame" {
	ChromeGtkFrame::frame-color = @titlebar_bg_color
	ChromeGtkFrame::inactive-frame-color = @titlebar_bg_color

	ChromeGtkFrame::frame-gradient-size = 0
	ChromeGtkFrame::frame-gradient-color = @titlebar_bg_color

	ChromeGtkFrame::incognito-frame-color = @titlebar_bg_color
	ChromeGtkFrame::incognito-inactive-frame-color = @titlebar_bg_color

	ChromeGtkFrame::incognito-frame-gradient-size = 0
	ChromeGtkFrame::incognito-frame-gradient-color = @titlebar_bg_color

	ChromeGtkFrame::scrollbar-trough-color = @bg_color
	ChromeGtkFrame::scrollbar-slider-normal-color =  mix (0.21, @fg_color, @bg_color)
	ChromeGtkFrame::scrollbar-slider-prelight-color =  mix (0.31, @fg_color, @bg_color)
}

class "ChromeGtkFrame" style "chrome-gtk-frame"

widget_class "*Chrom*Button*" style "chromium-toolbar-button"

# General Styles

class "GtkWidget" style "murrine-default"

class "GtkFrame" style "murrine-frame"
class "MetaFrames" style "metacity-frame"
class "GtkWindow" style "metacity-frame"

class "GtkSeparator" style "murrine-wide"
class "GtkCalendar" style "murrine-wide"

class "GtkSpinButton" style "murrine-spinbutton"

class "GtkScale" style "murrine-scale"
class "GtkVScale" style "murrine-vscale"
class "GtkHScale" style "murrine-hscale"
class "GtkScrollbar" style "murrine-scrollbar"
class "GtkVScrollbar" style "murrine-vscrollbar"
class "GtkHScrollbar" style "murrine-hscrollbar"

class "GtkEntry" style "murrine-entry"

widget_class "*<GtkNotebook>" style "clearlooks-notebook"
widget_class "*<GtkNotebook>*<GtkEventBox>" style "clearlooks-notebook-bg"
widget_class "*<GtkNotebook>*<GtkDrawingArea>" style "clearlooks-notebook-bg"
widget_class "*<GtkNotebook>*<GtkLayout>" style "clearlooks-notebook-bg"
widget_class "*.GtkNotebook.*.GtkViewport" style "clearlooks-notebook"

widget_class "*<GtkButton>" style "murrine-button"
widget_class "*<GtkStatusbar>*" style "murrine-statusbar"
widget_class "*<GtkProgress>" style "murrine-progressbar"
widget_class "*<GtkProgressBar>" style "murrine-progressbar"

widget_class "*<GtkComboBoxEntry>*" style "murrine-comboboxentry"
widget_class "*<GtkCombo>*" style "murrine-comboboxentry"

widget_class "*<GtkMenu>*" style "murrine-menu"
widget_class "*<GtkMenuItem>*" style "murrine-menu-item"
widget_class "*<GtkSeparatorMenuItem>*" style "murrine-separator-menu-item"
widget_class "*Menu*.*Sepa*"  style "murrine-separator-menu-item"
widget_class "*<GtkMenuBar>*" style "murrine-menubar"
widget_class "*<GtkMenuBar>*<GtkMenuItem>*" style "murrine-menubaritem"

widget_class "*GtkToolButton*" style "murrine-toolbutton"
widget_class "*GtkToggleToolButton*" style "murrine-toolbutton"
widget_class "*GtkMenuToolButton*" style "murrine-toolbutton"
widget_class "*GtkToolbar*Button" style "murrine-toolbutton"

widget_class "*.<GtkFrame>.<GtkLabel>" style "murrine-frame-title"

widget_class "*.<GtkTreeView>*" style "murrine-treeview"
widget_class "*.<GtkTreeView>.<GtkButton>" style "murrine-treeview-header"
widget_class "*.<GtkCTree>.<GtkButton>" style "murrine-treeview-header"
widget_class "*.<GtkList>.<GtkButton>" style "murrine-treeview-header"
widget_class "*.<GtkCList>.<GtkButton>" style "murrine-treeview-header"

widget_class "*.<GtkCheckButton>" style "clearlooks-radiocheck"
widget_class "*<GtkNotebook>.*.<GtkCheckButton>" style "clearlooks-base-radiocheck"
widget_class "*<GtkCellRendererToggle>" style "clearlooks-base-radiocheck"

widget "gtk-tooltip*" style "murrine-tooltips"

widget_class "*<GtkScrolledWindow>*<OsScrollbar>" style "murrine-overlay-scrollbar"

# Workarounds and Non-Standard Styling

style "text-is-fg-color-workaround" {
	text[NORMAL] = @text_color
	text[PRELIGHT] = @fg_color
	text[SELECTED] = @selected_fg_color
	text[ACTIVE] = @fg_color
	text[INSENSITIVE] = mix (0.5, @bg_color, @fg_color)
}

widget_class "*.<GtkComboBox>.<GtkCellView>" style "text-is-fg-color-workaround"

style "fg-is-text-color-workaround" {
	fg[NORMAL] = @text_color
	fg[PRELIGHT] = @text_color
	fg[ACTIVE] = @selected_fg_color
	fg[SELECTED] = @selected_fg_color
	fg[INSENSITIVE] = darker (@fg_color)
}

widget_class "*<GtkListItem>*" style "fg-is-text-color-workaround"
widget_class "*<GtkCList>" style "fg-is-text-color-workaround"
widget_class "*<EelEditableLabel>" style "fg-is-text-color-workaround"

style "murrine-evo-new-button-workaround" {
	engine "murrine" {
		toolbarstyle = 0
	}
}

widget_class "EShellWindow.GtkVBox.BonoboDock.BonoboDockBand.BonoboDockItem*" style "murrine-evo-new-button-workaround"

style "inkscape-toolbar-fix" {
	engine "murrine" {
		gradient_shades = { 1.0, 1.0, 1.0, 1.0 }
		highlight_shade = 1.0
	}
}

#widget "*GtkHandleBox*" style "inkscape-toolbar-fix"
#widget "*HandleBox*CommandsToolbar*" style "inkscape-toolbar-fix"
#widget "*HandleBox*SnapToolbar*" style "inkscape-toolbar-fix"
widget "*HandleBox*SelectToolbar*" style "inkscape-toolbar-fix"
widget "*HandleBox*NodeToolbar*" style "inkscape-toolbar-fix"
widget "*HandleBox*TweakToolbar*" style "inkscape-toolbar-fix"
widget "*HandleBox*ZoomToolbar*" style "inkscape-toolbar-fix"
widget "*HandleBox*StarToolbar*" style "inkscape-toolbar-fix"
widget "*HandleBox*RectToolbar*" style "inkscape-toolbar-fix"
widget "*HandleBox*3DBoxToolbar*" style "inkscape-toolbar-fix"
widget "*HandleBox*ArcToolbar*" style "inkscape-toolbar-fix"
widget "*HandleBox*SpiralToolbar*" style "inkscape-toolbar-fix"
widget "*HandleBox*PencilToolbar*" style "inkscape-toolbar-fix"
widget "*HandleBox*PenToolbar*" style "inkscape-toolbar-fix"
widget "*HandleBox*CalligraphyToolbar*" style "inkscape-toolbar-fix"
widget "*HandleBox*EraserToolbar*" style "inkscape-toolbar-fix"
widget "*HandleBox*LPEToolToolbar*" style "inkscape-toolbar-fix"
widget "*HandleBox*DropperToolbar*" style "inkscape-toolbar-fix"
widget "*HandleBox*ConnectorToolbar*" style "inkscape-toolbar-fix"
widget "*HandleBox*PaintbucketToolbar*" style "inkscape-toolbar-fix"




style "gimp-default-style" {
# Uncommenting this line allows to set a different (smaller) font for GIMP.
#
# font_name = "sans 8"
# Enabling the following line for some reason breaks toolbox resize
# increment calculation. You can enable it to get an even smaller GUI
# but need to restart GIMP after the theme change.
#
# GtkWidget::focus-padding         = 0
  GtkOptionMenu::indicator-size    = { 15, 25 }
  GtkOptionMenu::indicator-spacing = { 10, 8, 4, 4 }
  GtkPaned::handle-size             = 5
  GimpDockWindow::default-height    = 600
  GimpDock::font-scale              = 1.0
  GimpMenuDock::minimal-width       = 400
  GimpToolPalette::tool-icon-size   = large-toolbar
  GimpToolPalette::button-relief    = none
  GimpDockbook::tab-border          = 0
  GimpDockbook::tab-icon-size       = button
  GimpColorNotebook::tab-border     = 0
  GimpColorNotebook::tab-icon-size  = button
  GimpDeviceEditor::handle-size     = 30
  GimpDockable::content-border      = 1
  GimpEditor::content-spacing       = 1
  GimpEditor::button-spacing        = 1
  GimpEditor::button-icon-size      = button
  GimpDataEditor::minimal-height    = 150
  GimpFrame::label-spacing          = 5
  GtkDialog::content-area-border    = 2
  GtkDialog::button-spacing         = 20
  GtkDialog::action-area-border     = 25
  GimpUnitComboBox::appears-as-list = 0
}

class "GtkWidget" style "gimp-default-style"
style "gimp-tool-dialog-style" = "gimp-default-style"
{
  GtkDialog::action-area-border = 6
}
class "GimpToolDialog" style "gimp-tool-dialog-style"
style "gimp-grid-view-style" = "gimp-default-style"
{
  bg[NORMAL] = { 1.0, 1.0, 1.0 }
}
widget "*GimpContainerGridView*GtkViewport*" style "gimp-grid-view-style"
style "gimp-dockable-style" = "gimp-default-style"
{
  GimpFrame::label-bold       = 0
  GtkButton::focus-line_width = 1
  GtkButton::focus-padding    = 0
}
widget "*GimpDockable.*" style "gimp-dockable-style"
style "gimp-display-style" = "gimp-default-style"
{
  GimpRuler::font-scale          = 1.0
  GimpUnitComboBox::label-scale  = 1.0
  GimpScaleComboBox::label-scale = 1.0
  GtkComboBox::arrow-size        = 20
  GtkButton::inner-border        = { 0, 0, 0, 0 }
  GtkButton::focus-line-width    = 0
  GtkButton::focus-padding       = 0
}
widget "*GimpDisplayShell.*" style "gimp-display-style"
style "gimp-overlay-style" = "gimp-display-style"
{
  GtkButton::focus-line_width = 2
}
widget_class "*<GimpOverlayFrame>*" style "gimp-overlay-style"




# Performance Fixes

style "performance-fix" {
	engine "murrine" {
		textstyle = 0
	}
}

widget_class "*gtkmm__GtkWindow*" style "performance-fix" # Inkscape
widget_class "*GimpDisplayShell*" style "performance-fix" # Gimp
widget_class "*GimpToolbox*" style "performance-fix"
widget_class "*GimpMenuDock*" style "performance-fix"
widget "*OOoFixed*" style "performance-fix" # Openoffice/Libreoffice
widget_class "*MozContainer*" style "performance-fix" # Firefox (Not sure if this one does anything though.)

widget_class "*XfceHeading*" style "xfce-header"
widget_class "*XfceDesktop*" style "xfdesktop-windowlist"
widget_class "*XfdesktopIconView*" style "xfdesktop-icon-view"
widget "xfwm4-tabwin*" style "xfwm-tabwin"
widget "xfwm4-tabwin*GtkButton*" style "xfwm-tabwin-button"
widget_class "*XfsmLogoutDialog*" style "xfsm-logout"
widget_class "*XfsmLogoutDialog*GtkButton" style "xfsm-logout-button"


# button fg workarounds:
widget_class "*.<GtkButton>.<GtkLabel>" style "murrine-buttonlabel"
widget_class "*<GtkButton>*<GtkLabel>*" style:highest "murrine-buttonlabel"
widget_class "*<GtkCheckButton>*<GtkLabel>*" style:highest "clearlooks-radiocheck-label"
widget_class "*<GtkComboBoxText>*" style "murrine-comboboxtext"
widget_class "*<GtkToggleButton>*" style "murrine-togglebutton"
widget_class "*.<GtkCheckButton>" style "murrine-radiocheck"
widget_class "*<GtkComboBoxText>*<GtkEntry>*" style:highest "murrine-entry"
widget_class "*<GtkToolbar>*<GtkToolButton>*<GtkLabel>*" style:highest "murrine-toolbutton-label"

  '';
}