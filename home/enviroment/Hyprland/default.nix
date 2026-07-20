{
  lib,
  config,
  pkgs,
  deflocale,
  hostname,
  colorsvar,
  uservars,
  ...
}: let
  clp = config.palette;
in {
  imports = lib.optional (
    builtins.pathExists (./. + "/hostsettings/${hostname}.nix")
  ) (./. + "/hostsettings/${hostname}.nix");

  home.packages = with pkgs; [
    hyprland-qt-support
  ];

  home.file.".config/hypr/hyprland.lua".text = ''
    require("monitor")
    local mainMod = "SUPER"

    ----------------------------------------------------------------------
    -- Autostart.
    ----------------------------------------------------------------------
    hl.on("hyprland.start", function()

        -- Set cursor as hyprland doesn't respect gtk.
        hl.exec_cmd('hyprctl setcursor "Capitaine Cursors (Gruvbox)" 30')

        -- Startup scripts.
        hl.exec_cmd("wallpaper-autostart")
        hl.exec_cmd("iwwc-launcher")
    end)

    ----------------------------------------------------------------------
    -- Settings.
    ----------------------------------------------------------------------
    hl.config({
        general = {
            border_size = 2,
            col = {
                active_border   = { colors = { "rgb(427b58)", "rgb(b8bb26)" }, angle = 45 },
                inactive_border = "rgb(3c3836)",
            },
            gaps_in  = 3,
            gaps_out = 6,
            layout   = "dwindle",
        },

        decoration = {
            rounding = 4,
            blur = {
                enabled = true,
            },
            shadow = {
                enabled = false,
            },
        },

        dwindle = {
            preserve_split = true,
        },

        ecosystem = {
            no_donation_nag = true,
            no_update_news  = true,
        },

        misc = {
            background_color        = "0x282828",
            disable_hyprland_logo   = true,
            disable_splash_rendering = true,
            enable_anr_dialog       = false,
            font_family             = "0xProto",
            vrr                     = 0,
            initial_workspace_tracking = 0 -- TODO rm when fixed: https://github.com/hyprwm/Hyprland/discussions/14840
        },

        input = {
            focus_on_close = 1,
            follow_mouse   = 1,
            kb_layout      = "us,ru",
            kb_options     = "grp:win_space_toggle",
            kb_variant     = ",",
            touchpad = {
                clickfinger_behavior = true,
                natural_scroll       = true,
                scroll_factor        = 0.4,
            },
        },

        animations = {
            enabled = true,
        },
    })

    ----------------------------------------------------------------------
    -- Animations.
    ----------------------------------------------------------------------
    hl.curve("ease", { type = "bezier", points = { { 0.4, 0.02 }, { 0.21, 1 } } })

    hl.animation({ leaf = "windows",    enabled = true, speed = 1.5, bezier = "ease",    style = "slide" })
    hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.5, bezier = "ease",    style = "slide" })
    hl.animation({ leaf = "border",     enabled = true, speed = 6,   bezier = "default" })
    hl.animation({ leaf = "fade",       enabled = true, speed = 3,   bezier = "ease" })
    hl.animation({ leaf = "workspaces", enabled = true, speed = 1.5, bezier = "ease" })

    ----------------------------------------------------------------------
    -- Trackpad gestures.
    ----------------------------------------------------------------------
    hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

    ----------------------------------------------------------------------
    -- Per-device input config.
    ----------------------------------------------------------------------
    hl.device({
        name        = "apple-inc.-magic-trackpad-1",
        sensitivity = 0.3,
    })

    hl.device({
        name          = "apple-inc.-magic-trackpad",
        sensitivity   = 0.3,
        accel_profile = "adaptive",
    })

    ----------------------------------------------------------------------
    -- Keybinds.
    ----------------------------------------------------------------------
    -- Backup
    hl.bind(mainMod .. "+R", hl.dsp.exec_cmd("anyrun"))

    -- Drag can't be ported to swhkdp yet
    hl.bind(mainMod .. "+mouse:272", hl.dsp.window.drag())
    hl.bind(mainMod .. "+mouse:273", hl.dsp.window.resize())
    hl.bind("ALT+mouse:272",         hl.dsp.window.resize())

    -----------------------------------------------------------------------
    -- Popup settings.
    -----------------------------------------------------------------------
    hl.window_rule({
        match = { class = "nm-connection-editor" },
        size  = "monitor_w*0.3 monitor_h*0.65",
        move  = "monitor_w-monitor_w*0.3-20 60",
    })

    hl.window_rule({
        match = { class = "(?i)(blueman-manager|.blueman-manager-wrapped|com.saivert.pwvucontrol)" },
        size  = "monitor_w*0.37 monitor_h*0.71",
        move  = "monitor_w-monitor_w*0.37-20 60",
    })

    ----------------------------------------------------------------------
    -- File picker.
    ----------------------------------------------------------------------
    hl.window_rule({
        match = {
            title = "(?i)((choose (files|an image)|open (file(s)?|video|folder)|"
                .. "([image|video] file|save (as|image|video|file)|local file|file upload))|new archive)",
        },
        tag = "+fileOperation",
    })
    hl.window_rule({
        match = { tag = "fileOperation" },
        float  = true,
        size   = "monitor_w*0.35 monitor_h*0.7",
        center = true,
    })

    ----------------------------------------------------------------------
    -- Other window rules.
    ----------------------------------------------------------------------

    -- Floating + centered for assorted tools.
    hl.window_rule({
        -- TODO: add minecraft
        match = { class = "(?i)(gnome-disks|gparted|kitty|veracrypt|polkit-gnome-authentication-agent-1)" },
        tag = "+floatingCentered",
    })
    hl.window_rule({
        match = { tag = "floatingCentered" },
        float  = true,
        center = true,
    })

    -- Translucency for various apps. Two values = active, inactive (see WindowRuleApplicator opacity handling).
    hl.window_rule({
        match   = { class = "(?i)(spotify|nemo|org.gnome.nautilus|com.system76.cosmicfiles|code-url-handler|"
        .. "code|org.telegram.desktop|gnome-disks|gparted|alacritty|kitty)" },
        opacity = "0.95 0.9",
    })

    -- Floating + dimmed for system control panels.
    hl.window_rule({
        match = { class = "(?i)(blueman-manager|.blueman-manager-wrapped|nm-connection-editor|com.saivert.pwvucontrol)" },
        tag = "+floatOp",
    })
    hl.window_rule({
        match   = { tag = "floatOp" },
        float   = true,
        opacity = "0.8",
    })

    hl.window_rule({
        match = { class = "(?i)(wlroots)" },
        float = true,
    })

    -- Browsers.
    hl.window_rule({
        match   = { class = "(?i)(floorp|firefox)" },
        opacity = "0.95 0.95",
    })

    -- Pin discord-likes to workspace 2.
    hl.window_rule({
        match     = { class = "(?i)(equibop|discord|vesktop)" },
        workspace = "2",
    })

    -- Hide

    hl.window_rule({ match = { class = "(?i)(io.github.tobagin.karere|com.ayugram.desktop)" }, no_screen_share=true})
    hl.window_rule({ match = { title = "(?i)(✳ Claude Code)" }, no_screen_share=true })

    -- Deadlocked: no blur, fully opaque.
    hl.window_rule({
        match   = { class = "deadlocked" },
        no_blur = true,
        opaque  = true,
    })

  '';
}
