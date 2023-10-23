{ config, lib, pkgs, ... }:
{
  home.file.".themes/dynamic-color-theme/gtk-3.0/apps/solus-applications.css".text = ''
QuirkyClient .linked .button:first-child {
    border-color: alpha(black,0.2);
    border-width: 1px;
}

QuirkyClient .linked .button:first-child:hover,
QuirkyClient .linked .button:first-child:active,
QuirkyClient .linked .button:first-child:checked {
    border-color: transparent;
    border-top-color: alpha(white,0.2);
    border-bottom-color: alpha(black,0.2);
}
  '';
}
