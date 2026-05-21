#!/bin/sh

set -eu

tool_name="$1"
default_dest="$2"
repo_root="$3"
shift 3

dest="$default_dest"
force="false"

usage() {
  echo "Usage: $0 [--dest PATH] [--force]" >&2
}

package_paths() {
  case "$tool_name" in
    claude)
      cat <<'EOF'
.claude-plugin
skills
hooks
AGENTS.md
CLAUDE.md
README.md
LICENSE
docs/README.claude.md
EOF
      ;;
    codex)
      cat <<'EOF'
.codex-plugin
skills
commands
AGENTS.md
README.md
LICENSE
docs/README.codex.md
EOF
      ;;
    cursor)
      cat <<'EOF'
.cursor-plugin
skills
hooks
agents
commands
AGENTS.md
README.md
LICENSE
docs/README.cursor.md
EOF
      ;;
    github-copilot)
      cat <<'EOF'
skills
AGENTS.md
README.md
LICENSE
docs/README.copilot.md
integrations/github-copilot
EOF
      ;;
    *)
      echo "Unknown tool: $tool_name" >&2
      exit 1
      ;;
  esac
}

copy_path() {
  relative_path="$1"
  source_path="$repo_root/$relative_path"
  parent_dir=$(dirname "$relative_path")
  mkdir -p "$dest/$parent_dir"
  if [ -d "$source_path" ]; then
    cp -R "$source_path" "$dest/$parent_dir/"
  else
    cp "$source_path" "$dest/$relative_path"
  fi
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

if [ -e "$dest" ] && [ "$force" != "true" ]; then
  echo "Destination already exists: $dest. Re-run with --force to overwrite." >&2
  exit 1
fi

if [ -e "$dest" ]; then
  rm -rf "$dest"
fi
mkdir -p "$dest"

package_paths | while IFS= read -r relative_path; do
  [ -n "$relative_path" ] || continue
  copy_path "$relative_path"
done

echo "Installed Code Review Guild package for $tool_name to $dest"
echo "Shared skills are available under $dest/skills"
