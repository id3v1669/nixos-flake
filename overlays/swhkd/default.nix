{ lib
, fetchFromGitHub
, rustPlatform
, makeWrapper
, pkg-config
, udev
, tokio-console
, polkit
, gnumake
, bash
, psmisc
, runtimeShell
}:

rustPlatform.buildRustPackage rec {
  pname = "swhkd";
  version = "1.3.0";
  src = fetchFromGitHub {
    owner = "waycrate";
    repo = pname;
    rev = "30f25b5bf99df5f16d91b51a7bd397c1de075085";
    hash = "sha256-K05v2xw7G/ZJsf62g696TOSZHMAOWf24sT9JcvvBNx0=";
    #latest commits that build but don't work:
    # 30f25b5bf99df5f16d91b51a7bd397c1de075085 sha256-K05v2xw7G/ZJsf62g696TOSZHMAOWf24sT9JcvvBNx0= broken(ERROR swhkd] Err: ENOSYS)
    # ddada68da7feeef26acad47ec4194c6315b4fccb sha256-JV/fUnS+7EsyrthEs3ABUBN291VUPjnKG1GsmrG53vI= broken(ERROR swhkd] Err: ENOSYS)
    # 82f9617f9ddb82363a3e2f4ca7d5d9a8f60abfa1 sha256-m0pgv6UHmSzpff3W+bhz+R7M2plwDQdNHOBEzZFiNtI= broken(ERROR swhkd] Err: ENOSYS)
    # 3b19fc33b32efde88311579152a1078a8004397c sha256-245Y3UicW33hrQ6Mtf07I9vsWSpuijIEoEhxIKtjVQE= broken(ERROR swhkd] Err: ENOSYS)
  };
  cargoLock = { lockFile = "${src}/Cargo.lock"; };
  #cargoHash = "sha256-H14YwK4Ow86UxVXoclCjk2xYtu8L/44zkzf9gpveAh8=";
  patches = [
    ./rmrfkill.patch
  ];
  nativeBuildInputs = [ pkg-config makeWrapper tokio-console udev ];
  buildInputs = [ gnumake polkit tokio-console udev ];
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
  postFixup = ''
    wrapProgram $out/bin/swhkd --prefix PATH : ${
      lib.makeBinPath [ polkit ]
    }
    wrapProgram $out/bin/swhks --prefix PATH : ${
      lib.makeBinPath [ polkit ]
    }
  '';
  # doCheck = false;
}