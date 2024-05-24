{ pkgs
, ...
}:
(pkgs.vesktop.override {
  electron = pkgs.electron_30;
  vencord = pkgs.vencord.overrideAttrs (old: {
    src = old.src.override {
      rev = "v1.8.5";
      hash = "sha256-uxtHin2m0Qz9P1Xk1JsvvQN6504diK4YgNATi26Ytdc=";
    };
  });
}).overrideAttrs (oldAttrs: rec {
  version = "1.5.2";
  src = oldAttrs.src.override {
    rev = "a8d72fa665df1077d299dfaf87faceedda2a0e84";
    hash = "sha256-sLxAPllWW1N/s144/J25iMraJZfzru5oxOkE7Q79NvM=";
  };
  
  pnpmDeps = oldAttrs.pnpmDeps.overrideAttrs (oldAttrs2: {
    outputHash = "sha256-PogE8uf3W5cKSCqFHMz7FOvT7ONUP4FiFWGBgtk3UC8=";
  });
})
