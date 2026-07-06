#!/usr/bin/env bash
# =============================================================================
# Fetch the freely-embeddable fonts used by The Automatic Business interior.
# Pulls variable TTFs from the Google Fonts repository into ./fonts.
# Typst reads variable fonts and selects the weights it needs.
#
# Run from the repo root:  bash fonts/download.sh
# (or add as a step in the GitHub Action before `quarto render`)
# =============================================================================
set -euo pipefail

DEST="$(cd "$(dirname "$0")" && pwd)"
RAW="https://raw.githubusercontent.com/google/fonts/main"

fetch () {
  local url="$1" out="$2"
  echo "  -> ${out}"
  curl -fsSL "${url}" -o "${DEST}/${out}"
}

echo "Downloading fonts into ${DEST}"

# Body serif — Source Serif 4 (upright + italic, variable)
fetch "${RAW}/ofl/sourceserif4/SourceSerif4%5Bopsz%2Cwght%5D.ttf"        "SourceSerif4.ttf"
fetch "${RAW}/ofl/sourceserif4/SourceSerif4-Italic%5Bopsz%2Cwght%5D.ttf" "SourceSerif4-Italic.ttf"

# Display sans — Archivo (upright + italic, variable)
fetch "${RAW}/ofl/archivo/Archivo%5Bwdth%2Cwght%5D.ttf"        "Archivo.ttf"
fetch "${RAW}/ofl/archivo/Archivo-Italic%5Bwdth%2Cwght%5D.ttf" "Archivo-Italic.ttf"

# Mono — JetBrains Mono
fetch "${RAW}/ofl/jetbrainsmono/JetBrainsMono%5Bwght%5D.ttf" "JetBrainsMono.ttf"

# Figure lettering (only needed if diagram SVGs keep live text)
fetch "${RAW}/apache/permanentmarker/PermanentMarker-Regular.ttf" "PermanentMarker-Regular.ttf"
fetch "${RAW}/ofl/patrickhand/PatrickHand-Regular.ttf"            "PatrickHand-Regular.ttf"

echo "Done. $(ls -1 "${DEST}"/*.ttf | wc -l) font files in ${DEST}"
