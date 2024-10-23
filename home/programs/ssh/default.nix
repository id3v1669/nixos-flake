{ pkgs
, lib
, ...
}:
{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      srvnet510 = {
        hostname = "";
      };
    };
  };
}