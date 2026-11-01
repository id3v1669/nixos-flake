final: prev: {
  hyprland = prev.hyprland.overrideAttrs (old: {
    postPatch =
      (old.postPatch or "")
      + ''
        sed -i 's|m_geometry = m_positionerRules.getPosition(constraint, accumulateParentOffset() + t1coord);|m_geometry = m_positionerRules.getPosition(constraint, accumulateParentOffset() + t1coord).round();|' src/protocols/XDGShell.cpp
      '';
  });
}
