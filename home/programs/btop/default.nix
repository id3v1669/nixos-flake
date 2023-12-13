{ config
, ...
}:
{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "dynamic-btop";
      theme_background = true;
      truecolor = true;
      force_tty = false;
      presets = "cpu:1:default,proc:0:default cpu:0:default,mem:0:default,net:0:default cpu:0:block,net:0:tty";
      vim_keys = false;
      rounded_corners = true;
      graph_symbol = "braille";
      graph_symbol_cpu = "default";
      graph_symbol_mem = "default";
      graph_symbol_net = "default";
      graph_symbol_proc = "default";
      shown_boxes = "cpu mem net proc";
      update_ms = 2000;
      proc_sorting = "cpu lazy";
      proc_reversed = false;
      proc_tree = true;
      proc_colors = true;
      proc_gradient = true;
      proc_per_core = false;
      proc_mem_bytes = true;
      proc_cpu_graphs = true;
      proc_info_smaps = false;
      proc_left = false;
      proc_filter_kernel = false;
      cpu_graph_upper = "total";
      cpu_graph_lower = "total";
      cpu_invert_lower = true;
      cpu_single_graph = false;
      cpu_bottom = false;
      show_uptime = true;
      check_temp = true;
      cpu_sensor = "Auto";
      show_coretemp = true;
      cpu_core_map = "";
      temp_scale = "celsius";
      base_10_sizes = false;
      show_cpu_freq = true;
      clock_format = "%X";
      background_update = true;
      custom_cpu_name = "";
      disks_filter = "";
      mem_graphs = true;
      mem_below_net = false;
      zfs_arc_cached = true;
      show_swap = true;
      swap_disk = true;
      show_disks = true;
      only_physical = true;
      use_fstab = true;
      zfs_hide_datasets = false;
      disk_free_priv = false;
      show_io_stat = true;
      io_mode = false;
      io_graph_combined = false;
      io_graph_speeds = "";
      net_download = 100;
      net_upload = 100;
      net_auto = true;
      net_sync = true;
      net_iface = "";
      show_battery = true;
      selected_battery = "Auto";
      log_level = "WARNING";
    };
  };
  home.file.".config/btop/themes/dynamic-btop.theme".text = ''
# Main background, empty for terminal default, need to be empty if you want transparent background
theme[main_bg]="#${config.colorScheme.colors.base00}"

# Main text color
theme[main_fg]="#${config.colorScheme.colors.base05}"

# Title color for boxes
theme[title]="#${config.colorScheme.colors.base05}"

# Highlight color for keyboard shortcuts
theme[hi_fg]="#${config.colorScheme.colors.base0D}"

# Background color of selected item in processes box
theme[selected_bg]="#${config.colorScheme.colors.base03}"

# Foreground color of selected item in processes box
theme[selected_fg]="#${config.colorScheme.colors.base0D}"

# Color of inactive/disabled text
theme[inactive_fg]="#${config.colorScheme.colors.base03}"

# Color of text appearing on top of graphs, i.e uptime and current network graph scaling
theme[graph_text]="#${config.colorScheme.colors.base06}"

# Background color of the percentage meters
theme[meter_bg]="#${config.colorScheme.colors.base03}"

# Misc colors for processes box including mini cpu graphs, details memory graph and details status text
theme[proc_misc]="#${config.colorScheme.colors.base06}"

# CPU, Memory, Network, Proc box outline colors
theme[cpu_box]="#${config.colorScheme.colors.base0E}" #Mauve
theme[mem_box]="#${config.colorScheme.colors.base0B}" #Green
theme[net_box]="#${config.colorScheme.colors.base0F}" #Maroon
theme[proc_box]="#${config.colorScheme.colors.base0D}" #Blue

# Box divider line and small boxes line color
theme[div_line]="#${config.colorScheme.colors.base04}"

# Temperature graph color (Green -> Yellow -> Red)
theme[temp_start]="#${config.colorScheme.colors.base0B}"
theme[temp_mid]="#${config.colorScheme.colors.base0A}"
theme[temp_end]="#${config.colorScheme.colors.base08}"

# CPU graph colors (Teal -> Lavender)
theme[cpu_start]="#${config.colorScheme.colors.base0C}"
theme[cpu_mid]="#${config.colorScheme.colors.base05}"
theme[cpu_end]="#${config.colorScheme.colors.base07}"

# Mem/Disk free meter (Mauve -> Lavender -> Blue)
theme[free_start]="#${config.colorScheme.colors.base0E}"
theme[free_mid]="#${config.colorScheme.colors.base07}"
theme[free_end]="#${config.colorScheme.colors.base0D}"

# Mem/Disk cached meter (Sapphire -> Lavender)
theme[cached_start]="#${config.colorScheme.colors.base05}"
theme[cached_mid]="#${config.colorScheme.colors.base0D}"
theme[cached_end]="#${config.colorScheme.colors.base07}"

# Mem/Disk available meter (Peach -> Red)
theme[available_start]="#${config.colorScheme.colors.base09}"
theme[available_mid]="#${config.colorScheme.colors.base0F}"
theme[available_end]="#${config.colorScheme.colors.base08}"

# Mem/Disk used meter (Green -> Sky)
theme[used_start]="#${config.colorScheme.colors.base0B}"
theme[used_mid]="#${config.colorScheme.colors.base0C}"
theme[used_end]="#99d1db"

# Download graph colors (Peach -> Red)
theme[download_start]="#${config.colorScheme.colors.base09}"
theme[download_mid]="#${config.colorScheme.colors.base0F}"
theme[download_end]="#${config.colorScheme.colors.base08}"

# Upload graph colors (Green -> Sky)
theme[upload_start]="#${config.colorScheme.colors.base0B}"
theme[upload_mid]="#${config.colorScheme.colors.base0C}"
theme[upload_end]="#99d1db"

# Process box color gradient for threads, mem and cpu usage (Sapphire -> Mauve)
theme[process_start]="#${config.colorScheme.colors.base05}"
theme[process_mid]="#${config.colorScheme.colors.base07}"
theme[process_end]="#${config.colorScheme.colors.base0E}"
  '';
}