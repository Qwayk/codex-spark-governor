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
- Confirm README, command docs, onboarding docs, proof docs, and examples match the real behavior.

5. Standards check
- Confirm repo root rules, nearest scoped rules, and task-specific standards are still followed.

6. Coverage check
- For API tools, confirm the CLI surface, docs, and `docs/api_coverage.md` agree.
- Do not claim full coverage if any required row is still missing or still marked planned.

7. Fresh review check
- Run `ltg_checker` on the changed scope.
- Do one fresh direct review in the main chat after reading the latest diff, tests, and docs.
- If the app exposes `/review`, use it as the last extra check.

8. Blocker check
- Confirm there is no known real blocker, known mismatch, or known missing follow-up that should stop completion.

Before saying the build is ready, print a short final status table with PASS or FAIL for:
- code
- docs
- tests
- api_coverage
- proof
- skills wrapper
- final review

Do not say `done` if any row is FAIL.

Only after all eight checks pass may you say `done`.
