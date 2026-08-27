#!/usr/bin/env bash
# Register the light variant as a second Omarchy theme, "Septima Light".
#
# One git repo maps to one installable Omarchy theme, so the light variant cannot
# ride along with `omarchy theme install`. This symlinks it into place instead.
#
# The symlink is deliberate: Omarchy holds themes cloned from a repo to a
# restricted file list and detects a clone by its .git directory, but exempts a
# symlink to your own working copy -- see theme_came_from_a_repo() in
# omarchy-theme-set. Copying the directory in would work too; symlinking keeps it
# version controlled.

set -euo pipefail

repo=$(cd "$(dirname "$0")/.." && pwd)
target="$HOME/.config/omarchy/themes/septima-light"

if [[ -e $target && ! -L $target ]]; then
  echo "Refusing to overwrite $target -- it exists and is not a symlink." >&2
  echo "Move it aside first if you want to replace it." >&2
  exit 1
fi

ln -sfn "$repo/variants/light" "$target"
echo "Linked $target -> $repo/variants/light"
echo
echo "Apply it with:  omarchy theme set \"Septima Light\""
