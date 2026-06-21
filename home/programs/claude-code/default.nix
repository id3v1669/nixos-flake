{
  pkgs,
  inputs,
  ...
}: let
  mkClaudeSkill = import ../../../lib/mkClaudeSkill.nix {inherit pkgs;};

  caveman = mkClaudeSkill {
    pname = "caveman";
    src = inputs.caveman-src;
    skillMdPath = "skills/caveman/SKILL.md";
  };

  graphify = mkClaudeSkill {
    pname = "graphify";
    src = inputs.graphify-src;
    skillMdPath = "graphify/skill.md";
    refsDir = "graphify/skills/claude/references";
  };
in {
  home.file.".claude/skills/caveman/SKILL.md".source = "${caveman}/SKILL.md";

  home.file.".claude/skills/graphify/SKILL.md".source = "${graphify}/SKILL.md";
  home.file.".claude/skills/graphify/references".source = "${graphify}/references";
  home.file.".claude/CLAUDE.md".text = ''
    # General rules

    - Missing utility: if a command/tool is not available, do NOT look for an
      alternative tool. Run the requested tool through Nix instead, e.g.
      `nix-shell -p <pkg> --run '<cmd>'` (or `nix run nixpkgs#<pkg>`).
    - No fabrication: never lie, guess, assume, or invent. If something is
      unknown or unverified, say so plainly and stop. Only act on an assumption
      when I explicitly tell you to.
    - Never push to git: do not run `git push` (or any remote push) under any
      circumstances. Committing locally is fine when I ask; pushing is mine.
    - If you have any questions, you must ask them - do not proceed past an
      open question by guessing or assuming.
    - If a question arises mid-task, you must pause and ask it before
      continuing; do not push on and resolve it yourself.

    # graphify

    - **graphify** (`~/.claude/skills/graphify/SKILL.md`) - any input to
      knowledge graph. Trigger: `/graphify`
      When the user types `/graphify`, invoke the Skill tool with
      `skill: "graphify"` before doing anything else.
    - NixOS binary handling (overrides the skill's Step 1 install logic and any
      version check): this machine is NixOS. Use the locally installed
      `graphify` binary already on PATH. If it is missing, STOP and ask me to
      install it via the flake (`nixos-rebuild`); do NOT install graphify with
      `uv`, `uvx`, `pipx`, `pip`, or `--break-system-packages`. Skip the binary
      version check entirely - do not compare the running version against the
      version pinned in the skill, and never treat a version mismatch as a
      reason to (re)install. On a non-NixOS host, the skill's normal
      installation path is permitted.
  '';
}
