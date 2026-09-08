#!/usr/bin/env bash
set -euo pipefail

# 1. Build the site (clean stale output so draft/removed pages don't linger).
hugo --gc --minify --cleanDestinationDir

# 2. Encrypt protected pages that were actually built. A page turned draft
#    won't exist here, so we skip it instead of failing the build.
PAGE="public/work/supervised-mode/index.html"
if [ -f "$PAGE" ]; then
  echo "Encrypting $PAGE with StatiCrypt"
  npx --yes staticrypt "$PAGE" -d public/work/supervised-mode --template staticrypt/template.html
else
  echo "Skip StatiCrypt: $PAGE not built (draft or removed)"
fi
