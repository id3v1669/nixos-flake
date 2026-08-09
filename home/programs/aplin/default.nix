{inputs, ...}: {
  imports = [
    inputs.aplin.homeModules.default
  ];
  programs.aplin = {
    enable = true;
    settings = ''
      covered {
          both "playerctl play"
          none "playerctl pause"
      }

      notification {
          timeout "5s"
          full #true
          on25 #true
          on10 #true
          anc #false
      }

      disconnect {
          command "playerctl pause"
          timeout "60s"
      }

    '';
  };
}
