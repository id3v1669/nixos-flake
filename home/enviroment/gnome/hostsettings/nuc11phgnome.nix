{ config, lib, pkgs, ... }:

{
  dconf.settings = (with lib.hm.gvariant; 
      {
        "com/raggesilver/BlackBox" = {
          opacity = mkUint32 88;
          remember-window-size = true;
          scrollback-mode = mkUint32 1;
          theme-dark = "Dracula";
          window-height = mkUint32 875;
          window-width = mkUint32 924;
        };
        "org/gnome/desktop/input-sources" = {
          sources = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "xkb" "ru" ]) ];
          xkb-options = [ "terminate:ctrl_alt_bksp" ];
        };
        "org/gnome/desktop/interface" = {
          show-battery-percentage = true;
        };
        "org/gnome/desktop/peripherals/touchpad" = {
          tap-to-click = true;
          two-finger-scrolling-enabled = true;
        };
        "org/gnome/desktop/wm/keybindings" = {
          move-to-workspace-left = [ "<Shift><Control>Left" ];
          move-to-workspace-right = [ "<Shift><Control>Right" ];
          switch-to-workspace-left = [ "<Control>Left" ];
          switch-to-workspace-right = [ "<Control>Right" ];
        };
        "org/gnome/mutter" = {
          dynamic-workspaces = true;
          edge-tiling = true;
        };
        "org/gnome/settings-daemon/plugins/media-keys" = {
          custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" ];
        };
        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
          binding = "<Shift><Super>t";
          command = "blackbox";
          name = "blackbox";
        };
        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
          binding = "<Shift><Super>a";
          command = "alacritty";
          name = "alacrittylauncher";
        };
        "org/gnome/settings-daemon/plugins/power" = {
          idle-dim = false;
          sleep-inactive-ac-type = "nothing";
          sleep-inactive-battery-timeout = 1800;
          sleep-inactive-battery-type = "suspend";
        };
        "org/gnome/shell" = {
          enabled-extensions = [ "quick-settings-tweaks@qwreey" "appindicatorsupport@rgcjonas.gmail.com" "gsconnect@andyholmes.github.io" "notification-banner-reloaded@marcinjakubowski.github.com" ];
          #favorite-apps = [ "net.cozic.joplin_desktop.desktop" "firefox.desktop" "com.raggesilver.BlackBox.desktop" "org.telegram.desktop.desktop" "com.discordapp.Discord.desktop" "de.shorsh.discord-screenaudio.desktop" "steam.desktop" "spotify.desktop" "org.gnome.Nautilus.desktop" ];
          welcome-dialog-last-shown-version = "44.2";
        };
        "org/gnome/shell/app-switcher" = {
          current-workspace-only = false;
        };
        "org/gnome/shell/extensions/quick-settings-tweaks" = {
          list-buttons = "[{\"name\":\"Clutter_Actor\",\"label\":null,\"visible\":true},{\"name\":\"SystemItem\",\"label\":null,\"visible\":true},{\"name\":\"OutputStreamSlider\",\"label\":null,\"visible\":true},{\"name\":\"St_BoxLayout\",\"label\":null,\"visible\":true},{\"name\":\"InputStreamSlider\",\"label\":null,\"visible\":false},{\"name\":\"BrightnessItem\",\"label\":null,\"visible\":true},{\"name\":\"NMWiredToggle\",\"label\":null,\"visible\":false},{\"name\":\"NMWirelessToggle\",\"label\":null,\"visible\":true},{\"name\":\"NMModemToggle\",\"label\":null,\"visible\":false},{\"name\":\"NMBluetoothToggle\",\"label\":null,\"visible\":false},{\"name\":\"NMVpnToggle\",\"label\":null,\"visible\":false},{\"name\":\"BluetoothToggle\",\"label\":null,\"visible\":true},{\"name\":\"PowerProfilesToggle\",\"label\":null,\"visible\":false},{\"name\":\"NightLightToggle\",\"label\":\"Night Light\",\"visible\":true},{\"name\":\"DarkModeToggle\",\"label\":\"Dark Style\",\"visible\":true},{\"name\":\"RfkillToggle\",\"label\":\"Airplane Mode\",\"visible\":true},{\"name\":\"RotationToggle\",\"label\":\"Auto Rotate\",\"visible\":false},{\"name\":\"DndQuickToggle\",\"label\":null,\"visible\":true},{\"name\":\"BackgroundAppsToggle\",\"label\":\"No Background Apps\",\"visible\":false},{\"name\":\"MediaSection\",\"label\":null,\"visible\":false},{\"name\":\"Notifications\",\"label\":null,\"visible\":false}]";
        };
        "org/gnome/shell/world-clocks" = {
          locations = "@av []";
        };
        "org/gnome/software" = {
          first-run = false;
        };
      }
    );
}