# API tool finish line

Use this file for safe API CLI work in this repo.

Read these repo docs when they apply:
- `api-tools/standards/API_TOOL_STANDARD.md`
- `CODEX_AUTONOMOUS_LOOP_GUIDE.md`
- the tool-local `AGENTS.md`

Treat these rules as required:
- Build explicit named commands only.
- Do not use a raw request bridge to fake coverage.
- Keep risky writes plan-first and deterministic.
- Keep proof artifacts and redacted outputs.
- Keep docs and code aligned.
- Keep a coverage ledger for the promised API surface.
- Use the blessed local validation command when the tool defines it.

For a new or expanded API tool, do not stop at code.
Finish all of these:
- command surface
- tests
- docs
- coverage ledger
- references
- proof pack
- committed example outputs

If the task promises full or near-full API coverage, do not say `done` until the coverage ledger and CLI surface match that claim.
