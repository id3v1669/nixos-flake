{ config
, lib
, pkgs
, desk
, ...
}:
{
  home.packages = (with pkgs;[
    over-equibop                       # equibop(unofficial discord app)        
    arrpc                              # rpc for discord(equibop)
  ]);
  systemd.user.services = {} // lib.optionalAttrs (desk == "desktop") {
    arrpc = {
		  Unit = {
        Description = "arrpc service";
   	    After = ["default.target" ];
      };
		  Service = {
			  ExecStart = "${lib.getExe pkgs.arrpc}";
        Restart = "on-failure";
		  };
		  Install = { WantedBy = [ "default.target" ]; };
    };
  };
  home.file.".config/equibop/themes/usertheme.css".text = with config.palette; ''
.theme-dark,
.theme-light {
  --white:                                        ${base01.hexT};                  /* some buttons hover */
  --header-primary:                               ${base01.hexT};
  --header-secondary:                             ${base02.hexT};
  --text-normal:                                  ${base00.hexT};
  --text-muted:                                   ${base02.hexT};
  --text-link:                                    ${base18.hexT};
  --text-positive:                                ${base12.hexT};
  --text-warning:                                 ${base0F.hexT};
  --text-danger:                                  ${base09.hexT};
  --text-brand:                                   ${base0B.hexT};
  --background-primary:                           ${base04.hexT};
  --bg-overlay-2:                                 ${base06.hexT};                  /* background bar chat overlay in call */
  --background-secondary:                         ${base06.hexT};
  --background-secondary-alt:                     ${base06.hexT};
  --background-tertiary:                          ${base06.hexT};
  --background-accent:                            ${base0B.hexT};
  --background-floating:                          ${base07.hexT};
  --background-nested-floating:                   ${base07.hexT};
  --background-mobile-primary:                    ${base04.hexT};
  --background-mobile-secondary:                  ${base06.hexT};
  --chat-border:                                  ${base0B.hexT};
  --background-modifier-hover:                    ${base05.hexT};                  /* splitters & outliners active now & server settings bans */
  --background-modifier-selected:                 ${base07.hexT};                  /* splitters & outliners active now & server settings bans */
  --background-modifier-accent:                   ${base0B.hexT};                  /* splitters & outliners active now & server settings bans */
  --background-modifier-active:                   ${base0C.hexT};                  /* splitters & outliners active now & server settings bans */
  --info-positive-text:                           ${base00.hexT};
  --info-warning-foreground:                      ${base0F.hexT};
  --info-warning-text:                            ${base00.hexT};
  --info-danger-foreground:                       ${base09.hexT};
  --info-danger-text:                             ${base00.hexT};
  --info-help-foreground:                         ${base00.hexT};
  --info-help-text:                               ${base00.hexT};
  --status-positive-background:                   ${base11.hexT};
  --status-positive-text:                         ${base07.hexT};
  --status-warning-text:                          ${base07.hexT};
  --interactive-normal:                           ${base03.hexT};
  --status-danger-text:                           ${base07.hexT};
  --interactive-muted:                            ${base05.hexT};                  /* settings slider appearance */
  --control-brand-foreground-new:                 ${base0B.hexT};                  /* settings slider appearance */
  --interactive-hover:                            ${base03.hexT};
  --interactive-active:                           ${base01.hexT};
  --status-danger:                                ${base09.hexT};                  /* mute buttons left bar */
  --status-positive:                              ${base11.hexT};                  /* network connection */
  --status-warning:                               ${base0E.hexT};
  --status-danger-background:                     ${base09.hexT};                  /* hangup button incall */
  --green-330:                                    ${base13.hexT};                  /* screensharing active hover */
  --green-360:                                    ${base11.hexT};                  /* outer contour of active speaking & screensharing active */
  --black-500:                                    ${base05.hexT};                  /* inner contour of active speaking */
  --brand-500:                                    ${base06.hexT};                  /* background active button shop(elis) */
  --brand-560:                                    ${base07.hexT};                  /* background hover button shop(elis) */
  --red-400:                                      ${base09.hexT};                  /* background live status & privacy settings red dm spam filter */
  --deprecated-text-input-border-hover:           ${base03.hexT};                  /* hover options contour shop(elis) */
  --primary-300:                                  ${base00.hexT};                  /* text nickname & activity incall */
  --primary-400:                                  ${base03.hexT};                  /* users offline server hover popup */
  --yellow-360:                                   ${base0E.hexT};                  /* privacy settings warn dm spam filter */
  --yellow-300:                                   ${base10.hexT};                  /* channel settings perm synced */
  --info-warning-background:                      ${base05.hexT};                  /* channel settings privacy warn pc */
  --white-500:                                    ${base00.hexT};                  /* buttons camera etc & text shop color */
  --button-secondary-background:                  ${base0B.hexT};                  /* buttons invite friends incall */
  --button-secondary-background-hover:            ${base0D.hexT};                  /* buttons invite friends incall hover */
  --button-secondary-background-active:           ${base0C.hexT};                  /* buttons invite friends incall onclick */
  --button-secondary-background-disabled:         ${base07.rgba "0.5"};            /* base07 shop inactive button */
  --button-outline-danger-text:                   ${base09.hexT};                  /* my account disable button */
  --button-outline-danger-border:                 ${base09.hexT};                  /* my account disable button */
  --button-outline-danger-background              ${base0A.rgba "0.2"};            /* my account delete button */
  --button-outline-danger-background-hover:       ${base0A.rgba "0.2"};            /* my account disable button */
  --button-outline-danger-text-hover:             ${base00.hexT};                  /* my account disable button */
  --button-outline-danger-border-hover:           ${base0A.hexT};                  /* my account disable button */
  --button-danger-background:                     ${base08.hexT};                  /* my account delete button */
  --button-danger-background-hover:               ${base0A.hexT};                  /* my account delete button */
  --button-danger-background-active:              ${base0A.rgba "0.4"};            /* danger button on press */
  --scrollbar-thin-thumb:                         ${base0B.hexT};                  /* scrollbar channel list */
  --scrollbar-thin-track:                         ${base07.hexT};                  /* scrollbar channel list */
  --scrollbar-auto-thumb:                         ${base0B.hexT};                  /* scrollbar chat */
  --scrollbar-auto-track:                         ${base07.hexT};                  /* scrollbar chat */
  --input-background:                             ${base07.hexT};                  /* options background shop(elis) */
  --background-message-hover:                     ${base05.hexT};                  /* hover message in chat */
  --background-message-highlight:                 ${base07.hexT};                  /* highlight message in chat */
  --channel-icon:                                 ${base01.hexT};                  /* channel icon voice or text etc */
  --channels-default:                             ${base00.hexT};                  /* channel name text */
  --modal-background:                             ${base06.hexT};                  /* background modal(view raw message) */
  --modal-footer-background:                      ${base07.hexT};                  /* background footer modal(view raw message) */
  --channeltextarea-background:                   ${base06.hexT};                  /* background textinput chat */
  --channel-text-area-placeholder:                ${base03.hexT};                  /* placeholder textinput chat */
  --activity-card-background:                     ${base07.hexT};                  /* friends acive in voicechannels */
  --button-positive-background:                   ${base11.hexT};                  /* join voice button */
  --button-positive-background-hover:             ${base13.hexT};                  /* join voice button */
  --button-positive-background-active:            ${base12.hexT};                  /* join voice button */
  --button-positive-background-disabled:          ${base07.rgba "0.5"};            /* join voice button */
  --control-brand-foreground:                     ${base00.hexT};                  /* unserscore active family center */
  --deprecated-card-bg:                           ${base06.hexT};                  /* authorized apps bg */
  --guild-boosting-pink:                          ${base1D.hexT};                  /* boost icon */
  --button-outline-primary-text:                  ${base0B.hexT};                  /* server settings upload image button */
  --button-outline-primary-border:                ${base0B.hexT};                  /* server settings upload image button */
  --button-outline-primary-background-hover:      ${base0D.rgba "0.3"};            /* base0d server settings upload image button */
  --button-outline-primary-text-hover:            ${base00.hexT};                  /* server settings upload image button */
  --button-outline-primary-border-hover:          ${base0D.hexT};                  /* server settings upload image button */
  --button-outline-primary-background-active:     ${base0C.rgba "0.5"};            /* base0c server settings upload image button */
  --button-outline-primary-text-active:           ${base00.hexT};                  /* server settings upload image button */
  --button-outline-primary-border-active:         ${base0C.hexT};                  /* server settings upload image button */
  --input-placeholder-text:                       ${base03.hexT};                  /* placeholder text in settings */
  --info-help-background:                         ${base06.hexT};                  /* bg help settings keybinds */
  --deprecated-card-editable-bg:                  ${base06.hexT};                  /* bg server settings integrations */
  --status-warning-background:                    ${base0E.hexT};                  /* bg & outliner server settings subscriptions */
  --premium-perk-yellow:                          ${base0F.hexT};                  /* server settings premium perks */
  --premium-perk-purple:                          ${base1B.hexT};                  /* server settings premium perks */
  --premium-perk-dark-blue:                       ${base19.hexT};                  /* server settings premium perks */
  --premium-perk-light-blue:                      ${base18.hexT};                  /* server settings premium perks */
  --premium-perk-blue:                            ${base17.hexT};                  /* server settings premium perks */
  --premium-perk-green:                           ${base12.hexT};                  /* server settings premium perks */
  --premium-perk-pink:                            ${base1E.hexT};                  /* server settings premium perks */
  --premium-perk-orange:                          ${base0C.hexT};                  /* server settings premium perks */
  --home-background:                              ${base04.hexT};                  /* bg tickets main */
  --bg-mod-faint:                                 ${base06.hexT};                  /* bg tickets each */
  --background-mentioned:                         ${base05.hexT};                  /* reply message private chat */
  --background-mentioned-hover:                   ${base06.hexT};                  /* reply message private chat */
  --textbox-markdown-syntax:                      ${base0B.hexT};                  /* markdown 3 dots */
  --white-400:                                    ${base01.hexT};                  /* fg logo server boost status */
  --primary-100:                                  ${base00.hexT};                  /* fg sound hover popup timer */
  --mention-foreground:                           ${base00.hexT};                  /* mention text */
  --mention-background:                           ${base16.rgba "0.3"};            /* mention background */
  --primary-130:                                  ${base03.hexT};                  /* bg incall mic hover */
  --button-outline-positive-text:                 ${base11.hexT};                  /* invite friend in popup button */
  --button-outline-positive-border:               ${base11.hexT};                  /* invite friend in popup button */
  --


  /* not found */
  --primary-dark-700:                             #ff0000;
  --status-green-560:                             #ff0000;
  --status-green-400:                             #ff0000;
  --button-danger-background-disabled:            #ff0000;
  --button-outline-danger-background-active:      #ff0000;
  --button-outline-danger-text-active:            #ff0000;
  --button-outline-danger-border-active:          #ff0000;
  --button-outline-positive-background:           #ff0000;
  --button-outline-positive-background-hover:     #ff0000;
  --button-outline-positive-text-hover:           #ff0000;
  --button-outline-positive-border-hover:         #ff0000;
  --button-outline-positive-background-active:    #ff0000;
  --button-outline-positive-text-active:          #ff0000;
  --button-outline-positive-border-active:        #ff0000;
  --button-outline-brand-text:                    #ff0000;
  --button-outline-brand-border:                  #ff0000;
  --button-outline-brand-background:              #ff0000;
  --button-outline-brand-background-hover:        #ff0000;
  --button-outline-brand-text-hover:              #ff0000;
  --button-outline-brand-border-hover:            #ff0000;
  --button-outline-brand-background-active:       #ff0000;
  --button-outline-brand-text-active:             #ff0000;
  --button-outline-brand-border-active:           #ff0000;
  --button-outline-primary-background:            #ff0000;
  --scrollbar-auto-scrollbar-color-thumb:         #ff0000;
  --scrollbar-auto-scrollbar-color-track:         #ff0000;
  --logo-primary:                                 #ff0000;
  --background-message-automod:                   #ff0000;
  --background-message-automod-hover:             #ff0000;
  --background-message-highlight-hover:           #ff0000;
  --spoiler-revealed-background:                  #ff0000;
  --spoiler-hidden-background:                    #ff0000;
  --android-navigation-bar-background:            #ff0000;
  --android-ripple:                               #ff0000;
  --deprecated-store-bg:                          #ff0000;
  --deprecated-quickswitcher-input-background:    #ff0000;
  --deprecated-quickswitcher-input-placeholder:   #ff0000;
  --deprecated-text-input-bg:                     #ff0000;
  --deprecated-text-input-border:                 #ff0000;
  --info-positive-background:                     #ff0000;
  --info-positive-foreground:                     #ff0000;
  --info-danger-background:                       #ff0000;
  --custom-guild-shop-gradient-start:             #ff000E;
  --custom-guild-shop-gradient-end:               #ff000F;
  --chat-background:                              #ff0002;
  --chat-input-container-background:              #ff0004;
  --deprecated-text-input-border-disabled:        #ff0005;
  --deprecated-text-input-prefix:                 #ff0005;
  --focus-primary:                                #ff0005;
  --text-link-low-saturation:                     #ff0001;
  --search-popout-option-non-text-color:          #ff0005;
  --search-popout-option-filter-color:            #ff0005;
  --search-popout-option-answer-color:            #ff0006;
  --search-popout-date-picker-hint-text:          #ff0007;
  --status-yellow-400:                            #ff0016;
  --status-green-600:                             #ff0017;
  --primary-dark-600:                             #ff0018;
  --status-yellow-560:                            #ff0019;
  --status-red-500:                               #ff001A;
  --status-red-530:                               #ff001B;
  --status-yellow-500:                            #ff001C;
  --custom-store-colors-primary-750:              #ff0008;
  --custom-header-icon-color-expired:             #ff0009;
  --custom-guild-shop-channel-row-gradient: linear-gradient(113deg, #ff000A 1.98%, #ff000A 94.48%);
  --custom-guild-shop-channel-row-gradient-hover: linear-gradient(113deg, #ff000B 1.98%, #ff000B 94.48%);
  --custom-guild-shop-channel-row-border-gradient: linear-gradient(113deg, #ff000B, #ff000B);
  --custom-guild-shop-channel-row-glow: 0 0 4px #ff000B;
  --custom-guild-shop-preview-pill-shadow-dark: -4px 5px #ff000C;
  --custom-guild-shop-preview-pill-shadow-light: -4px 5px #ff000D;
}

/* remove border from keybinds plate in settings */
[id="keybinds-tab"] [class^=children_] [class^=container_]  {
  border: none;
}

/* rm border from user chat list */
[class^=peopleListItem_] { border: none; }

/* beautify server list row */
[aria-label="Servers sidebar"] {
  border-radius: var(--radius-sm);
  border: 2px solid var(--background-modifier-accent);
  margin: 6px;
  background-color: var(--brand-560);
  [class^=folderIconWrapper_] {
    background-color: var(--black-500) !important;
  }
}

/* call container bg */
[class^=callContainer_] {
  background-color: var(--background-primary);
}

/* forum preview message bg fix */
[class^=previewForm_]{
  background-color: var(--background-primary);
}

/* fix screenshare buttons for custom coloring */
[class^=vcd-screen-picker-quality] {
  [data-checked="true"] { 
    background-color: var(--black-500) !important;
  }
  [data-checked="false"] {
    background-color: var(--brand-560) !important;
    border: none !important;
  }
  [class^=vcd-screen-picker-radio]:hover {
    background-color: var(--background-primary) !important;
  }
}

/* snippets from vesktop discord */

/* hide profile effects */
/* author: 976176454511509554 */
[class^="profileEffects"] { display: none; }

/* enshure that the user popout is always rounded */
/* author: 1176270221628153886 */
[class*=userPopoutOuter_] {
  border-radius: var(--radius-sm);
  overflow: hidden;
}

/* fix too long userprofile */
/* author: 428188716641812481 */
[class^=userPopoutInner_] [class^=blockquoteContainer_] {
  max-height: 100px;
}

/* better discord on small screens */
/* author: 976176454511509554 */
@media (max-width: 1100px)
{
  [class*="sidebar_"]
  {
    width: 200px;
    .vc-typing-indicator, .vc-channelemojis-emoji, [class*="guildIconV2Container_"] { display: none; }
    [class*="containerDefault_"] { [role="img"] { display: none; } }
  }
  [class*="chat_"] { [class*="membersWrap_"] { display: none; } }
}

'';
}