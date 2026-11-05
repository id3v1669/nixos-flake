{inputs, ...}: final: prev: {
  codex = prev.codex.overrideAttrs (prevAttrs: {
    version = (builtins.fromTOML (builtins.readFile "${inputs.codex-src}/codex-rs/Cargo.toml")).workspace.package.version;
    src = inputs.codex-src;
    sourceRoot = "source/codex-rs";

    cargoHash = null;
    cargoDeps = final.rustPlatform.importCargoLock {
      lockFile = "${inputs.codex-src}/codex-rs/Cargo.lock";
      allowBuiltinFetchGit = true;
    };

    # mxc-sdk's build script checks its generated Windows bindings against the
    # `windows` version in the nearest Cargo.lock: its crate root, else one
    # directory up. Vendored, one directory up is codex's lock (first `windows`
    # entry 0.58, mxc's own lock has 0.62), so the check fails although the
    # bindings are fine. A lock without `windows` at the crate root skips it.
    preBuild =
      (prevAttrs.preBuild or "")
      + ''
        for d in "''${cargoDepsCopy:-/build/cargo-vendor-dir}"/mxc-sdk-*; do
          chmod u+w "$d"
          echo "# placeholder: skips mxc-sdk's windows binding check" > "$d/Cargo.lock"
        done
      '';
  });
}
