{config, ...}: {
  services.swaync = {
    enable = true;
    settings = {
      control-center-layer = "overlay";
      control-center-height = 600;
      control-center-width = 500;
      control-center-margin-top = 20;
      control-center-margin-bottom = 20;
      control-center-margin-right = 20;
      control-center-margin-left = 20;
      cssPriority = "user";
      fit-to-screen = true;
      hide-on-action = true;
      hide-on-clear = false;
      image-visibility = "when-available";
      keyboard-shortcuts = true;
      layer = "overlay";
      layer-shell = true;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
      notification-icon-size = 64;
      notification-inline-replies = true;
      notification-window-width = 450;
      positionX = "right";
      positionY = "top";
      script-fail-notify = true;
      timeout = 3;
      timeout-low = 3;
      timeout-critical = 0;
      transition-time = 200;

      widgets = [
        "title"
        "dnd"
        "mpris"
        "volume"
        "notifications"
      ];

      widget-config = {
        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = "Clear All";
        };
        dnd = {
          text = "Do Not Disturb";
        };
        label = {
          max-lines = 5;
          text = "Label Text";
        };
        mpris = {
          image-size = 96;
          image-radius = 12;
          blur = true;
        };
        volume = {
          label = "󰕾";
          show-per-app = true;
        };
      };
    };
    style = ''
      .widget-backlight, .widget-menubar > box > revealer > box, .widget-menubar > box > .menu-button-bar, .widget-buttons-grid, .widget-dnd, .widget-title, .notification-group {
        background-color: #3c3836;
        padding: 8px;
        margin: 8px;
        border-radius: 12px;
      }

      .notification-row {
        outline: none;
      }

      .notification-row:focus, .notification-row:hover {
        background: transparent;
      }

      .notification-row .notification-background {
        margin: 3px;
        border: none;
      }

      .notification-row .notification-background .close-button {
        /* The notification Close Button */
        background: #3c3836;
        color: #ebdbb2;
        text-shadow: none;
        padding: 0;
        border-radius: 100%;
        margin-top: 5px;
        margin-right: 5px;
        box-shadow: none;
        border: none;
        min-width: 24px;
        min-height: 24px;
      }

      .notification-row .notification-background .close-button:hover {
        box-shadow: none;
        background: rgba(255, 255, 255, 0.15);
        transition: background 0.15s ease-in-out;
        border: none;
      }

      .notification-row .notification-background .notification {
        /* The actual notification */
        border-radius: 12px;
        border: 1px solid #d5c4a1;
        padding: 0;
        transition: background 0.15s ease-in-out;
        background: #3c3836;
      }

      .notification-row .notification-background .notification.low {
        /* Low Priority Notification */
      }

      .notification-row .notification-background .notification.normal {
        /* Normal Priority Notification */
      }

      .notification-row .notification-background .notification.critical {
        /* Critical Priority Notification */
      }

      .notification-row .notification-background .notification .notification-action, .notification-row .notification-background .notification .notification-default-action {
        padding: 4px;
        margin: 0;
        box-shadow: none;
        background: transparent;
        border: none;
        color: #ebdbb2;
        transition: background 0.15s ease-in-out;
      }

      .notification-row .notification-background .notification .notification-action:hover, .notification-row .notification-background .notification .notification-default-action:hover {
        -gtk-icon-effect: none;
        background: #504945;
      }

      .notification-row .notification-background .notification .notification-default-action {
        /* The large action that also displays the notification summary and body */
        border-radius: 12px;
      }

      .notification-row .notification-background .notification .notification-default-action:not(:only-child) {
        /* When alternative actions are visible */
        border-bottom-left-radius: 0px;
        border-bottom-right-radius: 0px;
      }

      .notification-row .notification-background .notification .notification-default-action .notification-content {
        background: transparent;
        border-radius: 12px;
        padding: 4px;
      }

      .notification-row .notification-background .notification .notification-default-action .notification-content .image {
        /* Notification Primary Image */
        -gtk-icon-effect: none;
        border-radius: 100px;
        /* Size in px */
        margin: 4px;
      }

      .notification-row .notification-background .notification .notification-default-action .notification-content .app-icon {
        /* Notification app icon (only visible when the primary image is set) */
        -gtk-icon-effect: none;
        -gtk-icon-shadow: 0 1px 4px black;
        margin: 6px;
      }

      .notification-row .notification-background .notification .notification-default-action .notification-content .text-box .summary {
        /* Notification summary/title */
        font-size: 16px;
        font-weight: bold;
        background: transparent;
        color: #ebdbb2;
        text-shadow: none;
      }

      .notification-row .notification-background .notification .notification-default-action .notification-content .text-box .time {
        /* Notification time-ago */
        font-size: 16px;
        font-weight: bold;
        background: transparent;
        color: #ebdbb2;
        text-shadow: none;
        margin-right: 30px;
      }

      .notification-row .notification-background .notification .notification-default-action .notification-content .text-box .body {
        /* Notification body */
        font-size: 15px;
        font-weight: normal;
        background: transparent;
        color: #ebdbb2;
        text-shadow: none;
      }

      .notification-row .notification-background .notification .notification-default-action .notification-content progressbar {
        /* The optional notification progress bar */
        margin-top: 4px;
      }

      .notification-row .notification-background .notification .notification-default-action .notification-content .body-image {
        /* The "extra" optional bottom notification image */
        margin-top: 4px;
        background-color: white;
        border-radius: 12px;
        -gtk-icon-effect: none;
      }

      .notification-row .notification-background .notification .notification-default-action .notification-content .inline-reply {
        /* The inline reply section */
        margin-top: 4px;
      }

      .notification-row .notification-background .notification .notification-default-action .notification-content .inline-reply .inline-reply-entry {
        background: #ff0001;
        color: #ebdbb2;
        caret-color: #ebdbb2;
        border: 1px solid #d5c4a1;
        border-radius: 12px;
      }

      .notification-row .notification-background .notification .notification-default-action .notification-content .inline-reply .inline-reply-button {
        margin-left: 4px;
        background: #bdae93;
        border: 1px solid #d5c4a1;
        border-radius: 12px;
        color: #ebdbb2;
      }

      .notification-row .notification-background .notification .notification-default-action .notification-content .inline-reply .inline-reply-button:disabled {
        background: initial;
        color: #bdae93;
        border: 1px solid #d5c4a1;
        border-color: transparent;
      }

      .notification-row .notification-background .notification .notification-default-action .notification-content .inline-reply .inline-reply-button:hover {
        background: #504945;
      }

      .notification-row .notification-background .notification .notification-action {
        /* The alternative actions below the default action */
        border-top: 1px solid #d5c4a1;
        border-radius: 0px;
        border-right: 1px solid #d5c4a1;
      }

      .notification-row .notification-background .notification .notification-action:first-child {
        /* add bottom border radius to eliminate clipping */
        border-bottom-left-radius: 12px;
      }

      .notification-row .notification-background .notification .notification-action:last-child {
        border-bottom-right-radius: 12px;
        border-right: none;
      }

      .notification-group {
        /* Styling only for Grouped Notifications */
      }

      .notification-group.low {
        /* Low Priority Group */
      }

      .notification-group.normal {
        /* Low Priority Group */
      }

      .notification-group.critical {
        /* Low Priority Group */
      }

      .notification-group .notification-group-buttons, .notification-group .notification-group-headers {
        margin: 0 16px;
        color: #ebdbb2;
      }

      .notification-group .notification-group-headers {
        /* Notification Group Headers */
      }

      .notification-group .notification-group-headers .notification-group-icon {
        color: #ebdbb2;
      }

      .notification-group .notification-group-headers .notification-group-header {
        color: #ebdbb2;
      }

      .notification-group .notification-group-buttons {
        /* Notification Group Buttons */
      }

      .notification-group.collapsed .notification-row .notification {
        background-color: #3c3836;
      }

      .notification-group.collapsed .notification-row:not(:last-child) {
        /* Top notification in stack */
        /* Set lower stacked notifications opacity to 0 */
      }

      .notification-group.collapsed .notification-row:not(:last-child) .notification-action,
      .notification-group.collapsed .notification-row:not(:last-child) .notification-default-action {
        opacity: 0;
      }

      .notification-group.collapsed:hover .notification-row:not(:only-child) .notification {
        background-color: #504945;
      }

      .control-center {
        /* The Control Center which contains the old notifications + widgets */
        background: rgba(40, 40, 40, 0.9);
        color: #ebdbb2;
        border-radius: 10px;
        border: 1px solid #d5c4a1;
      }

      .control-center .control-center-list-placeholder {
        /* The placeholder when there are no notifications */
        opacity: 0.5;
      }

      .control-center .control-center-list {
        background: transparent;
      }

      .control-center .control-center-list .notification {
        background: #504945;
      }

      .blank-window {
        background: transparent;
      }

      .floating-notifications {
        background: transparent;
      }

      .floating-notifications .notification {
        margin: 15px;
        box-shadow: none;
        padding: 0;
      }

      /*** Widgets ***/
      /* Title widget */
      .widget-title {
        font-size: 1.5rem;
      }

      .widget-title > button {
        font-size: initial;
        color: #ebdbb2;
        text-shadow: none;
        background: #3c3836;
        border: 1px solid #d5c4a1;
        box-shadow: none;
        border-radius: 12px;
      }

      .widget-title > button:hover {
        background: #504945;
      }

      /* DND widget */
      .widget-dnd {
        color: #ebdbb2;
        font-size: 1.1rem;
      }

      .widget-dnd > switch {
        font-size: initial;
        border-radius: 12px;
        background: #bdae93;
        border: 1px solid #d5c4a1;
        box-shadow: none;
      }

      .widget-dnd > switch:checked {
        background: #fe8019;
      }

      .widget-dnd > switch slider {
        background: #282828;
        border-radius: 12px;
      }

      /* Label widget */
      .widget-label {
        margin: 8px;
      }

      .widget-label > label {
        font-size: 1.1rem;
      }

      /* Mpris widget */
      .widget-mpris .widget-mpris-player {
        padding: 8px;
        padding: 16px;
        margin: 16px 20px;
        background-color: rgba(40, 40, 40, 0.55);
        border-radius: 12px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.75);
      }

      .widget-mpris .widget-mpris-player button:hover {
        background: #504945;
      }

      .widget-mpris .widget-mpris-player .widget-mpris-album-art {
        border-radius: 12px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.75);
      }

      .widget-mpris .widget-mpris-player .widget-mpris-title {
        font-weight: bold;
        font-size: 1.25rem;
      }

      .widget-mpris .widget-mpris-player .widget-mpris-subtitle {
        font-size: 1.1rem;
      }

      .widget-mpris .widget-mpris-player > box > button:hover {
        background-color: rgba(40, 40, 40, 0.5);
      }

      .widget-mpris > box > button {
        color: transparent;
        background: transparent;
      }

      .widget-mpris > box > button:hover {
        color: #ebdbb2;
        background: rgba(40, 40, 40, 0.5);
      }

      .widget-mpris > box > button:disabled {
        color: transparent;
        background: transparent;
      }

      /* Buttons widget */
      .widget-buttons-grid > flowbox > flowboxchild > button {
        background: #504945;
        border-radius: 12px;
      }

      .widget-buttons-grid > flowbox > flowboxchild > button.toggle:checked {
        /* style given to the active toggle button */
      }

      /* Menubar widget */
      .widget-menubar > box > .menu-button-bar > button {
        border: none;
        background: #504945;
      }

      .widget-menubar > box > revealer > box > button {
        margin: 3px;
        background: #504945;
        border: none;
      }

      .topbar-buttons > button {
        border: none;
        background: transparent;
      }

      /* Volume widget */
      .widget-volume {
        background-color: #3c3836;
        padding: 8px;
        margin: 8px;
        border-radius: 12px;
      }

      .widget-volume > box > button {
        background: transparent;
        border: none;
      }

      .per-app-volume {
        background-color: #504945;
        padding: 4px 8px 8px 8px;
        margin: 8px;
        border-radius: 12px;
      }

      .per-app-volume .activatable:hover {
        background: none;
        border: none;
        padding: 8px;
        border-radius: 8px;
      }

      /* Backlight widget */
      /* Inhibitors widget */
      .widget-inhibitors {
        margin: 8px;
        font-size: 1.5rem;
      }

      .widget-inhibitors > button {
        font-size: initial;
        color: #ebdbb2;
        text-shadow: none;
        background: #bdae93;
        border: 1px solid #d5c4a1;
        box-shadow: none;
        border-radius: 12px;
      }

      .widget-inhibitors > button:hover {
        background: #504945;
      }

    '';
  };
}
