#!/usr/bin/env bash
# Regenerate extras/screensaver.txt from the official Septima logotype.
#
# Width matters: the Omarchy screensaver runs foot/alacritty at font size 18, so on
# a 2560x1600 panel at scale 1.6 the cell is ~23px and the canvas is only ~111x30
# characters. 100 columns leaves margin; anything past ~110 clips.
#
# Recompute the canvas for your own display with:
#   magick -density $((96 * SCALE)) -font <mono.ttf> -pointsize 18 \
#     label:'MMMMMMMMMMMMMMMMMMMM' -format '%w' info:
# then divide your panel width by (that / 20).
#
# Requires: omarchy (omarchy-transcode-ascii), ImageMagick 7.

set -euo pipefail

cd "$(dirname "$0")"
logo=${1:-logo-color-black.svg}

# The logotype is vendored (see SOURCES.md), so this runs offline and stays
# pinned to a known logo. The fetch is only a fallback if it has been deleted.
if [[ ! -f $logo ]]; then
  echo "Vendored $logo missing -- fetching from design.septima.dk ..." >&2
  curl -sL --max-time 20 -o logo-color-black.svg \
    https://design.septima.dk/cdn/logo/logotype/logo-color-black/logo-color-black.svg
  logo=logo-color-black.svg
fi

omarchy transcode ascii "$logo" ../extras/screensaver.txt \
  --width 100 --height 24 --mode braille

awk '{ n = length($0); if (n > m) m = n; c++ }
     END { print "  -> " m " cols x " c " rows (canvas is ~111x30)" }' ../extras/screensaver.txt
