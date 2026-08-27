#!/usr/bin/env bash
# Regenerate the wallpapers from the Septima mark geometry.
#
# The mark paths in mark-paths.svgfrag are lifted verbatim from
# design.septima.dk/cdn/logo/media/svg/favicon--green.svg (viewBox 0 0 872.8 876.93),
# so the wallpapers are the real logo, not a redraw.
#
# Requires: ImageMagick 7 (`magick`).

set -euo pipefail

cd "$(dirname "$0")"
out="../backgrounds"
mkdir -p "$out"

for n in 01:petroleum 02:mark 03:brand-bands 04:mint-light; do
  idx=${n%%:*}
  name=${n##*:}
  # -strip drops the embedded create/modify timestamps, so regenerating an
  # unchanged wallpaper is byte-identical and git sees no diff.
  magick -background none "bg${idx}.svg" -flatten -strip -quality 92 "$out/${idx}-${name}.png"
  echo "wrote $out/${idx}-${name}.png"
done
