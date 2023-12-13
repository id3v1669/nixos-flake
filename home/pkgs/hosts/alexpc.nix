{ pkgs
, ...
}:
{
  home.packages = with pkgs; [
    yandex-browser # bloated russian browser
  ];
}