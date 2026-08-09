{pkgs}: let
  src = pkgs.fetchzip {
    url = "https://codeberg.org/Noi/firmware-xiaomi-perseus/archive/0fed8729c3cc3c7fb9a2a15507b424e8b7e08037.tar.gz";
    sha256 = "114rf2ws43c3z14f0sri128n7ycc0np6b5rdxw1qqjjh2x37xc1l";
  };
in
  pkgs.runCommand "firmware-xiaomi-perseus"
  {
    dontFixup = true;
  } ''
    mkdir -p $out/lib/firmware
    if [ -d ${src}/lib/firmware ]; then
      cp -r ${src}/lib/firmware/* $out/lib/firmware/
    else
      cp -r ${src}/* $out/lib/firmware/
    fi
    chmod -R u+w $out/lib/firmware
    # Cross-link the two known layouts
    q=$out/lib/firmware/qcom/sdm845
    if [ -d $q/perseus ] && [ ! -e $q/Xiaomi/perseus ]; then
      mkdir -p $q/Xiaomi && ln -s ../perseus $q/Xiaomi/perseus
    fi
    if [ -d $q/Xiaomi/perseus ] && [ ! -e $q/perseus ]; then
      ln -s Xiaomi/perseus $q/perseus
    fi

    if [ -e $out/lib/firmware/postmarketos/qca/crbtfw21.tlv ]; then
      mkdir -p $out/lib/firmware/qca
      cp -f $out/lib/firmware/postmarketos/qca/crbtfw21.tlv \
            $out/lib/firmware/qca/crbtfw21.tlv
    fi

    if [ -e $out/lib/firmware/qca/perseus/crnv21.bin ] \
       && [ ! -e $out/lib/firmware/qca/sdm845/Xiaomi/perseus ]; then
      mkdir -p $out/lib/firmware/qca/sdm845/Xiaomi
      ln -s ../../perseus $out/lib/firmware/qca/sdm845/Xiaomi/perseus
    fi
    ls $out/lib/firmware/qcom/sdm845/ > $out/layout.txt 2>&1 || true
  ''
