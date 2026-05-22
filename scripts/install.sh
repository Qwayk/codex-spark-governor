#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CODEX_DIR="${CODEX_HOME:-$HOME/.codex}"

mkdir -p "$CODEX_DIR/skills" "$CODEX_DIR/agents"

rsync -a "$ROOT_DIR/skills/codex-spark-governor/" "$CODEX_DIR/skills/codex-spark-governor/"
rsync -a "$ROOT_DIR/agents/" "$CODEX_DIR/agents/"

if [ ! -f "$CODEX_DIR/config.toml" ]; then
  cp "$ROOT_DIR/config/codex-config.toml" "$CODEX_DIR/config.toml"
  echo "Created $CODEX_DIR/config.toml"
else
  echo "Installed skill and helper agents into $CODEX_DIR"
  echo "If needed, merge this snippet into $CODEX_DIR/config.toml:"
  echo
  cat "$ROOT_DIR/config/codex-config.toml"
fi

echo
echo "Restart Codex to load the new skill and agents."
echo "For long tasks, make sure your config has:"
echo
echo "[features]"
echo "goals = true"
echo "multi_agent = true"
