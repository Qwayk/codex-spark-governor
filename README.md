# Codex Spark Governor

Use more of your Spark limit without giving up strong-model review.

`codex-spark-governor` is a Codex skill plus Spark helper agents for long tasks. It keeps one main Codex chat in charge while `GPT-5.3-Codex-Spark` helpers do most of the narrow work. The main chat plans the work, reviews the helper output, and decides when the task is really done.

## Why it exists

- long tasks can burn through your stronger-model limit too fast
- one chat often says `done` too early on multi-step work
- helper agents are useful, but without one clear reviewer the work gets messy and harder to trust
- many users want visible progress in the main chat instead of losing the story across scattered runs

If your Codex setup gives `GPT-5.3-Codex-Spark` its own limit, this package helps you use more of that limit for the bulk work while saving the stronger model for the expensive judgment calls.

## What it does

- keeps one main chat as the governor, reviewer, and final judge
- uses Spark helpers for mapping, drafts, tests, first-pass fixes, and gap checks
- keeps progress visible in the main chat
- blocks early `done` calls with a strict final check

## Best for

- long coding tasks and other long repo tasks
- tasks with many files or many review loops
- users who want to spend more of their Spark limit without giving up strong review
- repos that already have tests, local rules, or a clear way to prove the result

## Not ideal for

- tiny one-file fixes
- tasks with nothing to test or review
- repos where helper agents are not allowed

## Fast install

```bash
git clone https://github.com/Qwayk/codex-spark-governor.git
cd codex-spark-governor
bash scripts/install.sh
```

Then restart Codex.

## Quick start

Use this in a new Codex chat:

```text
Use $codex-spark-governor to finish this task from start to real completion.
Keep the main chat as governor and final reviewer.
Use Spark helpers for mapping, drafts, tests, and first-pass fixes.
Do not say done early.
```

## How it works

- `spark_reader` maps the repo, docs, task surface, and gaps
- `spark_builder` handles one small code, docs, test, proof, or fix step at a time
- `spark_checker` does a fast gap pass before the main chat does the last review
- the main chat stays responsible for the plan, approvals, final review, and `done`

## Manual install

Copy these folders into your Codex home:

- `skills/codex-spark-governor/` -> `~/.codex/skills/codex-spark-governor/`
- `agents/*.toml` -> `~/.codex/agents/`

If you do not already have an agents section in your Codex config, merge this snippet into `~/.codex/config.toml`:

```toml
[agents]
max_threads = 4
max_depth = 1
```

The same snippet is included in `config/codex-config.toml`.

## Notes

- this package does not force your main model
- the helper agents are configured to use `gpt-5.3-codex-spark`
- if a helper misses the same narrow step twice, the main chat should step in
- if a repo has its own local instructions, standards, or proof steps, the main chat should follow those first

## License

MIT
