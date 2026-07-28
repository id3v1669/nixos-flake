
_:{
  services.kanshi.settings = [
      {
        profile = {
          name = "home_triple";
          outputs = [
            {
              criteria = "eDP-1";
              mode = "1920x1080@60Hz";
              position = "-1920,0";
              scale = 1.0;
            }
            {
              criteria = "DP-1";
              mode = "3440x1440@120Hz";
              position = "0,0";
            }
            {
              criteria = "DP-2";
              mode = "1920x1080@100Hz";
              position = "3440,-320";
              transform = "90";
              scale = 1.0;
            }
          ];
        };
      }
      {
        profile = {
          name = "work_hdmi";
          outputs = [
            {
              criteria = "HDMI-A-1";
              #TODO: figure out same layout with diff screens
              #mode = "1920x1080@74.906Hz";
              mode = "1920x1080@60Hz";
              position = "0,0";
              scale = 1.0;
            }
            {
              criteria = "eDP-1";
              position = "0,1080";
              scale = 1.0;
            }
          ];
        };
      }
      {
        profile = {
          name = "work_dvi";
          outputs = [
            {
              criteria = "DVI-I-1";
              mode = "2560x1440@99.946Hz";
              position = "0,0";
            }
            {
              criteria = "eDP-1";
              position = "0,1440";
            }
          ];
        };
      }
      {
        profile = {
          name = "laptop_only";
          outputs = [
            {
              criteria = "eDP-1";
              position = "0,0";
              scale = 1.0;
            }
          ];
        };
      }
    ];
  
  }