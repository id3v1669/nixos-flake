{inputs, ...}: final: prev: {
  codex = prev.codex.overrideAttrs (finalAttrs: _: {
    version = (builtins.fromTOML (builtins.readFile "${inputs.codex-src}/codex-rs/Cargo.toml")).workspace.package.version;
    src = inputs.codex-src;
    sourceRoot = "source/codex-rs";

    cargoHash = null;
    cargoDeps = final.rustPlatform.importCargoLock {
      lockFile = "${inputs.codex-src}/codex-rs/Cargo.lock";
      allowBuiltinFetchGit = true;
    };
  });
}
