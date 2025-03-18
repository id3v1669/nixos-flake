{
  config,
  pkgs,
  ...
}: let
  clp = config.palette;
in {
  home.file.".local/share/Steam" = {
    source = pkgs.adwaita-for-steam.override {
      customCss = pkgs.writeText "customSteam.css" ''
        :root {

        	/* gruvbox colors */
        	--bg0: ${clp.base06.rgbS};
        	--bg0_s: ${clp.base04.rgbS};
        	--bg0_h: ${clp.base07.rgbS};
        	--bg1: ${clp.base04.rgbS};
        	--bg2: ${clp.base05.rgbS};
        	--bg3: ${clp.base05.rgbS};
        	--fg0: ${clp.base00.rgbS};
        	--fg1: ${clp.base02.rgbS};
        	--accent: ${clp.base0D.rgbS};
        	--green: ${clp.base11.rgbS};
        	--blue: ${clp.base17.rgbS};
        	--orange: ${clp.base0B.rgbS};
        	--offline: ${clp.base03.rgbS};
        	--red: ${clp.base08.rgbS};
        	--popvers-bg: ${clp.base07.rgbS};

        	/* The main accent color and the matching text value */
        	--adw-accent-bg-rgb: var(--accent);
        	--adw-accent-fg-rgb: var(--fg0);
        	--adw-accent-rgb: var(--accent);

        	/* destructive-action buttons */
        	--adw-destructive-bg-rgb: var(--accent);
        	--adw-destructive-fg-rgb: var(--bg0);
        	--adw-destructive-rgb: var(--accent);

        	/* Levelbars, entries, labels and infobars. These don't need text colors */
        	--adw-success-bg-rgb: var(--green);
        	--adw-success-fg-rgb: var(--bg0);
        	--adw-success-rgb: var(--green);

        	--adw-warning-bg-rgb: var(--orange);
        	--adw-warning-fg-rgb: var(--fg0);
        	--adw-warning-rgb: var(--orange);

        	--adw-error-bg-rgb: var(--red);
        	--adw-error-fg-rgb: var(--fg0);
        	--adw-error-rgb: var(--red);

        	/* Window */
        	--adw-window-bg-rgb: var(--bg0);
        	--adw-window-fg-rgb: var(--fg0);

        	/* Header bar, search bar, tab bar */
        	--adw-headerbar-bg-rgb: var(--bg0_h);
        	--adw-headerbar-fg-rgb: var(--fg0);
        	--adw-headerbar-border-rgb: var(--bg3);
        	--adw-headerbar-backdrop-rgb: var(--adw-window-bg-rgb);

        	/* Split pane views */
        	--adw-sidebar-bg-rgb: var(--bg0_h);
        	--adw-sidebar-fg-rgb: var(--fg1);
        	--adw-sidebar-backdrop-rgb: 255, 255, 255;

        	/* Cards, boxed lists */
        	--adw-card-bg-rgb: 146, 131, 116; /* do not change! */
        	--adw-card-fg-rgb: var(--fg1);

        	/* Dialogs */
        	--adw-dialog-bg-rgb: var(--bg0);
        	--adw-dialog-fg-rgb: var(--fg1);

        	/* Popovers */
        	--adw-popover-bg-rgb: var(--popvers-bg);
        	--adw-popover-fg-rgb: var(--fg1);

        	/* Thumbnails */
        	--adw-thumbnail-bg-rgb: var(--bg0);
        	--adw-thumbnail-fg-rgb: var(--fg1);

        	/* Miscellaneous */
        	--adw-shade-rgb: var(--bg3);
        	--adw-shade-a: 0.36;

        	/* Skin-specific */
        	--adw-user-offline-rgb: var(--offline);
        	--adw-user-online-rgb: var(--blue);
        	--adw-user-ingame-rgb: var(--green);
        }
      '';
      extraOptions = [
        "library/hide_whats_new"
      ];
    };
    recursive = true;
  };
}
