{ config, lib, pkgs, uservars, inputs, ... }: {

  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      extraPolicies = {
        CaptivePortal = false;
        DisablePocket = true;
        DisableTelemetry = true;
        DisableFirefoxAccounts = true;
        DisableFirefoxStudies = true;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        OfferToSaveLoginsDefault = false;
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
      ] ++ [
        pkgs.nur.repos.bandithedoge.firefoxAddons.stylus
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
        "general.smoothScroll" = true;
        "browser.search.region" = "AU";
        "browser.search.isUS" = false;
        "browser.sessionstore.restore_on_demand" = true;
        "browser.sessionstore.resume_from_crash" = true;
        "distribution.searchplugins.defaultLocale" = "en-AU";
        "general.useragent.locale" = "en-AU";
        "browser.bookmarks.showMobileBookmarks" = true;
        "media.hardware-video-decoding.enabled" = true;
        "media.videocontrols.picture-in-picture.enabled" = true;
        "browser.search.suggest.enabled" = false;
        "privacy.donottrackheader.enabled" = true;
        "services.sync.prefs.sync.signon.management.page.breach-alerts.enabled" = false;
        "signon.management.page.breach-alerts.enabled" = false;
        "browser.safebrowsing.downloads.enabled" = false;
        "browser.safebrowsing.blockedURIs.enabled" = false;
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
