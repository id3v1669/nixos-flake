{
  inputs,
  system,
}: final: prev: let
  inherit (prev) lib;
  python = prev.python312;

  workspace = inputs.uv2nix.lib.workspace.loadWorkspace {
    workspaceRoot = inputs.graphify-src;
  };

  pyprojectOverlay = workspace.mkPyprojectOverlay {
    sourcePreference = "wheel";
  };

  grammarBuildFix = pyFinal: pyPrev:
    lib.mapAttrs (
      name: drv:
        if lib.hasPrefix "tree-sitter" name && lib.isDerivation drv
        then
          drv.overrideAttrs (old: {
            nativeBuildInputs =
              (old.nativeBuildInputs or [])
              ++ pyFinal.resolveBuildSystem {
                setuptools = [];
                wheel = [];
              };
          })
        else drv
    )
    pyPrev;

  pythonSet =
    (prev.callPackage inputs.pyproject-nix.build.packages {
      inherit python;
    })
    .overrideScope (lib.composeManyExtensions [
      inputs.pyproject-build-systems.overlays.default
      pyprojectOverlay
      grammarBuildFix
    ]);
in {
  graphify = (pythonSet.mkVirtualEnv "graphify" workspace.deps.default)
    .overrideAttrs (old: {
    meta =
      (old.meta or {})
      // {
        description = "Turn any folder of files into a knowledge graph (CLI)";
        homepage = "https://github.com/safishamsi/graphify";
        mainProgram = "graphify";
        platforms = lib.platforms.unix;
      };
  });
}
