{ pkgs
, ...
}:
{
  home.packages = with pkgs; [
    #gui
    yandex-browser # bloated russian browser
  ];
}