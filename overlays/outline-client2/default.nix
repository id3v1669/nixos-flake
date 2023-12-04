# trying to install appimage without appimageTools.wrapType2
{ lib
, stdenv
, appimageTools
, fetchurl
, makeWrapper
, undmg
, polkit
, polkit_gnome
, bash
, electron
, libsecret
, nodePackages
, pkgs
, glibc
, appimage-run
}:
let 
  pname = "Outline-Client";
  version = "1.10.1";

  src = fetchurl {
    url = "https://github.com//Jigsaw-Code/outline-client/releases/download/v${version}/Outline-Client.AppImage";
    sha256 = "1aqgcsq2j7mhhal8y3swr9ikri80j94820r8pziwcbpnc0v3d4pm";
  };

  appimageContents = pkgs.appimageTools.extractType2 { inherit pname version src; };

in 
stdenv.mkDerivation rec {
  
  inherit pname version src;

  dontUnpack = true;

  nativeBuildInputs = with pkgs; [
    appimage-run
    makeWrapper
    glibc
    (callPackage ./../tun2socks.nix {})
  ];
  runtimeDeps = with pkgs; [
    appimage-run
    electron
    glibc
    (callPackage ./../tun2socks.nix {})
  ];

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/share/outline-client/app.asar.unpacked
   
    ${nodePackages.asar}/bin/asar extract ./app.asar $out/share/outline-client/app.asar.unpacked
    
    cp $out/share/outline-client/app.asar.unpacked/tools/outline_proxy_controller/dist/OutlineProxyController $out/bin/OutlineProxyController
    chmod +x $out/bin/OutlineProxyController

    ${nodePackages.asar}/bin/asar pack $out/share/outline-client/app.asar.unpacked $out/share/outline-client/app.asar
    cp $out/share/outline-client/app.asar $out/bin/${pname}
    makeWrapper "${electron}/bin/electron" "$out/bin/${pname}" \
      --add-flags "$out/share/outline-client/app.asar" \
      --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform=wayland --enable-features=WaylandWindowDecorations}}" \
      --add-flags "--disable-gpu" \
      --prefix PATH : ${lib.makeBinPath runtimeDeps} \
      --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath runtimeDeps}
  '';
  
  meta = with lib; {
    description = "Outline Client vpn(proxy)";
    homepage = "https://github.com//Jigsaw-Code/outline-client";
    broken = true; 
    maintainers = with maintainers; [ id3v1669 ];
    platforms = [ "x86_64-linux" ];
  };
}
# outline_proxy_controller = {
#   description = "Outline Proxy Routing Controller";
#   wantedBy = [ "multi-user.target" ];
#   wants = [ "network.target" ];
#   after = [ "network.target" ];
#   serviceConfig = {
#     Type = "simple";
#     ExecStart = "${pkgs.outline-client}/bin/OutlineProxyController --socket-filename=/var/run/outline_controller --owning-user-id=1000";
#   };
# };

# installPhase = ''
#     mkdir -p $out/bin
#     mkdir -p $out/share/outline-client/app.asar.unpacked
   
#     ${nodePackages.asar}/bin/asar extract ${appimageContents}/resources/app.asar $out/share/outline-client/app.asar.unpacked
    
#     sed -i "s|/usr/bin/pkexec|/usr/bin/pkexec', '/run/wrappers/bin/pkexec|" $out/share/outline-client/app.asar.unpacked/node_modules/sudo-prompt/index.js
#     sed -i 's|/usr/bin/pkexec|/usr/bin/pkexec","/run/wrappers/bin/pkexec|' $out/share/outline-client/app.asar.unpacked/build/electron/electron/index.js
#     sed -i "s|/bin/bash|/usr/bin/env bash|" $out/share/outline-client/app.asar.unpacked/node_modules/sudo-prompt/index.js
#     sed -i "s|/bin/bash|/usr/bin/env bash|" $out/share/outline-client/app.asar.unpacked/build/electron/electron/index.js
#     sed -i "s|/usr/bin/chattr|/run/current-system/sw/bin/chattr|" $out/share/outline-client/app.asar.unpacked/build/electron/electron/index.js
#     sed -i "s|/usr/bin/echo|/run/current-system/sw/bin/echo|" $out/share/outline-client/app.asar.unpacked/build/electron/electron/index.js
#     sed -i "s|/usr/bin/shasum|/run/current-system/sw/bin/shasum|" $out/share/outline-client/app.asar.unpacked/build/electron/electron/index.js
#     sed -i 's|"use strict";Object.defineProperty(t,"__esModule",{value:!0}),t.AppImageUpdater=void 0;const r=n(9152),o=n(2081),i=n(344),s=n(7147),a=n(1017),c=n(4502),u=n(3458),l=n(7430),d=n(2310);class p extends c.BaseUpdater{constructor(e,t){super(e,t)}isUpdaterActive(){return null==process.env.APPIMAGE?(null==process.env.SNAP?this._logger.warn("APPIMAGE env is not defined, current application is not an AppImage"):this._logger.info("SNAP env is defined, updater is disabled"),!1):super.isUpdaterActive()}doDownloadUpdate(e){const t=e.updateInfoAndProvider.provider,n=d.findFile(t.resolveFiles(e.updateInfoAndProvider.info),"AppImage");return this.executeDownload({fileExtension:"AppImage",fileInfo:n,downloadUpdateOptions:e,task:async(o,s)=>{const a=process.env.APPIMAGE;if(null==a)throw r.newError("APPIMAGE env is not defined","ERR_UPDATER_OLD_FILE_NOT_FOUND");let c=!1;try{const r={newUrl:n.url,oldFile:a,logger:this._logger,newFile:o,isUseMultipleRangeRequest:t.isUseMultipleRangeRequest,requestHeaders:e.requestHeaders,cancellationToken:e.cancellationToken};this.listenerCount(l.DOWNLOAD_PROGRESS)>0&&(r.onProgress=e=>this.emit(l.DOWNLOAD_PROGRESS,e)),await new u.FileWithEmbeddedBlockMapDifferentialDownloader(n.info,this.httpExecutor,r).download()}catch(e){this._logger.error(`Cannot download differentially, fallback to full download: ''${e.stack||e}`),c="linux"===process.platform}c&&await this.httpExecutor.download(n.url,o,s),await i.chmod(o,493)}})}doInstall(e){const t=process.env.APPIMAGE;if(null==t)throw r.newError("APPIMAGE env is not defined","ERR_UPDATER_OLD_FILE_NOT_FOUND");let n;s.unlinkSync(t);const i=a.basename(t);n=a.basename(e.installerPath)!==i&&/\d+\.\d+\.\d+/.test(i)?a.join(a.dirname(t),a.basename(e.installerPath)):t,o.execFileSync("mv",["-f",e.installerPath,n]),n!==t&&this.emit("appimage-filename-updated",n);const c={...process.env,APPIMAGE_SILENT_INSTALL:"true"};return e.isForceRunAfter?o.spawn(n,[],{detached:!0,stdio:"ignore",env:c}).unref():(c.APPIMAGE_EXIT_AFTER_INSTALL="true",o.execFileSync(n,[],{env:c})),!0}}t.AppImageUpdater=p|t.AppImageUpdater = {};|' $out/share/outline-client/app.asar.unpacked/build/electron/electron/index.js
#     echo -e '#!/usr/bin/env bash\n/run/current-system/sw/bin/systemctl --user restart outline_proxy_controller\n/run/current-system/sw/bin/sleep 3' > $out/share/outline-client/app.asar.unpacked/tools/outline_proxy_controller/dist/install_linux_service.sh
#     cp $out/share/outline-client/app.asar.unpacked/tools/outline_proxy_controller/dist/OutlineProxyController $out/bin/OutlineProxyController
#     chmod +x $out/bin/OutlineProxyController
#     ${nodePackages.asar}/bin/asar pack $out/share/outline-client/app.asar.unpacked $out/share/outline-client/app.asar
#     cp $out/share/outline-client/app.asar $out/bin/${pname}
#     makeWrapper "${electron}/bin/electron" "$out/bin/${pname}" \
#       --add-flags "$out/share/outline-client/app.asar" \
#       --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform=wayland --enable-features=WaylandWindowDecorations}}" \
#       --add-flags "--disable-gpu" \
#       --prefix PATH : ${lib.makeBinPath runtimeDeps} \
#       --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath runtimeDeps}
#   '';