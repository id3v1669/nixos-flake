{
  lib,
  stdenvNoCC,
  equibop,
  bun,
  writableTmpDirAsHomeHook,
}:
stdenvNoCC.mkDerivation {
  inherit (equibop) version src;
  pname = equibop.pname + "-modules";

  impureEnvVars =
    lib.fetchers.proxyImpureEnvVars
    ++ [
      "GIT_PROXY_COMMAND"
      "SOCKS_SERVER"
    ];

  nativeBuildInputs = [
    bun
    writableTmpDirAsHomeHook
  ];

  dontConfigure = true;
  dontFixup = true;

  buildPhase = ''
    runHook preBuild
    export BUN_INSTALL_CACHE_DIR=$(mktemp -d)
    bun install \
        --filter=equibop \
        --force \
        --frozen-lockfile \
        --ignore-scripts \
        --linker=hoisted \
        --no-progress
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    cp -R ./node_modules $out
    runHook postInstall
  '';

  outputHash = "sha256-xo8potmx1DPKk9btNnYB/j9up3yKgAX+XC0iCn82jL8=";
  outputHashAlgo = "sha256";
  outputHashMode = "recursive";
}
