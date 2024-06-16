{ config
, ...
}:
{
  home.file.".config/eww/eww.scss".text = ''
.launcher {
    font-size: 1.5em;
    border-radius: 20px;
    padding: 5px 12px 5px 13px; 
    background-color: #${config.colorScheme.palette.base00};
    color: #${config.colorScheme.palette.base05};
    &:hover {
        background-color: #${config.colorScheme.palette.base01};
        color: #${config.colorScheme.palette.base05};
    }
}

.usageinfo {
    background-color: #${config.colorScheme.palette.base00};
    color: #${config.colorScheme.palette.base05};
    border-radius: 20px;
    padding: 5px 15px; 
    &:hover {
        background-color: #${config.colorScheme.palette.base01};
        color: #${config.colorScheme.palette.base06};
        .spacer {  
            color: #${config.colorScheme.palette.base05};
          }
      }
  }

  .ram, .cputemp, .disk, .boot {
    padding: 5px;
    border-radius: 3px;
  }

  .spacerh {
    color: #${config.colorScheme.palette.base0B};
    font-size: 1.4em;
  }
  
  .workspaces {
    font-size: 1.3em;
    border-radius: 20px;
    padding: 5px 20px 5px 15px; 
    background-color: #${config.colorScheme.palette.base00};
    color: #${config.colorScheme.palette.base05};
  }

  .lang {
    border-radius: 20px;
    padding: 5px 10px 5px 10px; 
    background-color: #${config.colorScheme.palette.base00};
    color: #${config.colorScheme.palette.base05};
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
    background-color: #${config.colorScheme.palette.base00};
    color: #${config.colorScheme.palette.base05};
    border-radius: 20px;
    padding: 5px 16px 5px 17px;
    &:hover {
        background-color: #${config.colorScheme.palette.base01};
        color: #${config.colorScheme.palette.base06};
      }
  }

  .music-controls {
    background-color: #${config.colorScheme.palette.base00};
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
    background-color: #${config.colorScheme.palette.base00};
    color: #${config.colorScheme.palette.base05};
    border-radius: 20px;
    padding: 5px 14px 5px 15px;
  }


.replay {
  font-size: 1.4em;
  background-color: #${config.colorScheme.palette.base00};
  border-radius: 20px;
  padding: 5px 16px 4px 10px;
  &:hover {
      background-color: #${config.colorScheme.palette.base01};
      color: #${config.colorScheme.palette.base06};
    }
}
.replay.active {
  color: #${config.colorScheme.palette.base0B};
}

.replay.inactive {
  color: #${config.colorScheme.palette.base05};
}

  .mic {
    font-size: 1.3em;
    background-color: #${config.colorScheme.palette.base00};
    color: #${config.colorScheme.palette.base05};
    border-radius: 20px;
    padding: 5px 16px 4px 14px;
    &:hover {
        background-color: #${config.colorScheme.palette.base01};
        color: #${config.colorScheme.palette.base06};
      }
  }

  .sound {
    //font-size: 1.6em;
    background-color: #${config.colorScheme.palette.base00};
    color: #${config.colorScheme.palette.base05};
    border-radius: 20px;
    padding: 3px 16px 3px 2px;
    &:hover {
        background-color: #${config.colorScheme.palette.base01};
        color: #${config.colorScheme.palette.base06};
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
    background-color: #${config.colorScheme.palette.base00};
    color: #${config.colorScheme.palette.base05};
    border-radius: 20px;
    padding: 5px 16px 5px 14px;
    &:hover {
        background-color: #${config.colorScheme.palette.base01};
        color: #${config.colorScheme.palette.base06};
      }
  }

  .calelndarpop {
    font-size: 1em;
    background-color: #${config.colorScheme.palette.base00};
    color: #${config.colorScheme.palette.base05};
    border-radius: 20px;
    padding: 5px 16px 5px 14px;
  }
  

  calendar:selected {
    background-color: #${config.colorScheme.palette.base01};;
  }

  .powerpopup {
    padding: 5px 0px 0px 0px;
  }

  .suspend {
    font-size: 1.3em;
    background-color: #${config.colorScheme.palette.base0A};
    color: #${config.colorScheme.palette.base05};
    border-radius: 20px;
    padding: 4px 16px 5px 9px;
    &:hover {
        background-color: #${config.colorScheme.palette.base04};
        color: #${config.colorScheme.palette.base06};
      }
  }
  .reboot {
    font-size: 1.3em;
    background-color: #${config.colorScheme.palette.base0D};
    color: #${config.colorScheme.palette.base05};
    border-radius: 20px;
    padding: 4px 14px 5px 9px;
    &:hover {
        background-color: #${config.colorScheme.palette.base04};
        color: #${config.colorScheme.palette.base06};
      }
  }
  .shutdown {
    font-size: 1.4em;
    background-color: #${config.colorScheme.palette.base08};
    color: #${config.colorScheme.palette.base05};
    border-radius: 20px;
    padding: 4px 12px 5px 10px;
    &:hover {
        background-color: #${config.colorScheme.palette.base04};
        color: #${config.colorScheme.palette.base06};
      }
  }

    .background {
        background-color: rgba(0, 0, 0, 0);
    }

    .battery {
      font-size: 1.3em;
      border-radius: 20px;
      padding: 5px 12px 5px 15px; 
      background-color: #${config.colorScheme.palette.base00};
      color: #${config.colorScheme.palette.base05};
  }
  '';
}