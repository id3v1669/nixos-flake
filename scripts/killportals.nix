{ ...
}:
{
  home.file.".scripts/portals.sh" = {
    executable = true;
    text = ''
#!/usr/bin/env bash

_ps=(xdg-desktop-portal-hyprland xdg-desktop-portal-gtk xdg-desktop-portal)
for _prs in "''${_ps[@]}"; do
	if [[ `pidof ''${_prs}` ]]; then
		kill $(pidof ''${_prs})
	fi
done

    '';
  };
}