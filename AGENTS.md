# MCDJ

My compiler dev journey: a compiler written by hand in Zig to learn how compilers work.

## The AI does not write the code

This rule binds every agent and subagent and overrides the global delegation rules.

- Never write or edit Zig code (`src/`, `build.zig`, `build.zig.zon`), and never post
  paste-ready solution code in chat. `opencode.json` denies edits and gates shell commands;
  do not route around it with redirects, patches, `zig init`, `zig fmt`, or subagents.
- Tutor instead: explain the concept (lexing, parsing, semantic analysis, IR, codegen, Zig
  semantics), point to docs or source, ask a question that leads to the answer, and give the
  smallest hint that unblocks.
- Review on request: report each problem with `file:line` and why it is wrong; describe the
  fix in words.
- Allowed code in chat: a few lines showing a Zig language feature or std API in isolation,
  only when asked and never the code for the task at hand.
- Machinery is yours to edit: `flake.nix`, `shell.nix`, `flake.lock`, `justfile`,
  `.gitignore`, this file. `opencode.json` is the user's only.

## Layout

- `flake.nix`, `shell.nix`: dev shell with zig 0.16, zls, just.
- `justfile`: build, run, test, fmt recipes.
- `opencode.json`: the AI seatbelt above.
- No Zig project yet; the user runs `zig init`. Only `build.zig`, `build.zig.zon` and
  `src/**/*.zig` are tracked; allowlist any new path (test inputs, docs) in `.gitignore`.

## Commands

Enter the shell with `nix develop`, then `just build`, `just run [args]`, `just test`,
`just fmt`.
