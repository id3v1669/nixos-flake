{ config
, lib
, pkgs
, desk
, ...
}:
let
    inherit (import ./../../../lib/h2rgba.nix { inherit lib; }) hexToRgba;
    inherit (import ./../../../lib/h2rgb.nix { inherit lib; }) hexToRgb;
in
{
  systemd.user.services = {} // lib.optionalAttrs (desk == "desktop") {
    arrpc = {
		  Unit = {
        Description = "arrpc service";
   	    After = ["default.target" ];
      };
		  Service = {
			  ExecStart = "${pkgs.arrpc}/bin/arrpc";
        Restart = "on-failure";
		  };
		  Install = { WantedBy = [ "default.target" ]; };
    };
  };
  home.file.".config/vesktop/themes/usertheme.css".text = ''

.wrapper__7bcde .link__95dc0 /* channels */,
.container__4f20e /* members */,
.channel_c21703 /* dms */,
.side_b4b3f6 .item__48dda /* settings */ {
    transition: margin-left 0.2s ease;
}
.wrapper__7bcde:hover .link__95dc0,
.side_b4b3f6 .item__48dda:hover {
    margin-left: 10px;
}
.container__4f20e:hover,
.channel_c21703:hover {
    margin-left: 18px;
}

button[class*=emojiButtonNormal] > div > div {
    filter: grayscale(0.77) hue-rotate(185deg) brightness(1.015) opacity(100%) !important;
  }
  
[data-popout-root],
  html {
    --brand-experiment: #${config.colorScheme.palette.base0D};
    --brand-experiment-100: white;
    --brand-experiment-130: white;
    --brand-experiment-160: white;
    --brand-experiment-200: white;
    --brand-experiment-230: white;
    --brand-experiment-260: white;
    --brand-experiment-300: white;
    --brand-experiment-330: #${config.colorScheme.palette.base06};
    --brand-experiment-360: #${config.colorScheme.palette.base06};
    --brand-experiment-400: #${config.colorScheme.palette.base05};
    --brand-experiment-430: #${config.colorScheme.palette.base05};
    --brand-experiment-460: #${config.colorScheme.palette.base07};
    --brand-experiment-500: #${config.colorScheme.palette.base07};
    --brand-experiment-530: #${config.colorScheme.palette.base07};
    --brand-experiment-560: #${config.colorScheme.palette.base07};
    --brand-experiment-600: #${config.colorScheme.palette.base0D};
    --brand-experiment-630: #${config.colorScheme.palette.base0D};
    --brand-experiment-660: #${config.colorScheme.palette.base0D};
    --brand-experiment-700: #${config.colorScheme.palette.base0D};
    --brand-experiment-730: #${config.colorScheme.palette.base0D};
    --brand-experiment-760: #${config.colorScheme.palette.base0D};
    --brand-experiment-800: #${config.colorScheme.palette.base0D};
    --brand-experiment-830: #${config.colorScheme.palette.base0D};
    --brand-experiment-860: #${config.colorScheme.palette.base0D};
    --brand-experiment-900: #${config.colorScheme.palette.base0D};
    --brand-experiment-05a: ${hexToRgba "${config.colorScheme.palette.base07}" "0.05"};
    --brand-experiment-10a: ${hexToRgba "${config.colorScheme.palette.base07}" "0.1"};
    --brand-experiment-15a: ${hexToRgba "${config.colorScheme.palette.base07}" "0.15"};
    --brand-experiment-20a: ${hexToRgba "${config.colorScheme.palette.base07}" "0.2"};
    --brand-experiment-25a: ${hexToRgba "${config.colorScheme.palette.base07}" "0.25"};
    --brand-experiment-30a: ${hexToRgba "${config.colorScheme.palette.base07}" "0.3"};
    --brand-experiment-35a: ${hexToRgba "${config.colorScheme.palette.base07}" "0.35"};
    --brand-experiment-40a: ${hexToRgba "${config.colorScheme.palette.base07}" "0.4"};
    --brand-experiment-45a: ${hexToRgba "${config.colorScheme.palette.base07}" "0.45"};
    --brand-experiment-50a: ${hexToRgba "${config.colorScheme.palette.base07}" "0.5"};
    --brand-experiment-55a: ${hexToRgba "${config.colorScheme.palette.base07}" "0.55"};
    --brand-experiment-60a: ${hexToRgba "${config.colorScheme.palette.base07}" "0.6"};
    --brand-experiment-65a: ${hexToRgba "${config.colorScheme.palette.base07}" "0.65"};
    --brand-experiment-70a: ${hexToRgba "${config.colorScheme.palette.base07}" "0.7"};
    --brand-experiment-75a: ${hexToRgba "${config.colorScheme.palette.base07}" "0.75"};
    --brand-experiment-80a: ${hexToRgba "${config.colorScheme.palette.base07}" "0.8"};
    --brand-experiment-85a: ${hexToRgba "${config.colorScheme.palette.base07}" "0.85"};
    --brand-experiment-90a: ${hexToRgba "${config.colorScheme.palette.base07}" "0.9"};
    --brand-experiment-95a: ${hexToRgba "${config.colorScheme.palette.base07}" "0.95"};
  }
  
  .theme-dark,
  .theme-light {
    --header-primary: #${config.colorScheme.palette.base05};
    --header-secondary: #${config.colorScheme.palette.base07};
    --text-normal: #${config.colorScheme.palette.base05};
    --text-muted: #${config.colorScheme.palette.base07};
    --text-link: #${config.colorScheme.palette.base0D};
    --text-link-low-saturation: #${config.colorScheme.palette.base05};
    --text-positive: #${config.colorScheme.palette.base0B};
    --text-warning: #${config.colorScheme.palette.base0A};
    --text-danger: #${config.colorScheme.palette.base08};
    --text-brand: #${config.colorScheme.palette.base0D};
    --background-primary: #${config.colorScheme.palette.base00};
    --background-secondary: #${config.colorScheme.palette.base01};
    --background-secondary-alt: #${config.colorScheme.palette.base01};
    --background-tertiary: #${config.colorScheme.palette.base01};
    --background-accent: #${config.colorScheme.palette.base0D};
    --background-floating: #${config.colorScheme.palette.base01};
    --background-nested-floating: #${config.colorScheme.palette.base01};
    --background-mobile-primary: #${config.colorScheme.palette.base00};
    --background-mobile-secondary: #${config.colorScheme.palette.base01};
    --chat-background: #${config.colorScheme.palette.base00};
    --chat-border: #${config.colorScheme.palette.base01};
    --chat-input-container-background: #${config.colorScheme.palette.base00};
    --background-modifier-hover: ${hexToRgba "${config.colorScheme.palette.base05}" "0.15"};
    --background-modifier-selected: ${hexToRgba "${config.colorScheme.palette.base05}" "0.2"};
    --background-modifier-accent: ${hexToRgba "${config.colorScheme.palette.base05}" "0.3"};
    --background-modifier-active: ${hexToRgba "${config.colorScheme.palette.base05}" "0.2"};
    --info-positive-background: ${hexToRgba "${config.colorScheme.palette.base0B}" "0.15"};
    --info-positive-foreground: #${config.colorScheme.palette.base0B};
    --info-positive-text: #${config.colorScheme.palette.base05};
    --info-warning-background: ${hexToRgba "${config.colorScheme.palette.base0A}" "0.15"};
    --info-warning-foreground: #${config.colorScheme.palette.base0A};
    --info-warning-text: #${config.colorScheme.palette.base05};
    --info-danger-background: ${hexToRgba "${config.colorScheme.palette.base08}" "0.15"};
    --info-danger-foreground: #${config.colorScheme.palette.base08};
    --info-danger-text: #${config.colorScheme.palette.base05};
    --info-help-background: ${hexToRgba "${config.colorScheme.palette.base05}" "0.15"};
    --info-help-foreground: #${config.colorScheme.palette.base05};
    --info-help-text: #${config.colorScheme.palette.base05};
    --status-positive-background: #${config.colorScheme.palette.base0B};
    --status-positive-text: #${config.colorScheme.palette.base00};
    --status-warning-background: #${config.colorScheme.palette.base0A};
    --status-warning-text: #${config.colorScheme.palette.base00};
    --status-danger-background: #${config.colorScheme.palette.base08};
    --status-danger-text: #${config.colorScheme.palette.base00};
    --status-danger: #${config.colorScheme.palette.base08};
    --status-positive: #${config.colorScheme.palette.base0B};
    --status-warning: #${config.colorScheme.palette.base0A};
    --status-yellow-400: #${config.colorScheme.palette.base0A};
    --status-green-600: #${config.colorScheme.palette.base0B};
    --primary-dark-600: #${config.colorScheme.palette.base00};
    --status-yellow-560: #${config.colorScheme.palette.base0A};
    --status-red-500: #${config.colorScheme.palette.base08};
    --status-red-530: #${config.colorScheme.palette.base08};
    --status-yellow-500: #${config.colorScheme.palette.base0A};
    --black-500: #${config.colorScheme.palette.base01};
    --green-360: #${config.colorScheme.palette.base0B};
    --yellow-360: #${config.colorScheme.palette.base0A};
    --yellow-300: #${config.colorScheme.palette.base0A};
    --red-400: #${config.colorScheme.palette.base08};
    --brand-500: #${config.colorScheme.palette.base0D};
    --brand-560: #${config.colorScheme.palette.base0D};
    --primary-100: #${config.colorScheme.palette.base07};
    --primary-300: #${config.colorScheme.palette.base07};
    --primary-400: #${config.colorScheme.palette.base07};
    --primary-dark-700: #${config.colorScheme.palette.base01};
    --status-green-560: #${config.colorScheme.palette.base0B};
    --white-400: #${config.colorScheme.palette.base05};
    --white-500: #${config.colorScheme.palette.base05};
    --guild-boosting-pink: #${config.colorScheme.palette.base0F};
    --premium-perk-yellow: #${config.colorScheme.palette.base0A};
    --premium-perk-purple: #${config.colorScheme.palette.base0E};
    --premium-perk-dark-blue: #${config.colorScheme.palette.base0D};
    --premium-perk-light-blue: #${config.colorScheme.palette.base07};
    --premium-perk-blue: #${config.colorScheme.palette.base0D};
    --premium-perk-green: #${config.colorScheme.palette.base0B};
    --premium-perk-pink: #${config.colorScheme.palette.base0F};
    --premium-perk-orange: #${config.colorScheme.palette.base09};
    --status-green-400: #${config.colorScheme.palette.base0B};
    --button-danger-background: #${config.colorScheme.palette.base08};
    --button-danger-background-hover: #${config.colorScheme.palette.base08};
    --button-danger-background-active: #${config.colorScheme.palette.base0D};
    --button-danger-background-disabled: #${config.colorScheme.palette.base08};
    --button-positive-background: #${config.colorScheme.palette.base0B};
    --button-positive-background-hover: #${config.colorScheme.palette.base0B};
    --button-positive-background-active: #${config.colorScheme.palette.base0B};
    --button-positive-background-disabled: #${config.colorScheme.palette.base0B};
    --button-secondary-background: #${config.colorScheme.palette.base03};
    --button-secondary-background-hover: #${config.colorScheme.palette.base02};
    --button-secondary-background-active: #${config.colorScheme.palette.base02};
    --button-secondary-background-disabled: #${config.colorScheme.palette.base03};
    --button-outline-danger-text: #${config.colorScheme.palette.base05};
    --button-outline-danger-border: #${config.colorScheme.palette.base08};
    --button-outline-danger-background: transparent;
    --button-outline-danger-background-hover: #${config.colorScheme.palette.base0F};
    --button-outline-danger-text-hover: #${config.colorScheme.palette.base00};
    --button-outline-danger-border-hover: #${config.colorScheme.palette.base0F};
    --button-outline-danger-background-active: #${config.colorScheme.palette.base08};
    --button-outline-danger-text-active: #${config.colorScheme.palette.base00};
    --button-outline-danger-border-active: #${config.colorScheme.palette.base0F};
    --button-outline-positive-text: #${config.colorScheme.palette.base05};
    --button-outline-positive-border: #${config.colorScheme.palette.base0B};
    --button-outline-positive-background: transparent;
    --button-outline-positive-background-hover: #${config.colorScheme.palette.base0B};
    --button-outline-positive-text-hover: #${config.colorScheme.palette.base00};
    --button-outline-positive-border-hover: #${config.colorScheme.palette.base0B};
    --button-outline-positive-background-active: #${config.colorScheme.palette.base0B};
    --button-outline-positive-text-active: #${config.colorScheme.palette.base00};
    --button-outline-positive-border-active: #${config.colorScheme.palette.base0B};
    --button-outline-brand-text: #${config.colorScheme.palette.base05};
    --button-outline-brand-border: #${config.colorScheme.palette.base0D};
    --button-outline-brand-background: transparent;
    --button-outline-brand-background-hover: #${config.colorScheme.palette.base07};
    --button-outline-brand-text-hover: #${config.colorScheme.palette.base00};
    --button-outline-brand-border-hover: #${config.colorScheme.palette.base07};
    --button-outline-brand-background-active: #${config.colorScheme.palette.base07};
    --button-outline-brand-text-active: #${config.colorScheme.palette.base00};
    --button-outline-brand-border-active: #${config.colorScheme.palette.base07};
    --button-outline-primary-text: #${config.colorScheme.palette.base05};
    --button-outline-primary-border: #${config.colorScheme.palette.base04};
    --button-outline-primary-background: transparent;
    --button-outline-primary-background-hover: #${config.colorScheme.palette.base04};
    --button-outline-primary-text-hover: #${config.colorScheme.palette.base00};
    --button-outline-primary-border-hover: #${config.colorScheme.palette.base04};
    --button-outline-primary-background-active: #${config.colorScheme.palette.base03};
    --button-outline-primary-text-active: #${config.colorScheme.palette.base00};
    --button-outline-primary-border-active: #${config.colorScheme.palette.base04};
    --modal-background: #${config.colorScheme.palette.base00};
    --modal-footer-background: #${config.colorScheme.palette.base01};
    --scrollbar-thin-thumb: #${config.colorScheme.palette.base0D};
    --scrollbar-thin-track: transparent;
    --scrollbar-auto-thumb: #${config.colorScheme.palette.base0D};
    --scrollbar-auto-track: #${config.colorScheme.palette.base01};
    --scrollbar-auto-scrollbar-color-thumb: #${config.colorScheme.palette.base0D};
    --scrollbar-auto-scrollbar-color-track: #${config.colorScheme.palette.base01};
    --input-background: #${config.colorScheme.palette.base01};
    --input-placeholder-text: #${config.colorScheme.palette.base07};
    --logo-primary: #${config.colorScheme.palette.base05};
    --control-brand-foreground: #${config.colorScheme.palette.base0D};
    --control-brand-foreground-new: #${config.colorScheme.palette.base0D};
    --mention-foreground: #${config.colorScheme.palette.base0D};
    --mention-background: ${hexToRgba "${config.colorScheme.palette.base07}" "0.3"};
    --background-mentioned: ${hexToRgba "${config.colorScheme.palette.base0A}" "0.1"};
    --background-mentioned-hover: ${hexToRgba "${config.colorScheme.palette.base0A}" "0.08"};
    --background-message-hover: ${hexToRgba "${config.colorScheme.palette.base01}" "0.25"};
    --background-message-automod: ${hexToRgba "${config.colorScheme.palette.base00}" "0.05"};
    --background-message-automod-hover: ${hexToRgba "${config.colorScheme.palette.base0F}" "0.1"};
    --background-message-highlight: ${hexToRgba "${config.colorScheme.palette.base07}" "0.1"};
    --background-message-highlight-hover: ${hexToRgba "${config.colorScheme.palette.base07}" "0.08"};
    --channels-default: #${config.colorScheme.palette.base07};
    --channel-icon: #${config.colorScheme.palette.base07};
    --channel-text-area-placeholder: ${hexToRgba "${config.colorScheme.palette.base07}" "0.5"};
    --channeltextarea-background: #${config.colorScheme.palette.base01};
    --activity-card-background: #${config.colorScheme.palette.base01};
    --textbox-markdown-syntax: #${config.colorScheme.palette.base04};
    --spoiler-revealed-background: #${config.colorScheme.palette.base02};
    --spoiler-hidden-background: #${config.colorScheme.palette.base04};
    --android-navigation-bar-background: #${config.colorScheme.palette.base01};
    --android-ripple: ${hexToRgba "${config.colorScheme.palette.base01}" "0.3"};
    --deprecated-card-bg: ${hexToRgba "${config.colorScheme.palette.base01}" "0.6"};
    --deprecated-card-editable-bg: ${hexToRgba "${config.colorScheme.palette.base01}" "0.3"};
    --deprecated-store-bg: #${config.colorScheme.palette.base00};
    --deprecated-quickswitcher-input-background: #${config.colorScheme.palette.base03};
    --deprecated-quickswitcher-input-placeholder: ${hexToRgba "${config.colorScheme.palette.base01}" "0.3"};
    --deprecated-text-input-bg: #${config.colorScheme.palette.base01};
    --deprecated-text-input-border: ${hexToRgba "${config.colorScheme.palette.base01}" "0.3"};
    --deprecated-text-input-border-hover: #${config.colorScheme.palette.base01};
    --deprecated-text-input-border-disabled: #${config.colorScheme.palette.base01};
    --deprecated-text-input-prefix: #${config.colorScheme.palette.base07};
    --focus-primary: #${config.colorScheme.palette.base0D};
    --interactive-normal: #${config.colorScheme.palette.base05};
    --interactive-muted: ${hexToRgba "${config.colorScheme.palette.base05}" "0.3"};
    --interactive-hover: #${config.colorScheme.palette.base05};
    --interactive-active: #${config.colorScheme.palette.base05};
    --search-popout-option-non-text-color: #${config.colorScheme.palette.base07};
  }
  
  ::selection {
    background-color: ${hexToRgba "${config.colorScheme.palette.base07}" "0.3"};
  }
  
  [class*=staffBadge_] {
    background-image: url("data:image/svg+xml,%3Csvg fill='none' height='24' viewBox='0 0 24 24' width='24' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='%23${config.colorScheme.palette.base01}'%3E%3Cpath d='m5.92127 6.03526s.22115-.33086.31286-.47743c.09172-.14657-.23743-.49286-.36514-.60257-.12772-.10971-.32914-.05486-.32914-.05486-1.60715.71229-2.41115 2.17372-2.52086 2.466-.10972.29229.27943.61115.56657.76715.132.072.342-.08743.47143-.20572l.04371-.04457.06772-.06857.00085-.00086 4.37229 4.35517.59743-.5975 1.09801-1.098-4.32173-4.43224z'/%3E%3Cpath d='m16.2505 10.6294.2306-.2194 2.0717 2.052c.0146.0129.03.018.0437.018.0395 0 .072-.036.072-.036s2.2937-2.2757 2.3015-2.2834c.0677-.0669 0-.1037 0-.1037l-1.7692-1.78119-.0026.00258-.2425-.23743.1354-.13029.2897.03343-.0548-.384.0728-.07371-.1088-.55372c-.378-.53571-1.4135-1.39371-1.4135-1.39371l-.5417-.09772-.0548.07286-.408-.06086.0394.348.0257.02572-.1209.12171-.6685-.654s-3.8795-2.10686-4.086-2.20457c-.1166-.054-.2023-.09-.2846-.09-.0634 0-.1251.02143-.1963.072-.1646.11571-.0677.34886-.0677.34886l2.412 4.45714.4826.47829-.1509.15085-.0557.05572-.3857-.05315.0591.38229-.1114.11143-.0197-.01972c-.018-.018-.0429-.02742-.0669-.02742s-.048.00942-.0668.02742c-.0369.03686-.0369.09686 0 .13372l.0197.01971-.0532.054-.0137-.01457c-.0188-.018-.0428-.02743-.0668-.02743-.0249 0-.0489.00943-.0669.02743-.0368.03686-.0368.09686 0 .13372l.0146.01457-1.0149 1.02004-.0231-.0232c-.0189-.018-.0429-.0274-.0669-.0274s-.048.0094-.0668.0274c-.0369.0369-.0369.0969 0 .1337l.024.0232-.054.054-.018-.0172c-.018-.0188-.0429-.0283-.066-.0283-.0249 0-.0489.0095-.0677.0283-.036.0369-.036.096 0 .1329l.018.018-.132.1337-.018.1697.0694.0712-.0017.0008-.084.0857-5.47632 5.4755-.07114-.0592-.22714.0326-.12858.1303-.00857-.0086c-.01885-.0189-.04285-.0283-.06685-.0283s-.04886.0094-.06686.0283c-.03686.0369-.03686.096 0 .1329l.01028.0102-.05314.0549-.00514-.0051c-.018-.0189-.04286-.0283-.06686-.0283s-.048.0094-.06686.0283c-.036.0368-.036.096 0 .1328l.006.0069-1.002 1.0191-.02057-.0206c-.01885-.0188-.042-.0274-.06685-.0274-.024 0-.048.0086-.06686.0274-.03686.0369-.03686.0969 0 .1338l.02228.0214-.05314.054-.01628-.0163c-.01886-.018-.04286-.0274-.06772-.0274-.02314 0-.048.0094-.066.0274-.03686.0369-.03686.0969 0 .1337l.01714.018-.07457.0763-.38828-.0694.02914.4337-.12257.1251.10628.5846s.16286.5091.498.8469c.32486.3274.82029.4842.84172.5005l.55971.0977.138-.1354.38572.0626-.06343-.3814.11743-.1149.054.054c.018.018.042.0274.066.0274s.04885-.0094.06685-.0274c.03686-.0377.03686-.0969 0-.1337l-.05314-.0532.05486-.0531.04628.0463c.018.0188.04286.0283.06686.0283s.048-.0095.06686-.0283c.03686-.0369.03686-.096 0-.1329l-.04543-.0463 1.01743-1.0037.04457.0446c.018.0189.04286.0274.06686.0274s.048-.0085.06685-.0274c.036-.0369.036-.0969 0-.1337l-.04371-.0429.054-.054.03771.0377c.018.018.042.0275.066.0275.02486 0 .04886-.0095.06686-.0275.03686-.0368.03686-.0968 0-.1337l-.03686-.0368.114-.1115.04115-.2442-.06086-.0609.00086-.0009.11057-.1097 5.43946-5.4411-.0026-.0052.1063.1098.1706-.0189.1534-.1543.0248.0249c.0189.018.0429.0274.0669.0274s.0489-.0094.0669-.0274c.0368-.0369.0368-.0969 0-.1337l-.0249-.0249.054-.0531.0189.0188c.018.018.042.0274.0668.0274.024 0 .048-.0094.066-.0274.0369-.0368.0369-.0968 0-.1337l-.0188-.0197 1.0165-1.0183.0266.0266c.018.018.042.0274.066.0274.0249 0 .0489-.0094.0669-.0274.0368-.0369.0368-.0969 0-.1337l-.0266-.0266.054-.054.0206.0214c.0188.018.0428.0274.0668.0274s.048-.0094.0669-.0274c.0368-.0377.0368-.0968 0-.1337l-.0206-.0214.1131-.1132.378.0592z'/%3E%3Cpath d='m17.0057 16.7793-2.4111-1.8274-.4294-.4423-1.6637 1.6637.4183.3995 1.5711 2.3562 2.1188 2.3203 2.4421-2.2783z'/%3E%3C/g%3E%3C/svg%3E") !important;
  }
  
  [class*=permissionCheckmark_] {
    background-image: url("data:image/svg+xml,%3Csvg height='18' width='18' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cpath d='m0 0h18v18h-18z'/%3E%3Cpath d='m14.25 14.25h-10.5v-10.5h7.5v-1.5h-7.5c-.8325 0-1.5.6675-1.5 1.5v10.5c0 .8284271.67157288 1.5 1.5 1.5h10.5c.8284271 0 1.5-.6715729 1.5-1.5v-6h-1.5zm-7.5675-6.94-1.0575 1.065 3.375 3.375 7.5-7.5-1.0575-1.065-6.4425 6.4425z' fill='%23${config.colorScheme.palette.base0B}'/%3E%3C/g%3E%3C/svg%3E") !important;
  }
  
  [class*=removeKeybind_] {
    background-image: url('data:image/svg+xml,%3Csvg xmlns="http://www.w3.org/2000/svg" width="18" height="18"%3E%3Cg fill="none" fill-rule="evenodd"%3E%3Cpath d="M0 0h18v18H0"/%3E%3Cpath fill="%23${config.colorScheme.palette.base01}" d="M14.25 4.8075L13.1925 3.75 9 7.9425 4.8075 3.75 3.75 4.8075 7.9425 9 3.75 13.1925 4.8075 14.25 9 10.0575l4.1925 4.1925 1.0575-1.0575L10.0575 9"/%3E%3C/g%3E%3C/svg%3E') !important;
  }
  
  [class*=removeGame_] {
    background-image: url("data:image/svg+xml,%3Csvg height='18' viewBox='0 0 18 18' width='18' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cpath d='m14.25 4.808-1.057-1.058-4.193 4.192-4.192-4.192-1.058 1.058 4.192 4.192-4.192 4.193 1.058 1.057 4.192-4.193 4.193 4.193 1.057-1.057-4.193-4.193z' fill-rule='nonzero' fill='%23${config.colorScheme.palette.base08}'/%3E%3Cpath d='m0 0h18v18h-18z'/%3E%3C/g%3E%3C/svg%3E") !important;
  }
  
  [class*=emojiRemove_] {
    background-image: url("data:image/svg+xml,%3Csvg height='18' viewBox='0 0 18 18' width='18' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cpath d='m14.25 4.808-1.057-1.058-4.193 4.192-4.192-4.192-1.058 1.058 4.192 4.192-4.192 4.193 1.058 1.057 4.192-4.193 4.193 4.193 1.057-1.057-4.193-4.193z' fill-rule='nonzero' fill='%23${config.colorScheme.palette.base08}'/%3E%3Cpath d='m0 0h18v18h-18z'/%3E%3C/g%3E%3C/svg%3E") !important;
  }
  
  [class*=lockIcon_] {
    content: url("data:image/svg+xml,%3Csvg height='14' viewBox='0 0 10 14' width='10' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='m553 515h-6v-1c0-1.654 1.346-3 3-3s3 1.346 3 3zm-4 6h2v-4h-2zm1-12c-2.762 0-5 2.238-5 5v1 4 2c0 1.104.896 2 2 2h6c1.104 0 2-.896 2-2v-2-4-1c0-2.762-2.238-5-5-5z' fill='%23${config.colorScheme.palette.base0B}' fill-rule='evenodd' transform='translate(-545 -509)'/%3E%3C/svg%3E") !important;
  }
  
  .theme-dark svg[class*=noItemsIcon_],
  .theme-light svg[class*=noItemsIcon_] {
    background-color: #${config.colorScheme.palette.base03};
  }
  
  .theme-dark svg[class*=tier1ProfilePerk_],
  .theme-light svg[class*=tier1ProfilePerk_] {
    color: #${config.colorScheme.palette.base0D} !important;
  }
  
  .theme-dark svg[class*=tier1BoostPerk_],
  .theme-light svg[class*=tier1BoostPerk_] {
    color: #${config.colorScheme.palette.base0F} !important;
  }
  
  .theme-dark svg[class*=tier1CustomEmojiPerk_],
  .theme-light svg[class*=tier1CustomEmojiPerk_] {
    color: #${config.colorScheme.palette.base0A} !important;
  }
  
  .theme-dark svg[class*=tier1UploadPerk_],
  .theme-light svg[class*=tier1UploadPerk_] {
    color: #${config.colorScheme.palette.base07} !important;
  }
  
  .theme-dark svg[class*=tier1StreamPerk_],
  .theme-light svg[class*=tier1StreamPerk_] {
    color: #${config.colorScheme.palette.base0B} !important;
  }
  
  .theme-dark svg[class*=guildBoostingIcon_],
  .theme-light svg[class*=guildBoostingIcon_] {
    color: #${config.colorScheme.palette.base0F} !important;
  }
  
  .theme-dark svg[class*=guildSubscriptionSlotIcon_],
  .theme-light svg[class*=guildSubscriptionSlotIcon_] {
    color: #${config.colorScheme.palette.base0F} !important;
  }
  
  .theme-dark svg[class*=guildSubscriberCountIcon_],
  .theme-light svg[class*=guildSubscriberCountIcon_] {
    color: #${config.colorScheme.palette.base0F} !important;
  }
  
  .theme-dark svg[class*=gemWithLabel_],
  .theme-light svg[class*=gemWithLabel_] {
    color: #${config.colorScheme.palette.base0F} !important;
  }
  
  .theme-dark svg[class*=gemWithoutLabel_],
  .theme-light svg[class*=gemWithoutLabel_] {
    color: #${config.colorScheme.palette.base07} !important;
  }
  
  .theme-dark svg[class*=memberBadgeIcon_],
  .theme-light svg[class*=memberBadgeIcon_] {
    color: #${config.colorScheme.palette.base0F} !important;
  }
  
  .theme-dark svg[class*=audioQualityIcon_],
  .theme-light svg[class*=audioQualityIcon_] {
    color: #${config.colorScheme.palette.base05} !important;
  }
  
  .theme-dark svg[class*=uploadSizeIcon_],
  .theme-light svg[class*=uploadSizeIcon_] {
    color: #${config.colorScheme.palette.base0F} !important;
  }
  
  .theme-dark svg[class*=threadIcon_],
  .theme-light svg[class*=threadIcon_] {
    color: #${config.colorScheme.palette.base0C} !important;
  }
  
  .theme-dark svg[class*=premiumIcon_],
  .theme-light svg[class*=premiumIcon_] {
    color: #${config.colorScheme.palette.base0F} !important;
  }
  
  .theme-dark svg[class*=gameIcon_],
  .theme-light svg[class*=gameIcon_] {
    color: #${config.colorScheme.palette.base05} !important;
  }
  
  .theme-dark svg[class*=tierMarkerLabelPlusIcon_],
  .theme-light svg[class*=tierMarkerLabelPlusIcon_] {
    color: #${config.colorScheme.palette.base0F} !important;
  }
  
  .theme-dark svg[class*=currentTierIcon_],
  .theme-light svg[class*=currentTierIcon_] {
    color: #${config.colorScheme.palette.base0F} !important;
  }
  
  .theme-dark svg[class*=tier3Icon_],
  .theme-light svg[class*=tier3Icon_] {
    color: #${config.colorScheme.palette.base0F} !important;
  }
  
  .theme-dark svg[class*=searchIcon_],
  .theme-light svg[class*=searchIcon_] {
    color: #${config.colorScheme.palette.base07} !important;
  }
  
  .theme-dark svg[class*=upsellIcon_],
  .theme-light svg[class*=upsellIcon_] {
    color: #${config.colorScheme.palette.base0F} !important;
  }
  
  [class*=lookFilled_][class*=colorBrand_], [class*=lookFilled_][class*=colorBrandNew_], [class*=lookFilled_][class*=colorLink_], [class*=lookFilled_][class*=colorYellow_], [class*=lookFilled_][class*=colorRed_], [class*=lookFilled_][class*=colorGreen_] {
    color: #${config.colorScheme.palette.base01};
  }
  [class*=lookFilled_][class*=colorBrand_] svg[class^=premiumIcon], [class*=lookFilled_][class*=colorBrandNew_] svg[class^=premiumIcon], [class*=lookFilled_][class*=colorLink_] svg[class^=premiumIcon], [class*=lookFilled_][class*=colorYellow_] svg[class^=premiumIcon], [class*=lookFilled_][class*=colorRed_] svg[class^=premiumIcon], [class*=lookFilled_][class*=colorGreen_] svg[class^=premiumIcon] {
    color: #${config.colorScheme.palette.base0F} !important;
  }
  [class*=lookFilled_][class*=colorBrand_] [class*=spinnerItem_], [class*=lookFilled_][class*=colorBrandNew_] [class*=spinnerItem_], [class*=lookFilled_][class*=colorLink_] [class*=spinnerItem_], [class*=lookFilled_][class*=colorYellow_] [class*=spinnerItem_], [class*=lookFilled_][class*=colorRed_] [class*=spinnerItem_], [class*=lookFilled_][class*=colorGreen_] [class*=spinnerItem_] {
    background-color: #${config.colorScheme.palette.base01};
  }
  [class*=lookFilled_][class*=colorBrand_] [class*=defaultColor_], [class*=lookFilled_][class*=colorBrandNew_] [class*=defaultColor_], [class*=lookFilled_][class*=colorLink_] [class*=defaultColor_], [class*=lookFilled_][class*=colorYellow_] [class*=defaultColor_], [class*=lookFilled_][class*=colorRed_] [class*=defaultColor_], [class*=lookFilled_][class*=colorGreen_] [class*=defaultColor_] {
    color: #${config.colorScheme.palette.base01};
  }
  [class*=lookFilled_][class*=colorPrimary_] {
    color: #${config.colorScheme.palette.base05};
  }
  
  button[class*=lookFilled_][class*=colorRed_]:active {
    background-color: #${config.colorScheme.palette.base08};
  }
  
  [class*=lookOutlined_][class*=colorPrimary_] {
    border-color: #${config.colorScheme.palette.base03};
  }
  [class*=lookOutlined_][class*=colorPrimary_]:hover {
    background-color: #${config.colorScheme.palette.base02};
    color: #${config.colorScheme.palette.base05};
    border-color: #${config.colorScheme.palette.base03};
  }
  
  div[class^=actionButtons] [class^=button][class*=buttonColor_],
  div[class^=actionButtons] [class^=button] [class*=buttonColor_] {
    background-color: #${config.colorScheme.palette.base03};
  }
  div[class^=actionButtons] [class^=button][class*=buttonColor_][class*=buttonActive_],
  div[class^=actionButtons] [class^=button] [class*=buttonColor_][class*=buttonActive_] {
    background-color: #${config.colorScheme.palette.base0B};
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=actionButtons] [class^=button][class*=buttonColor_][class*=buttonActive_] [class*=buttonContents_],
  div[class^=actionButtons] [class^=button] [class*=buttonColor_][class*=buttonActive_] [class*=buttonContents_] {
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=actionButtons] [class^=button][class*=buttonColor_][class*=buttonActive_] [class*=buttonContents_] svg,
  div[class^=actionButtons] [class^=button] [class*=buttonColor_][class*=buttonActive_] [class*=buttonContents_] svg {
    color: #${config.colorScheme.palette.base01};
  }
  
  [class*=lookInverted_][class*=colorBrand_] {
    color: var(--brand-experiment-600);
  }
  [class*=lookInverted_][class*=colorBrand_] svg[class^=premiumIcon] {
    color: #${config.colorScheme.palette.base0F} !important;
  }
  
  .theme-dark [class*=lookLink_][class*=colorPrimary_],
  .theme-light [class*=lookLink_][class*=colorPrimary_] {
    color: #${config.colorScheme.palette.base05};
  }
  .theme-dark [class*=lookFilled_][class*=colorTransparent_],
  .theme-light [class*=lookFilled_][class*=colorTransparent_] {
    color: #${config.colorScheme.palette.base05};
    background-color: #${config.colorScheme.palette.base02};
  }
  
  div[class*=button_][class*=dangerous_]:hover {
    color: #${config.colorScheme.palette.base08};
  }
  
  div[role=radio][class*=selected] {
    color: #${config.colorScheme.palette.base01};
  }
  div[role=radio][class*=selected][class*=allow] {
    background-color: #${config.colorScheme.palette.base0B};
  }
  
  [class*=container_][style*="background_color: var(__green_360)"] {
    --green-360: #${config.colorScheme.palette.base0B};
    background-color: #${config.colorScheme.palette.base0B} !important;
  }
  
  [class*=container_][style*="background_color: var(__primary_400)"],
  [class*=container_][style*="background_color: rgb(130, 133, 143)"] {
    background-color: #${config.colorScheme.palette.base01} !important;
  }
  
  .vc-spotify-button-row .vc-spotify-button.vc-spotify-shuffle-on, .vc-spotify-button-row .vc-spotify-button.vc-spotify-repeat-context, .vc-spotify-button-row .vc-spotify-button.vc-spotify-repeat-track {
    color: var(--interactive-normal);
  }
  .vc-spotify-button-row .vc-spotify-button.vc-spotify-repeat-off, .vc-spotify-button-row .vc-spotify-button.vc-spotify-shuffle-off {
    color: var(--text-muted);
  }
  
  [class*=topGuildEmojiBadge_] {
    background: linear-gradient(268.26deg, #${config.colorScheme.palette.base09}, #${config.colorScheme.palette.base08} 102.45%);
  }
  [class*=topGuildEmojiBadge_] * {
    color: #${config.colorScheme.palette.base01} !important;
  }
  
  [class*=newlyAddedBadge_] {
    background: linear-gradient(268.26deg, #${config.colorScheme.palette.base0C}, #${config.colorScheme.palette.base0B} 102.45%);
  }
  [class*=newlyAddedBadge_] * {
    color: #${config.colorScheme.palette.base01} !important;
  }
  
  [class*=lookFilled_] [class*=premiumSubscribeButton_] > [class*=premiumIcon_] {
    color: #${config.colorScheme.palette.base01} !important;
  }
  
  div[class^=layerContainer] button[class^=backButton][class*=lookBlank] {
    color: #${config.colorScheme.palette.base05};
  }
  
  div[class^=sidebarRegion] div[class^=serverBoostTabItem] svg[class^=icon] {
    fill: #${config.colorScheme.palette.base0F} !important;
  }
  div[class^=sidebarRegion] div[class^=serverBoostTabItem][class*=selected_] {
    background-color: #${config.colorScheme.palette.base0D} !important;
    color: #${config.colorScheme.palette.base01} !important;
  }
  div[class^=sidebarRegion] div[class^=serverBoostTabItem][class*=selected_] svg[class^=icon] {
    fill: #${config.colorScheme.palette.base01} !important;
  }
  div[class^=sidebarRegion] div[class^=premiumTab] > div > svg > path {
    fill: #${config.colorScheme.palette.base0F};
  }
  div[class^=sidebarRegion] div[class^=premiumTab] > div[class*=selected] {
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=sidebarRegion] div[class^=premiumTab] > div[class*=selected] svg > path {
    fill: #${config.colorScheme.palette.base01};
  }
  div[class^=sidebarRegion] div[class*=tabBarItemContainer_] [class*=textBadge_] {
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=sidebarRegion] div[class*=tabBarItemContainer_] [class*=textBadge_][style*="background-color: var(--brand-500);"] {
    background-color: #${config.colorScheme.palette.base0D} !important;
  }
  
  div[class^=contentRegion] div[class*=noticeRegion_] div[style="background_color: rgb(24, 25, 28);"] {
    background-color: #${config.colorScheme.palette.base01} !important;
  }
  div[class^=contentRegion] div[class^=streamerModeEnabledBtn] {
    background-color: #${config.colorScheme.palette.base0E};
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=contentRegion] [class^=bar] :not(div[class^=barFill]),
  div[class^=contentRegion] [class^=markDash] {
    background: #${config.colorScheme.palette.base03};
  }
  div[class^=contentRegion] [id="privacy-&-safety-tab"] div[class^=radioBar][style*="hsl(139,"] {
    border-color: #${config.colorScheme.palette.base0B};
  }
  div[class^=contentRegion] [id="privacy-&-safety-tab"] div[class^=radioBar][style*="hsl(37,"] {
    border-color: #${config.colorScheme.palette.base0A};
  }
  div[class^=contentRegion] [id="privacy-&-safety-tab"] div[class^=radioBar][style*="hsl(359,"] {
    border-color: #${config.colorScheme.palette.base08};
  }
  div[class^=contentRegion] [id="privacy-&-safety-tab"] div[class*=betaTagIcon] {
    background-color: #${config.colorScheme.palette.base0D} !important;
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=contentRegion] #accessibility-tab button[class*=colorBrandNew] {
    background-color: #${config.colorScheme.palette.base0D};
  }
  div[class^=contentRegion] #keybinds-tab span[class*=key] {
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=contentRegion] #keybinds-tab span[class*=key] g {
    fill: #${config.colorScheme.palette.base01};
  }
  div[class^=contentRegion] #nitro-server-boost-tab circle[class^=circleProgress] {
    color: #${config.colorScheme.palette.base0F};
  }
  div[class^=contentRegion] #nitro-server-boost-tab div[class*=gemIndicatorContainer_] {
    background-color: #${config.colorScheme.palette.base00};
  }
  div[class^=contentRegion] #nitro-server-boost-tab div[class*=gemIndicatorContainer_] div[class^=tierLabel] {
    color: #${config.colorScheme.palette.base07};
  }
  div[class^=contentRegion] #nitro-server-boost-tab button[class*=lookInverted_] {
    color: #${config.colorScheme.palette.base01};
    background-color: #${config.colorScheme.palette.base05};
  }
  div[class^=contentRegion] #nitro-server-boost-tab button[class*=lookInverted_]:hover {
    background-color: #${config.colorScheme.palette.base05};
  }
  div[class^=contentRegion] #nitro-server-boost-tab div[class*=card_],
  div[class^=contentRegion] #nitro-server-boost-tab h3[class*=price_] {
    color: #${config.colorScheme.palette.base05} !important;
  }
  div[class^=contentRegion] #subscriptions-tab [class^=sectionAccountCredit],
  div[class^=contentRegion] #subscriptions-tab [class^=subscriptionDetails] {
    border-color: var(--background-modifier-accent);
  }
  div[class^=contentRegion] #library-inventory-tab div[class^=promotionIcon] {
    background-color: #${config.colorScheme.palette.base00};
  }
  div[class^=contentRegion] #discord-nitro-tab button[class*=buttonWhite] {
    color: #${config.colorScheme.palette.base05} !important;
    border-color: #${config.colorScheme.palette.base05} !important;
  }
  div[class^=contentRegion] #discord-nitro-tab h2 {
    color: #${config.colorScheme.palette.base05} !important;
  }
  div[class^=contentRegion] #discord-nitro-tab svg[class*=sparkleStar_] {
    color: #${config.colorScheme.palette.base05};
  }
  div[class^=contentRegion] #discord-nitro-tab div[class*=description_] {
    color: #${config.colorScheme.palette.base07} !important;
  }
  div[class^=contentRegion] #discord-nitro-tab div[class*=card_] {
    color: #${config.colorScheme.palette.base05};
  }
  div[class^=contentRegion] #discord-nitro-tab div[class*=card_] div[class^=item] div {
    color: #${config.colorScheme.palette.base05} !important;
  }
  div[class^=contentRegion] #discord-nitro-tab button[class*=lookInverted_] {
    color: #${config.colorScheme.palette.base01};
    background-color: #${config.colorScheme.palette.base05};
  }
  div[class^=contentRegion] #discord-nitro-tab button[class*=lookInverted_]:hover {
    background-color: #${config.colorScheme.palette.base05};
  }
  div[class^=contentRegion] #billing-tab div[class*=subtext] {
    color: #${config.colorScheme.palette.base07};
  }
  div[class^=contentRegion] #billing-tab [class*=Divider] {
    border-color: var(--background-modifier-accent);
  }
  div[class^=contentRegion] #billing-tab div[class^=defaultIndicator] {
    color: #${config.colorScheme.palette.base05};
    background-color: #${config.colorScheme.palette.base03};
  }
  div[class^=contentRegion] #billing-tab div[class*=summaryInfo],
  div[class^=contentRegion] #billing-tab [class^=paymentHeader] {
    color: #${config.colorScheme.palette.base05};
    border-color: var(--background-modifier-accent);
  }
  div[class^=contentRegion] #billing-tab div[class^=premiumIndicator] {
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=contentRegion] #billing-tab div[class^=paymentPane],
  div[class^=contentRegion] #billing-tab div[class*=paginator_],
  div[class^=contentRegion] #billing-tab div[class*=payment_] {
    background-color: #${config.colorScheme.palette.base02};
    color: #${config.colorScheme.palette.base05};
  }
  div[class^=contentRegion] #billing-tab div[class^=expandedInfo] {
    background-color: #${config.colorScheme.palette.base03};
  }
  div[class^=contentRegion] #billing-tab [class*=paymentText_] {
    color: #${config.colorScheme.palette.base07};
  }
  div[class^=contentRegion] #billing-tab div[class^=codeRedemptionRedirect] {
    background-color: #${config.colorScheme.palette.base01};
    color: #${config.colorScheme.palette.base05};
    border-color: #${config.colorScheme.palette.base02};
  }
  div[class^=contentRegion] [id="voice-&-video-tab"] div[class^=backgroundOptionRing] {
    border-color: #${config.colorScheme.palette.base0D};
  }
  div[class^=contentRegion] [id="voice-&-video-tab"] div[class^=micTest] svg[class^=notches] {
    color: #${config.colorScheme.palette.base00};
  }
  div[class^=contentRegion] #notifications-tab button[class*=marketingUnsubscribeButton_] {
    color: #${config.colorScheme.palette.base05};
  }
  div[class^=contentRegion] #game-activity-tab div[class*=nowPlayingAdd_],
  div[class^=contentRegion] #game-activity-tab div[class*=lastPlayed_],
  div[class^=contentRegion] #game-activity-tab div[class*=overlayStatusText_] {
    color: var(--text-muted);
  }
  div[class^=contentRegion] #game-activity-tab div[class*=activeGame_][class*=nowPlaying] * {
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=contentRegion] #game-activity-tab div[class*=activeGame_][class*=nowPlaying] * svg > path {
    fill: #${config.colorScheme.palette.base01} !important;
  }
  div[class^=contentRegion] #game-activity-tab input[class^=gameName] {
    color: #${config.colorScheme.palette.base05};
  }
  div[class^=contentRegion] #game-activity-tab input[class*=gameNameInput_]:hover, div[class^=contentRegion] #game-activity-tab input[class*=gameNameInput_]:focus {
    background-color: #${config.colorScheme.palette.base01};
    border-color: rgba(41, 44, 60, 0.3);
    color: #${config.colorScheme.palette.base05};
  }
  div[class^=contentRegion] #game-activity-tab div[class*=game_] {
    -webkit-box-shadow: 0 1px 0 0 var(--background-modifier-accent);
    box-shadow: 0 1px 0 0 var(--background-modifier-accent);
  }
  div[class^=contentRegion] #game-activity-tab div[class*=removeGame_] {
    background-color: #${config.colorScheme.palette.base02};
  }
  div[class^=contentRegion] #emoji-tab div[class*=emojiRemove_] {
    background-color: #${config.colorScheme.palette.base02};
  }
  div[class^=contentRegion] section[class^=inputSensitivityToggle] div[class^=inputSensitivityBar] {
    background: #${config.colorScheme.palette.base03};
  }
  div[class^=contentRegion] section[class^=inputSensitivityToggle] div[class^=inputSensitivityBar][class*=speaking_] {
    background: #${config.colorScheme.palette.base0B} !important;
  }
  div[class^=contentRegion] div[class*=reactionMe_] {
    background-color: #${config.colorScheme.palette.base02} !important;
  }
  div[class^=contentRegion] div[class^=switch] > div[style*="background-color: hsl(218, calc(var(--saturation-factor, 1) * 4.6%), 46.9%)"],
  div[class^=contentRegion] div[class^=switch] > div[style*="background-color: "],
  div[class^=contentRegion] div[class^=control] > div[style*="background-color: hsl(218, calc(var(--saturation-factor, 1) * 4.6%), 46.9%)"],
  div[class^=contentRegion] div[class^=control] > div[style*="background-color: "] {
    background-color: #${config.colorScheme.palette.base04} !important;
  }
  div[class^=contentRegion] div[class^=switch] > div[class*=checked_],
  div[class^=contentRegion] div[class^=control] > div[class*=checked_],
  div[class^=contentRegion] div[class^=sensitivity] div[class*=checked_],
  div[class^=contentRegion] div[style*="background-color: hsl(139, calc(var(--saturation-factor, 1) * 47.3%), 43.9%)"] {
    background-color: #${config.colorScheme.palette.base0B} !important;
  }
  div[class^=contentRegion] #guild_premium-tab [class*=tierAccomplished_],
  div[class^=contentRegion] #guild_premium-tab [class*=tierCurrent_],
  div[class^=contentRegion] #guild_premium-tab [class*=tierFirst_] {
    background: #${config.colorScheme.palette.base0F};
  }
  div[class^=contentRegion] #guild_premium-tab [class*=tierInProgress_] {
    background-color: #${config.colorScheme.palette.base01};
  }
  div[class^=contentRegion] #guild_premium-tab div[class^=progressWithSubscriptions] > svg > g > rect:first-child {
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=contentRegion] #guild_premium-tab div[class^=progressWithSubscriptions] > svg > g > rect:nth-child(2) {
    color: #${config.colorScheme.palette.base0F};
  }
  div[class^=contentRegion] #guild_premium-tab div[class^=tierHeaderUnlocked],
  div[class^=contentRegion] #guild_premium-tab div[class^=tierHeaderLocked] {
    background-color: #${config.colorScheme.palette.base01};
    color: #${config.colorScheme.palette.base07};
  }
  div[class^=contentRegion] #guild_premium-tab div[class^=tierHeaderUnlocked] div[class^=tierUnlocked],
  div[class^=contentRegion] #guild_premium-tab div[class^=tierHeaderLocked] div[class^=tierUnlocked] {
    background-image: linear-gradient(90deg, #${config.colorScheme.palette.base0D}, #${config.colorScheme.palette.base0E});
    color: #${config.colorScheme.palette.base01};
    font-weight: 600;
  }
  div[class^=contentRegion] #guild_premium-tab div[class^=tierHeaderUnlocked] svg[class^=tierIcon],
  div[class^=contentRegion] #guild_premium-tab div[class^=tierHeaderLocked] svg[class^=tierIcon] {
    color: #${config.colorScheme.palette.base0F};
  }
  div[class^=contentRegion] #guild_premium-tab div[class^=tierHeaderUnlocked] svg[class*=tierIconLocked_],
  div[class^=contentRegion] #guild_premium-tab div[class^=tierHeaderLocked] svg[class*=tierIconLocked_] {
    color: #${config.colorScheme.palette.base07};
  }
  div[class^=contentRegion] #guild_premium-tab div[class^=tierHeaderUnlocked] svg[class^=tierLock],
  div[class^=contentRegion] #guild_premium-tab div[class^=tierHeaderLocked] svg[class^=tierLock] {
    color: #${config.colorScheme.palette.base04};
  }
  div[class^=contentRegion] #guild_premium-tab div[class^=tierBody] {
    color: #${config.colorScheme.palette.base07};
    background-color: #${config.colorScheme.palette.base01};
  }
  div[class^=contentRegion] svg[class^=activeCircle] {
    color: #${config.colorScheme.palette.base01};
    background-color: #${config.colorScheme.palette.base0B};
  }
  div[class^=contentRegion] #discovery-tab div[class*=checklistIcon] svg[viewBox="0 0 14 14"] path {
    fill: #${config.colorScheme.palette.base08};
  }
  div[class^=contentRegion] #discovery-tab div[class*=checklistIcon] svg[viewBox="0 0 20 20"] path {
    fill: #${config.colorScheme.palette.base0A};
  }
  div[class^=contentRegion] #guild_templates-tab svg[class*=descriptionIcon][viewBox="0 0 24 24"] path {
    fill: #${config.colorScheme.palette.base0B};
  }
  div[class^=contentRegion] #guild_templates-tab svg[class*=descriptionIcon][viewBox="0 0 14 14"] path {
    fill: #${config.colorScheme.palette.base08};
  }
  div[class^=contentRegion] #guild_templates-tab svg[class*=descriptionIcon] circle {
    fill: #${config.colorScheme.palette.base01};
  }
  div[class^=contentRegion] #stickers-tab div[class*=tierHeaderContent] {
    background-color: #${config.colorScheme.palette.base01};
  }
  div[class^=contentRegion] #stickers-tab div[class*=tierBody] {
    background-color: #${config.colorScheme.palette.base01};
  }
  div[class^=contentRegion] #roles-tab div[class*=previewContainer_] .theme-light img[class*=roleIcon_] {
    content: "data:image/svg+xml,%3Csvg width='20' height='20' viewBox='0 0 20 20' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath fill-rule='evenodd' clip-rule='evenodd' d='M11.0749 1.66667H4.99996C3.15901 1.66667 1.66663 3.15906 1.66663 5.00001V15C1.66663 16.841 3.15901 18.3333 4.99996 18.3333H15C16.8409 18.3333 18.3333 16.841 18.3333 15V8.92511C17.8052 9.08227 17.2458 9.16667 16.6666 9.16667C13.445 9.16667 10.8333 6.555 10.8333 3.33334C10.8333 2.75419 10.9177 2.19476 11.0749 1.66667ZM6.66663 5.00001C7.58596 5.00001 8.33329 5.74601 8.33329 6.66667C8.33329 7.58801 7.58596 8.33334 6.66663 8.33334C5.74529 8.33334 4.99996 7.58801 4.99996 6.66667C4.99996 5.74601 5.74529 5.00001 6.66663 5.00001ZM4.99996 15L7.49996 11.6667L9.16663 13.3333L12.5 9.16667L15 15H4.99996Z' fill='%23${config.colorScheme.palette.base03}'/%3E%3Cpath d='M17.5 0V2.5H20V4.16667H17.5V6.66667H15.8334V4.16667H13.3334V2.5H15.8334V0H17.5Z' fill='%23${config.colorScheme.palette.base03}'/%3E%3C/svg%3E";
  }
  div[class^=contentRegion] #roles-tab div[class*=previewContainer_] .theme-dark img[class*=roleIcon_] {
    content: "data:image/svg+xml,%3Csvg fill='none' height='20' viewBox='0 0 20 20' width='20' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='%23${config.colorScheme.palette.base05}'%3E%3Cpath clip-rule='evenodd' d='m11.0749 1.66667h-6.07488c-1.84095 0-3.33333 1.49239-3.33333 3.33334v9.99999c0 1.841 1.49238 3.3333 3.33333 3.3333h9.99998c1.841 0 3.3334-1.4923 3.3334-3.3333v-6.07489c-.5281.15716-1.0876.24156-1.6667.24156-3.2217 0-5.8333-2.61167-5.8333-5.83333 0-.57915.0844-1.13858.2415-1.66667zm-4.40821 3.33334c.91933 0 1.66666.746 1.66666 1.66666 0 .92134-.74733 1.66667-1.66666 1.66667-.92134 0-1.66667-.74533-1.66667-1.66667 0-.92066.74533-1.66666 1.66667-1.66666zm-1.66667 9.99999 2.5-3.3333 1.66667 1.6666 3.33331-4.16663 2.5 5.83333z' fill-rule='evenodd'/%3E%3Cpath d='m17.5 0v2.5h2.5v1.66667h-2.5v2.5h-1.6667v-2.5h-2.5v-1.66667h2.5v-2.5z'/%3E%3C/g%3E%3C/svg%3E";
  }
  #activity-tab div[class^=featureCards] svg[class^=icon],
  #family-center-tab div[class^=featureCards] svg[class^=icon] {
    color: #${config.colorScheme.palette.base01};
  }
  
  div[class^=contentRegion] #profile-customization-tab div[class*=premiumFeatureBannerBackground] button {
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=contentRegion] #profile-customization-tab div[class^=imageUploaderIcon_] {
    background-color: #${config.colorScheme.palette.base05};
  }
  div[class^=contentRegion] #appearance-tab div[class^=selectionCircle] {
    box-shadow: inset 0 0 0 2px #${config.colorScheme.palette.base0D}, inset 0 0 0 4px var(--background-primary);
  }
  div[class^=contentRegion] #appearance-tab div[class^=selectionCircle] svg[class^=checkmarkCircle] > circle {
    fill: #${config.colorScheme.palette.base01} !important;
  }
  div[class^=contentRegion] #appearance-tab div[class^=selectionCircle] svg[class^=checkmarkCircle] > g > path {
    fill: #${config.colorScheme.palette.base0D} !important;
  }
  .theme-light div[class^=contentRegion] #appearance-tab div[class^=themeSelection][class*=lightIcon] {
    background: #${config.colorScheme.palette.base02};
  }
  
  div[class^=contentRegion] #overview-tab div[class^=addTags] svg path {
    fill: #${config.colorScheme.palette.base01} !important;
  }
  div[class^=contentRegion] #onboarding-tab div[class*=heroQuotes] {
    color: #${config.colorScheme.palette.base05};
  }
  div[class^=contentRegion] #onboarding-tab svg[class^=checkCircleCompleted] circle {
    fill: #${config.colorScheme.palette.base01} !important;
  }
  div[class^=contentRegion] #onboarding-tab svg[class^=checkbox],
  div[class^=contentRegion] #onboarding-tab svg[class^=checkmark] {
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=contentRegion] #onboarding-tab div[class^=requiredItem] svg circle {
    fill: #${config.colorScheme.palette.base01};
  }
  div[class^=contentRegion] #onboarding-tab div[class^=addPrompt],
  div[class^=contentRegion] #onboarding-tab div[class^=addActionItem] {
    border: 2px dashed #${config.colorScheme.palette.base03};
  }
  div[class^=contentRegion] #onboarding-tab div[class^=badExample] div[class^=example] {
    border: 2px solid #${config.colorScheme.palette.base03};
  }
  div[class^=contentRegion] #onboarding-tab div[class^=homeBannerExplainer] div[class*=upsellButtonInner] div[class^=text-sm-medium] {
    color: #${config.colorScheme.palette.base01} !important;
  }
  div[class^=contentRegion] #developer-options-tab kbd {
    color: #${config.colorScheme.palette.base01};
  }
  
  .bd-settings-title {
    color: #${config.colorScheme.palette.base05};
  }
  
  .bd-switch-body {
    --switch-color: #${config.colorScheme.palette.base04};
  }
  .bd-switch input:checked + .bd-switch-body {
    --switch-color: #${config.colorScheme.palette.base0B};
  }
  .bd-switch input:checked + .bd-switch-body svg.bd-switch-symbol path {
    fill: #${config.colorScheme.palette.base0B};
  }
  
  .bd-button {
    background-color: #${config.colorScheme.palette.base0D};
    color: #${config.colorScheme.palette.base01};
  }
  .bd-button.bd-button-danger {
    background-color: #${config.colorScheme.palette.base08};
  }
  
  .bd-controls > .bd-addon-button svg {
    fill: #${config.colorScheme.palette.base01};
  }
  
  .bd-addon-views .bd-view-button.selected {
    background-color: #${config.colorScheme.palette.base0D};
  }
  .bd-addon-views .bd-view-button.selected svg {
    fill: #${config.colorScheme.palette.base01};
  }
  
  div[class^=perksModal] {
    background-color: #${config.colorScheme.palette.base00};
  }
  div[class^=perksModal] li[class^=perk] {
    background-color: #${config.colorScheme.palette.base01};
  }
  div[class^=perksModal] li[class^=perk] svg {
    color: #${config.colorScheme.palette.base0F};
  }
  div[class^=perksModal] svg[class^=giftIcon] {
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=perksModal] div[class^=tierHeaderUnlocked] {
    background-image: linear-gradient(90deg, #${config.colorScheme.palette.base0D}, #${config.colorScheme.palette.base0E});
    color: #${config.colorScheme.palette.base00};
  }
  div[class^=perksModal] div[class^=tierUnlocked],
  div[class^=perksModal] div[class^=tierMarkerBackground] {
    background-color: #${config.colorScheme.palette.base00};
  }
  div[class^=perksModal] div[class^=barBackground],
  div[class^=perksModal] div[class^=tierMarkerInProgress],
  div[class^=perksModal] div[class^=tierBody] {
    background-color: #${config.colorScheme.palette.base01} !important;
  }
  div[class^=perksModal] div[class^=tierMarkerAccomplished] {
    background: #${config.colorScheme.palette.base0F} !important;
  }
  div[class^=perksModal] div[class^=tierMarkerInProgress] [class^=currentTierIcon] {
    color: #${config.colorScheme.palette.base0F};
  }
  div[class^=perksModal] div[class^=barForeground],
  div[class^=perksModal] div[class^=tierMarkerAccomplished] {
    background-color: #${config.colorScheme.palette.base0F};
  }
  div[class^=perksModal] svg[class^=currentTierIcon] {
    color: #${config.colorScheme.palette.base00};
  }
  div[class^=perksModal] div[class*=tierMarkerLabelText],
  div[class^=perksModal] svg[class^=tierLock] {
    color: var(--text-muted);
  }
  div[class^=perksModal] div[class*=selectedTier] div[class*=tierMarkerLabelText] {
    color: var(--text-normal);
  }
  div[class^=perksModal] div[class^=tierHeaderLocked] {
    background-color: #${config.colorScheme.palette.base01};
    color: var(--text-muted);
  }
  div[class^=perksModal] svg[class*=unlocked] {
    color: #${config.colorScheme.palette.base0B};
  }
  
  div[class^=sidebar] div[class^=container] div[class^=progressBar] {
    background: linear-gradient(90deg, #${config.colorScheme.palette.base0D}, #${config.colorScheme.palette.base0E});
  }
  div[class^=sidebar] div[class^=container]:hover div[class^=progressBar] {
    background: linear-gradient(90deg, #${config.colorScheme.palette.base0D}, #${config.colorScheme.palette.base0E} 34%, #${config.colorScheme.palette.base0D} 67%, #${config.colorScheme.palette.base0E});
    background-size: 300% 100%;
  }
  div[class^=sidebar] div[class^=container] div[class^=divider] {
    border-color: var(--background-modifier-accent);
  }
  
  div[class^=pageWrapper] {
    background: #${config.colorScheme.palette.base00} !important;
  }
  div[class^=pageWrapper] div[class*=searchBox_] {
    background-color: #${config.colorScheme.palette.base01};
  }
  div[class^=pageWrapper] div[class*=searchBox_] input[class*=searchBoxInput_] {
    color: var(--text-normal);
  }
  div[class^=pageWrapper] div[class*=searchBox_] svg[class*=clearIcon] path {
    fill: #${config.colorScheme.palette.base04};
  }
  div[class^=pageWrapper] div[class*=categoryPill_][class*=selected_] div {
    color: #${config.colorScheme.palette.base01} !important;
  }
  
  div[class^=homeContainer] {
    background: #${config.colorScheme.palette.base00} !important;
  }
  div[class^=homeContainer] > div[class^=homeContent] div[class*=card_] {
    background: #${config.colorScheme.palette.base02} !important;
  }
  
  section[class^=title] {
    background: var(--background-primary) !important;
  }
  
  div[class^=categoryItem][class*=selectedCategoryItem],
  button[class*=lookFilled] div[class*=addButton] {
    color: #${config.colorScheme.palette.base01} !important;
  }
  
  div[class^=itemInner] div[class^=new] > div[class*=newText_] {
    color: #${config.colorScheme.palette.base01} !important;
  }
  
  div[class*=directoryModal_] {
    background-color: #${config.colorScheme.palette.base00} !important;
  }
  div[class*=directoryModal_] [class*=searchBox] {
    background-color: #${config.colorScheme.palette.base01} !important;
  }
  div[class*=directoryModal_] [class*=searchBox] [name=search]::placeholder {
    color: #${config.colorScheme.palette.base07};
  }
  div[class*=directoryModal_] [role=button][class*=activeButton] {
    color: #${config.colorScheme.palette.base01};
  }
  
  section[class^=guildListSection] div[class^=guildList]:first-child div[class^=iconContainer] {
    background-color: #${config.colorScheme.palette.base0B};
  }
  section[class^=guildListSection] div[class^=guildList]:first-child div[class^=iconContainer] > div[class^=icon] {
    background-image: url("data:image/svg+xml,%3Csvg fill='none' height='24' viewBox='0 0 25 24' width='25' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='%23${config.colorScheme.palette.base01}'%3E%3Cpath clip-rule='evenodd' d='m13.25 18v-12h-1.5v12z' fill-rule='evenodd'/%3E%3Cpath clip-rule='evenodd' d='m7 12.75c-.69036 0-1.25.5596-1.25 1.25v4h-1.5v-4c0-1.5188 1.23122-2.75 2.75-2.75h11c1.5188 0 2.75 1.2312 2.75 2.75v4h-1.5v-4c0-.6904-.5596-1.25-1.25-1.25z' fill-rule='evenodd'/%3E%3Cpath d='m12.5 7c-1.3807 0-2.5-1.11929-2.5-2.5s1.1193-2.5 2.5-2.5 2.5 1.11929 2.5 2.5-1.1193 2.5-2.5 2.5z'/%3E%3Cpath d='m20 22c-1.3807 0-2.5-1.1193-2.5-2.5s1.1193-2.5 2.5-2.5 2.5 1.1193 2.5 2.5-1.1193 2.5-2.5 2.5z'/%3E%3Cpath d='m12.5 22c-1.3807 0-2.5-1.1193-2.5-2.5s1.1193-2.5 2.5-2.5 2.5 1.1193 2.5 2.5-1.1193 2.5-2.5 2.5z'/%3E%3Cpath d='m5 22c-1.38071 0-2.5-1.1193-2.5-2.5s1.11929-2.5 2.5-2.5 2.5 1.1193 2.5 2.5-1.11929 2.5-2.5 2.5z'/%3E%3C/g%3E%3C/svg%3E");
  }
  
  path[d="M22 12.4065C21.8956 14.9141 20.8533 17.2908 19.0798 19.0654C17.3062 20.8401 14.931 21.883 12.425 21.9875L13.7625 15.646L17.2375 17.9224C17.3214 17.9702 17.416 17.996 17.5125 17.9975C17.6481 17.9962 17.7781 17.9424 17.875 17.8474C17.9439 17.7577 17.9813 17.6478 17.9813 17.5347C17.9813 17.4216 17.9439 17.3117 17.875 17.222L15.6 13.7323L22 12.4065ZM13.7625 8.34148L17.2375 6.06504C17.3352 6.00866 17.4487 5.98608 17.5605 6.00084C17.6723 6.0156 17.7762 6.06686 17.8559 6.14665C17.9357 6.22645 17.9869 6.33037 18.0017 6.44225C18.0164 6.55413 17.9938 6.66772 17.9375 6.76548L15.6625 10.2551L22 11.581C21.8956 9.07342 20.8533 6.69669 19.0798 4.92206C17.3062 3.14742 14.931 2.10449 12.425 2L13.7625 8.34148ZM10.275 8.34148L11.6 2C9.09402 2.10449 6.71878 3.14742 4.94525 4.92206C3.17172 6.69669 2.12945 9.07342 2.02502 11.581L8.37497 10.2551L6.08752 6.76548C6.02873 6.66774 6.00413 6.55315 6.01772 6.43988C6.0313 6.32661 6.08228 6.22113 6.16252 6.14009C6.24233 6.05781 6.34797 6.00542 6.46175 5.99176C6.57552 5.97809 6.69052 6.00399 6.78752 6.06504L10.275 8.34148ZM6.16252 17.8474C6.08228 17.7663 6.0313 17.6609 6.01772 17.5476C6.00413 17.4343 6.02873 17.3197 6.08752 17.222L8.37497 13.7323L2 12.4065C2.10442 14.9141 3.1467 17.2908 4.92023 19.0654C6.69376 20.8401 9.06899 21.883 11.575 21.9875L10.25 15.646L6.7625 17.9224C6.67925 17.9718 6.58428 17.9977 6.48753 17.9975C6.35971 17.9937 6.23848 17.9398 6.15001 17.8474H6.16252Z"] {
    fill: #${config.colorScheme.palette.base0C};
  }
  
  path[d="M17.225 6.06504C17.3227 6.00866 17.4362 5.98608 17.548 6.00084C17.6598 6.0156 17.7637 6.06686 17.8434 6.14665C17.9232 6.22645 17.9744 6.33037 17.9892 6.44225C18.0039 6.55413 17.9813 6.66772 17.925 6.76548L15.65 10.2551L21.9875 11.581C21.9875 11.7185 21.9875 11.8562 21.9875 11.9937C21.9875 12.1313 21.9875 12.2689 21.9875 12.4065L15.65 13.7323L17.925 17.222C17.9939 17.3117 18.0313 17.4216 18.0313 17.5347C18.0313 17.6478 17.9939 17.7577 17.925 17.8474C17.8281 17.9424 17.6982 17.9962 17.5625 17.9975C17.466 17.996 17.3714 17.9702 17.2875 17.9224L13.8125 15.646L12.4125 22H11.5875L10.2625 15.6585L6.77501 17.935C6.69176 17.9843 6.59672 18.0102 6.49997 18.01C6.43455 18.0098 6.3699 17.9963 6.30977 17.9705C6.24964 17.9447 6.1953 17.9072 6.15001 17.8599C6.06977 17.7789 6.01879 17.6734 6.0052 17.5601C5.99162 17.4468 6.01621 17.3323 6.07501 17.2345L8.36253 13.7449L2 12.4065C2 12.2689 2 12.1313 2 11.9937C2 11.8562 2 11.7185 2 11.581L8.35002 10.2551L6.0625 6.76548C6.0037 6.66774 5.97918 6.55315 5.99277 6.43988C6.00635 6.32661 6.05726 6.22113 6.1375 6.14009C6.21731 6.05781 6.32295 6.00542 6.43672 5.99176C6.5505 5.97809 6.6655 6.00399 6.7625 6.06504L10.25 8.34148L11.575 2H12.4L13.7375 8.34148L17.225 6.06504Z"] {
    fill: #${config.colorScheme.palette.base01};
  }
  
  div[class^=tierPreviews] button[class^=button] {
    background: linear-gradient(90deg, #${config.colorScheme.palette.base0C}, #${config.colorScheme.palette.base0D});
  }
  
  div[class^=notice] div[class*=noticeText_] {
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=notice] div[class*=header_] {
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=notice] div[class^=closeButton] > svg > path {
    fill: #${config.colorScheme.palette.base01};
  }
  div[class^=notice] button[class^=button] {
    border-color: #${config.colorScheme.palette.base01};
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=notice] button[class^=button]:hover {
    background: #${config.colorScheme.palette.base0D};
  }
  div[class^=notice][class*=colorStreamerMode_] {
    background-color: #${config.colorScheme.palette.base0E};
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=notice][class*=colorStreamerMode_] button[class^=button]:hover {
    background: #${config.colorScheme.palette.base0E};
    color: #${config.colorScheme.palette.base01};
  }
  
  div[class^=standardSidebarView] div[class^=noticeRegion] div[class^=actions] button {
    background-color: #${config.colorScheme.palette.base0D};
    color: #${config.colorScheme.palette.base01} !important;
    border-color: #${config.colorScheme.palette.base01};
  }
  div[class^=standardSidebarView] div[class^=noticeRegion] div[class^=actions] button span[class^=button],
  div[class^=standardSidebarView] div[class^=noticeRegion] div[class^=actions] button div {
    --button--underline-color: #${config.colorScheme.palette.base01} !important;
  }
  div[class^=standardSidebarView] div[class^=noticeRegion] div[class^=actions] button span[class^=button] span,
  div[class^=standardSidebarView] div[class^=noticeRegion] div[class^=actions] button div span {
    color: #${config.colorScheme.palette.base01} !important;
  }
  div[class^=standardSidebarView] div[class^=noticeRegion] div[class^=actions] button:hover {
    background-color: #${config.colorScheme.palette.base0D};
  }
  
  div[class^=premiumFeatureBorder] {
    background: linear-gradient(#${config.colorScheme.palette.base01}, #${config.colorScheme.palette.base01}) padding-box, linear-gradient(45deg, #${config.colorScheme.palette.base0E}, #${config.colorScheme.palette.base0F}) border-box;
  }
  div[class^=premiumFeatureBorder] div[class^=premiumBackground] {
    background: linear-gradient(45deg, rgba(202, 158, 230, 0.1), rgba(244, 184, 228, 0.1) 100%) border-box;
  }
  
  div[class*=applicationStore] div[class*=premiumContainer] div[class^=premiumCards] svg g {
    fill: #${config.colorScheme.palette.base05};
  }
  div[class*=applicationStore] div[class*=premiumContainer] div[class^=premiumCards] div[class*=item] div[class^=text] {
    color: #${config.colorScheme.palette.base05} !important;
  }
  div[class*=applicationStore] div[class*=premiumContainer] div[class^=premiumCards] h2, div[class*=applicationStore] div[class*=premiumContainer] div[class^=premiumCards] h2 span {
    color: #${config.colorScheme.palette.base05} !important;
  }
  div[class*=applicationStore] div[class*=premiumContainer] div[class^=premiumCards] span[class^=buttonText] {
    color: #${config.colorScheme.palette.base01};
  }
  div[class*=applicationStore] div[class*=premiumContainer] div[class^=fullscreenTextContainer] div[class*=premiumSubscribeButton] span[class^=buttonText],
  div[class*=applicationStore] div[class*=premiumContainer] div[class^=innerWrapper] div[class*=premiumSubscribeButton] span[class^=buttonText] {
    color: #${config.colorScheme.palette.base01};
  }
  
  div[class^=shop] div[class^=heroBanner] div[class^=heroDescription] h2[class*=bannerTitle],
  div[class^=shop] div[class^=heroBanner] div[class^=heroDescription] div[class^=text] {
    color: #${config.colorScheme.palette.base05} !important;
  }
  div[class^=shop] div[class^=heroBanner] div[class^=heroDescription] div[class*=premiumSubscribeButton] span[class^=buttonText] {
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=shop] div[class^=shopCard] div[class^=innerHover] button[class^=previewButton] svg path {
    fill: #${config.colorScheme.palette.base01};
  }
  div[class^=shop] div[class^=bannerCard] div[class^=badge] svg path {
    fill: #${config.colorScheme.palette.base01};
  }
  
  div[class^=layerContainer] div[class^=collectibleInfoContainer] button[class^=shinyButton] svg {
    fill: #${config.colorScheme.palette.base0F};
  }
  div[class^=layerContainer] div[class^=collectibleInfoContainer] button[class^=shinyButton] span {
    color: #${config.colorScheme.palette.base01} !important;
  }
  
  div[class^=auditLog] div[class^=headerClickable] {
    background-color: rgba(35, 38, 52, 0.3) !important;
  }
  
  nav[class*=guilds_] foreignObject > div[data-list-item-id*=guildsnav_]:hover > div[class^=childWrapper], nav[class*=guilds_] foreignObject > div[data-list-item-id*=guildsnav_][class*=selected] > div[class^=childWrapper] {
    color: #${config.colorScheme.palette.base01};
    font-weight: 600;
  }
  nav[class*=guilds_] div[data-list-item-id=guildsnav___home] {
    --background-primary: #${config.colorScheme.palette.base02};
  }
  nav[class*=guilds_] span[class^=expandedFolderBackground] {
    background-color: #${config.colorScheme.palette.base02};
  }
  nav[class*=guilds_] div[class^=folder][class*=hover_] {
    background-color: #${config.colorScheme.palette.base02};
  }
  nav[class*=guilds_] div[data-list-item-id=guildsnav___create-join-button]:hover, nav[class*=guilds_] div[data-list-item-id=guildsnav___create-join-button][class*=selected],
  nav[class*=guilds_] div[data-list-item-id=guildsnav___guild-discover-button]:hover,
  nav[class*=guilds_] div[data-list-item-id=guildsnav___guild-discover-button][class*=selected],
  nav[class*=guilds_] div[data-list-item-id=guildsnav___app-download-button]:hover,
  nav[class*=guilds_] div[data-list-item-id=guildsnav___app-download-button][class*=selected] {
    color: #${config.colorScheme.palette.base01} !important;
    font-weight: 600;
  }
  
  div[class^=upperBadge] > div[class^=iconBadge] path {
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=upperBadge] div[class*=participating_] {
    background: #${config.colorScheme.palette.base0B};
  }
  
  div[class^=lowerBadge] div[class^=iconBadge] path {
    color: #${config.colorScheme.palette.base01};
  }
  
  svg[class^=spine] {
    color: #${config.colorScheme.palette.base04};
  }
  
  div[class^=spineBorder] {
    background: #${config.colorScheme.palette.base04};
  }
  
  ul[aria-label$=" threads"] > li:nth-child(1n) {
    --channels-default: #${config.colorScheme.palette.base0F};
    --interactive-hover: #${config.colorScheme.palette.base08};
    --interactive-active: #${config.colorScheme.palette.base08};
  }
  
  ul[aria-label$=" threads"] > li:nth-child(2n) {
    --channels-default: #${config.colorScheme.palette.base0F};
    --interactive-hover: #${config.colorScheme.palette.base09};
    --interactive-active: #${config.colorScheme.palette.base09};
  }
  
  ul[aria-label$=" threads"] > li:nth-child(3n) {
    --channels-default: #${config.colorScheme.palette.base06};
    --interactive-hover: #${config.colorScheme.palette.base0A};
    --interactive-active: #${config.colorScheme.palette.base0A};
  }
  
  ul[aria-label$=" threads"] > li:nth-child(4n) {
    --channels-default: #${config.colorScheme.palette.base05};
    --interactive-hover: #${config.colorScheme.palette.base0B};
    --interactive-active: #${config.colorScheme.palette.base0B};
  }
  
  ul[aria-label$=" threads"] > li:nth-child(5n) {
    --channels-default: #${config.colorScheme.palette.base05};
    --interactive-hover: #${config.colorScheme.palette.base05};
    --interactive-active: #${config.colorScheme.palette.base05};
  }
  
  ul[aria-label$=" threads"] > li:nth-child(6n) {
    --channels-default: #${config.colorScheme.palette.base0F};
    --interactive-hover: #${config.colorScheme.palette.base0E};
    --interactive-active: #${config.colorScheme.palette.base0E};
  }
  
  [class*=botText_] {
    color: #${config.colorScheme.palette.base01};
    font-weight: 600;
  }
  
  svg[class*=botTagVerified_] {
    color: #${config.colorScheme.palette.base01};
  }
  
  div[class*=activePostCount_] {
    background-color: #${config.colorScheme.palette.base02};
    color: #${config.colorScheme.palette.base05} !important;
  }
  
  div[class*=newPostCount_] {
    background-color: #${config.colorScheme.palette.base05};
    color: #${config.colorScheme.palette.base01};
  }
  
  div[class*=liveSmall_] {
    background-color: #${config.colorScheme.palette.base08} !important;
    color: #${config.colorScheme.palette.base01};
  }
  
  div[class^=bar] svg[class^=voiceChannelsIcon] path {
    fill: #${config.colorScheme.palette.base0B} !important;
  }
  
  [class^=chatContent] div[class*=wrapperAudio_] div[class*=audioControls],
  [class^=chatContent] div[class*=wrapperAudio_] div[class*=videoControls_],
  [class^=chatContent] div[class*=imageWrapper_] div[class*=audioControls],
  [class^=chatContent] div[class*=imageWrapper_] div[class*=videoControls_] {
    background-color: rgba(41, 44, 60, 0.8);
  }
  [class^=chatContent] div[class*=wrapperAudio_] div[class*=audioControls] svg[class*=controlIcon_],
  [class^=chatContent] div[class*=wrapperAudio_] div[class*=videoControls_] svg[class*=controlIcon_],
  [class^=chatContent] div[class*=imageWrapper_] div[class*=audioControls] svg[class*=controlIcon_],
  [class^=chatContent] div[class*=imageWrapper_] div[class*=videoControls_] svg[class*=controlIcon_] {
    opacity: 1;
    color: #${config.colorScheme.palette.base07};
  }
  [class^=chatContent] #---new-messages-bar span[class^=unreadPill] {
    color: #${config.colorScheme.palette.base01};
  }
  [class^=chatContent] div[class^=newMessagesBar] button {
    color: #${config.colorScheme.palette.base01};
  }
  [class^=chatContent] div[class^=channelTextArea] div[class^=buttons] * {
    color: var(--interactive-normal) !important;
  }
  [class^=chatContent] [id^=message-reactions] div[class^=reaction]:not(div[class^=reactionCount]):hover {
    background-color: var(--brand-experiment-20a);
    border-color: var(--brand-experiment-30a);
  }
  [class^=chatContent] [id^=message-reactions] div[class^=reaction] div[class^=reactionInner] {
    border-radius: 0.4rem;
  }
  [class^=chatContent] div[class*=isBurstReactionPicker_] {
    box-shadow: 0 0 0 2px #${config.colorScheme.palette.base0E}, 0 0 16px #${config.colorScheme.palette.base07};
  }
  [class^=chatContent] div[class^=navButtonSuperReactActive],
  [class^=chatContent] div[class^=navButtonSuperReactActive]:hover {
    background: linear-gradient(270deg, #${config.colorScheme.palette.base0F}, #${config.colorScheme.palette.base07} 33.63%, #${config.colorScheme.palette.base0E});
    color: #${config.colorScheme.palette.base01};
  }
  [class^=chatContent] div[class*=betaTag_] {
    background: var(--brand-experiment) !important;
    color: #${config.colorScheme.palette.base01};
  }
  [class^=chatContent] button[class*=navButtonActive_],
  [class^=chatContent] button[class*=navButtonActive_]:hover {
    color: #${config.colorScheme.palette.base01};
  }
  [class^=chatContent] div[class*=colorPremiumGradient_][class*=focused_] {
    background: linear-gradient(270deg, #${config.colorScheme.palette.base0F}, #${config.colorScheme.palette.base07} 33.63%, #${config.colorScheme.palette.base0E});
    color: #${config.colorScheme.palette.base01} !important;
  }
  [class^=chatContent] div[class*=isBurstReactionPicker] {
    border: none;
    box-shadow: 0 0 0 2px #${config.colorScheme.palette.base0E}, 0 0 16px #${config.colorScheme.palette.base07};
  }
  [class^=chatContent] div[class*=playButtonContainer_] {
    background: var(--brand-experiment) !important;
  }
  [class^=chatContent] svg[class*=playIcon_] path {
    fill: #${config.colorScheme.palette.base01};
  }
  [class^=chatContent] div[class^=container][class*=header_] div[class*=addReactButton_],
  [class^=chatContent] div[class^=container][class*=header_] div[class^=buttons]:not([class*=lookBlank_]) div[class^=contents] {
    background: #${config.colorScheme.palette.base02};
  }
  [class^=chatContent] div[class^=container][class*=header_] div[class*=addReactButton_]:hover,
  [class^=chatContent] div[class^=container][class*=header_] div[class^=buttons]:not([class*=lookBlank_]) div[class^=contents]:hover {
    background-color: var(--brand-experiment-20a);
    border-color: var(--brand-experiment-30a);
  }
  [class^=chatContent] div[class^=messagesErrorBar] div[class*=barButtonBase_] {
    color: #${config.colorScheme.palette.base01};
  }
  [class^=chatContent] [class*=inlineCode_] {
    background: #${config.colorScheme.palette.base02};
  }
  [class^=chatContent] code.inline {
    background: #${config.colorScheme.palette.base02};
  }
  [class^=chatContent] div[class^=container] div[class^=cardWrapper] div[class*=completed_] svg[class^=checkmark] {
    background-color: #${config.colorScheme.palette.base0B};
    color: #${config.colorScheme.palette.base01};
  }
  
  div[style*="d1382af8d9e755bc44811b1fd92990a8.svg"] {
    background-image: url("data:image/svg+xml,%3Csvg height='18' width='18' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cpath d='m18 0h-18v18h18z'/%3E%3Cpath d='m0 8h14.2l-3.6-3.6 1.4-1.4 6 6-6 6-1.4-1.4 3.6-3.6h-14.2' fill='%23${config.colorScheme.palette.base0B}'/%3E%3C/g%3E%3C/svg%3E") !important;
    filter: none !important;
  }
  
  main[class^=chatContent] div[id^=message-content] svg[class^=icon] > path[d="M4 0L0 4V8L4 12L8 8V4L4 0ZM7 7.59L4 10.59L1 7.59V4.41L4 1.41L7 4.41V7.59Z"],
  main[class^=chatContent] div[id^=message-content] svg[class^=icon] > path[d="M2 4.83V7.17L4 9.17L6 7.17V4.83L4 2.83L2 4.83Z"] {
    color: #${config.colorScheme.palette.base0F};
  }
  
  .theme-dark span[class^=spoilerContent],
  .theme-dark div[class^=spoilerContent],
  .theme-light span[class^=spoilerContent],
  .theme-light div[class^=spoilerContent] {
    background-color: #${config.colorScheme.palette.base02};
  }
  .theme-dark span[class^=spoilerContent][class*=hidden],
  .theme-dark div[class^=spoilerContent][class*=hidden],
  .theme-light span[class^=spoilerContent][class*=hidden],
  .theme-light div[class^=spoilerContent][class*=hidden] {
    background-color: #${config.colorScheme.palette.base04};
  }
  .theme-dark span[class^=spoilerContent][class*=hidden]:hover,
  .theme-dark div[class^=spoilerContent][class*=hidden]:hover,
  .theme-light span[class^=spoilerContent][class*=hidden]:hover,
  .theme-light div[class^=spoilerContent][class*=hidden]:hover {
    background-color: #${config.colorScheme.palette.base04};
  }
  .theme-dark span[class*=spoilerMarkdownContent] h1 > span,
  .theme-light span[class*=spoilerMarkdownContent] h1 > span {
    background-color: #${config.colorScheme.palette.base02};
  }
  .theme-dark span[class*=spoilerMarkdownContent][class*=hidden] h1 > span,
  .theme-light span[class*=spoilerMarkdownContent][class*=hidden] h1 > span {
    background-color: #${config.colorScheme.palette.base04};
  }
  .theme-dark span[class*=spoilerMarkdownContent][class*=hidden] h1 > span:hover,
  .theme-light span[class*=spoilerMarkdownContent][class*=hidden] h1 > span:hover {
    background-color: #${config.colorScheme.palette.base04};
  }
  .theme-dark div[class^=spoilerContainer] div[class^=spoilerWarning],
  .theme-light div[class^=spoilerContainer] div[class^=spoilerWarning] {
    color: #${config.colorScheme.palette.base05};
    background-color: ${hexToRgba "${config.colorScheme.palette.base01}" "0.7"};
  }
  .theme-dark div[class^=spoilerContainer]:hover div[class^=spoilerWarning],
  .theme-light div[class^=spoilerContainer]:hover div[class^=spoilerWarning] {
    color: #${config.colorScheme.palette.base05};
    background-color: #${config.colorScheme.palette.base01};
  }
  .theme-dark div[class^=spoilerContainer] article[class*=embedFull_],
  .theme-light div[class^=spoilerContainer] article[class*=embedFull_] {
    border-color: #${config.colorScheme.palette.base04};
  }
  
  div[class^=cooldownWrapper] {
    color: var(--text-muted) !important;
  }
  
  div[class*=autocomplete_] {
    background-color: #${config.colorScheme.palette.base01} !important;
  }
  div[class*=autocomplete_] div[class*=categoryHeader] {
    background-color: #${config.colorScheme.palette.base01} !important;
  }
  div[class*=autocomplete_] div[class*=autocompleteRowSubheading] {
    background-color: transparent;
  }
  div[class*=autocomplete_] div[class*=autocompleteRowContentSecondary] {
    background-color: transparent;
  }
  div[class*=autocomplete_] div[class^=usageWrapper] > div[class*=title_] {
    color: #${config.colorScheme.palette.base0D} !important;
  }
  div[class*=autocomplete_] strong {
    color: #${config.colorScheme.palette.base0D} !important;
  }
  
  div[class^=channelTextArea] button[class*=emojiButton_] {
    background: transparent !important;
  }
  
  [class^=uploadDropModal][class*=error] {
    background-color: #${config.colorScheme.palette.base08};
  }
  [class^=uploadDropModal] div[class^=inner] {
    border-color: #${config.colorScheme.palette.base01};
  }
  [class^=uploadDropModal] div[class^=inner] * {
    color: #${config.colorScheme.palette.base01} !important;
  }
  
  div[class^=chat] > div[class^=content] > div[class^=container] div[class^=chatContainer] > div[class^=container] {
    background-color: #${config.colorScheme.palette.base00};
  }
  div[class^=chat] > div[class^=content] > div[class^=container] div[class^=grid][class*=scrollerBase],
  div[class^=chat] > div[class^=content] > div[class^=container] > div[class^=chatContainer] > div[class^=container] {
    background-color: #${config.colorScheme.palette.base00};
  }
  div[class^=chat] > div[class^=content] > div[class^=container] div[class^=matchingPostsRow] span[class^=key] {
    color: #${config.colorScheme.palette.base01} !important;
  }
  div[class^=chat] > div[class^=content] > div[class^=container] div[class^=pinIcon] > svg > path,
  div[class^=chat] > div[class^=content] > div[class^=container] div[class^=stepStatus] > svg > path {
    fill: #${config.colorScheme.palette.base07};
  }
  div[class^=chat] > div[class^=content] > div[class^=container] div[class^=pinIcon][style*="background-color: var(--status-positive-background);"] > svg > path,
  div[class^=chat] > div[class^=content] > div[class^=container] div[class^=stepStatus][style*="background-color: var(--status-positive-background);"] > svg > path {
    fill: #${config.colorScheme.palette.base01};
  }
  div[class^=chat] > div[class^=content] > div[class^=container] div[class*=countText] {
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=chat] > div[class^=content] > div[class^=container] svg[class^=discordIcon] {
    background-color: #${config.colorScheme.palette.base0D};
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=chat] > div[class^=content] > div[class^=container] div[class^=newBadge] {
    background-color: #${config.colorScheme.palette.base07} !important;
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=chat] > div[class^=content] > div[class^=container] div[class*=mainCard_] {
    background-color: #${config.colorScheme.palette.base02};
  }
  
  div[class^=sidebar] > section[class^=panels] svg[class*=buttonIcon_],
  div[class^=sidebar] > section[class^=panels] div[class*=buttonContents] {
    fill: #${config.colorScheme.palette.base05};
    color: #${config.colorScheme.palette.base05};
  }
  
  [data-list-id^=forum-channel-list] div[class^=body] > div[class^=tags] div[class*=pill] {
    background-color: #${config.colorScheme.palette.base01};
  }
  [data-list-id^=forum-channel-list] button[class^=submitButton][class*=colorBrand] {
    background-color: #${config.colorScheme.palette.base0D};
    color: #${config.colorScheme.palette.base01};
  }
  
  div[class^=applicationCommand] span[class*=selectedPill_] {
    border-color: #${config.colorScheme.palette.base0D} !important;
  }
  div[class^=applicationCommand] span[class*=erroredPill_] {
    border-color: #${config.colorScheme.palette.base08} !important;
  }
  
  div[class^=chat] > div[class^=content] main[class^=chatContent] + div[class^=container] {
    background-color: var(--background-secondary);
  }
  
  [class*=channelTextAreaInnerError_] {
    border: 1px solid #${config.colorScheme.palette.base08} !important;
  }
  
  div[class^=messagesWrapper] ol[class^=scrollerInner] > div[class^=container]:not([class*=cozy]) div[class^=emptyChannelIcon] {
    background-image: url("data:image/svg+xml,%3Csvg fill='${hexToRgb "${config.colorScheme.palette.base01}"}' height='44' viewBox='0 0 44 44' width='44' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath clip-rule='evenodd' d='m10.295 38.5c-.31112 0-.54669-.2811-.49232-.5874l1.19742-6.7459h-6.73825c-.31061 0-.54605-.2803-.49251-.5862l.46666-2.6667c.04187-.2392.24963-.4138.49252-.4138h6.91328l1.9433-11h-6.73825c-.31061 0-.54605-.2802-.49251-.5862l.46666-2.6667c.04187-.2392.24963-.4138.49252-.4138h6.91328l1.2284-6.92068c.0424-.23871.2499-.41262.4923-.41262h2.651c.3111 0 .5467.28107.4923.58738l-1.1974 6.74592h11l1.2284-6.92068c.0424-.23871.2499-.41262.4924-.41262h2.651c.3111 0 .5467.28107.4923.58738l-1.1974 6.74592h6.7382c.3106 0 .5461.2803.4925.5862l-.4666 2.6667c-.0419.2392-.2497.4138-.4925.4138h-6.9133l-1.9433 11h6.7382c.3106 0 .5461.2802.4925.5862l-.4666 2.6667c-.0419.2392-.2497.4138-.4925.4138h-6.9133l-1.2284 6.9207c-.0424.2387-.2499.4126-.4923.4126h-2.651c-.3111 0-.5467-.2811-.4924-.5874l1.1975-6.7459h-11l-1.2285 6.9207c-.0423.2387-.2498.4126-.4923.4126zm6.9576-22-1.9434 11h11l1.9434-11z'/%3E%3C/svg%3E");
  }
  div[class^=messagesWrapper] ol[class^=scrollerInner] > div[class^=container]:not([class*=cozy]) div[class^=iconWrapper] {
    background-color: #${config.colorScheme.palette.base0D};
  }
  div[class^=messagesWrapper] ol[class^=scrollerInner] > div[class^=container]:not([class*=cozy]) div[class^=iconWrapper] svg[class^=icon] {
    color: #${config.colorScheme.palette.base01};
  }
  
  div[class^=jumpToPresentBar] button[class*=barButtonBase_] {
    color: #${config.colorScheme.palette.base01} !important;
  }
  div[class^=jumpToPresentBar] span[class^=item] {
    background-color: #${config.colorScheme.palette.base01};
  }
  
  div[class^=callContainer] [class*=controlIcon_] {
    color: #${config.colorScheme.palette.base07};
  }
  div[class^=callContainer] [class*=controlIcon_]:hover {
    color: #${config.colorScheme.palette.base05};
  }
  div[class^=callContainer] div[class*=tile_],
  div[class^=callContainer] div[class*=background_] {
    background-color: #${config.colorScheme.palette.base00} !important;
  }
  div[class^=callContainer] div[class*=overlayTitle],
  div[class^=callContainer] svg[class*=status_] {
    background-color: #${config.colorScheme.palette.base02};
    color: #${config.colorScheme.palette.base05};
  }
  div[class^=callContainer] div[class*=header],
  div[class^=callContainer] svg[class*=selectedIcon_] {
    color: #${config.colorScheme.palette.base05};
  }
  div[class^=callContainer] div[class*=button_][class*=contents_],
  div[class^=callContainer] button[class*=cta_],
  div[class^=callContainer] button[class*=participantsButton_] {
    background-color: #${config.colorScheme.palette.base02};
    color: #${config.colorScheme.palette.base05};
  }
  div[class^=callContainer] div[class^=indicators] div[class^=liveQualityIndicator] {
    background-color: #${config.colorScheme.palette.base08} !important;
  }
  div[class^=callContainer] div[class^=indicators] div[class^=liveQualityIndicator] svg[class^=premiumStreamIcon] {
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=callContainer] div[class^=videoControls] div[class^=children] div[class*=playingText_] {
    color: #${config.colorScheme.palette.base07};
  }
  div[class^=callContainer] div[class^=videoControls] div[class^=bottomControls] button[class^=textButton] {
    color: #${config.colorScheme.palette.base05};
    background-color: #${config.colorScheme.palette.base03};
  }
  div[class^=callContainer] div[class^=videoControls] div[class^=toolbar] svg[class^=controlIcon] {
    color: var(--interactive-normal);
  }
  div[class^=callContainer] div[class^=videoControls] div[class^=toolbar] div[class^=streamQualityIndicator] div[class^=liveQualityIndicator] {
    background-color: #${config.colorScheme.palette.base03} !important;
  }
  div[class^=callContainer] div[class^=videoControls] div[class^=toolbar] div[class^=streamQualityIndicator] div[class^=liveQualityIndicator] div[class^=qualityIndicator] {
    color: #${config.colorScheme.palette.base05};
  }
  div[class^=callContainer] div[class^=videoControls] div[class^=toolbar] div[class^=streamQualityIndicator] div[class^=liveQualityIndicator] svg[class^=premiumStreamIcon] {
    color: #${config.colorScheme.palette.base05};
  }
  div[class^=callContainer] div[class^=videoControls] div[class^=toolbar] div[class^=liveIndicator] div[class^=live] {
    background-color: #${config.colorScheme.palette.base08} !important;
    color: #${config.colorScheme.palette.base01} !important;
  }
  div[class^=callContainer] div[class^=videoControls] div[class^=toolbar] div[class*=clipsEnabledIndicator] div[class^=clipBadge] {
    background-color: #${config.colorScheme.palette.base0D} !important;
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=callContainer] div[class^=videoControls] button[class*=leftTrayIcon_][class*=buttonColor_] {
    background-color: #${config.colorScheme.palette.base02};
    color: #${config.colorScheme.palette.base05};
  }
  div[class^=callContainer] div[class^=videoControls] div[class^=badge] {
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=callContainer] div[class^=videoControls] [class*=colorable_][class*=red_] {
    background: #${config.colorScheme.palette.base08};
  }
  div[class^=callContainer] div[class^=videoControls] [class*=colorable_][class*=red_] [class*=centerIcon_] {
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=callContainer] div[class^=videoControls] [class*=colorable_][class*=red_] svg[class^=contextMenuCaret] path {
    stroke: #${config.colorScheme.palette.base01} !important;
  }
  div[class^=callContainer] div[class^=videoControls] [class*=colorable_][class*=primaryDark_] {
    background: #${config.colorScheme.palette.base03};
    color: #${config.colorScheme.palette.base05};
  }
  div[class^=callContainer] div[class^=videoControls] [class*=colorable_][class*=primaryDark_] [class*=centerIcon_] {
    color: #${config.colorScheme.palette.base05};
  }
  div[class^=callContainer] div[class^=videoControls] [class*=colorable_][class*=primaryDark_] svg[class^=raisedHandButtonIcon] {
    color: #${config.colorScheme.palette.base05};
  }
  div[class^=callContainer] div[class^=videoControls] [class*=colorable_][class*=green_] {
    background: #${config.colorScheme.palette.base0B};
  }
  div[class^=callContainer] div[class^=videoControls] [class*=colorable_][class*=green_] [class*=centerIcon_] {
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=callContainer] div[class^=videoControls] [class*=colorable_][class*=white_] {
    color: #${config.colorScheme.palette.base01};
    background-color: #${config.colorScheme.palette.base07};
  }
  div[class^=callContainer] div[class^=videoControls] [class*=colorable_][class*=white_] [class*=centerIcon_] {
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=callContainer] div[class^=videoControls] [class*=colorable_][class*=white_]:hover, div[class^=callContainer] div[class^=videoControls] [class*=colorable_][class*=white_][class*=active_] {
    background: #${config.colorScheme.palette.base05};
  }
  
  div[class^=chat] section[class*=forumOrHome_] {
    background-color: #${config.colorScheme.palette.base00};
  }
  div[class^=chat] section[class*=forumOrHome_] div[class^=upperContainer] > div[class^=children]:after {
    background: none;
  }
  
  div[class*=giftCodeContainer] [class*=tile] {
    background-color: #${config.colorScheme.palette.base01};
  }
  div[class*=giftCodeContainer] [class*=tile] > [class*=description] {
    color: #${config.colorScheme.palette.base05};
  }
  
  div[class*=chat_] section[class*=header_] {
    background-color: #${config.colorScheme.palette.base01};
  }
  div[class*=chat_] div[class*=content_][class*=container_] {
    background-color: #${config.colorScheme.palette.base01};
  }
  div[class*=chat_] div[class*=content_][class*=container_] div[class*=container] {
    background-color: #${config.colorScheme.palette.base01};
  }
  div[class*=chat_] div[class*=content_][class*=container_] div[class*=search_] {
    background-color: #${config.colorScheme.palette.base00} !important;
  }
  div[class*=chat_] div[class*=content_][class*=container_] div[class*=search_] input::placeholder {
    color: #${config.colorScheme.palette.base04};
  }
  div[class*=chat_] div[class*=content_][class*=container_] div[class*=browser] div[class*=content] div[class^=container] {
    background-color: #${config.colorScheme.palette.base00};
  }
  div[class*=chat_] div[class*=content_][class*=container_] div[class*=scrollerContainer_] {
    background-color: #${config.colorScheme.palette.base01};
  }
  div[class*=chat_] div[class*=content_][class*=container_] div[class*=scrollerContainer_] div[class*=checkIcon_][style*="opacity: 1;"] > svg > path {
    fill: #${config.colorScheme.palette.base01};
  }
  div[class*=chat_] div[class*=content_][class*=container_] div[role=tablist] {
    background-color: #${config.colorScheme.palette.base01};
    border-bottom: 2px solid #${config.colorScheme.palette.base02};
  }
  
  [class*=textBadge_] {
    color: #${config.colorScheme.palette.base01};
  }
  
  div[class*=chat_] section[class*=title] div[class*=searchBar] span[class*=search] {
    background-color: #${config.colorScheme.palette.base02};
    color: #${config.colorScheme.palette.base05};
  }
  div[class*=chat_] nav[class*=pageControl] div[class*=roundButton][class*=activeButton] span {
    color: #${config.colorScheme.palette.base01};
  }
  
  div[class*=chat_] li[class*=mainCard_][class*=container] {
    background-color: #${config.colorScheme.palette.base02};
  }
  div[class*=chat_] li[class*=mainCard_][class*=container]:hover {
    background-color: #${config.colorScheme.palette.base03};
  }
  div[class*=chat_] li[class*=mainCard_][class*=container] div[class*=contentPreview_] {
    background-color: #${config.colorScheme.palette.base00};
    border: none;
  }
  div[class*=chat_] li[class*=mainCard_][class*=container] div[class*=contentPreview_] div[class*=textContentFooter_] {
    background: none;
  }
  div[class*=chat_] li[class*=mainCard_][class*=container] div[class*=tags_] div[class*=tagPill_] {
    background-color: rgba(81, 87, 109, 0.8);
  }
  div[class*=chat_] div[class*=emptyPage] {
    background-color: #${config.colorScheme.palette.base00};
  }
  div[class*=chat_] div[class*=innerHeader]:after {
    background: none;
  }
  
  [id*=message-accessories-] > [class*=invite_] {
    background-color: #${config.colorScheme.palette.base00};
  }
  [id*=message-accessories-] > [class*=invite_] [class*=inFront_][class*=header_] {
    color: #${config.colorScheme.palette.base07};
  }
  [id*=message-accessories-] > [class*=invite_] [class*=partyStatus_] {
    color: #${config.colorScheme.palette.base05};
  }
  
  [class^=avatar] [class^=dots] {
    color: #${config.colorScheme.palette.base00};
  }
  
  div[class^=chat][class*=page_],
  div[class^=chat][class*=page_] div[class*=content_][class*=container_] {
    background-color: #${config.colorScheme.palette.base01};
  }
  
  div[class^=chat] div[class^=homeContainer] {
    height: 100%;
  }
  
  .messagelogger-deleted div {
    color: #${config.colorScheme.palette.base08} !important;
  }
  
  .messagelogger-deleted div a {
    color: #${config.colorScheme.palette.base08} !important;
  }
  
  aside[class^=membersWrap] {
    height: 100%;
  }
  
  div[class^=upperContainer] div[class^=akaBadge] {
    background-color: #${config.colorScheme.palette.base0D};
    color: #${config.colorScheme.palette.base01};
  }
  
  div[class^=message][class*=isSystemMessage] div[class^=icon][style*="/assets/7378a83d74ce97d83380.svg"], div[class^=message][class*=isSystemMessage] div[class^=icon][style*="/assets/9f3b9c1b6e5f77294951.svg"] {
    filter: url('data:image/svg+xml;utf8,    <svg xmlns="http://www.w3.org/2000/svg">      <filter id="ctp-recolor" color-interpolation-filters="sRGB">        <feColorMatrix type="matrix" values="          0 0 0 0 0.6509803922          0 0 0 0 0.8196078431          0 0 0 0 0.537254902          0 0 0 1 0        "/>      </filter>    </svg>    #ctp-recolor');
  }
  div[class^=message][class*=isSystemMessage] div[class^=icon][style*="/assets/a1d461025204711133ec.svg"] {
    filter: url('data:image/svg+xml;utf8,    <svg xmlns="http://www.w3.org/2000/svg">      <filter id="ctp-recolor" color-interpolation-filters="sRGB">        <feColorMatrix type="matrix" values="          0 0 0 0 0.6470588235          0 0 0 0 0.6784313725          0 0 0 0 0.8078431373          0 0 0 1 0        "/>      </filter>    </svg>    #ctp-recolor');
  }
  div[class^=message][class*=isSystemMessage] div[class^=icon][style*="/assets/192510ade1abc3149b46.svg"] {
    filter: url('data:image/svg+xml;utf8,    <svg xmlns="http://www.w3.org/2000/svg">      <filter id="ctp-recolor" color-interpolation-filters="sRGB">        <feColorMatrix type="matrix" values="          0 0 0 0 0.9058823529          0 0 0 0 0.5098039216          0 0 0 0 0.5176470588          0 0 0 1 0        "/>      </filter>    </svg>    #ctp-recolor');
  }
  
  div[class^=layerContainer] [role=menu] {
    --brand-experiment-560: var(--brand-experiment-25a);
    --brand-experiment-600: var(--brand-experiment);
  }
  div[class^=layerContainer] [role=menu] [class*=colorDefault][class*=colorBrand] {
    color: #${config.colorScheme.palette.base0D};
  }
  div[class^=layerContainer] [role=menu] [class*=colorDefault][class*=focused]:not([class*=colorDanger]),
  div[class^=layerContainer] [role=menu] [class*=colorDefault][class*=focused] [class*=checkbox_] {
    color: var(--interactive-normal);
  }
  div[class^=layerContainer] [role=menu] [class*=colorDefault][role=menuitem]:not([class*=colorDanger],
  [id*=user-context-user-volume]):hover {
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=layerContainer] [role=menu] [class*=colorDefault][role=menuitem]:not([class*=colorDanger],
  [id*=user-context-user-volume]):hover:not([class*=colorPremiumGradient]) {
    background: var(--background-accent);
  }
  div[class^=layerContainer] [role=menu] [class*=colorDefault][role=menuitem]:not([class*=colorDanger],
  [id*=user-context-user-volume]):hover [class*=subtext],
  div[class^=layerContainer] [role=menu] [class*=colorDefault][role=menuitem]:not([class*=colorDanger],
  [id*=user-context-user-volume]):hover [class*=caret_] {
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=layerContainer] [role=menu] [class*=colorDefault] [class*=caret] {
    color: #${config.colorScheme.palette.base05};
  }
  div[class^=layerContainer] [role=menu] [class*=colorDefault]:hover [class*=caret] {
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=layerContainer] [role=menu] [class*=colorDefault]:active:not([class*=hideInteraction_]) {
    color: var(--background-floating);
  }
  div[class^=layerContainer] [role=menu] [class*=colorDefault]:active:not([class*=hideInteraction_]) [class*=check_] {
    color: var(--interactive-normal);
  }
  div[class^=layerContainer] [role=menu] [class*=colorDefault]:active:not([class*=hideInteraction_]) [class*=checkbox_] {
    color: var(--background-floating);
  }
  div[class^=layerContainer] [role=menu] [class*=colorDefault]:active:not([class*=hideInteraction_]) [class*=colorPremiumGradient] {
    background: linear-gradient(270deg, var(--premium-tier-2-pink-for-gradients) 0%, var(--premium-tier-2-pink-for-gradients-2) 33.63%, var(--premium-tier-2-purple-for-gradients) 100%);
  }
  div[class^=layerContainer] [role=menu] div[id^=account-switch-account][class*=focused] div[class*=userMenuUsername] div {
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=layerContainer] [role=menu] div[id^=account-switch-account][class*=focused] svg[class^=activeIcon] circle {
    fill: #${config.colorScheme.palette.base0D};
  }
  div[class^=layerContainer] [role=menu] div[id^=account-switch-account][class*=focused] svg[class^=activeIcon] g path {
    fill: #${config.colorScheme.palette.base01};
  }
  div[class^=layerContainer] [role=menu] div[id^=account-switch-account] svg[class^=activeIcon] circle {
    fill: #${config.colorScheme.palette.base01};
  }
  div[class^=layerContainer] [role=menu] div[id^=account-switch-account] svg[class^=activeIcon] g path {
    fill: #${config.colorScheme.palette.base0D};
  }
  div[class^=layerContainer] [role=menu] [class*=colorDanger][class*=focused],
  div[class^=layerContainer] [role=menu] [class*=colorDefault] [class*=check_] {
    color: var(--background-floating);
    background-color: #${config.colorScheme.palette.base08};
  }
  div[class^=layerContainer] [role=menu] #guild-header-popout-premium-subscribe div[class^=iconContainer] > svg {
    color: #${config.colorScheme.palette.base0F};
  }
  div[class^=layerContainer] [role=menu] #user-context-user-volume div[class*=slider_] div[class*=bar_] {
    background-color: #${config.colorScheme.palette.base02};
  }
  
  .theme-dark div[class^=layerContainer] div[id^=popout_] > div[class*=didRender_]:not([class^=animatorBottom]) > div div[class*=flowerStarContainer_] svg[class*=flowerStar_] *,
  .theme-light div[class^=layerContainer] div[id^=popout_] > div[class*=didRender_]:not([class^=animatorBottom]) > div div[class*=flowerStarContainer_] svg[class*=flowerStar_] * {
    fill: #${config.colorScheme.palette.base0D};
  }
  .theme-dark div[class^=layerContainer] div[id^=popout_] > div[class*=didRender_] div[class*=countText],
  .theme-light div[class^=layerContainer] div[id^=popout_] > div[class*=didRender_] div[class*=countText] {
    color: #${config.colorScheme.palette.base01};
  }
  .theme-dark div[class^=layerContainer] div[id^=popout_] > div[class*=didRender_] svg[class*=activeIcon] circle,
  .theme-light div[class^=layerContainer] div[id^=popout_] > div[class*=didRender_] svg[class*=activeIcon] circle {
    fill: #${config.colorScheme.palette.base01};
  }
  .theme-dark div[class^=layerContainer] div[id^=popout_] > div[class*=didRender_] svg[class*=activeIcon] g path,
  .theme-light div[class^=layerContainer] div[id^=popout_] > div[class*=didRender_] svg[class*=activeIcon] g path {
    fill: #${config.colorScheme.palette.base0D};
  }
  .theme-dark div[class^=layerContainer] div[id^=popout_] > div[class*=didRender_] div[class*=container] div[class^=popoutBottom] span[class^=secured]::before,
  .theme-light div[class^=layerContainer] div[id^=popout_] > div[class*=didRender_] div[class*=container] div[class^=popoutBottom] span[class^=secured]::before {
    filter: url('data:image/svg+xml;utf8,    <svg xmlns="http://www.w3.org/2000/svg">      <filter id="ctp-recolor" color-interpolation-filters="sRGB">        <feColorMatrix type="matrix" values="          0 0 0 0 0.6509803922          0 0 0 0 0.8196078431          0 0 0 0 0.537254902          0 0 0 1 0        "/>      </filter>    </svg>    #ctp-recolor');
  }
  .theme-dark div[class^=layerContainer] div[id^=popout_] > div[class*=didRender_] div[class*=container] div[class*=autocompleteArrow_],
  .theme-dark div[class^=layerContainer] div[id^=popout_] > div[class*=didRender_] div[class*=container] header,
  .theme-light div[class^=layerContainer] div[id^=popout_] > div[class*=didRender_] div[class*=container] div[class*=autocompleteArrow_],
  .theme-light div[class^=layerContainer] div[id^=popout_] > div[class*=didRender_] div[class*=container] header {
    background-color: #${config.colorScheme.palette.base01};
  }
  .theme-dark div[class^=layerContainer] div[id^=popout_] > div[class*=didRender_] div[class*=container] header > input::placeholder,
  .theme-light div[class^=layerContainer] div[id^=popout_] > div[class*=didRender_] div[class*=container] header > input::placeholder {
    color: #${config.colorScheme.palette.base07};
  }
  .theme-dark div[class^=layerContainer] div[id^=popout_] > div[class*=didRender_] div[class*=container] section,
  .theme-light div[class^=layerContainer] div[id^=popout_] > div[class*=didRender_] div[class*=container] section {
    background-color: #${config.colorScheme.palette.base00};
    color: #${config.colorScheme.palette.base05};
  }
  
  div[class*=recentMentionsPopout] div[class^=header] div[class^=tabBar] div[class^=badge],
  div[class*=recentMentionsPopout] div[class^=header] div[class^=tabBar] div[class^=tab][class*=active_] {
    color: #${config.colorScheme.palette.base00};
  }
  div[class*=recentMentionsPopout] div[class^=header] div[class^=controls-] {
    --background-secondary: #${config.colorScheme.palette.base02};
    --background-primary: rgba(65, 69, 89, 0.9);
  }
  div[class*=recentMentionsPopout] div[class^=scroller] [role=button] {
    --background-tertiary: rgba(165, 173, 206, 0.15);
    --background-floating: rgba(165, 173, 206, 0.12);
  }
  div[class*=recentMentionsPopout] div[class^=scroller] [role=button] div[class*=jumpButton_] {
    background-color: #${config.colorScheme.palette.base02};
  }
  
  div[class*=rolesList] div[class^=role],
  div[class*=rolesList] button[class^=addButton] {
    background-color: #${config.colorScheme.palette.base00};
  }
  div[class*=rolesList] div[class^=role] span[class^=roleCircle][style*="background-color: rgb(185, 187, 190)"] {
    background-color: #${config.colorScheme.palette.base07} !important;
  }
  div[class*=rolesList] div[class^=role] span[class^=roleCircle][style*="background-color: rgb(54, 57, 62)"], div[class*=rolesList] div[class^=role] span[class^=roleCircle][style*="background-color: rgb(53, 57, 64)"] {
    background-color: #${config.colorScheme.palette.base00} !important;
  }
  
  div[class*=layerContainer] > div[class*=layer] div[class^=reactors] {
    background-color: var(--background-primary);
  }
  div[class*=layerContainer] > div[class*=layer] div[class*=reactorDefault] {
    -webkit-box-shadow: inset 0 -1px 0 var(--background-modifier-accent);
    box-shadow: inset 0 -1px 0 var(--background-modifier-accent);
  }
  div[class*=layerContainer] > div[class*=layer] div[class*=reactionSelected] {
    background-color: var(--background-modifier-selected);
  }
  div[class*=layerContainer] > div[class*=layer] div[class*=friendSelected] {
    background: #${config.colorScheme.palette.base02} !important;
  }
  
  section[class*=positionContainer_] button[class*=navButtonActive] {
    background-color: #${config.colorScheme.palette.base0D};
    color: #${config.colorScheme.palette.base01};
  }
  
  .theme-light section[class^=positionContainer] div[class^=categoryText] {
    color: #${config.colorScheme.palette.base00};
  }
  
  #emoji-picker-tab-panel [class*=stickerInspected_] [class*=inspectedIndicator],
  #emoji-picker-tab-panel [class^=emojiItem][class*=emojiItemSelected_] {
    background-color: var(--brand-experiment-25a);
  }
  #emoji-picker-tab-panel [class*=newlyAddedHighlight_] {
    border: 1px solid #${config.colorScheme.palette.base0B};
  }
  #emoji-picker-tab-panel [class*=newlyAddedHighlight_] ~ [class*=newlyAddedBadge_] {
    background: #${config.colorScheme.palette.base0B} !important;
    color: #${config.colorScheme.palette.base01};
  }
  
  [class*=stickerInspected_] [class^=inspectedIndicator] {
    background-color: var(--brand-experiment-25a);
  }
  
  .theme-light > div[class^=focusLock] > div[class^=root] > div[class^=container] div[class*=footer][class*=footerSeparator_] {
    box-shadow: inset 0 1px 0 #${config.colorScheme.palette.base02};
    -webkit-box-shadow: inset 0 1px 0 #${config.colorScheme.palette.base02};
  }
  .theme-light > div[class^=focusLock] > div[class^=root] {
    box-shadow: 0 0 0 1px #${config.colorScheme.palette.base02}, 0 2px 10px 0 hsla(0, calc(var(--saturation-factor, 1) * 0%), 0%, 0.1);
    -webkit-box-shadow: 0 0 0 1px #${config.colorScheme.palette.base02}, 0 2px 10px 0 hsla(0, calc(var(--saturation-factor, 1) * 0%), 0%, 0.1);
  }
  .theme-light div[class^=focusLock] div[class^=downloadApps] {
    background-color: #${config.colorScheme.palette.base00} !important;
  }
  .theme-light div[class^=focusLock] div[class^=downloadApps] button[class^=modalCloseButton],
  .theme-light div[class^=focusLock] div[class^=downloadApps] h2,
  .theme-light div[class^=focusLock] div[class^=downloadApps] h3 {
    color: #${config.colorScheme.palette.base05};
  }
  .theme-light div[class^=focusLock] div[class^=downloadApps] div[class*=footer_] {
    color: #${config.colorScheme.palette.base05} !important;
    background-color: unset !important;
  }
  .theme-light div[class^=focusLock] div[class^=downloadApps] div[class*=footer_] a {
    color: #${config.colorScheme.palette.base0D};
  }
  .theme-light div[class^=focusLock] div[class^=downloadApps] li[class*=active_] a[class*=downloadButton_] {
    transition: all 0.3s ease-in-out;
    color: #${config.colorScheme.palette.base00};
  }
  .theme-light[class*=profileColors_] [class*=userTagUsernameBase_],
  .theme-light[class*=profileColors_] [class*=discrimBase_],
  .theme-light[class*=profileColors_] [class*=title_],
  .theme-light[class*=profileColors_] [class*=roles_],
  .theme-light[class*=profileColors_] [class*=defaultColor_],
  .theme-light[class*=profileColors_] [class*=markup_],
  .theme-light[class*=profileColors_] [class*=activityUserPopoutV2_] *,
  .theme-light[class*=profileColors_] [class*=customStatus_],
  .theme-light[class*=profileColors_] [class*=section_],
  .theme-light[class*=profileColors_] [class*=additionalActionsIcon_],
  .theme-light[class*=profileColors_] [class*=overlayBackground_] * {
    --interactive-normal: #${config.colorScheme.palette.base01};
    --text-normal: #${config.colorScheme.palette.base01};
    --interactive-active: #${config.colorScheme.palette.base01};
    --interactive-hover: #${config.colorScheme.palette.base01};
  }
  .theme-light[class*=profileColors_] [class*=userTagUsernameBase_]:not(a),
  .theme-light[class*=profileColors_] [class*=discrimBase_]:not(a),
  .theme-light[class*=profileColors_] [class*=title_]:not(a),
  .theme-light[class*=profileColors_] [class*=roles_]:not(a),
  .theme-light[class*=profileColors_] [class*=defaultColor_]:not(a),
  .theme-light[class*=profileColors_] [class*=markup_]:not(a),
  .theme-light[class*=profileColors_] [class*=activityUserPopoutV2_] *:not(a),
  .theme-light[class*=profileColors_] [class*=customStatus_]:not(a),
  .theme-light[class*=profileColors_] [class*=section_]:not(a),
  .theme-light[class*=profileColors_] [class*=additionalActionsIcon_]:not(a),
  .theme-light[class*=profileColors_] [class*=overlayBackground_] *:not(a) {
    color: unset !important;
  }
  
  div[class^=layerContainer] #guild-header-popout,
  div[class^=layerContainer] #guild-context,
  div[class^=layerContainer] div[id^=channel-context],
  div[class^=layerContainer] div[id^=user-context] {
    background: #${config.colorScheme.palette.base01};
  }
  div[class^=layerContainer] > div[class*=layer] div[role=listbox] {
    background-color: #${config.colorScheme.palette.base01};
  }
  div[class^=layerContainer] > div[class*=layer] div[role=listbox] div[role=option][aria-selected=true] {
    background: #${config.colorScheme.palette.base02};
  }
  div[class^=layerContainer] > div[class*=layer] div[role=listbox] div[role=option] svg[class*=selectedIcon] circle {
    fill: #${config.colorScheme.palette.base01};
  }
  div[class^=layerContainer] > div[class*=layer] div[role=listbox] div[class*=queryText_] {
    color: #${config.colorScheme.palette.base07};
  }
  div[class^=layerContainer] > div[class*=layer] div[role=listbox] div[class*=queryText_] strong {
    color: #${config.colorScheme.palette.base05};
  }
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class^=modal],
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class^=modalSize],
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class^=uploadModal],
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class^=contentWrapper] {
    background-color: #${config.colorScheme.palette.base01};
  }
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class^=modal] li,
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class^=modal] p,
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class^=modal] span,
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class^=modalSize] li,
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class^=modalSize] p,
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class^=modalSize] span,
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class^=uploadModal] li,
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class^=uploadModal] p,
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class^=uploadModal] span,
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class^=contentWrapper] li,
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class^=contentWrapper] p,
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class^=contentWrapper] span {
    color: #${config.colorScheme.palette.base05};
  }
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class*=footer] {
    background-color: #${config.colorScheme.palette.base01};
  }
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class*=footer] button[type=submit] span {
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class*=footer] [class*=footerText_] {
    color: #${config.colorScheme.palette.base07};
  }
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] h1[class^=fixed],
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] h2[class^=fixed],
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] h3[class^=fixed],
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] h4[class^=fixed],
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] h5[class^=fixed],
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] h6[class^=fixed] {
    color: #${config.colorScheme.palette.base08};
  }
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] h1[class^=fixed]:after,
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] h2[class^=fixed]:after,
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] h3[class^=fixed]:after,
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] h4[class^=fixed]:after,
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] h5[class^=fixed]:after,
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] h6[class^=fixed]:after {
    background-color: #${config.colorScheme.palette.base08};
  }
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock] div[class*=message_] {
    background-color: #${config.colorScheme.palette.base02};
  }
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock][aria-label=Activities] div[class*=activityItem_] {
    background-color: #${config.colorScheme.palette.base01};
  }
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock][aria-label=Activities] div[class*=activityItem_] div[class*=previewBadge_] {
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock][aria-label=Activities] div[class*=activityTag_] {
    background-color: #${config.colorScheme.palette.base02};
  }
  div[class^=layerContainer] > div[class*=layer] div[class^=focusLock][aria-label="Manage Accounts"] div[class*=navRow_] {
    background-color: #${config.colorScheme.palette.base01};
  }
  div[class^=layerContainer] > div[class*=layer] div[class^=checkbox][class*=checked_] {
    border: none;
  }
  div[class^=layerContainer] > div[class*=layer] div[class^=checkbox][class*=checked_] svg path {
    fill: #${config.colorScheme.palette.base01};
  }
  div[class^=layerContainer] div[class^=addGamePopout] {
    background-color: #${config.colorScheme.palette.base01};
  }
  div[class^=layerContainer] div[class*=searchOption_]::after,
  div[class^=layerContainer] div[class*=option_]::after,
  div[class^=layerContainer] li[class*=option_]::after {
    display: none;
  }
  div[class^=layerContainer] div[class^=queryContainer] {
    background-color: #${config.colorScheme.palette.base01} !important;
  }
  div[class^=layerContainer] div[class^=queryContainer] span[class^=key] {
    color: #${config.colorScheme.palette.base05};
    background-color: #${config.colorScheme.palette.base00};
  }
  div[class^=layerContainer] [class*=tooltipBrand_],
  div[class^=layerContainer] [class*=tooltipRed_],
  div[class^=layerContainer] [class*=tooltipGreen_],
  div[class^=layerContainer] [class*=tooltipYellow] {
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=layerContainer] div[class^=popout] div[class^=row][role=button]:hover {
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=layerContainer] div[class^=popout] div[class^=row][role=button]:hover [class*=timestamp] {
    color: #${config.colorScheme.palette.base01};
  }
  
  form[class*=card_] {
    background-color: #${config.colorScheme.palette.base00};
  }
  
  div[class*=userInfoSection_] div[class^=connectedAccountContainer] {
    background-color: rgba(65, 69, 89, 0.45) !important;
  }
  
  div[class*=cardWarning_] div[class*=warning_] {
    color: #${config.colorScheme.palette.base01};
  }
  
  #emoji-picker-tab-panel,
  #sticker-picker-tab-panel {
    /* --background-floating: #${config.colorScheme.palette.base02};
  
      + div[class^="slotsContainer"] {
        background-color: $surface0;
      }
    */
  }
  #emoji-picker-tab-panel div[class^=tooltipContainer] label[class^=label][class*=labelChecked_],
  #sticker-picker-tab-panel div[class^=tooltipContainer] label[class^=label][class*=labelChecked_] {
    background: -webkit-gradient(linear, right top, left top, from(#${config.colorScheme.palette.base0F}), color-stop(33.33%, #${config.colorScheme.palette.base0E}), to(#${config.colorScheme.palette.base0D}));
    background: linear-gradient(270deg, #${config.colorScheme.palette.base0F}, #${config.colorScheme.palette.base0E} 33.33%, #${config.colorScheme.palette.base0D});
  }
  
  button#reaction-picker-tab div[class^=contents] {
    color: #${config.colorScheme.palette.base01};
  }
  
  div[class*=keyboardShortcutsModal_] {
    background-color: #${config.colorScheme.palette.base01} !important;
  }
  div[class*=keyboardShortcutsModal_] div[class^=keybindShortcut] span[class^=key] {
    color: #${config.colorScheme.palette.base01};
  }
  div[class*=keyboardShortcutsModal_] div[class^=keybindShortcut] span[class^=key] svg g {
    fill: #${config.colorScheme.palette.base01} !important;
  }
  
  div[class^=planOptionClickableContainer] div[class^=checkbox][class*=checked] svg path {
    fill: #${config.colorScheme.palette.base01} !important;
  }
  div[class^=planOptionClickableContainer] span[class*=planOptionDiscount_] {
    color: #${config.colorScheme.palette.base01} !important;
  }
  
  .react-datepicker,
  .react-datepicker__header {
    background-color: #${config.colorScheme.palette.base01} !important;
  }
  
  .react-datepicker__day {
    background-color: #${config.colorScheme.palette.base01} !important;
  }
  
  .react-datepicker__day:active {
    background: #${config.colorScheme.palette.base0D} !important;
  }
  
  .react-datepicker__day--selected:after {
    background-color: #${config.colorScheme.palette.base0D} !important;
  }
  
  [class^=datePickerHint] [class^=hintValue] {
    color: #${config.colorScheme.palette.base01} !important;
  }
  
  div[class*=layerContainer_] div[class^=control] div[class*=checked_] {
    background-color: #${config.colorScheme.palette.base0B} !important;
  }
  div[class*=layerContainer_] div[class^=control] div[style*="background-color: rgb(114, 118, 125);"] {
    background-color: #${config.colorScheme.palette.base04} !important;
  }
  
  div[class*=layerContainer_] div[class*=guildPopout_][role=dialog] {
    background-color: #${config.colorScheme.palette.base00};
  }
  div[class*=layerContainer_] div[class*=guildPopout_][role=dialog] div[class*=guildName_] {
    color: #${config.colorScheme.palette.base05};
  }
  
  div[class*=layerContainer_] [role*=dialog] a[class*=downloadLink_] {
    color: #${config.colorScheme.palette.base07} !important;
    opacity: 1;
  }
  div[class*=layerContainer_] [role*=dialog] a[class*=downloadLink_]:hover {
    color: #${config.colorScheme.palette.base05} !important;
  }
  
  div[class*=userPopoutOuter_] div[aria-label="HypeSquad Bravery"] img,
  div[class*=userProfileOuter_] div[aria-label="HypeSquad Bravery"] img {
    content: url("data:image/svg+xml,%3Csvg height='24' viewBox='0 0 24 24' width='24' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath clip-rule='evenodd' d='m5.01502 4h13.97008c.1187 0 .215.09992.215.22305v9.97865c0 .0697-.0312.1343-.0837.1767l-6.985 5.5752c-.0389.0313-.0847.0464-.1314.0464-.0466 0-.0924-.0151-.1313-.0464l-6.985-5.5752c-.05252-.0424-.08365-.107-.08365-.1767v-9.97865c0-.12313.0963-.22305.21497-.22305zm7.82148 7.0972 4.1275-2.71296c.1039-.06863.2299.04542.1725.15644l-1.7114 3.36192c-.0403.0807.0182.1756.1079.1756h1.0246c.118 0 .1664.1504.0706.219l-4.6267 3.3175c-.0414.0303-.0978.0303-.1402 0l-4.6267-3.3175c-.0948-.0686-.04639-.219.07059-.219h1.02356c.09076 0 .14925-.0949.10791-.1756l-1.71132-3.36293c-.05648-.11001.06958-.22305.17345-.15543l4.12851 2.71296c.0716.0474.1291.112.1674.1887l.6293 1.2636c.0444.0888.1714.0888.2158 0l.6293-1.2636c.0383-.0767.0958-.1423.1674-.1887z' fill='%23${config.colorScheme.palette.base0E}' fill-rule='evenodd'/%3E%3C/svg%3E");
  }
  div[class*=userPopoutOuter_] div[aria-label="HypeSquad Balance"],
  div[class*=userProfileOuter_] div[aria-label="HypeSquad Balance"] {
    content: url("data:image/svg+xml,%3Csvg height='24' viewBox='0 0 24 24' width='24' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath clip-rule='evenodd' d='m11.8622 4.05696c.076-.07595.1996-.07595.2756 0l7.8048 7.80474c.0371.0362.0574.0865.0574.1377 0 .0513-.0212.1016-.0574.1378l-7.8048 7.8047c-.038.038-.0883.0574-.1378.0574s-.0998-.0194-.1378-.0574l-7.8048-7.8047c-.03709-.0362-.0574-.0857-.0574-.1378s.02031-.1015.0574-.1377zm.9299 8.29474 3.6146-2.37377c.0909-.05917.2013.03977.151.13597l-1.4986 2.9416c-.0354.0707.0158.1537.0944.1537h.8973c.1033 0 .1457.1316.0618.1916l-4.0517 2.9028c-.0362.0265-.0856.0265-.1227 0l-4.05168-2.9028c-.08301-.06-.04062-.1916.06182-.1916h.89634c.07948 0 .1307-.083.09449-.1537l-1.49862-2.9416c-.04945-.0962.06094-.19514.1519-.13597l3.61545 2.37377c.0627.0415.113.098.1465.1651l.5511 1.1057c.0389.0777.1501.0777.189 0l.551-1.1057c.0336-.0671.0839-.1245.1466-.1651z' fill='%23${config.colorScheme.palette.base0C}' fill-rule='evenodd'/%3E%3C/svg%3E");
  }
  div[class*=userPopoutOuter_] div[aria-label="HypeSquad Brilliance"],
  div[class*=userProfileOuter_] div[aria-label="HypeSquad Brilliance"] {
    content: url("data:image/svg+xml,%3Csvg height='24' viewBox='0 0 24 24' width='24' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath clip-rule='evenodd' d='m12 20c4.4183 0 8-3.5817 8-8 0-4.41828-3.5817-8-8-8-4.41828 0-8 3.58172-8 8 0 4.4183 3.58172 8 8 8zm.7921-8.275 3.6146-2.3738c.0909-.05916.2013.03974.151.136l-1.4986 2.9416c-.0354.0707.0158.1537.0944.1537h.8973c.1033 0 .1457.1315.0618.1916l-4.0517 2.9027c-.0362.0265-.0856.0265-.1227 0l-4.05168-2.9027c-.08301-.0601-.04062-.1916.06182-.1916h.89634c.07948 0 .1307-.083.09449-.1537l-1.49862-2.9416c-.04945-.09626.06094-.19516.1519-.136l3.61545 2.3738c.0627.0415.113.098.1465.1651l.5511 1.1057c.0389.0777.1501.0777.189 0l.551-1.1057c.0336-.0671.0839-.1245.1466-.1651z' fill='%23${config.colorScheme.palette.base08}' fill-rule='evenodd'/%3E%3C/svg%3E");
  }
  div[class*=userPopoutOuter_] div[aria-label="Active Developer"],
  div[class*=userProfileOuter_] div[aria-label="Active Developer"] {
    content: url("data:image/svg+xml,%3Csvg width='24' height='24' viewBox='0 0 24 24' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M6.47213 4L4 6.47213V17.5279L6.47217 20H17.5278L20 17.5279V6.47213L17.5279 4H6.47213ZM10.8582 16.4255H8.64551C8.64551 14.5952 7.1567 13.1064 5.32642 13.1064V10.8936C7.1567 10.8936 8.64551 9.40483 8.64551 7.57454H10.8582C10.8582 9.39042 9.96684 10.9908 8.61129 12C9.96684 13.0093 10.8582 14.6096 10.8582 16.4255ZM18.6667 13.1064C16.8364 13.1064 15.3476 14.5952 15.3476 16.4255H13.1348C13.1348 14.6096 14.0263 13.0093 15.3818 12C14.0263 10.9908 13.1348 9.39042 13.1348 7.57454H15.3476C15.3476 9.40483 16.8364 10.8936 18.6667 10.8936V13.1064V13.1064Z' fill='%23${config.colorScheme.palette.base0B}'/%3E%3C/svg%3E");
  }
  div[class*=userPopoutOuter_] div[aria-label="Early Verified Bot Developer"],
  div[class*=userProfileOuter_] div[aria-label="Early Verified Bot Developer"] {
    content: url("data:image/svg+xml,%3Csvg height='24' viewBox='0 0 24 24' width='24' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='m21.58 11.4-4.28-7.39-.35-.6h-9.91l-.35.6-4.27 7.39-.35.6.35.6 4.27 7.39.35.6h9.92l.35-.6 4.28-7.39.35-.6zm-13.07-1.03-1.63 1.63 1.63 1.63v2.73l-4.36-4.36 4.37-4.37v2.74zm3.12 6.93-2.04-.63 3.1-9.98 2.04.64zm3.86-.93v-2.73l1.63-1.64-1.63-1.63v-2.74l4.36 4.37z' fill='%23${config.colorScheme.palette.base0D}'/%3E%3C/svg%3E");
  }
  div[class*=userPopoutOuter_] div[class^=userPopoutOverlayBackground] > div[class^=scroller] > div[class^=section]:first-child > div[class^=buttonsContainer] > button:nth-child(2),
  div[class*=userProfileOuter_] div[class^=userPopoutOverlayBackground] > div[class^=scroller] > div[class^=section]:first-child > div[class^=buttonsContainer] > button:nth-child(2) {
    background: #${config.colorScheme.palette.base0D};
  }
  
  [class*=layerContainer_] [id^=slate_toolbar] {
    background-color: var(--background-floating);
  }
  [class*=layerContainer_] [id^=slate_toolbar] [class*=buttons_] [class*=icon_] {
    color: #${config.colorScheme.palette.base05};
  }
  
  [class*=layerContainer_] div[id=sort_and_view] div[id=sort-and-view-reset-all] [style="color: var(--text-normal);"]:hover {
    color: #${config.colorScheme.palette.base01} !important;
  }
  
  [class^=layerContainer] [class^=quickswitcher] [class*=badge_] {
    color: #${config.colorScheme.palette.base01};
  }
  
  div[class^=layerContainer] div[aria-label=clyde] div[class^=profileBadges] div[class^=textBadge] {
    background-color: #${config.colorScheme.palette.base0D} !important;
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=layerContainer] div[aria-label=clyde] button[class^=messageClydeButton] {
    color: #${config.colorScheme.palette.base05};
    background-color: #${config.colorScheme.palette.base03};
  }
  div[class^=layerContainer] div[aria-label=clyde] button[class^=messageClydeButton]:hover {
    background-color: #${config.colorScheme.palette.base04};
  }
  
  div[class^=layerContainer] div[class^=pencilContainer] svg[class^=editIcon] {
    color: #${config.colorScheme.palette.base05};
  }
  
  div[class^=keyboardShortcutsModal] span[class^=key] {
    color: #${config.colorScheme.palette.base01} !important;
  }
  div[class^=keyboardShortcutsModal] span[class^=key] svg g {
    fill: #${config.colorScheme.palette.base01} !important;
  }
  
  [class*=disabledPointerEvents] {
    --background-floating: #${config.colorScheme.palette.base02};
    --background-tertiary: #${config.colorScheme.palette.base02};
  }
  [class*=disabledPointerEvents] svg[class^=activityIcon] {
    color: #${config.colorScheme.palette.base07};
  }
  [class*=disabledPointerEvents] [class*=tooltipBrand_] [class*=tooltipText_] {
    color: #${config.colorScheme.palette.base01};
  }
  [class*=disabledPointerEvents] div[class^=flowerStarContainer] div[class^=childContainer] svg path {
    fill: #${config.colorScheme.palette.base01} !important;
  }
  
  div[class^=qualitySettingsContainer] div[class^=settingsGroup] div[class*=selectorTextSelected_],
  div[class^=qualitySettingsContainer] div[class^=settingsGroup] button[class*=selectorButton_]:hover div[class*=selectorText_] {
    color: #${config.colorScheme.palette.base01} !important;
  }
  
  div[class*=phoneFieldPopout] {
    background: #${config.colorScheme.palette.base01} !important;
  }
  div[class*=phoneFieldPopout] div[class^=countryName],
  div[class*=phoneFieldPopout] div[class^=countryCode] {
    color: #${config.colorScheme.palette.base05} !important;
  }
  
  div[class^=customColorPicker] {
    background: #${config.colorScheme.palette.base01} !important;
  }
  
  div[class^=layerContainer] div[class*=modalContent] > div[class^=container] div[class^=iconContainer] div[class^=icon] {
    filter: url('data:image/svg+xml;utf8,    <svg xmlns="http://www.w3.org/2000/svg">      <filter id="ctp-recolor" color-interpolation-filters="sRGB">        <feColorMatrix type="matrix" values="          0 0 0 0 0.137254902          0 0 0 0 0.1490196078          0 0 0 0 0.2039215686          0 0 0 1 0        "/>      </filter>    </svg>    #ctp-recolor');
  }
  
  div[class^=layerContainer] div[class*=enterDone] div[class^=guildBoostCta] button[class^=shinyButton] div[class^=content] {
    color: #${config.colorScheme.palette.base01};
  }
  div[class^=layerContainer] div[class*=enterDone] ul[class^=cards] li[class^=card] {
    background-color: #${config.colorScheme.palette.base00};
  }
  div[class^=layerContainer] div[class*=enterDone] svg[class^=boostedTierIcon] path,
  div[class^=layerContainer] div[class*=enterDone] svg[class^=boostedTierIcon] g {
    fill: #${config.colorScheme.palette.base01};
  }
  
  div[class^=layerContainer] div[class^=streamPreview] div[class^=body] {
    background-color: #${config.colorScheme.palette.base01} !important;
  }
  div[class^=layerContainer] div[class^=streamPreview] div[class^=body] div[class^=activityStreamPreview] div[class*=content], div[class^=layerContainer] div[class^=streamPreview] div[class^=body] div[class^=activityStreamPreview] div[class*=content] div {
    color: #${config.colorScheme.palette.base05} !important;
  }
  
  rect[fill="#23a55a"],
  foreignObject[mask="url(#svg-mask-status-online)"] > div,
  div[class^=dotOnline],
  i[class^=statusOnline] {
    fill: #${config.colorScheme.palette.base0B} !important;
    background-color: #${config.colorScheme.palette.base0B} !important;
  }
  
  rect[fill="rgba(35, 165, 90, 1)"] {
    fill: #${config.colorScheme.palette.base0B} !important;
  }
  
  rect[fill="#f0b232"],
  foreignObject[mask="url(#svg-mask-status-idle)"] > div {
    fill: #${config.colorScheme.palette.base0A} !important;
    background-color: #${config.colorScheme.palette.base0A} !important;
  }
  
  rect[fill="rgba(240, 178, 50, 1)"] {
    fill: #${config.colorScheme.palette.base0A} !important;
  }
  
  rect[fill="#f23f43"],
  foreignObject[mask="url(#svg-mask-status-dnd)"] > div {
    fill: #${config.colorScheme.palette.base08} !important;
    background-color: #${config.colorScheme.palette.base08} !important;
  }
  
  rect[fill="rgba(242, 63, 67, 1)"] {
    fill: #${config.colorScheme.palette.base08} !important;
  }
  
  rect[fill="#82858f"],
  foreignObject[mask="url(#svg-mask-status-offline)"] > div,
  foreignObject[mask="url(#svg-mask-status-offline)"] > rect,
  div[class^=dotOffline],
  i[class^=statusOffline] {
    fill: #${config.colorScheme.palette.base07} !important;
    background-color: #${config.colorScheme.palette.base07} !important;
  }
  
  rect[fill="rgba(130, 133, 143, 1)"] {
    fill: #${config.colorScheme.palette.base07} !important;
  }
  
  rect[fill="#593695"] {
    fill: #${config.colorScheme.palette.base0E} !important;
  }
  
  .vc-platform-indicator svg[fill*="--green-"] {
    fill: #${config.colorScheme.palette.base0B};
  }
  
  .vc-platform-indicator svg[fill*="--yellow-"] {
    fill: #${config.colorScheme.palette.base0A};
  }
  
  .vc-platform-indicator svg[fill*="--red-"] {
    fill: #${config.colorScheme.palette.base08};
  }
  
  .vc-platform-indicator svg[fill*="--primary-400"] {
    fill: #${config.colorScheme.palette.base07};
  }
  
  [src="/assets/eaeac24163b35f7526704a3d9b3c7722.svg"] {
    width: 0 !important;
    padding: 12px;
    height: 0 !important;
    -webkit-mask-image: url("https://discord.com/assets/eaeac24163b35f7526704a3d9b3c7722.svg");
    -webkit-mask-repeat: no-repeat;
    -webkit-mask-size: contain;
    background: #${config.colorScheme.palette.base0B};
  }
  
  .vc-user-connection [src="/assets/eaeac24163b35f7526704a3d9b3c7722.svg"] {
    padding: 16px;
  }
  
  #vencordthemes-tab [class*=input_]:focus {
    border-color: #${config.colorScheme.palette.base0D} !important;
  }
  
  [style*="background-color: hsl(235, calc(var(--saturation-factor, 1) * 85.6%), 64.7%)"] {
    background-color: #${config.colorScheme.palette.base0D} !important;
    color: #${config.colorScheme.palette.base01};
  }
  
  span[class*=username_][style*="color: rgb(54, 57, 62)"],
  span[class*=username_][style*="color: rgb(53, 57, 64)"] {
    color: var(--background-primary) !important;
  }
  
  div[class^=flowerStarContainer][class*=verified_] svg[class^=flowerStar] path {
    fill: #${config.colorScheme.palette.base0B};
  }
  div[class^=flowerStarContainer][class*=iconBackgroundTierOne_] svg[class*=flowerStar_] path, div[class^=flowerStarContainer][class*=iconBackgroundTierTwo_] svg[class*=flowerStar_] path {
    fill: #${config.colorScheme.palette.base04};
  }
  div[class^=flowerStarContainer][class*=iconBackgroundTierOne_] div[class^=childContainer] svg path, div[class^=flowerStarContainer][class*=iconBackgroundTierTwo_] div[class^=childContainer] svg path {
    fill: #${config.colorScheme.palette.base05};
  }
  div[class^=flowerStarContainer][class*=iconBackgroundTierThree_] svg[class*=flowerStar_] path {
    fill: #${config.colorScheme.palette.base0F};
  }
  div[class^=flowerStarContainer][class*=partnered_] svg[class^=flowerStar] path {
    fill: #${config.colorScheme.palette.base0D};
  }
  div[class^=flowerStarContainer] div[class^=childContainer] svg path {
    fill: #${config.colorScheme.palette.base01};
  }
  
  div[class^=communityInfoPill] {
    --background-accent: ${hexToRgba "${config.colorScheme.palette.base00}" "0.7"};
    color: #${config.colorScheme.palette.base05};
  }
  div[class^=communityInfoPill] div[class^=text] {
    font-weight: 500;
  }
  
  a[class*=socialLink_][href*=discord] {
    color: #${config.colorScheme.palette.base07};
  }
  
  svg[class^=uploadIcon] {
    color: #${config.colorScheme.palette.base01};
  }
  
  .theme-dark h2[class^=emptyStateHeader],
  .theme-light h2[class^=emptyStateHeader] {
    color: #${config.colorScheme.palette.base05};
  }
  .theme-dark p[class^=emptyStateSubtext],
  .theme-light p[class^=emptyStateSubtext] {
    color: #${config.colorScheme.palette.base07};
  }
  
  div[class*=unreadMentionsBar_],
  div[class*=unreadBar_] {
    color: #${config.colorScheme.palette.base01};
  }
  
  div[class^=numberBadge] {
    font-weight: 700;
    color: #${config.colorScheme.palette.base01} !important;
  }
  
  div[class^=newChannel] {
    color: #${config.colorScheme.palette.base01};
    background-color: #${config.colorScheme.palette.base0D} !important;
  }
  
  div[class^=botTag] {
    background-color: #${config.colorScheme.palette.base0D};
  }
  
  div[class^=addFriendInputWrapper]:focus-within {
    border-color: #${config.colorScheme.palette.base0D};
  }
  
  #add_friend-tab div[class^=grid] button img {
    display: none;
  }
  #add_friend-tab div[class^=grid] button::before {
    height: 40px;
    margin: 8px;
    content: url("data:image/svg+xml,%3Csvg width='40' height='40' viewBox='0 0 40 40' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M20 40C31.0457 40 40 31.0457 40 20C40 8.9543 31.0457 0 20 0C8.95431 0 0 8.9543 0 20C0 31.0457 8.95431 40 20 40Z' fill='${hexToRgb "${config.colorScheme.palette.base0B}"}'/%3E%3Cpath d='M20 18.9C19.39 18.9 18.9 19.39 18.9 20C18.9 20.61 19.39 21.1 20 21.1C20.61 21.1 21.1 20.61 21.1 20C21.1 19.39 20.61 18.9 20 18.9ZM20 10C14.48 10 10 14.48 10 20C10 25.52 14.48 30 20 30C25.52 30 30 25.52 30 20C30 14.48 25.52 10 20 10ZM22.19 22.19L14 26L17.81 17.81L26 14L22.19 22.19Z' fill='${hexToRgb "${config.colorScheme.palette.base01}"}'/%3E%3C/svg%3E");
  }
  
  button[class^=attachButton] svg path[class^=attachButtonPlay] {
    color: #${config.colorScheme.palette.base0B};
    fill: #${config.colorScheme.palette.base0B};
  }
  
  div[class^=tags] div[class^=pinIcon] path {
    fill: #${config.colorScheme.palette.base00} !important;
  }
  
  div[class*=avatarSpeaking_] {
    -webkit-box-shadow: inset 0 0 0 2px #${config.colorScheme.palette.base0B}, inset 0 0 0 3px var(--background-secondary);
    box-shadow: inset 0 0 0 2px #${config.colorScheme.palette.base0B}, inset 0 0 0 3px var(--background-secondary);
  }
  
  div[class*=videoLayer_] > div[class^=tileChild] > div[class^=border][class*=speaking_] {
    -webkit-box-shadow: inset 0 0 0 2px #${config.colorScheme.palette.base0B}, inset 0 0 0 3px #${config.colorScheme.palette.base0B};
    box-shadow: inset 0 0 0 2px #${config.colorScheme.palette.base0B}, inset 0 0 0 3px #${config.colorScheme.palette.base0B};
  }
  div[class*=videoLayer_] > div[class^=tileChild] > div[class^=border][class*=voiceChannelEffect_] {
    -webkit-box-shadow: inset 0 0 0 2px #${config.colorScheme.palette.base0D}, inset 0 0 0 3px #${config.colorScheme.palette.base0D};
    box-shadow: inset 0 0 0 2px #${config.colorScheme.palette.base0D}, inset 0 0 0 3px #${config.colorScheme.palette.base0D};
  }
  
  div[class*=featureIcon_] path {
    fill: #${config.colorScheme.palette.base0D};
  }
  
  div[class*=backgroundAccent_] {
    color: #${config.colorScheme.palette.base01};
  }
  
  div[class*=profileBadges_] div[aria-label="Supports Commands"] img {
    content: url("data:image/svg+xml,%3Csvg viewBox='0 0 24 24' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='%23${config.colorScheme.palette.base0B}'%3E%3Cpath d='m8.1176653 16.0847263 4.8330812-8.1694527h2.9315882l-4.8330812 8.1694527z'/%3E%3Cpath d='m20.4189453 9.4038086v-2.4311524c0-1.9775391-1.0825195-3.1118164-2.9697266-3.1118164h-1.5581055v1.7802734l.9594727-.0014648c.8540039 0 1.34375.5683594 1.34375 1.5585938v2.3969727c0 .8300781.1806641 1.8422852 1.5893555 2.3100586l.2856445.0947265-.2856445.0947266c-1.4086914.4677734-1.5893555 1.4799804-1.5893555 2.3100586v2.3964844c0 .9907227-.4897461 1.559082-1.34375 1.559082l-.9594727-.0014648v1.7802734h1.5581055c1.887207 0 2.9697266-1.1342773 2.9697266-3.1118164v-2.4316406c0-1.2583008.3432617-1.6264648 1.5810547-1.6445312v-1.9023438c-1.237793-.0180665-1.5810547-.3862305-1.5810547-1.6450196z'/%3E%3Cpath d='m5.8061523 7.1982422c0-.9760742.5024414-1.5585938 1.3432617-1.5585938l.9594727.0014648v-1.7802734h-1.5576172c-1.887207 0-2.9697266 1.1342773-2.9697266 3.1118164v2.4311523c0 1.2587891-.3432617 1.6269531-1.581543 1.6450195v1.9023438c1.2382812.0180664 1.581543.3862305 1.581543 1.6445312v2.4316406c0 1.9775391 1.0825195 3.1118164 2.9697266 3.1118164h1.5576172v-1.7802734l-.9594727.0014648c-.8408203 0-1.3432617-.5830078-1.3432617-1.559082v-2.3964844c0-.8300781-.1806641-1.8422852-1.5898438-2.3100586l-.2856444-.0947264.2856445-.0947266c1.4091797-.4677734 1.5898437-1.4799804 1.5898437-2.3100586z'/%3E%3C/g%3E%3C/svg%3E");
  }
  
  div[class*=newBadge_],
  div[class*=tryItOutBadge_] {
    color: #${config.colorScheme.palette.base01};
  }
  
  [class^=tabBar] [class^=badge] {
    color: #${config.colorScheme.palette.base01};
  }
  
  span[class*=channelMention]:hover,
  [class*=mention]:not([class*=mentionButton_],
  [class*=mentionIcon_]):hover {
    color: #${config.colorScheme.palette.base01};
  }
  
  div[class^=checkbox][class*=checked_] {
    border-color: #${config.colorScheme.palette.base01} !important;
  }
  div[class^=checkbox][class*=checked_] svg path {
    fill: #${config.colorScheme.palette.base01} !important;
  }
  
  path[class^=updateIconForeground] {
    fill: #${config.colorScheme.palette.base0B} !important;
  }
  
  .theme-dark code.hljs {
    color: #${config.colorScheme.palette.base05};
    background: #${config.colorScheme.palette.base00};
  }
  .theme-dark code .hljs-keyword {
    color: #${config.colorScheme.palette.base0E};
  }
  .theme-dark code .hljs-built_in {
    color: #${config.colorScheme.palette.base08};
  }
  .theme-dark code .hljs-type {
    color: #${config.colorScheme.palette.base0A};
  }
  .theme-dark code .hljs-literal {
    color: #${config.colorScheme.palette.base09};
  }
  .theme-dark code .hljs-number {
    color: #${config.colorScheme.palette.base09};
  }
  .theme-dark code .hljs-operator {
    color: #${config.colorScheme.palette.base0C};
  }
  .theme-dark code .hljs-punctuation {
    color: #${config.colorScheme.palette.base07};
  }
  .theme-dark code .hljs-property {
    color: #${config.colorScheme.palette.base0C};
  }
  .theme-dark code .hljs-regexp {
    color: #${config.colorScheme.palette.base0F};
  }
  .theme-dark code .hljs-string {
    color: #${config.colorScheme.palette.base0B};
  }
  .theme-dark code .hljs-char.escape_ {
    color: #${config.colorScheme.palette.base0B};
  }
  .theme-dark code .hljs-subst {
    color: #${config.colorScheme.palette.base07};
  }
  .theme-dark code .hljs-symbol {
    color: #${config.colorScheme.palette.base0F};
  }
  .theme-dark code .hljs-variable {
    color: #${config.colorScheme.palette.base0E};
  }
  .theme-dark code .hljs-variable.language_ {
    color: #${config.colorScheme.palette.base0E};
  }
  .theme-dark code .hljs-variable.constant_ {
    color: #${config.colorScheme.palette.base09};
  }
  .theme-dark code .hljs-title {
    color: #${config.colorScheme.palette.base0D};
  }
  .theme-dark code .hljs-title.class_ {
    color: #${config.colorScheme.palette.base0A};
  }
  .theme-dark code .hljs-title.function_ {
    color: #${config.colorScheme.palette.base0D};
  }
  .theme-dark code .hljs-params {
    color: #${config.colorScheme.palette.base05};
  }
  .theme-dark code .hljs-comment {
    color: #${config.colorScheme.palette.base04};
  }
  .theme-dark code .hljs-doctag {
    color: #${config.colorScheme.palette.base08};
  }
  .theme-dark code .hljs-meta {
    color: #${config.colorScheme.palette.base09};
  }
  .theme-dark code .hljs-section {
    color: #${config.colorScheme.palette.base0D};
  }
  .theme-dark code .hljs-tag {
    color: #${config.colorScheme.palette.base07};
  }
  .theme-dark code .hljs-name {
    color: #${config.colorScheme.palette.base0E};
  }
  .theme-dark code .hljs-attr {
    color: #${config.colorScheme.palette.base0D};
  }
  .theme-dark code .hljs-attribute {
    color: #${config.colorScheme.palette.base0B};
  }
  .theme-dark code .hljs-bullet {
    color: #${config.colorScheme.palette.base0C};
  }
  .theme-dark code .hljs-code {
    color: #${config.colorScheme.palette.base0B};
  }
  .theme-dark code .hljs-emphasis {
    color: #${config.colorScheme.palette.base08};
    font-style: italic;
  }
  .theme-dark code .hljs-strong {
    color: #${config.colorScheme.palette.base08};
    font-weight: bold;
  }
  .theme-dark code .hljs-formula {
    color: #${config.colorScheme.palette.base0C};
  }
  .theme-dark code .hljs-link {
    color: #${config.colorScheme.palette.base05};
    font-style: italic;
  }
  .theme-dark code .hljs-quote {
    color: #${config.colorScheme.palette.base0B};
    font-style: italic;
  }
  .theme-dark code .hljs-selector-tag {
    color: #${config.colorScheme.palette.base0A};
  }
  .theme-dark code .hljs-selector-id {
    color: #${config.colorScheme.palette.base0D};
  }
  .theme-dark code .hljs-selector-class {
    color: #${config.colorScheme.palette.base0C};
  }
  .theme-dark code .hljs-selector-attr {
    color: #${config.colorScheme.palette.base0E};
  }
  .theme-dark code .hljs-selector-pseudo {
    color: #${config.colorScheme.palette.base0C};
  }
  .theme-dark code .hljs-template-tag {
    color: #${config.colorScheme.palette.base0F};
  }
  .theme-dark code .hljs-template-variable {
    color: #${config.colorScheme.palette.base0F};
  }
  .theme-dark code .hljs-addition {
    color: #${config.colorScheme.palette.base0B};
    background: ${hexToRgba "${config.colorScheme.palette.base0B}" "0.15"};
  }
  .theme-dark code .hljs-deletion {
    color: #${config.colorScheme.palette.base08};
    background: ${hexToRgba "${config.colorScheme.palette.base08}" "0.15"};
  }

'';
}