{inputs, ...}: final: prev: let
  # The prebuilt V8 that nixpkgs pins for codex must match the `v8` crate in
  # codex-src's Cargo.lock; codex-src moves faster than nixpkgs.
  cargoLock = builtins.fromTOML (builtins.readFile "${inputs.codex-src}/codex-rs/Cargo.lock");
  v8Version = (builtins.head (builtins.filter (p: p.name == "v8") cargoLock.package)).version;
  rustyV8 = {
    version = "152.2.0";
    archive = "0g7d1wpw2yair4i2acvb46mjj86m6ifz9b63na6bszxpzjd3ws5n";
    srcBinding = "1m8rqlp3xpgcvd65xsy56aq7z9qr4nl7r7g62xh8myg0vgn5yk9y";
  };
  rustyV8Url = file: "https://github.com/denoland/rusty_v8/releases/download/v${rustyV8.version}/${file}";
  target = final.stdenv.hostPlatform.rust.rustcTarget;
in {
  codex = assert final.lib.assertMsg (v8Version == rustyV8.version)
  "overlays/codex.nix: codex-src needs v8 ${v8Version}, but rusty_v8 ${rustyV8.version} is pinned; update rustyV8 (version and both hashes)";
    prev.codex.overrideAttrs (finalAttrs: prevAttrs: {
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

      env =
        prevAttrs.env
        // {
          RUSTY_V8_ARCHIVE = final.fetchurl {
            name = "librusty_v8-${rustyV8.version}";
            url = rustyV8Url "librusty_v8_release_${target}.a.gz";
            sha256 = rustyV8.archive;
          };
          RUSTY_V8_SRC_BINDING_PATH = final.fetchurl {
            name = "src_binding-${rustyV8.version}";
            url = rustyV8Url "src_binding_release_${target}.rs";
            sha256 = rustyV8.srcBinding;
          };
        };
    });
}
