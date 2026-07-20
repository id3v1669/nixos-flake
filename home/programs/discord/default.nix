{
  config,
  lib,
  pkgs,
  desk,
  ...
}: {
  home.packages = with pkgs; [
    equibop # equibop(unofficial discord app)
    arrpc # rpc for discord(equibop)
  ];
  systemd.user.services =
    {}
    // lib.optionalAttrs (desk == "desktop") {
      arrpc = {
        Unit = {
          Description = "arrpc service";
          After = ["default.target"];
        };
        Service = {
          ExecStart = "${lib.getExe pkgs.arrpc}";
          Restart = "on-failure";
        };
        Install = {WantedBy = ["default.target"];};
      };
    };
}
