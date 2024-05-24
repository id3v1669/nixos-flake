{ config
, ...
}:
{
  programs.fastfetch.enable = true; # linux core)) but faster
# home file is used instead of settings as I had trouble passing '\'
  home.file.".config/fastfetch/config.jsonc".text = ''
{
    "logo": {
        "padding": {
            "top": 2
        }
    },
    "display": {
        "separator": "    "
    },
    "modules": [
        {
            "type": "custom",
            "format": "\u001b[90m┌──────────────── Hardware Information ───────────────┐"
        },
        {
            "type": "host",
            "key": "󰌢 PC",
            "keyColor": "green"
        },
        {
            "type": "cpu",
            "key": "│ ├󰻠",
            "keyColor": "green"
        },
        {
            "type": "gpu",
            "key": "│ ├󰍛",
            "keyColor": "green"
        },
        {
            "type": "disk",
            "key": "│ ├",
            "keyColor": "green"
        },
        {
            "type": "memory",
            "key": "│ ├󰑭",
            "keyColor": "green"
        },
        {
            "type": "display",
            "key": "│ └󰍹",
            "keyColor": "green"
        },
        {
            "type": "custom",
            "format": "\u001b[90m├──────────────── Software Information ───────────────┤"
        },
        {
            "type": "os",
            "key": " OS",
            "keyColor": "yellow"
        },
        {
            "type": "kernel",
            "key": "│ ├",
            "keyColor": "yellow"
        },
        {
            "type": "packages",
            "key": "│ ├󰏖",
            "keyColor": "yellow"
        },
        {
            "type": "shell",
            "key": "│ ├",
            "keyColor": "yellow"
        },
        {
            "type": "uptime",
            "key": "│ └󰅐",
            "keyColor": "yellow"
        },
        {
            "type": "wm",
            "key": " DE/WM",
            "keyColor": "cyan"
        },
        {
            "type": "lm",
            "key": "│ ├󰧨",
            "keyColor": "cyan"
        },
        {
            "type": "wmtheme",
            "key": "│ ├󰉼",
            "keyColor": "cyan"
        },
        {
            "type": "icons",
            "key": "│ ├󰀻",
            "keyColor": "cyan"
        },
        {
            "type": "terminal",
            "key": "│ └",
            "keyColor": "cyan"
        },
        {
            "type": "custom",
            "format": "\u001b[90m└────────────────────────────────────────────────────┘"
        },
        "break",
        {
            "type": "custom",
            "format": "               \u001b[90m  \u001b[31m  \u001b[32m  \u001b[33m  \u001b[34m  \u001b[35m  \u001b[36m  \u001b[37m  \u001b[38m"
        }
    ]
}
  '';
}
