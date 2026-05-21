# Codex Spark Governor

`codex-spark-governor` is a Codex skill plus Spark helper agents for long coding tasks.

It is built for one simple pattern:
- one strong main Codex chat stays in charge
- `GPT-5.3-Codex-Spark` helper agents do most of the narrow work
- the main chat reviews, approves, and decides when the task is really done

This package includes:
- the `codex-spark-governor` skill
- `spark_reader` Spark helper
- `spark_builder` Spark helper
- `spark_checker` Spark helper
- a small Codex config snippet

## Fast install

```bash
git clone https://github.com/Qwayk/codex-spark-governor.git
cd codex-spark-governor
bash scripts/install.sh
```

Then restart Codex.

## What it is good for

- long coding tasks
- tasks where you want visible status in the main Codex chat
- tasks where you want Spark to do most of the heavy narrow work
- tasks where you want a strict final check before `done`

It is especially tuned for repos that use `AGENTS.md` and for safe API CLI work, but the main pattern can still help on other coding tasks too.

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

## Example prompt

```text
Use $codex-spark-governor to build this task from start to true completion with the Spark helper agents. Keep the main chat as governor and final reviewer. Do not say done early.
```

## Repo layout

- `skills/codex-spark-governor/` -> the skill
- `agents/` -> the Spark helper agent files
- `config/codex-config.toml` -> small optional config snippet
- `scripts/install.sh` -> safe installer

## Notes

- This package does not force your main model.
- The helper agents are configured to use `gpt-5.3-codex-spark`.
- If a helper misses the same narrow step twice, the main chat should step in.

## License

MIT
