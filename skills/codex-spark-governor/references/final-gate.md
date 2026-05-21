# Final gate

Do not say `done` until every check below passes.

1. Scope check
- Confirm the user-requested scope is actually covered.

2. Code check
- Confirm the changed code paths are complete enough for the promised scope.

3. Test check
- Run the relevant real tests or proof commands.
- Treat failing tests, missing tests for critical new behavior, or unverified risky paths as unfinished work.

4. Docs check
- Confirm README, usage notes, examples, and other changed docs match the real behavior.

5. Standards check
- Confirm repo root rules, nearest scoped rules, and task-specific standards are still followed.

6. Task-specific check
- Confirm the task-specific promised checks really passed.
- Examples: coverage maps, migration steps, release notes, examples, proof files, or cleanup scans.
- Do not claim a full result if the promised proof for that claim is still missing.

7. Fresh review check
- Run `spark_checker` on the changed scope.
- Do one fresh direct review in the main chat after reading the latest diff, tests, and docs.
- If the app exposes `/review`, use it as the last extra check.

8. Blocker check
- Confirm there is no known real blocker, known mismatch, or known missing follow-up that should stop completion.

Before the PASS/FAIL table, write a short human summary that says:
- what was built or changed
- what was checked
- any small remaining risk or note

Before saying the build is ready, print a short final status table with PASS or FAIL for:
- scope
- code
- tests
- docs
- task-specific checks
- final review

If a line truly does not apply, mark it PASS and explain why in one short note below the table.

Do not say `done` if any row is FAIL.

Only after all eight checks pass may you say `done`.
