---
name: codex-spark-governor
description: Govern long coding tasks in the Codex app with visible progress, Spark helper agents, and a strict finish line. Use when Codex should stay in one main chat, keep its context clean, drive a multi-step build or repair task from start to real completion, and avoid saying done early. Especially use for safe API CLI work in this repo where code, tests, docs, coverage, and standards all need to be checked before completion.
---

# Codex Spark Governor

Use the main Codex chat as the only governor.

Keep your own context focused on scope, decisions, blockers, and final judgment. Push noisy read-heavy work, narrow edits, and fast gap checks to the helper agents in `.codex/agents/`:
- `csg_reader`
- `csg_builder`
- `csg_checker`

## Start

- Restate the user goal and the true finish line in 2-4 short bullets.
- Read repo root `AGENTS.md` first.
- Read the nearest scoped `AGENTS.md` before changing code.
- When the task is an API tool, read:
  - `references/repo-rules.md`
  - `references/api-tool-finish-line.md`
  - `references/final-gate.md`
- If the repo helper agents are missing, say so clearly and continue in single-agent mode only if the user still wants to proceed.

## Operating mode

- Stay as governor, reviewer, and final judge.
- Keep the stronger main chat for only these jobs:
  - approve the plan
  - approve the endpoint and coverage map
  - review each finished helper slice
  - do the final review
  - decide `done`
- Use Spark helpers by default for most of the work:
  - API mapping
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
- Review each subagent result before moving on.
- Keep important findings and decisions in the main thread so status stays visible in the app.
- Do not let the main chat draft long code or long docs when a helper can do that bounded work.

## Helper agents

### `csg_reader`

Use for:
- API doc mapping
- endpoint inventory
- repo exploration
- test and docs gap finding
- coverage ledger checks
- stale-name scans right after scaffolding
- template drift checks

### `csg_builder`

Use for:
- one bounded code change
- one bounded docs change
- one bounded test change
- one bounded proof or examples change
- one focused fix from review findings
- one focused polish pass after review

### `csg_checker`

Use for:
- fast PASS/FAIL checks before final review
- standards mismatch checks
- docs/code alignment checks
- missing endpoint coverage checks
- first-pass final gap review before the stronger main chat reviews

## Recommended loop

1. Map scope.
   - Ask `csg_reader` to map the surface, source docs, existing code, and missing pieces.
   - After scaffolding, ask `csg_reader` for a stale-name and template-drift scan before real writing starts.
2. Plan the smallest complete path.
   - Break the work into small checked steps.
   - Approve the endpoint list and coverage ledger in the main chat before broad implementation starts.
3. Build in bounded slices.
   - Use `csg_builder` for one slice at a time.
   - Push code, docs, proof, examples, and narrow test work to Spark by default.
4. Verify after each meaningful slice.
   - Run the smallest real test or proof that matches the changed scope.
   - Review the helper result in the main chat and either accept it or send back one narrow fix.
5. Run a gap pass before calling the task complete.
   - Ask `csg_checker` for missing endpoints, missing tests, docs drift, and standards drift.
   - If a helper misses the same narrow step twice, stop retrying that step and do the smallest direct main-chat fix needed to unblock progress.
6. Do the final gate.
   - Follow `references/final-gate.md`.
7. Say `done` only after the final gate passes.

## Done rules

- Never say `done` because the code looks complete.
- Never say `done` before tests, docs, and standards are checked.
- Never claim full API coverage without an explicit coverage map and matching CLI surface.
- For API tools, treat missing docs, missing examples, missing proof files, and missing coverage rows as unfinished work, not optional polish.
- Before saying the build is ready, print a short final status table with PASS or FAIL for:
  - code
  - docs
  - tests
  - api_coverage
  - proof
  - skills wrapper
  - final review
- Do not say `done` if any row is FAIL.

## Notes

- Prefer Spark helpers to save the stronger main chat for planning, tradeoffs, and final judgment.
- Spark should write most first drafts and most first fixes. The stronger main chat should mostly approve, reject, and polish only where Spark still misses.
- If a helper agent fails twice on the same narrow step, stop retrying that exact step and do the smallest direct work needed to unblock progress.
- If the app exposes `/review`, use it as the last extra check. If it is not available, do a fresh direct final review in the main chat after `csg_checker`.
