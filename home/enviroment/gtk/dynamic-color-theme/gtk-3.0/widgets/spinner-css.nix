{ config, lib, pkgs, ... }:
{
  home.file.".themes/dynamic-color-theme/gtk-3.0/widgets/spinner.css".text = ''
@keyframes spin {
  to {
    -gtk-icon-transform: rotate(1turn); 
  }     
}

.spinner {
  background-image: none;
  background-color: blue;
  opacity: 0;
  -gtk-icon-source: -gtk-icontheme("process-working-symbolic"); 
}
  
.spinner:active {
    opacity: 1;
    animation: spin 1s linear infinite; 
} 

.spinner:active:insensitive {
    opacity: 0.5; 
}
  '';
}
