{inputs, ...}: {
  imports = [
    inputs.wayshot.homeModules.default
  ];
  programs.wayshot = {
    enable = true;
    # Build features for the default package; ignored when `package` is set.
    features = {
      jxlSupport = false;
    };
    settings = {
      base = {
        cursor = true;
        clipboard = false;
        file = true;
      };
      file = {
        path = "~/Pictures";
      };
    };
  };
}
