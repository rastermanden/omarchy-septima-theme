# Vendored brand assets

These SVGs are copied byte-for-byte from the Septima design system and are the
inputs the wallpapers and screensaver are generated from. They are vendored so
the repo regenerates offline and stays pinned to the logo as it existed on
2026-08-27 — the generators no longer depend on `design.septima.dk` being
reachable, or on the CDN serving the same file later.

| File | Source | SHA-256 |
|---|---|---|
| `logo-color-black.svg` | `https://design.septima.dk/cdn/logo/logotype/logo-color-black/logo-color-black.svg` | `17205afec3d9f4d83df4463f52e05117c453f4ff34a41c26b09e5323206d104a` |
| `favicon--green.svg` | `https://design.septima.dk/cdn/logo/media/svg/favicon--green.svg` | `25703443a441b4bc7741e169650073dc44ed357b3db74300a6bf5d6fb83e0873` |

`mark-paths.svgfrag` is the three `<path>` elements from `favicon--green.svg`
with the `fill` stripped, so `bg0*.svg` can recolour the mark per wallpaper. It
is a mechanical extraction, not a redraw — the geometry is unmodified.

## Re-pinning

To pick up an upstream logo change, re-fetch and verify the checksums move as
you expect before regenerating:

```bash
curl -sL -o tools/logo-color-black.svg \
  https://design.septima.dk/cdn/logo/logotype/logo-color-black/logo-color-black.svg
curl -sL -o tools/favicon--green.svg \
  https://design.septima.dk/cdn/logo/media/svg/favicon--green.svg
sha256sum tools/*.svg
```

Note that the design system is served `noindex,nofollow` and these are Septima
trademarks; see the Trademark section of the top-level README.
