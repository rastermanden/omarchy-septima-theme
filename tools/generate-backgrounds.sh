#!/usr/bin/env bash
# Regenerate the wallpapers for both variants from the Septima mark geometry.
#
# The mark paths in mark-paths.svgfrag are lifted verbatim from
# favicon--green.svg (viewBox 0 0 872.8 876.93), vendored here — see SOURCES.md.
# The wallpapers are the real logo, not a redraw.
#
# -strip drops the embedded create/modify timestamps, so regenerating an
# unchanged wallpaper is byte-identical and git sees no diff.
#
# Requires: ImageMagick 7 (`magick`).

set -euo pipefail

cd "$(dirname "$0")"

render() {
  local svg=$1 out=$2
  mkdir -p "$(dirname "$out")"
  magick -background none "$svg" -flatten -strip -quality 92 "$out"
  echo "wrote ${out#../}"
}

# Dark theme
render bg01.svg ../backgrounds/01-petroleum.png
render bg02.svg ../backgrounds/02-mark.png
render bg03.svg ../backgrounds/03-brand-bands.png
render bg04.svg ../backgrounds/04-mint-light.png

# Light variant
render bgL1.svg ../variants/light/backgrounds/01-mint.png
render bgL2.svg ../variants/light/backgrounds/02-mark-light.png
render bgL3.svg ../variants/light/backgrounds/03-paper.png
