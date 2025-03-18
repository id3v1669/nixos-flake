{
  config,
  pkgs,
  ...
}: {
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
  home.file.".config/btop/themes/dynamic-btop.theme".text = with config.palette; ''
    # Main background, empty for terminal default, need to be empty if you want transparent background
    theme[main_bg]="${base06.hexT}"

    # Main text color
    theme[main_fg]="${base00.hexT}"

    # Title color for boxes
    theme[title]="${base00.hexT}"

    # Highlight color for keyboard shortcuts
    theme[hi_fg]="${base17.hexT}"

    # Background color of selected item in processes box
    theme[selected_bg]="${base05.hexT}"

    # Foreground color of selected item in processes box
    theme[selected_fg]="${base17.hexT}"

    # Color of inactive/disabled text
    theme[inactive_fg]="${base03.hexT}"

    # Color of text appearing on top of graphs, i.e uptime and current network graph scaling
    theme[graph_text]="${base02.hexT}"

    # Background color of the percentage meters
    theme[meter_bg]="${base05.hexT}"

    # Misc colors for processes box including mini cpu graphs, details memory graph and details status text
    theme[proc_misc]="${base02.hexT}"

    # CPU, Memory, Network, Proc box outline colors
    theme[cpu_box]="${base1A.hexT}"
    theme[mem_box]="${base11.hexT}"
    theme[net_box]="${base0B.hexT}"
    theme[proc_box]="${base17.hexT}"

    # Box divider line and small boxes line color
    theme[div_line]="${base0B.hexT}"

    # Temperature graph color (Green -> Yellow -> Red)
    theme[temp_start]="${base11.hexT}"
    theme[temp_mid]="${base0E.hexT}"
    theme[temp_end]="${base08.hexT}"

    # CPU graph colors (Teal -> Lavender)
    theme[cpu_start]="${base14.hexT}"
    theme[cpu_mid]="${base00.hexT}"
    theme[cpu_end]="${base01.hexT}"

    # Mem/Disk free meter (Mauve -> Lavender -> Blue)
    theme[free_start]="${base1A.hexT}"
    theme[free_mid]="${base01.hexT}"
    theme[free_end]="${base17.hexT}"

    # Mem/Disk cached meter (Sapphire -> Lavender)
    theme[cached_start]="${base00.hexT}"
    theme[cached_mid]="${base17.hexT}"
    theme[cached_end]="${base01.hexT}"

    # Mem/Disk available meter (Peach -> Red)
    theme[available_start]="${base0B.hexT}"
    theme[available_mid]="${base0B.hexT}"
    theme[available_end]="${base08.hexT}"

    # Mem/Disk used meter (Green -> Sky)
    theme[used_start]="${base11.hexT}"
    theme[used_mid]="${base14.hexT}"
    theme[used_end]="${base08.hexT}"

    # Download graph colors (Peach -> Red)
    theme[download_start]="${base0B.hexT}"
    theme[download_mid]="${base0B.hexT}"
    theme[download_end]="${base08.hexT}"

    # Upload graph colors (Green -> Sky)
    theme[upload_start]="${base11.hexT}"
    theme[upload_mid]="${base14.hexT}"
    theme[upload_end]="${base08.hexT}"

    # Process box color gradient for threads, mem and cpu usage (Sapphire -> Mauve)
    theme[process_start]="${base00.hexT}"
    theme[process_mid]="${base01.hexT}"
    theme[process_end]="${base1A.hexT}"
  '';
}
