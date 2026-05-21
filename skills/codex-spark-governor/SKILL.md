---
name: codex-spark-governor
description: Govern long tasks in Codex with visible progress, Spark helper agents, and a strict finish line. Use when one main chat should stay in charge, helper agents should do most of the narrow work, and the task should not be marked done early.
---

# Codex Spark Governor

Use the main Codex chat as the only governor.

Keep your own context focused on scope, decisions, blockers, and final judgment. Push noisy read-heavy work, narrow edits, and fast gap checks to the helper agents in `.codex/agents/`:
- `spark_reader`
- `spark_builder`
- `spark_checker`

## Start

- Restate the user goal and the true finish line in 2-4 short bullets.
- Confirm the active setup in one short line: `$codex-spark-governor` with `spark_reader`, `spark_builder`, and `spark_checker`.
- If you see old names like `$long-task-governor`, `ltg_reader`, `ltg_builder`, or `ltg_checker`, stop and tell the user to restart with the current names.
- Read repo root instructions first when the repo has them.
- Read the nearest local instructions before changing code.
- Read:
  - `references/repo-rules.md`
  - `references/task-finish-line.md`
  - `references/final-gate.md`
- If the repo has task-specific standards, proof steps, release checks, or review rules, read those before broad implementation starts.
- If the repo helper agents are missing, say so clearly and continue in single-agent mode only if the user still wants to proceed.

## Operating mode

- Stay as governor, reviewer, and final judge.
- Keep the stronger main chat for only these jobs:
  - approve the plan
  - approve the main checklist
  - review each finished helper slice
  - do the final review
  - decide `done`
- Use Spark helpers by default for most of the work:
  - task mapping
  - repo exploration
  - code slices
  - docs drafts
  - proof files
  - example outputs
  - test runs
  - first-pass fixes
  - first-pass gap checks
- Keep visible progress in the main chat with short milestone updates.
- Do not ask whether to continue after an obvious next step.
- Ask only when a real blocker, real risk, or real business choice appears.
- Prefer at most one write-capable subagent at a time.
- Prefer narrow prompts and narrow file scopes.
- If a code or docs batch will touch more than 2 files, send it to `spark_builder` first as one bounded slice.
- Review each subagent result before moving on.
- Keep important findings and decisions in the main thread so status stays visible in the app.
- Do not let the main chat draft first-pass multi-file code or docs work when `spark_builder` can do it.
- Let the main chat write directly only for final polish, review fixes, or after Spark misses the same narrow step twice.

## Helper agents

### `spark_reader`

Use for:
- repo and docs mapping
- task inventory
- repo exploration
- test and docs gap finding
- stale-name scans right after scaffolding
- template drift checks

### `spark_builder`

Use for:
- one bounded code change
- one bounded docs change
- one bounded test change
- one bounded proof or examples change
- one focused fix from review findings
- one focused polish pass after review

### `spark_checker`

Use for:
- fast PASS/FAIL checks before final review
- standards mismatch checks
- docs/code alignment checks
- scope gap checks
- first-pass final gap review before the stronger main chat reviews

## Recommended loop

1. Map scope.
   - Ask `spark_reader` to map the surface, source docs, existing code, and missing pieces.
   - After scaffolding, ask `spark_reader` for a stale-name and template-drift scan before real writing starts.
2. Plan the smallest complete path.
   - Break the work into small checked steps.
   - Approve the main checklist in the main chat before broad implementation starts.
3. Build in bounded slices.
   - Use `spark_builder` for one slice at a time.
   - Push code, docs, proof, examples, and narrow test work to Spark by default.
4. Verify after each meaningful slice.
   - Run the smallest real test or proof that matches the changed scope.
   - Review the helper result in the main chat and either accept it or send back one narrow fix.
5. Run a gap pass before calling the task complete.
   - Ask `spark_checker` for missing tests, docs drift, standards drift, and scope gaps.
   - If a helper misses the same narrow step twice, stop retrying that step and do the smallest direct main-chat fix needed to unblock progress.
6. Do the final gate.
   - Follow `references/final-gate.md`.
7. Say `done` only after the final gate passes.

## Done rules

- Never say `done` because the first draft works.
- Never say `done` before tests or proof, docs or usage notes when needed, and repo rules are checked.
- If the task promises full coverage, full cleanup, or full migration, do not claim that without an explicit checklist or map that matches the work.
- Treat stale copied files, known mismatches, and known missing follow-up as unfinished work.
- Before the PASS/FAIL table, write a short human summary that says:
  - what was built or changed
  - what was checked
  - any small remaining risk or note
- Before saying the build is ready, print a short final status table with PASS or FAIL for:
  - scope
  - code
  - tests
  - docs
  - task-specific checks
  - final review
- If a line truly does not apply, mark it PASS and explain why in one short note below the table.
- Do not say `done` if any row is FAIL.

## Notes

- Prefer Spark helpers to save the stronger main chat for planning, tradeoffs, and final judgment.
- Spark should write most first drafts and most first fixes. The stronger main chat should mostly approve, reject, and polish only where Spark still misses.
- For bigger code or docs batches, Spark should usually write first and the stronger main chat should review after.
- If a helper agent fails twice on the same narrow step, stop retrying that exact step and do the smallest direct work needed to unblock progress.
- If the app exposes `/review`, use it as the last extra check. If it is not available, do a fresh direct final review in the main chat after `spark_checker`.
