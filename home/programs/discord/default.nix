{ config, lib, pkgs, uservars, ... }:
{
  imports = [
    #./assets
  ];
  home.file.".config/VencordDesktop/VencordDesktop/themes/usertheme.css".text = ''
.theme-light,
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
    --background-nested-floating: #ff0000;
    --background-mobile-primary: #ff0001;
    --background-modifier-selected: #${config.colorScheme.colors.base02};
    --background-modifier-hover: #${config.colorScheme.colors.base00};
    --background-modifier-selected: #${config.colorScheme.colors.base02};
    --background-modifier-accent: #${config.colorScheme.colors.base0D};
    --background-modifier-active: #${config.colorScheme.colors.base0D};
    --info-warning-background: #${config.colorScheme.colors.base03};
    --info-warning-foreground: #${config.colorScheme.colors.base09};
    --info-warning-text: #${config.colorScheme.colors.base09};
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
    --status-danger-background: #${config.colorScheme.colors.base08};
    --status-danger-text: #${config.colorScheme.colors.base06};
    --status-danger: #${config.colorScheme.colors.base08};
    --status-positive: #${config.colorScheme.colors.base0B};
    --status-warning: #${config.colorScheme.colors.base09};
  
  --black-500: #${config.colorScheme.colors.base00};
  --green-360: #${config.colorScheme.colors.base0B};
  --primary-400: #${config.colorScheme.colors.base0E};
  --white-500: #${config.colorScheme.colors.base06};
  --guild-boosting-pink: #${config.colorScheme.colors.base0F};
  --premium-perk-yellow: #${config.colorScheme.colors.base0E};
  --premium-perk-purple: #${config.colorScheme.colors.base0E};
  --premium-perk-dark-blue: #${config.colorScheme.colors.base0E};
  --premium-perk-light-blue: #${config.colorScheme.colors.base0E};
  --premium-perk-blue: #${config.colorScheme.colors.base0E};
  --premium-perk-green: #${config.colorScheme.colors.base0E};
  --premium-perk-pink: #${config.colorScheme.colors.base0E};
  --premium-perk-orange: #${config.colorScheme.colors.base0E};
  
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
    --button-secondary-background-active: #${config.colorScheme.colors.base0D};
    --button-secondary-background-disabled: #ff00ff;
  
    --button-outline-danger-text: #${config.colorScheme.colors.base08};
    --button-outline-danger-border: #${config.colorScheme.colors.base08};
    --button-outline-danger-background: #ff0000;
    --button-outline-danger-background-hover: transparent;
    --button-outline-danger-text-hover: #${config.colorScheme.colors.base09};
    --button-outline-danger-border-hover: #${config.colorScheme.colors.base09};
    --button-outline-danger-background-active: #ff0000;
    --button-outline-danger-text-active: #ff0000;
    --button-outline-danger-border-active: #ff0000;
  
    --button-outline-positive-text: #${config.colorScheme.colors.base06};
    --button-outline-positive-border: #${config.colorScheme.colors.base0D};
    --button-outline-positive-background: #ff00ff;
    --button-outline-positive-background-hover: #ff00ff;
    --button-outline-positive-text-hover: #ff00ff;
    --button-outline-positive-border-hover: #ff00ff;
    --button-outline-positive-background-active: #ff00ff;
    --button-outline-positive-text-active: #ff00ff;
    --button-outline-positive-border-active: #ff00ff;
  
    --button-outline-brand-text: #${config.colorScheme.colors.base0C};
    --button-outline-brand-border: #${config.colorScheme.colors.base0C};
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
    --deprecated-card-editable-bg: #${config.colorScheme.colors.base03};
    --deprecated-text-input-bg: #ff0002;
    --deprecated-text-input-border: #ff0001;
  
    --focus-primary: #ff0003;
    --interactive-normal: #${config.colorScheme.colors.base06};
    --interactive-muted: #${config.colorScheme.colors.base03};
    --interactive-hover: #${config.colorScheme.colors.base02};
    --interactive-active: #${config.colorScheme.colors.base03};
    --primary-200: #${config.colorScheme.colors.base0E};
  }

  div[class|=bottomControls] [class*=justifyCenter] [class|=wrapper] [class*=svg__7900e] {
    color: #ff2a00;
    background-color: #ff0000;
    background: #ff0004;
  }

  div[class|=callContainer] div[class|=videoControls] [class*=colorable-][class*=red-] {
    background: #${config.colorScheme.colors.base08};
  }
  div[class|=callContainer] div[class|=videoControls] [class*=colorable-][class*=red-] [class*=centerIcon-] {
    color: #${config.colorScheme.colors.base06};
  }
  div[class|=callContainer] div[class|=videoControls] [class*=colorable-][class*=primaryDark-] {
    background: #${config.colorScheme.colors.base04};
    color: #${config.colorScheme.colors.base06};
  }
  div[class|=callContainer] div[class|=videoControls] [class*=colorable-][class*=primaryDark-] [class*=centerIcon-] {
    color: #${config.colorScheme.colors.base06};
  }
  div[class|=callContainer] div[class|=videoControls] [class*=colorable-][class*=white-] {
    color: #${config.colorScheme.colors.base06};
    background-color: #${config.colorScheme.colors.base01};
  }
  div[class|=callContainer] div[class|=videoControls] [class*=colorable-][class*=white-] [class*=centerIcon-] {
    color: #${config.colorScheme.colors.base06};
  }

  [class*=lookFilled-][class*=colorBrand-], [class*=lookFilled-][class*=colorBrandNew-], [class*=lookFilled-][class*=colorLink-], [class*=lookFilled-][class*=colorYellow-], [class*=lookFilled-][class*=colorRed-], [class*=lookFilled-][class*=colorGreen-] {
    color: #${config.colorScheme.colors.base06};
  }
  [class*=lookFilled-][class*=colorBrand-] [class*=defaultColor-], [class*=lookFilled-][class*=colorBrandNew-] [class*=defaultColor-], [class*=lookFilled-][class*=colorLink-] [class*=defaultColor-], [class*=lookFilled-][class*=colorYellow-] [class*=defaultColor-], [class*=lookFilled-][class*=colorRed-] [class*=defaultColor-], [class*=lookFilled-][class*=colorGreen-] [class*=defaultColor-] {
    color: #${config.colorScheme.colors.base06};
  }
  [class*=lookFilled-][class*=colorPrimary-] {
    color: #${config.colorScheme.colors.base06};
  }
  
.theme-dark [class*=lookLink-][class*=colorPrimary-],
.theme-light [class*=lookLink-][class*=colorPrimary-] {
  color: #${config.colorScheme.colors.base08};
}
.theme-dark [class*=lookFilled-][class*=colorTransparent-],
.theme-light [class*=lookFilled-][class*=colorTransparent-] {
  color: #${config.colorScheme.colors.base06};
  background-color: #${config.colorScheme.colors.base04};
}
  [class|=chatContent] div[class*=colorPremiumGradient-][class*=focused-] {
    background: linear-gradient(270deg, #${config.colorScheme.colors.base0F}, #${config.colorScheme.colors.base07} 33.63%, #${config.colorScheme.colors.base0E});
  }
  div[class|=contentRegion] #billing-tab [class*=Divider] {
    border-color: #${config.colorScheme.colors.base0D};
  }
  div[class|=contentRegion] #billing-tab div[class|=defaultIndicator] {
    color: #${config.colorScheme.colors.base06};
    background-color: #${config.colorScheme.colors.base04};
  }
  div[class|=contentRegion] #billing-tab div[class*=summaryInfo],
  div[class|=contentRegion] #billing-tab [class|=paymentHeader] {
    color: #${config.colorScheme.colors.base06};
    border-color: #${config.colorScheme.colors.base0D};
  }
  div[class|=contentRegion] #billing-tab div[class|=premiumIndicator] {
    color: #${config.colorScheme.colors.base06};
    background-color: #${config.colorScheme.colors.base04};
  }
  div[class|=contentRegion] #billing-tab div[class|=paymentPane],
  div[class|=contentRegion] #billing-tab div[class*=paginator-],
  div[class|=contentRegion] #billing-tab div[class*=payment-] {
    background-color: #${config.colorScheme.colors.base00};
    color: #${config.colorScheme.colors.base06};
  }
  div[class|=contentRegion] #billing-tab div[class|=expandedInfo] {
    background-color: #${config.colorScheme.colors.base01};
  }
  div[class|=contentRegion] #billing-tab [class*=paymentText-] {
    color: #${config.colorScheme.colors.base06};
  }
  div[class|=contentRegion] #billing-tab div[class|=codeRedemptionRedirect] {
    background-color: #${config.colorScheme.colors.base00};
    border-color: #${config.colorScheme.colors.base0D};
  }

  div[class|=contentRegion] #discord-nitro-tab h2 {
    color: #${config.colorScheme.colors.base06} !important;
  }

  div[class|=contentRegion] #discord-nitro-tab button[class*=lookInverted-] {
    color: #${config.colorScheme.colors.base06};
    background-color: #${config.colorScheme.colors.base04};
  }
  div[class|=contentRegion] #discord-nitro-tab button[class*=lookInverted-]:hover {
    background-color: #${config.colorScheme.colors.base03};
  }
  
  div[class|=sidebarRegion] div[class|=serverBoostTabItem] svg[class|=icon] {
    fill: #${config.colorScheme.colors.base0F} !important;
  }
  div[class|=sidebarRegion] div[class|=serverBoostTabItem][class*=selected-] {
    background-color: #${config.colorScheme.colors.base02} !important;
    color: #${config.colorScheme.colors.base06} !important;
  }
  div[class|=sidebarRegion] div[class|=serverBoostTabItem][class*=selected-] svg[class|=icon] {
    fill: #${config.colorScheme.colors.base0F} !important;
  }
  div[class|=sidebarRegion] div[class|=premiumTab] > div > svg > path {
    fill: #${config.colorScheme.colors.base0E};
  }
  div[class|=sidebarRegion] div[class|=premiumTab] > div[class*=selected] {
    color: #${config.colorScheme.colors.base0E};
  }
  div[class|=sidebarRegion] div[class|=premiumTab] > div[class*=selected] svg > path {
    fill: #${config.colorScheme.colors.base0E};
  }
  [class*=container-][style*="background-color: var(--green-360)"] {
    --green-360: #${config.colorScheme.colors.base0B};
    background-color: #${config.colorScheme.colors.base0B} !important;
  }
  
  [class*=container-][style*="background-color: var(--primary-400)"],
  [class*=container-][style*="background-color: rgb(130, 133, 143)"] {
    background-color: #${config.colorScheme.colors.base08} !important;
  }

div[class|=contentRegion] #nitro-server-boost-tab button[class*=lookInverted-] {
  background-color: #${config.colorScheme.colors.base05};
}

.theme-dark [class*=disabledPointerEvents],
.theme-light [class*=disabledPointerEvents] {
  --background-floating: #${config.colorScheme.colors.base04};
  --background-tertiary: #${config.colorScheme.colors.base01};
}
  '';
# .userPopoutOverlayBackground-3A0Pcz {
#   max-height: 60vh;
# }


}