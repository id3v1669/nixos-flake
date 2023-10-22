{ config, lib, pkgs, uservars, ... }:
{
  home.file.".config/eww/eww.scss" = {
    text = ''
    .launcher {
    font-size: 1.3em;
    border-radius: 20;
    padding: 5px 12px 5px 15px; 
    background-color: #241b26;
    color: #eed5d9;
    &:hover {
        background-color: #2f2a3f;
        color: #eed5d9;
    }
}

.usageinfo {
    background-color: #241b26;
    color: #eed5d9;
    border-radius: 20;
    padding: 5px 15px; 
    &:hover {
        background-color: #2f2a3f;
        color: #d9c2c6;
        .spacer {  
            color: #eed5d9;
          }
      }
  }

.ram, .cputemp, .disk, .boot {
    padding: 5px;
    border-radius: 3px;
  }

  .spacerh {
    color: #c965bf;
    font-size: 1.4em;
  }
  
  .workspaces {
    font-size: 1.3em;
    border-radius: 20;
    padding: 5px 20px 5px 15px; 
    background-color: #241b26;
    color: #eed5d9;
  }

  .miniclock {
    font-size: 1.3em;
    background-color: #241b26;
    color: #eed5d9;
    border-radius: 20;
    padding: 5px 16px 5px 17px;
    &:hover {
        background-color: #2f2a3f;
        color: #d9c2c6;
      }
  }

  .tray {
    font-size: 1.4em;
    background-color: #241b26;
    color: #eed5d9;
    border-radius: 20;
    padding: 5px 14px 5px 15px;
  }

  .mic {
    font-size: 1.3em;
    background-color: #241b26;
    color: #eed5d9;
    border-radius: 20;
    padding: 5px 16px 4px 14px;
    &:hover {
        background-color: #2f2a3f;
        color: #d9c2c6;
      }
  }

  .sound {
    //font-size: 1.6em;
    background-color: #241b26;
    color: #eed5d9;
    border-radius: 20;
    padding: 3px 16px 3px 2px;
    &:hover {
        background-color: #2f2a3f;
        color: #d9c2c6;
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
    background-color: #241b26;
    color: #eed5d9;
    border-radius: 20;
    padding: 5px 16px 5px 14px;
    &:hover {
        background-color: #2f2a3f;
        color: #d9c2c6;
      }
  }

  .calelndarpop {
    font-size: 1em;
    background-color: #241b26;
    color: #eed5d9;
    border-radius: 20;
    padding: 5px 16px 5px 14px;
  }
  

  calendar:selected {
    background-color: #2f2a3f;;
  }

  .powerpopup {
    padding: 5px 0px 0px 0px;
  }

  .suspend {
    font-size: 1.3em;
    background-color: #a3a079;
    color: #eed5d9;
    border-radius: 20;
    padding: 4px 16px 5px 9px;
    &:hover {
        background-color: #7e5f83;
        color: #d9c2c6;
      }
  }
  .reboot {
    font-size: 1.3em;
    background-color: #6a9eb5;
    color: #eed5d9;
    border-radius: 20;
    padding: 4px 14px 5px 9px;
    &:hover {
        background-color: #7e5f83;
        color: #d9c2c6;
      }
  }
  .shutdown {
    font-size: 1.4em;
    background-color: #de5b44;
    color: #eed5d9;
    border-radius: 20;
    padding: 4px 12px 5px 10px;
    &:hover {
        background-color: #7e5f83;
        color: #d9c2c6;
      }
  }

    .background {
        background-color: rgba(0, 0, 0, 0);
    }

    .battery {
      font-size: 1.3em;
      border-radius: 20;
      padding: 5px 12px 5px 15px; 
      background-color: #241b26;
      color: #eed5d9;
  }
    '';
  };
}