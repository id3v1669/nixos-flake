{ config, lib, pkgs, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      shell.program = "fish";
      colors = {
        primary = {
          background = "0x282433";
          foreground = "0xeee9fc";
        };
        cursor = {
          text = "0xeee9fc";
          cursor = "0xeee9fc";
        };
        normal = {
          black = "0x282433";
          red = "0xe965a5";
          green = "0xb1f2a7";
          yellow = "0xebde76";
          blue = "0xb1baf4";
          magenta = "0xe192ef";
          cyan = "0xb3f4f3";
          white = "0xeee9fc";
        };
        bright = {
          black = "0x3f3951";
          red = "0xe965a5";
          green = "0xb1f2a7";
          yellow = "0xebde76";
          blue = "0xb1baf4";
          magenta = "0xe192ef";
          cyan = "0xb3f4f3";
          white = "0xeee9fc";
        };      
      };
    };
  };
}
