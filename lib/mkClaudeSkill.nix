{pkgs}: {
  pname,
  src,
  version ? "unstable",
  skillMdPath ? "SKILL.md",
  skillsDir ? null,
  refsDir ? null,
}:
pkgs.runCommand "${pname}-claude-skill" {
  inherit pname version;
  passthru.claudeSkill = {inherit pname version;};
} ''
  mkdir -p $out
  ${
    if skillsDir != null
    then "cp -r ${src}/${skillsDir}/. $out/"
    else "cp ${src}/${skillMdPath} $out/SKILL.md"
  }
  ${pkgs.lib.optionalString (refsDir != null) ''
    mkdir -p $out/references
    cp -r ${src}/${refsDir}/. $out/references/
  ''}
''
