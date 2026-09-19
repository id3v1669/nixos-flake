{inputs, ...}: final: prev: {
  codex = prev.codex.overrideAttrs (finalAttrs: prevAttrs: {
    version = (builtins.fromTOML (builtins.readFile "${inputs.codex-src}/codex-rs/Cargo.toml")).workspace.package.version;
    src = inputs.codex-src;
    sourceRoot = "source/codex-rs";

    postPatch =
      prevAttrs.postPatch
      + ''
        sed -i '1i #![recursion_limit = "1024"]' chatgpt/src/lib.rs
      '';

    cargoHash = null;
    cargoDeps = final.rustPlatform.importCargoLock {
      lockFile = "${inputs.codex-src}/codex-rs/Cargo.lock";
      allowBuiltinFetchGit = true;
    };
  });
}
