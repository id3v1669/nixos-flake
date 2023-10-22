{ config, lib, pkgs, ... }:
{
  home.file.".config/eww/eww.scss" = {
    text = ''
    .launcher {
    font-size: 1.3em;
    border-radius: 20;
    padding: 5px 12px 5px 15px; 
    background-color: #${config.colorScheme.colors.base00};
    color: #${config.colorScheme.colors.base05};
    &:hover {
        background-color: #${config.colorScheme.colors.base01};
        color: #${config.colorScheme.colors.base05};
    }
}

.usageinfo {
    background-color: #${config.colorScheme.colors.base00};
    color: #${config.colorScheme.colors.base05};
    border-radius: 20;
    padding: 5px 15px; 
    &:hover {
        background-color: #${config.colorScheme.colors.base01};
        color: #${config.colorScheme.colors.base06};
        .spacer {  
            color: #${config.colorScheme.colors.base05};
          }
      }
  }

.ram, .cputemp, .disk, .boot {
    padding: 5px;
    border-radius: 3px;
  }

  .spacerh {
    color: #${config.colorScheme.colors.base0B};
    font-size: 1.4em;
  }
  
  .workspaces {
    font-size: 1.3em;
    border-radius: 20;
    padding: 5px 20px 5px 15px; 
    background-color: #${config.colorScheme.colors.base00};
    color: #${config.colorScheme.colors.base05};
  }

  .miniclock {
    font-size: 1.3em;
    background-color: #${config.colorScheme.colors.base00};
    color: #${config.colorScheme.colors.base05};
    border-radius: 20;
    padding: 5px 16px 5px 17px;
    &:hover {
        background-color: #${config.colorScheme.colors.base01};
        color: #${config.colorScheme.colors.base06};
      }
  }

  .tray {
    font-size: 1.4em;
    background-color: #${config.colorScheme.colors.base00};
    color: #${config.colorScheme.colors.base05};
    border-radius: 20;
    padding: 5px 14px 5px 15px;
  }

  .mic {
    font-size: 1.3em;
    background-color: #${config.colorScheme.colors.base00};
    color: #${config.colorScheme.colors.base05};
    border-radius: 20;
    padding: 5px 16px 4px 14px;
    &:hover {
        background-color: #${config.colorScheme.colors.base01};
        color: #${config.colorScheme.colors.base06};
      }
  }

  .sound {
    //font-size: 1.6em;
    background-color: #${config.colorScheme.colors.base00};
    color: #${config.colorScheme.colors.base05};
    border-radius: 20;
    padding: 3px 16px 3px 2px;
    &:hover {
        background-color: #${config.colorScheme.colors.base01};
        color: #${config.colorScheme.colors.base06};
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
    background-color: #${config.colorScheme.colors.base00};
    color: #${config.colorScheme.colors.base05};
    border-radius: 20;
    padding: 5px 16px 5px 14px;
    &:hover {
        background-color: #${config.colorScheme.colors.base01};
        color: #${config.colorScheme.colors.base06};
      }
  }

  .calelndarpop {
    font-size: 1em;
    background-color: #${config.colorScheme.colors.base00};
    color: #${config.colorScheme.colors.base05};
    border-radius: 20;
    padding: 5px 16px 5px 14px;
  }
  

  calendar:selected {
    background-color: #${config.colorScheme.colors.base01};;
  }

  .powerpopup {
    padding: 5px 0px 0px 0px;
  }

  .suspend {
    font-size: 1.3em;
    background-color: #${config.colorScheme.colors.base0F};
    color: #${config.colorScheme.colors.base05};
    border-radius: 20;
    padding: 4px 16px 5px 9px;
    &:hover {
        background-color: #${config.colorScheme.colors.base04};
        color: #${config.colorScheme.colors.base06};
      }
  }
  .reboot {
    font-size: 1.3em;
    background-color: #${config.colorScheme.colors.base0D};
    color: #${config.colorScheme.colors.base05};
    border-radius: 20;
    padding: 4px 14px 5px 9px;
    &:hover {
        background-color: #${config.colorScheme.colors.base04};
        color: #${config.colorScheme.colors.base06};
      }
  }
  .shutdown {
    font-size: 1.4em;
    background-color: #${config.colorScheme.colors.base09};
    color: #${config.colorScheme.colors.base05};
    border-radius: 20;
    padding: 4px 12px 5px 10px;
    &:hover {
        background-color: #${config.colorScheme.colors.base04};
        color: #${config.colorScheme.colors.base06};
      }
  }

    .background {
        background-color: rgba(0, 0, 0, 0);
    }

    .battery {
      font-size: 1.3em;
      border-radius: 20;
      padding: 5px 12px 5px 15px; 
      background-color: #${config.colorScheme.colors.base00};
      color: #${config.colorScheme.colors.base05};
  }
    '';
  };
}