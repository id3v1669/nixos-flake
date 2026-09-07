{
  writeShellApplication,
  curl,
  gawk,
  coreutils,
}:
writeShellApplication {
  name = "claude-desktop-update";
  runtimeInputs = [curl gawk coreutils];
  text = ''
    base="https://downloads.claude.ai/claude-desktop/apt/stable"
    index="$base/dists/stable/main/binary-amd64/Packages"
    out="''${1:-overlays/claude-desktop/source.json}"

    # Debian control format: blank-line separated stanzas, "Key: value" lines.
    # The index keeps every release, so take the highest version.
    newest=$(curl -fsSL --max-time 60 "$index" | awk '
      BEGIN{RS="";FS="\n"}
      { v="";f="";s=""
        for(i=1;i<=NF;i++){
          if($i ~ /^Version: /){v=substr($i,10)}
          else if($i ~ /^Filename: /){f=substr($i,11)}
          else if($i ~ /^SHA256: /){s=substr($i,9)} }
        if(v!="" && f!="" && s!="") print v"|"f"|"s }' \
      | sort -t'|' -k1,1 -V | tail -1)

    if [ -z "$newest" ]; then
      echo "claude-desktop-update: could not parse any package out of $index" >&2
      exit 1
    fi

    version=''${newest%%|*}
    rest=''${newest#*|}
    filename=''${rest%%|*}
    sha256=''${rest##*|}

    printf '{\n  "version": "%s",\n  "url": "%s/%s",\n  "sha256": "%s"\n}\n' \
      "$version" "$base" "$filename" "$sha256" > "$out"
    echo "claude-desktop-update: pinned $version -> $out"
  '';
}
