{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = [
    (pkgs.symlinkJoin {
      name = "ox";
      buildInputs = [pkgs.makeWrapper];
      paths = [pkgs.ox];
      postBuild = let
        oxConfig = with config.palette; ''
                  -- Configure Colours --
          colors.editor_bg = {${base07.rgbS}}						--bgdarkalt
          colors.editor_fg = {${base00.rgbS}} 					--fg
          colors.line_number_bg = {${base06.rgbS}}					--bgdark
          colors.line_number_fg = {${base02.rgbS}}				--fgdark
          colors.status_bg = {${base0B.rgbS}} 						--orange accentcolor
          colors.status_fg = {${base00.rgbS}} 					--fg

          colors.highlight = {255,0.0}

          colors.tab_inactive_bg = {${base04.rgbS}}					--bg
          colors.tab_inactive_fg = {${base00.rgbS}} 				--fg
          colors.tab_active_bg = {${base05.rgbS}}					--bglight
          colors.tab_active_fg = {${base00.rgbS}} 				--fg
          colors.split_bg = {${base05.rgbS}}						--bglight
          colors.split_fg = {${base0B.rgbS}} 						--orange accentcolor
          colors.info_bg = {${base05.rgbS}} 						--bglight
          colors.info_fg = {${base14.rgbS}} 						--cyan
          colors.warning_bg = {${base05.rgbS}} 						--bglight
          colors.warning_fg = {${base0E.rgbS}} 					--yellow
          colors.error_bg = {${base05.rgbS}} 						--bglight
          colors.error_fg = {${base08.rgbS}} 						--red
          colors.selection_bg = {${base04.rgbS}} 					--bg
          colors.selection_fg = {${base14.rgbS}} 				--cyan
          colors.file_tree_bg = {${base07.rgbS}} 					--bgdarkalt
          colors.file_tree_fg = {${base00.rgbS}} 				--fg
          colors.file_tree_selection_bg = {${base05.rgbS}} 			--bglight
          colors.file_tree_selection_fg = {${base14.rgbS}} 		--cyan

          colors.file_tree_red = {${base08.rgbS}}
          colors.file_tree_orange = {${base0B.rgbS}}
          colors.file_tree_yellow = {${base0E.rgbS}}
          colors.file_tree_green = {${base11.rgbS}}
          colors.file_tree_lightblue = {${base18.rgbS}}
          colors.file_tree_darkblue = {${base19.rgbS}}
          colors.file_tree_purple = {${base1A.rgbS}}
          colors.file_tree_pink = {${base1D.rgbS}}
          colors.file_tree_brown = {${base0A.rgbS}}
          colors.file_tree_grey = {${base03.rgbS}}

          -- Configure Syntax Highlighting Colours --
          syntax:set("string",{${base12.rgbS}}) 					--greenlight String vars maybe change
          syntax:set("comment",{${base03.rgbS}}) 				--fgdarkalt Comments,light purple
          syntax:set("digit",{${base15.rgbS}}) 					--cyanlight Digits
          syntax:set("keyword",{${base17.rgbS}})					--blue Keywords,fn types,etc.
          syntax:set("attribute",{${base16.rgbS}})   				--cyandark Attributes,rsmacros
          syntax:set("function",{${base14.rgbS}}) 				--cyan Function names,light purple
          syntax:set("macro",{${base18.rgbS}})					--bluelight Macros,red
          syntax:set("namespace",{${base17.rgbS}}) 				--blue Namespaces
          syntax:set("struct",{${base1B.rgbS}}) 					--purplelight Structs,classes,and enums
          syntax:set("operator",{${base01.rgbS}})				--fglight Operators
          syntax:set("boolean",{${base19.rgbS}})					--bluedark Booleans
          syntax:set("reference",{${base1E.rgbS}})				--pinklight References
          syntax:set("tag",{${base03.rgbS}})						--fgdarkalt Tags (e.g. HTML tags)


          -- Undefined Syntax Highlights with old values --
          syntax:set("table",{255,0,0})--darkmagenta)  -- Tables,light purple
          syntax:set("character",{255,0,0}) --darkblue)  -- Characters,cyan
          syntax:set("type",{255,0,0}) --yellow)  -- Types,light purple
          syntax:set("header",{255,0,0})--blue)  -- Headers,cyan
          syntax:set("heading",{255,0,0})--darkmagenta)  -- Headings,light purple
          syntax:set("link",{255,0,0})--magenta)  -- Links,vibrant pink
          syntax:set("key",{255,0,0})--magenta)  -- Keys,vibrant pink
          syntax:set("quote",{255,0,0})--grey)  -- Quotes,light purple/gray
          syntax:set("bold",{255,0,0})--red)  -- Bold text,cyan
          syntax:set("italic",{255,0,0})--darkyellow)  -- Italic text,cyan
          syntax:set("block",{255,0,0})--blue)  -- Code blocks,cyan
          syntax:set("image",{255,0,0})--blue)  -- Images in markup languages,cyan
          syntax:set("list",{255,0,0})--green)  -- Lists,bright green
          syntax:set("insertion",{255,0,0})--green)  -- Insertions (e.g. diff highlight),bright green
          syntax:set("deletion",{255,0,0})--red)  -- Deletions (e.g. diff highlight),red

          -- Document Configuration --
          document.tab_width = 2
          document.indentation = "tabs"

          -- Configure Line Numbers --
          line_numbers.enabled = true
          line_numbers.padding_left = 1
          line_numbers.padding_right = 1

          -- Configure Mouse Behaviour --
          terminal.mouse_enabled = true
          terminal.scroll_amount = 3

          -- Configure Terminal Behaviour --
          terminal.shell = "fish"

          -- Tab Line Configuration --
          tab_line.enabled = true
          tab_line.format = '  {icon} {file_name}{modified}  '

          -- Status Line Configuration --
          status_line.parts = {
          	'  {file_name}{modified}  │  {icon} {file_type}  │',
          	'│  {cursor_y} / {line_count}  {cursor_x}  ',
          }

          -- Greeting Message Configuration --
          greeting_message.enabled = false

          -- File Tree Configuration --
          file_tree.icons = true

          -- Load Plug-Ins --
          load_plugin("autoindent.lua")
          load_plugin("pairs.lua")
          load_plugin("quickcomment.lua")
        '';
      in ''
        wrapProgram $out/bin/ox \
          --append-flags "--config ${pkgs.writeText "oxrc.cfg" oxConfig}"
      '';
    })
  ];
}
