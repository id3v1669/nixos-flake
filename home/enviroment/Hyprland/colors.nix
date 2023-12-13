{ config
, ...
}:
{
  home.file.".config/hypr/colors".text = ''
$background = rgb(${config.colorScheme.colors.base01})
$foreground = rgb(${config.colorScheme.colors.base06})

$color0 = rgb(${config.colorScheme.colors.base00})
$color1 = rgb(${config.colorScheme.colors.base01})
$color2 = rgb(${config.colorScheme.colors.base02})
$color3 = rgb(${config.colorScheme.colors.base03})
$color4 = rgb(${config.colorScheme.colors.base04})
$color5 = rgb(${config.colorScheme.colors.base05})
$color6 = rgb(${config.colorScheme.colors.base06})
$color7 = rgb(${config.colorScheme.colors.base07})
$color8 = rgb(${config.colorScheme.colors.base08})
$color9 = rgb(${config.colorScheme.colors.base09})
$color10 = rgb(${config.colorScheme.colors.base0A})
$color11 = rgb(${config.colorScheme.colors.base0B})
$color12 = rgb(${config.colorScheme.colors.base0C})
$color13 = rgb(${config.colorScheme.colors.base0D})
$color14 = rgb(${config.colorScheme.colors.base0E})
$color15 = rgb(${config.colorScheme.colors.base0F})
  '';
}