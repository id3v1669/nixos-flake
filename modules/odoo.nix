{
  pkgs,
  config,
  ...
}: {
  services = {
    odoo = {
      enable = false;
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
