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

source_dir="$repo_root/integrations/$tool_name"
target_root="$dest/$tool_name"

if [ ! -d "$source_dir" ]; then
  echo "Missing integration bundle: $source_dir" >&2
  exit 1
fi

if [ -e "$target_root" ] && [ "$force" != "true" ]; then
  echo "Destination already exists: $target_root. Re-run with --force to overwrite." >&2
  exit 1
fi

mkdir -p "$dest"
rm -rf "$target_root"
cp -R "$source_dir" "$target_root"

echo "Installed $tool_name bundle to $target_root"
echo "Next: use the review-dry, review-kiss, review-yagni, review-soc, review-solid, and review-all-principles entrypoints from that bundle."
