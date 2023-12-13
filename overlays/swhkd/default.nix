{ fetchFromGitHub
, rustPlatform
, makeWrapper
, pkg-config
, udev
}:

rustPlatform.buildRustPackage rec {
  pname = "swhkd";
  version = "1.3.0";
  src = fetchFromGitHub {
    owner = "waycrate";
    repo = pname;
    rev = "30f25b5bf99df5f16d91b51a7bd397c1de075085";
    hash = "sha256-K05v2xw7G/ZJsf62g696TOSZHMAOWf24sT9JcvvBNx0=";
  };
  cargoLock = { lockFile = "${src}/Cargo.lock"; };
  patches = [
    ./rmrfkill.patch
  ];
  nativeBuildInputs = [ pkg-config makeWrapper ];
  buildInputs = [ udev ];
  postInstall = ''
    mkdir -p $out/share/polkit-1/actions
    cat > $out/share/polkit-1/actions/com.github.swhkd.pkexec.policy <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE policyconfig PUBLIC "-//freedesktop//DTD PolicyKit Policy Configuration 1.0//EN" "http://www.freedesktop.org/standards/PolicyKit/1/policyconfig.dtd">
<policyconfig>
  <action id="com.github.swhkd.pkexec">
    <message>Authentication is required to run Simple Wayland Hotkey Daemon</message>
    <defaults>
      <allow_any>no</allow_any>
      <allow_inactive>no</allow_inactive>
      <allow_active>yes</allow_active>
    </defaults>
    <annotate key="org.freedesktop.policykit.exec.path">$out/bin/swhkd</annotate>
  </action>
</policyconfig>
EOF
  '';
}