{
  pkgs,
  uservars,
  ...
}: {
  programs.floorp = {
    enable = true;
    package = pkgs.wrapFirefox pkgs.floorp-bin-unwrapped {
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
      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        bitwarden
        duckduckgo-privacy-essentials
        darkreader
        stylus
        return-youtube-dislikes
      ];
      search = {
        force = true;
        default = "ddg";
        engines = {
          "ddg" = {
            urls = [{template = "https://duckduckgo.com/?q={searchTerms}";}];
            definedAliases = ["d"];
          };
          "github" = {
            urls = [{template = "https://github.com/search?q={searchTerms}&type=code";}];
            definedAliases = ["gh"];
          };
          "wikipedia".definedAliases = ["wiki"];
          "google".metaData.hidden = true;
          "amazondotcom-us".metaData.hidden = true;
          "amazondotcom-au".metaData.hidden = true;
          "bing".metaData.hidden = true;
          "ebay".metaData.hidden = true;
        };
      };
      settings = {
        "accessibility.typeaheadfind.autostart" = false;
        "accessibility.typeaheadfind.manual" = false;
        "browser.bookmarks.showMobileBookmarks" = true;
        "browser.chrome.toolbar_tips" = false;
        "browser.low_commit_space_threshold_percent" = 70;
        "browser.safebrowsing.blockedURIs.enabled" = false;
        "browser.search.isUS" = false;
        "browser.search.region" = "AU";
        "browser.search.suggest.enabled" = false;
        "browser.search.suggest.enabled.private" = false;
        "browser.sessionstore.restore_on_demand" = true;
        "browser.sessionstore.resume_from_crash" = true;
        "browser.startup.page" = 3; # Restore previous session
        "browser.shell.checkDefaultBrowser" = false; # Don't ask to be default browser as custom-url-handler is used
        "browser.toolbars.bookmarks.visibility" = "never";
        "browser.uiCustomization.state" = ''{"placements":{"widget-overflow-fixed-list":[],"unified-extensions-area":["ublock0_raymondhill_net-browser-action","_a4c4eda4-fb84-4a84-b4a1-f7c1cbf2a1ad_-browser-action","redirector_einaregilsson_com-browser-action","jid1-kkzogwgsw3ao4q_jetpack-browser-action","treestyletab_piro_sakura_ne_jp-browser-action","_34daeb50-c2d2-4f14-886a-7160b24d66a4_-browser-action","addon_darkreader_org-browser-action"],"nav-bar":["back-button","forward-button","stop-reload-button","urlbar-container","save-to-pocket-button","bookmarks-menu-button","downloads-button","unified-extensions-button"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["firefox-view-button","tabbrowser-tabs","new-tab-button","alltabs-button"],"PersonalToolbar":["personal-bookmarks"]},"seen":["_a4c4eda4-fb84-4a84-b4a1-f7c1cbf2a1ad_-browser-action","redirector_einaregilsson_com-browser-action","jid1-kkzogwgsw3ao4q_jetpack-browser-action","treestyletab_piro_sakura_ne_jp-browser-action","_34daeb50-c2d2-4f14-886a-7160b24d66a4_-browser-action","addon_darkreader_org-browser-action","ublock0_raymondhill_net-browser-action","developer-button"],"dirtyAreaCache":["nav-bar","widget-overflow-fixed-list","toolbar-menubar","TabsToolbar","PersonalToolbar","unified-extensions-area"],"currentVersion":19,"newElementCount":14}'';
        "browser.urlbar.suggest.bookmark" = false;
        "devtools.chrome.enabled" = true;
        "distribution.searchplugins.defaultLocale" = "en-AU";
        "extensions.autoDisableScopes" = 0;
        "browser.sidebar.enable" = false;
        "floorp.browser.sidebar.enable" = false;
        "floorp.panelSidebar.enabled" = false;
        "general.smoothScroll" = true;
        "general.useragent.locale" = "en-AU";
        "media.ffmpeg.enabled" = true;
        "media.ffmpeg.vaapi.enabled" = true;
        "media.ffmpeg.encoder.enabled" = true;
        "media.hardware-video-decoding.enabled" = true;
        "media.videocontrols.picture-in-picture.enabled" = true;
        "mousewheel.default.delta_multiplier_y" = 80;
        "privacy.donottrackheader.enabled" = true;
        "services.sync.prefs.sync.browser.safebrowsing.downloads.enabled" = false;
        "services.sync.prefs.sync.general.smoothScroll" = true;
        "services.sync.prefs.sync.signon.management.page.breach-alerts.enabled" = false;
        "signon.management.page.breach-alerts.enabled" = false;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

        # Disable crash reports
        "breakpad.reportURL" = "";
        "browser.safebrowsing.provider.google.reportURL" = "";
        "browser.safebrowsing.provider.google4.reportURL" = "";
        "browser.tabs.crashReporting.sendReport" = false;
        "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
      };
      bookmarks = {
        force = true;
        settings = [
          {
            name = "Yandex";
            tags = ["yandex"];
            keyword = "yandex";
            url = "https://yandex.com";
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
            name = "Nix";
            bookmarks = [
              {
                name = "Packages";
                url = "https://search.nixos.org/";
              }
              {
                name = "wiki";
                tags = ["wiki" "nix"];
                url = "https://nixos.wiki/";
              }
            ];
          }
        ];
      };
    };
  };
}
