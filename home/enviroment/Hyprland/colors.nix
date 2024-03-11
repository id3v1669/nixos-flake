{ config
, ...
}:
{
  home.file.".config/hypr/colors".text = ''
$background = rgb(${config.colorScheme.palette.base01})
$foreground = rgb(${config.colorScheme.palette.base06})

$color0 = rgb(${config.colorScheme.palette.base00})
$color1 = rgb(${config.colorScheme.palette.base01})
$color2 = rgb(${config.colorScheme.palette.base02})
$color3 = rgb(${config.colorScheme.palette.base03})
$color4 = rgb(${config.colorScheme.palette.base04})
$color5 = rgb(${config.colorScheme.palette.base05})
$color6 = rgb(${config.colorScheme.palette.base06})
$color7 = rgb(${config.colorScheme.palette.base07})
$color8 = rgb(${config.colorScheme.palette.base08})
$color9 = rgb(${config.colorScheme.palette.base09})
$color10 = rgb(${config.colorScheme.palette.base0A})
$color11 = rgb(${config.colorScheme.palette.base0B})
$color12 = rgb(${config.colorScheme.palette.base0C})
$color13 = rgb(${config.colorScheme.palette.base0D})
$color14 = rgb(${config.colorScheme.palette.base0E})
$color15 = rgb(${config.colorScheme.palette.base0F})
  '';
}