{ pkgs
, ...
}:
{
  services.input-remapper = {
    enable = true;
    enableUdevRules = true;
  };
  environment.etc = let
    mouseCfg = ''
[
    {
        "input_combination": [
            {
                "type": 1,
                "code": 275,
                "origin_hash": "c41241a6416a9ab8a82d2169f660d334"
            }
        ],
        "target_uinput": "keyboard",
        "output_symbol": "Super_L",
        "mapping_type": "key_macro"
    },
    {
        "input_combination": [
            {
                "type": 1,
                "code": 276,
                "origin_hash": "c41241a6416a9ab8a82d2169f660d334"
            }
        ],
        "target_uinput": "mouse",
        "output_symbol": "hold(key(BTN_LEFT).wait(50))",
        "mapping_type": "key_macro"
    }
]
    '';
  in {
    "input-remapper/config.json".text = ''
{
    "version": "2.0.1",
    "autoload": {
        "Logitech USB Receiver": "side_buttons",
        "Logitech PRO X 2": "side_buttons"
    }
}
    '';
    "input-remapper/presets/Logitech PRO X 2/side_buttons.json".text = ''${mouseCfg}'';
    "input-remapper/presets/Logitech USB Receiver/side_buttons.json".text = ''${mouseCfg}'';
  };
}