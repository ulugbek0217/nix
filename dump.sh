# !/usr/bin/bash

# dump-nix.zsh
# Concatenate all Nix-related files into test.nix.blank, excluding unwanted files/dirs.

set -euo pipefail

OUTFILE="test.nix.blank"

# Clear the output file if it exists, or create it
: > "$OUTFILE"

# Append top-level flake.nix if it exists
if [[ -f flake.nix ]]; then
  cat flake.nix >> "$OUTFILE"
  echo -e "\n# ---- flake.nix ----\n" >> "$OUTFILE"  # Add separator for clarity
fi

# Find and append relevant files, excluding specified patterns
find home-manager hosts modules overlays pkgs \
  -type d \( -name .git -o -name node_modules -o -name .direnv -o -name .github \) -prune -o \
  -type f \
  ! -name 'README.md' \
  ! -name 'flake.lock' \
  ! -name "$OUTFILE" \
  -print0 | sort -z | while IFS= read -r -d '' file; do
    echo -e "\n# ---- $file ----\n" >> "$OUTFILE"  # Add file name as separator
    cat "$file" >> "$OUTFILE"
  done

# Check if any files were appended
if [[ -s "$OUTFILE" ]]; then
  echo "✅ Combined files written to $OUTFILE"
else
  echo "⚠️ No files were found to combine into $OUTFILE"
  exit 1
fi
