final: _prev: {
  claude-desktop = final.callPackage ./package.nix {};
  claude-desktop-update = final.callPackage ./update.nix {};
}
