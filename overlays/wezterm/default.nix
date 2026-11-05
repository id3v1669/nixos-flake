final: prev: {
  # wayland: send the buffer scale with the buffer it applies to.
  # Fixes "Protocol error 2 on wl_surface" (invalid_size) killing every window
  # when a new one opens on a scaled output.
  # https://github.com/wezterm/wezterm/pull/8250 (drop once merged and pinned)
  wezterm = prev.wezterm.overrideAttrs (old: {
    patches = (old.patches or []) ++ [./pr-8250-buffer-scale.patch];
  });
}
