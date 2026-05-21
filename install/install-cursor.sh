#!/bin/sh

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname "$0")" && pwd)
REPO_ROOT=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)

/bin/sh "$SCRIPT_DIR/lib/install_bundle.sh" "cursor" "$HOME/.cursor/plugins/local/code-review-guild" "$REPO_ROOT" "$@"
