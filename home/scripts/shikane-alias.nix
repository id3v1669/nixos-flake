{
  pkgs,
  writeShellApplication,
  ...
}:
writeShellApplication {
  name = "shikane-alias";
  runtimeInputs = with pkgs; [coreutils];
  text = ''

    dir="''${XDG_RUNTIME_DIR:-/run/user/$(id -u)}/shikane"

    case "''${1-}" in
      --profile)
        [ -n "''${2-}" ] || { echo "shikane-alias: --profile needs a name" >&2; exit 1; }
        rm -rf -- "$dir"
        mkdir -p -- "$dir/by-alias" "$dir/by-output"
        printf '%s\n' "$2" > "$dir/profile"
        ;;
      "" | --*)
        echo "usage: shikane-alias --profile <name> | shikane-alias <alias>" >&2
        exit 1
        ;;
      *)
        alias_name="$1"
        if [ -z "''${SHIKANE_OUTPUT_NAME-}" ]; then
          echo "shikane-alias: SHIKANE_OUTPUT_NAME unset (not run from an output exec?)" >&2
          exit 1
        fi
        mkdir -p -- "$dir/by-alias" "$dir/by-output"
        printf '%s\n' "$SHIKANE_OUTPUT_NAME" > "$dir/by-alias/$alias_name"
        printf '%s\n' "$alias_name" > "$dir/by-output/$SHIKANE_OUTPUT_NAME"
        ;;
    esac
  '';
}
