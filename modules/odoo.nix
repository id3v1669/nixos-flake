{
  pkgs,
  config,
  ...
}: {
  services = {
    odoo = {
      enable = true;
      #domain = "odoo.id3v1669.com";
      package = pkgs.odoo;
      autoInit = true;
      settings = {
        options = {
          db_user = "odoo";
          db_password = "odoo";
        };
      };
      addons = [];
    };
  };
}
