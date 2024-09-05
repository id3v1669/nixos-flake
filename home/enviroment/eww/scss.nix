{ config
, ...
}:
{
  home.file.".config/eww/eww.scss".text = with config.palette; ''

* {
    font-family: "0xProto";
}

.launcher {
    font-size: 1.5em;
    border-radius: 20px;
    padding: 5px 12px 5px 13px; 
    background-color: ${base06.hexT};
    color: ${base02.hexT};
    &:hover {
        background-color: ${base04.hexT};
        color: ${base02.hexT};
    }
}

.usageinfo {
    background-color: ${base06.hexT};
    color: ${base02.hexT};
    border-radius: 20px;
    padding: 5px 15px; 
    &:hover {
        background-color: ${base04.hexT};
        color: ${base00.hexT};
        .spacer {  
            color: ${base02.hexT};
          }
      }
  }

  .ram, .cputemp, .disk, .boot {
    padding: 5px;
    border-radius: 3px;
  }

  .spacerh {
    color: ${base11.hexT};
    font-size: 1.4em;
  }
  
  .workspaces {
    font-size: 1.3em;
    border-radius: 20px;
    padding: 5px 20px 5px 15px; 
    background-color: ${base06.hexT};
    color: ${base02.hexT};
  }

  .lang {
    border-radius: 20px;
    padding: 5px 10px 5px 10px; 
    background-color: ${base06.hexT};
    color: ${base02.hexT};
  }

  .langsymb {
    font-size: 1.2em;
    padding: 0px 10px 0px 0px; 
  }

  .langvar {
    font-size: 1.2em;
    min-width: 23px;
  }

  .miniclock {
    font-size: 1.3em;
    background-color: ${base06.hexT};
    color: ${base02.hexT};
    border-radius: 20px;
    padding: 5px 16px 5px 17px;
    &:hover {
        background-color: ${base04.hexT};
        color: ${base00.hexT};
      }
  }

  .music-controls {
    background-color: ${base06.hexT};
    border-radius: 20px;
    padding: 0px 4px 0px 2px;
  }
  
  .playpause {
    border-radius: 55px;
    background-color: rgba(0, 0, 0, 0);
  }
  
  .previoussong {
    border-radius: 55px;
    background-color: rgba(0, 0, 0, 0);
  }
  
  .nextsong {
    border-radius: 55px;
    background-color: rgba(0, 0, 0, 0);
  }
  
  .symb{
    font-size: 1.3em;
  }

  .testmus {
    border-radius: 20px;
    padding: 0px 0px 0px 0px; 
  }
  
  .songname {
    font-size: 1.1em;
    padding: 0px 8px 0px 7px; 
  }
  
  .songbtn {
    font-size: 1.3em;
    padding: 0px 15px 0px 7px; 
  }

  .tray {
    font-size: 1.4em;
    background-color: ${base06.hexT};
    color: ${base02.hexT};
    border-radius: 20px;
    padding: 5px 14px 5px 15px;
  }


.replay {
  font-size: 1.4em;
  background-color: ${base06.hexT};
  border-radius: 20px;
  padding: 5px 16px 4px 10px;
  &:hover {
      background-color: ${base04.hexT};
      color: ${base00.hexT};
    }
}
.replay.active {
  color: ${base11.hexT};
}

.replay.inactive {
  color: ${base02.hexT};
}

  .mic {
    font-size: 1.3em;
    background-color: ${base06.hexT};
    color: ${base02.hexT};
    border-radius: 20px;
    padding: 5px 16px 4px 14px;
    &:hover {
        background-color: ${base04.hexT};
        color: ${base00.hexT};
      }
  }

  .sound {
    //font-size: 1.6em;
    background-color: ${base06.hexT};
    color: ${base02.hexT};
    border-radius: 20px;
    padding: 3px 16px 3px 2px;
    &:hover {
        background-color: ${base04.hexT};
        color: ${base00.hexT};
      }
  }
  .soundsymb {
    padding: 0px 0px 0px 0px;
    font-size: 1.7em;
  }
  .soundvol {
    padding: 0px 0px 0px 0px;
    font-size: 1.3em;
  }

  .minipower {
    font-size: 1.4em;
    background-color: ${base06.hexT};
    color: ${base02.hexT};
    border-radius: 20px;
    padding: 5px 16px 5px 14px;
    &:hover {
        background-color: ${base04.hexT};
        color: ${base00.hexT};
      }
  }

  .calelndarpop {
    font-size: 1em;
    background-color: ${base06.hexT};
    color: ${base02.hexT};
    border-radius: 20px;
    padding: 5px 16px 5px 14px;
  }
  

  calendar:selected {
    background-color: ${base04.hexT};;
  }

  .powerpopup {
    padding: 5px 0px 0px 0px;
  }

  .suspend {
    font-size: 1.3em;
    background-color: ${base0E.hexT};
    color: ${base02.hexT};
    border-radius: 20px;
    padding: 4px 16px 5px 9px;
    &:hover {
        background-color: ${base05.hexT};
        color: ${base00.hexT};
      }
  }
  .reboot {
    font-size: 1.3em;
    background-color: ${base17.hexT};
    color: ${base02.hexT};
    border-radius: 20px;
    padding: 4px 14px 5px 9px;
    &:hover {
        background-color: ${base05.hexT};
        color: ${base00.hexT};
      }
  }
  .shutdown {
    font-size: 1.4em;
    background-color: ${base09.hexT};
    color: ${base02.hexT};
    border-radius: 20px;
    padding: 4px 12px 5px 10px;
    &:hover {
        background-color: ${base05.hexT};
        color: ${base00.hexT};
      }
  }

    .background {
        background-color: rgba(0, 0, 0, 0);
    }

    .battery {
      font-size: 1.3em;
      border-radius: 20px;
      padding: 5px 12px 5px 15px; 
      background-color: ${base06.hexT};
      color: ${base02.hexT};
  }
  '';
}