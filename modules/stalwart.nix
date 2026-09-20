{config, ...}: let
  # Mail for the Odoo instance lives under id3v1669.org (owner decision
  # 2026-09-20), deliberately separate from the id3v1669.com vhosts.
  mailDomain = "id3v1669.org";
  mailHost = "mail.${mailDomain}";
  # Stalwart's HTTP listener (web admin + JMAP) stays on loopback behind nginx.
  httpPort = 8087;
  secrets = ./../secrets/system/stalwart.enc.yaml;
  cred = name: "%{file:/run/credentials/stalwart.service/${name}}%";
  acmeFile = name: "%{file:/var/lib/acme/${mailHost}/${name}}%";
in {
  sops.secrets = {
    "stalwart/admin-secret" = {
      sopsFile = secrets;
      restartUnits = ["stalwart.service"];
    };
    "stalwart/dkim-rsa" = {
      sopsFile = secrets;
      restartUnits = ["stalwart.service"];
    };
    "stalwart/dkim-ed25519" = {
      sopsFile = secrets;
      restartUnits = ["stalwart.service"];
    };
  };

  services.stalwart = {
    enable = true;
    stateVersion = "26.05";
    # systemd LoadCredential= reads these as root; Stalwart sees them under
    # /run/credentials/stalwart.service/.
    credentials = {
      admin_secret = config.sops.secrets."stalwart/admin-secret".path;
      dkim_rsa = config.sops.secrets."stalwart/dkim-rsa".path;
      dkim_ed25519 = config.sops.secrets."stalwart/dkim-ed25519".path;
    };
    settings = {
      server.hostname = mailHost;
      # The host has no global IPv6 address, so bind IPv4 only.
      server.listener = {
        smtp = {
          bind = ["0.0.0.0:25"];
          protocol = "smtp";
        };
        submission = {
          bind = ["0.0.0.0:587"];
          protocol = "smtp";
        };
        submissions = {
          bind = ["0.0.0.0:465"];
          protocol = "smtp";
          tls.implicit = true;
        };
        imaptls = {
          bind = ["0.0.0.0:993"];
          protocol = "imap";
          tls.implicit = true;
        };
        sieve = {
          bind = ["0.0.0.0:4190"];
          protocol = "managesieve";
        };
        http = {
          bind = ["127.0.0.1:${toString httpPort}"];
          protocol = "http";
        };
      };

      # TLS: the certificate is issued by NixOS ACME through the nginx vhost
      # below and read from /var/lib/acme (stalwart is in the acme group).
      certificate.default = {
        cert = acmeFile "fullchain.pem";
        private-key = acmeFile "key.pem";
        default = true;
      };

      authentication.fallback-admin = {
        user = "admin";
        secret = cred "admin_secret";
      };

      # DKIM: two signatures (RSA for compatibility, Ed25519 per RFC 8463).
      # Public keys for the DNS TXT records are in the vault DNS note.
      signature = let
        common = {
          domain = mailDomain;
          headers = [
            "From"
            "To"
            "Cc"
            "Date"
            "Subject"
            "Message-ID"
            "Organization"
            "MIME-Version"
            "Content-Type"
            "In-Reply-To"
            "References"
            "List-Id"
            "User-Agent"
          ];
          canonicalization = "relaxed/relaxed";
        };
      in {
        rsa =
          common
          // {
            private-key = cred "dkim_rsa";
            selector = "rsa2026";
            algorithm = "rsa-sha256";
          };
        ed25519 =
          common
          // {
            private-key = cred "dkim_ed25519";
            selector = "ed2026";
            algorithm = "ed25519-sha256";
          };
      };
      # Sign everything submitted by authenticated clients; never re-sign
      # inbound mail arriving on port 25.
      auth.dkim.sign = [
        {
          "if" = "listener != 'smtp'";
          "then" = "['rsa', 'ed25519']";
        }
        {"else" = false;}
      ];
    };
  };

  users.users.stalwart.extraGroups = ["acme"];

  security.acme.certs."${mailHost}".reloadServices = ["stalwart.service"];

  # Start only once the (self-signed placeholder or real) certificate exists.
  systemd.services.stalwart = {
    after = ["acme-selfsigned-${mailHost}.service"];
    wants = ["acme-selfsigned-${mailHost}.service"];
  };

  # Web admin / JMAP over HTTPS; this vhost is also what obtains the ACME
  # certificate that the SMTP/IMAP listeners use. The mail host must be a
  # DNS-only (unproxied) record so that SMTP/IMAP reach this box directly.
  services.nginx.virtualHosts."${mailHost}" = {
    enableACME = true;
    forceSSL = true;
    extraConfig = ''
      client_max_body_size 50m;
    '';
    locations."/" = {
      proxyPass = "http://127.0.0.1:${toString httpPort}";
      proxyWebsockets = true;
      recommendedProxySettings = true;
    };
  };
}
