# Septima — an Omarchy theme

A dark [Omarchy](https://omarchy.org/) theme built from the Septima design system,
grounded in the brand's deepest colour (`patroleum` `#113342`) with the logo green
`#0d9474` as the accent. Ships four wallpapers built from the real logo geometry
and a screensaver made from the official logotype.

Foreground/background contrast is **12.06:1**.

## Install

```bash
omarchy theme install https://github.com/rastermanden/omarchy-septima-theme && omarchy theme set Septima
```

That clones the theme and applies it — colours, wallpapers and icon theme. A
wallpaper is selected automatically; cycle them with `omarchy theme bg next`.

The screensaver is a **separate step**. Omarchy never touches
`~/.config/omarchy/branding/` during a theme install, so nothing above installs
it:

```bash
cp ~/.config/omarchy/branding/screensaver.txt{,.bak}                              # keep the Omarchy original
cp ~/.config/omarchy/themes/septima/extras/screensaver.txt ~/.config/omarchy/branding/screensaver.txt
omarchy launch screensaver force                                                  # preview it
```

The art is sized for a canvas of about **111×30 characters** (a 2560×1600 panel
at scale 1.6, which is what Omarchy's font size 18 works out to). On a smaller
display it will clip; regenerate it with `tools/generate-screensaver.sh`, which
documents how to measure your own canvas. See [Screensaver](#screensaver) below.

> If you are developing this theme rather than consuming it, do **not** run
> `omarchy theme install` — it clones into the same slot, and a clone carries a
> `.git` directory that makes Omarchy treat the theme as untrusted. Use the
> symlink setup in [Hacking on it locally](#hacking-on-it-locally) instead.

## Palette

Every value below is taken verbatim from the CSS custom properties published by
the Septima design system, except where noted.

| Role | Hex | Design-system token |
|---|---|---|
| background | `#113342` | `--bs-patroleum` |
| selection | `#2E495C` | `--bs-onedoor` |
| accent / green | `#0d9474` | logo mark fill |
| foreground | `#F0F5EF` | `--bs-light` |
| light foreground | `#dce7e4` | `--bs-border-color` |
| blue | `#5a97bd` | `--bs-secondary` `#2F607C`, lightened for contrast on dark |
| cyan | `#9cbeb3` | `--bs-accordion-btn-focus-border-color` |
| yellow | `#F5D041` | `--bs-warning` |
| red | `#e76754` | `--bs-danger` |
| orange | `#ec8576` | `--bs-dark-bg-subtle` |
| magenta | `#d59aa4` | derived — see below |

Two caveats, stated plainly:

- **The brand has no purple and no true orange.** ANSI slots still need them, so
  `magenta` is derived from the danger coral (desaturated and lightened toward
  rose) and `orange` uses the coral's own light tint. Neither is a published
  brand colour.
- **`blue` is lightened.** The brand's `--bs-secondary` `#2F607C` is designed
  against white and reads too dark against the petroleum background.

The design system itself is **light** (white ground, `#565657` body text). This
theme is dark because Omarchy is dark-centric; `04-mint-light.png` is included
for a light desktop, and flipping `mode = "light"` in `colors.toml` is a
reasonable starting point for a light variant.

## Backgrounds

All four are 3840×2400 (16:10), using the mark's actual SVG path data.

| File | Description |
|---|---|
| `01-petroleum.png` | Petroleum gradient, oversized mark bleeding off the right edge |
| `02-mark.png` | Centred mark in brand green on a dark vignette |
| `03-brand-bands.png` | The five brand colours as vertical bands, mark watermarked over |
| `04-mint-light.png` | Light mint ground with the primary-green mark — pairs with a light desktop |

## Screensaver

Omarchy's screensaver renders `~/.config/omarchy/branding/screensaver.txt` through
`ttfx` at a random effect each cycle. `extras/screensaver.txt` is the official
Septima logotype transcoded to braille. Install it with the commands in
[Install](#install) above.

The art is 100×12 characters. That ceiling is not arbitrary: the screensaver runs
its terminal at font size 18, so on a 2560×1600 panel at scale 1.6 the cell is
~23px and the canvas is only about **111×30 characters**. Wider art clips — a
126-column version looks considerably better and does not fit. If your display
differs, regenerate with `tools/generate-screensaver.sh`, which documents how to
measure your own canvas.

## Regenerating

```bash
tools/generate-backgrounds.sh    # wallpapers   (needs ImageMagick 7)
tools/generate-screensaver.sh    # screensaver  (needs omarchy + ImageMagick 7)
```

Both run offline and are byte-reproducible — the brand SVGs they consume are
vendored in `tools/` and pinned by checksum, so regenerating an unchanged asset
produces no git diff. See [`tools/SOURCES.md`](tools/SOURCES.md) for provenance
and how to re-pin against an upstream logo change.

## Hacking on it locally

Omarchy holds themes cloned from a repo to a restricted file list — it drops
anything that runs code (`*.lua`, terminal configs, `vscode.json`) and detects a
clone by the `.git` directory. This theme ships only `colors.toml`, `icons.theme`
and `backgrounds/`, all of which survive a clone intact, so a normal install is
unaffected.

If you want to edit it as a working copy **and** keep the unrestricted treatment
Omarchy gives your own themes, symlink it rather than cloning into place — a
symlink is explicitly exempt from the clone rules:

```bash
git clone https://github.com/rastermanden/omarchy-septima-theme ~/Work/omarchy-septima-theme
ln -sfn ~/Work/omarchy-septima-theme ~/.config/omarchy/themes/septima
omarchy theme set Septima
```

## Trademark

The Septima name, mark and logotype are property of
[Septima](https://septima.dk) and are included here as brand assets, not under
the terms below. The theme configuration, scripts and wallpaper compositions are
MIT licensed. If you are not Septima, do not ship their logo in your own work.

Brand assets sourced from `design.septima.dk`.
