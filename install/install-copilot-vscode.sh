#!/bin/sh

set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname "$0")" && pwd)
REPO_ROOT=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)

dest="$PWD"
force="false"

usage() {
  echo "Usage: $0 [--dest PATH] [--force]" >&2
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    --dest)
      shift
      if [ "$#" -eq 0 ]; then
        usage
        exit 1
      fi
      dest="$1"
      ;;
    --force)
      force="true"
      ;;
    *)
      usage
      exit 1
      ;;
  esac
  shift
done

mkdir -p "$dest/.github/prompts"

copy_file() {
  relative_source="$1"
  relative_target="$2"
  source_path="$REPO_ROOT/$relative_source"
  target_path="$dest/$relative_target"
  target_parent=$(dirname "$target_path")

  mkdir -p "$target_parent"

  if [ -e "$target_path" ] && [ "$force" != "true" ]; then
    echo "Destination already contains $relative_target. Re-run with --force to overwrite." >&2
    exit 1
  fi

  cp "$source_path" "$target_path"
}

copy_file \
  "integrations/github-copilot/instructions/code-review-guild.instructions.md" \
  ".github/copilot-instructions.md"

for source_path in "$REPO_ROOT"/integrations/github-copilot/prompts/*.prompt.md; do
  copy_file "${source_path#"$REPO_ROOT"/}" ".github/prompts/$(basename "$source_path")"
done

echo "Installed Code Review Guild GitHub Copilot scaffolding into $dest"
echo "Custom instructions: $dest/.github/copilot-instructions.md"
echo "Prompt files: $dest/.github/prompts"
