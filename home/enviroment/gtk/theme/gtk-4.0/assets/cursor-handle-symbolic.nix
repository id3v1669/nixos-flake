{config, lib, pkgs, ...}:
{
  home.file.".themes/dynamic-color-theme/gtk-4.0/assets/scalable/cursor-handle-symbolic.svg".text = ''
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24">
  <path d="M0 0h12A12 12 0 1 1 0 12z"/>
</svg>
  '';
}