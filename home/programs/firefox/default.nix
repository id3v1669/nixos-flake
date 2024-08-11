{ pkgs
, uservars
, ...
}:
{
  imports = [
    ./stylish.nix
  ];
  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox pkgs.over-firefox {
      extraPolicies = {
        CaptivePortal = false;
        DisablePocket = true;
        DisableTelemetry = true;
        DisableFirefoxAccounts = true;
        DisableFirefoxStudies = true;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        OfferToSaveLoginsDefault = false;
        OverrideFirstRunPage = "";
        OverridePostUpdatePage = "";
        PasswordManagerEnabled = false;
        FirefoxHome = {
          Search = true;
          Pocket = false;
          Snippets = false;
          TopSites = false;
          Highlights = false;
        };
        UserMessaging = {
          ExtensionRecommendations = false;
          SkipOnboarding = true;
        };
      };
    };
    profiles."${uservars.name}" = {
      name = "${uservars.name}";
      isDefault = true;
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        bitwarden
        duckduckgo-privacy-essentials
        darkreader
        stylus
      ];
      search = {
        force = true;
        default = "DuckDuckGo";
        engines = {
          "Wikipedia (en)".metaData.alias = "@wiki";
          "Google".metaData.hidden = true;
          "Amazon.com".metaData.hidden = true;
          "Amazon.com.au".metaData.hidden = true;
          "Bing".metaData.hidden = true;
          "eBay".metaData.hidden = true;
        };
      };
      settings = {
        "accessibility.typeaheadfind.autostart" = false;
        "accessibility.typeaheadfind.manual" = false;
        "browser.startup.page" = 3; # Restore previous session
        "browser.search.region" = "AU";
        "browser.search.isUS" = false;
        "browser.sessionstore.restore_on_demand" = true;
        "browser.sessionstore.resume_from_crash" = true;
        "browser.uiCustomization.state" = ''{"placements":{"widget-overflow-fixed-list":[],"unified-extensions-area":["ublock0_raymondhill_net-browser-action","_a4c4eda4-fb84-4a84-b4a1-f7c1cbf2a1ad_-browser-action","redirector_einaregilsson_com-browser-action","jid1-kkzogwgsw3ao4q_jetpack-browser-action","treestyletab_piro_sakura_ne_jp-browser-action","_34daeb50-c2d2-4f14-886a-7160b24d66a4_-browser-action","addon_darkreader_org-browser-action"],"nav-bar":["back-button","forward-button","stop-reload-button","urlbar-container","save-to-pocket-button","bookmarks-menu-button","downloads-button","unified-extensions-button"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["firefox-view-button","tabbrowser-tabs","new-tab-button","alltabs-button"],"PersonalToolbar":["personal-bookmarks"]},"seen":["_a4c4eda4-fb84-4a84-b4a1-f7c1cbf2a1ad_-browser-action","redirector_einaregilsson_com-browser-action","jid1-kkzogwgsw3ao4q_jetpack-browser-action","treestyletab_piro_sakura_ne_jp-browser-action","_34daeb50-c2d2-4f14-886a-7160b24d66a4_-browser-action","addon_darkreader_org-browser-action","ublock0_raymondhill_net-browser-action","developer-button"],"dirtyAreaCache":["nav-bar","widget-overflow-fixed-list","toolbar-menubar","TabsToolbar","PersonalToolbar","unified-extensions-area"],"currentVersion":19,"newElementCount":14}'';
        "browser.bookmarks.showMobileBookmarks" = true;
        "browser.search.suggest.enabled" = false;
        "browser.safebrowsing.downloads.enabled" = false;
        "browser.safebrowsing.blockedURIs.enabled" = false;
        "distribution.searchplugins.defaultLocale" = "en-AU";
        "devtools.chrome.enabled" = true;
        "general.useragent.locale" = "en-AU";
        "general.smoothScroll" = true;
        "media.hardware-video-decoding.enabled" = true;
        "media.videocontrols.picture-in-picture.enabled" = true;
        "privacy.donottrackheader.enabled" = true;
        "services.sync.prefs.sync.signon.management.page.breach-alerts.enabled" = false;
        "signon.management.page.breach-alerts.enabled" = false;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

        # Disable crash reports
        "breakpad.reportURL" = "";
        "browser.tabs.crashReporting.sendReport" = false;
        "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
      };
      extraConfig = ''
        user_pref("media.ffmpeg.vaapi.enabled", true);
        '';
      bookmarks = [
        {
          name = "Yandex";
          tags = [ "yandex" ];
          keyword = "yandex";
          url = "https://yandex.com";
        }
        {
          name = "kernel.org";
          url = "https://www.kernel.org";
        }
        {
          name = "Arch sites";
          toolbar = true;
          bookmarks = [
            {
              name = "Packages";
              url = "https://archlinux.org/packages/";
            }
            {
              name = "Aur";
              url = "https://aur.archlinux.org/";
            }
          ];
        }
        {
          name = "Nix sites";
          bookmarks = [
            {
              name = "Packages";
              url = "https://search.nixos.org/";
            }
            {
              name = "wiki";
              tags = [ "wiki" "nix" ];
              url = "https://nixos.wiki/";
            }
          ];
        }
      ];
    };
  };
}
