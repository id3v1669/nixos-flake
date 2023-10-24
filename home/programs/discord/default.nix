{ config, lib, pkgs, uservars, ... }:
{
  imports = [
    #./assets
  ];
  home.file.".config/VencordDesktop/VencordDesktop/themes/usertheme.css".text = ''
.theme-dark {
  --header-primary: #${config.colorScheme.colors.base06};
  --header-secondary: #${config.colorScheme.colors.base06};
  --text-normal: #${config.colorScheme.colors.base06};
  --text-muted: #${config.colorScheme.colors.base06};
  --text-link: #${config.colorScheme.colors.base0C};
  --text-link-low-saturation: #ff0000;
  --text-positive: #${config.colorScheme.colors.base0B};
  --text-warning: #${config.colorScheme.colors.base0A};
  --text-danger: #${config.colorScheme.colors.base08};
  --text-brand: #${config.colorScheme.colors.base0C};
  --background-primary: #${config.colorScheme.colors.base01};
  --background-secondary: #${config.colorScheme.colors.base01};
  --background-secondary-alt: #${config.colorScheme.colors.base02};
  --background-tertiary: #${config.colorScheme.colors.base00};
  --background-accent: #${config.colorScheme.colors.base03};
  --background-floating: #${config.colorScheme.colors.base02};
  --background-nested-floating: #${config.colorScheme.colors.base02};
  --background-mobile-primary: #ff0001;
  --background-modifier-selected: #${config.colorScheme.colors.base02};
  --background-modifier-hover: #${config.colorScheme.colors.base00};
  --background-modifier-selected: #${config.colorScheme.colors.base02};
  --background-modifier-accent: #${config.colorScheme.colors.base03};
  --background-modifier-active: #${config.colorScheme.colors.base02};
  --info-warning-background: #ff0002;
  --info-warning-foreground: #${config.colorScheme.colors.base03};
  --info-warning-text: #ff0004;
  --info-danger-background: #ff0005;
  --info-danger-foreground: #ff0006;
  --info-danger-text: #ff0007;
  --info-help-background: #${config.colorScheme.colors.base02};
  --info-help-foreground: #${config.colorScheme.colors.base0C};
  --info-help-text: #ff0008;
  
  --status-positive-background: #${config.colorScheme.colors.base03};
  --status-positive-text: #${config.colorScheme.colors.base06};
  --status-warning-background: #${config.colorScheme.colors.base09};
  --status-warning-text: #ff0009;
  --status-danger-background: ${config.colorScheme.colors.base08};
  --status-danger-text: #${config.colorScheme.colors.base06};
  --status-danger: #${config.colorScheme.colors.base08};
  --status-positive: #ff0012;
  --status-warning: #ff0013;

  --black-500: #${config.colorScheme.colors.base00};
  --green-360: #${config.colorScheme.colors.base0B};
  --primary-400: #${config.colorScheme.colors.base0E};
  --white-500: #${config.colorScheme.colors.base06};
  --guild-boosting-pink: #${config.colorScheme.colors.base0F};
  --premium-perk-yellow: #${config.colorScheme.colors.base0A};
  --premium-perk-purple: #${config.colorScheme.colors.base0E};
  --premium-perk-dark-blue: #ff0014;
  --premium-perk-light-blue: #ff0015;
  --premium-perk-blue: #ff0016;
  --premium-perk-green: #ff0017;
  --premium-perk-pink: #ff0018;
  --premium-perk-orange: #ff0019;

  --button-danger-background: #${config.colorScheme.colors.base08};
  --button-danger-background-hover: #${config.colorScheme.colors.base09};
  --button-danger-background-active: #ff0000;
  --button-danger-background-disabled: #ff0000;
  --button-positive-background: #${config.colorScheme.colors.base02};
  --button-positive-background-hover: #${config.colorScheme.colors.base03};
  --button-positive-background-active: #ff0000;
  --button-positive-background-disabled: #ff0000;
  --button-secondary-background: #${config.colorScheme.colors.base02};
  --button-secondary-background-hover: #${config.colorScheme.colors.base03};
  --button-secondary-background-active: #ff0000;
  --button-secondary-background-disabled: #ff0000;

  --button-outline-danger-text: #${config.colorScheme.colors.base08};
  --button-outline-danger-border: #${config.colorScheme.colors.base08};
  --button-outline-danger-background: #ff0000;
  --button-outline-danger-background-hover: transparent;
  --button-outline-danger-text-hover: #${config.colorScheme.colors.base09};
  --button-outline-danger-border-hover: #${config.colorScheme.colors.base09};
  --button-outline-danger-background-active: #ff0000;
  --button-outline-danger-text-active: #ff0000;
  --button-outline-danger-border-active: #ff0000;

  --button-outline-positive-text: #ff0000;
  --button-outline-positive-border: #ff0000;
  --button-outline-positive-background: #ff0000;
  --button-outline-positive-background-hover: #ff0000;
  --button-outline-positive-text-hover: #ff0000;
  --button-outline-positive-border-hover: #ff0000;
  --button-outline-positive-background-active: #ff0000;
  --button-outline-positive-text-active: #ff0000;
  --button-outline-positive-border-active: #ff0000;

  --button-outline-brand-text: #2aa198;
  --button-outline-brand-border: #2aa198;
  --button-outline-brand-background: #ff0000;
  --button-outline-brand-background-hover: #ff0000;
  --button-outline-brand-text-hover: #ff0000;
  --button-outline-brand-border-hover: #ff0000;
  --button-outline-brand-background-active: #ff0000;
  --button-outline-brand-text-active: #ff0000;
  --button-outline-brand-border-active: #ff0000;

  --button-outline-primary-text: #${config.colorScheme.colors.base0C};
  --button-outline-primary-border: #${config.colorScheme.colors.base0C};
  --button-outline-primary-background: #ff0011;
  --button-outline-primary-background-hover: transparent;
  --button-outline-primary-text-hover: #${config.colorScheme.colors.base0D};
  --button-outline-primary-border-hover: #${config.colorScheme.colors.base0D};
  --button-outline-primary-background-active: #ff0010;
  --button-outline-primary-text-active: #ff0009;
  --button-outline-primary-border-active: #ff0008;

  --modal-background: #${config.colorScheme.colors.base00};

  --scrollbar-thin-thumb: #${config.colorScheme.colors.base0C};
  --scrollbar-thin-track: transparent;
  --scrollbar-auto-thumb: #${config.colorScheme.colors.base0C};
  --scrollbar-auto-track: transparent;
  --scrollbar-auto-scrollbar-color-thumb: #${config.colorScheme.colors.base0C};
  --scrollbar-auto-scrollbar-color-track: #${config.colorScheme.colors.base0C};

  --input-background: #${config.colorScheme.colors.base02};
  --input-placeholder-text: #${config.colorScheme.colors.base0E};
  --control-brand-foreground: #${config.colorScheme.colors.base03};
  --mention-foreground: #${config.colorScheme.colors.base0E};

  --mention-background: #${config.colorScheme.colors.base01};
  --background-mentioned: #${config.colorScheme.colors.base02}; 
  --background-mentioned-hover: #${config.colorScheme.colors.base00};
  --background-message-hover: #${config.colorScheme.colors.base02};
  --background-message-highlight: #${config.colorScheme.colors.base03};

  --channels-default: #${config.colorScheme.colors.base06};
  --channel-icon: #${config.colorScheme.colors.base06};
  --channel-text-area-placeholder: #${config.colorScheme.colors.base0E};

  --channeltextarea-background: #${config.colorScheme.colors.base00}; 
  --textbox-markdown-syntax: #${config.colorScheme.colors.base03};
  --deprecated-card-bg: #${config.colorScheme.colors.base00};
  --deprecated-card-editable-bg: #ff0005;
  --deprecated-text-input-bg: #ff0002;
  --deprecated-text-input-border: #ff0001;

  --focus-primary: #ff0003;
  --interactive-normal: #${config.colorScheme.colors.base06};
  --interactive-muted: #${config.colorScheme.colors.base03};
  --interactive-hover: #${config.colorScheme.colors.base02};
  --interactive-active: #${config.colorScheme.colors.base03};
  --primary-200: #${config.colorScheme.colors.base0E};
}


  '';
}