#!/bin/bash

set -e

TARGET_DIR="$HOME/.omni-ecosystem/omni-ui-kit"

echo "=== Omni UI Kit Uninstaller ==="
echo ""

# Check if omni-ui-kit exists
if [ ! -d "$TARGET_DIR" ]; then
    echo "omni-ui-kit not found at: $TARGET_DIR"
    echo "Nothing to uninstall."
    exit 0
fi

echo "WARNING: This will remove omni-ui-kit:"
echo "  $TARGET_DIR"
echo ""
read -p "Are you sure you want to continue? (yes/no): " -r
echo ""

if [[ $REPLY =~ ^[Yy][Ee][Ss]$ ]]; then
    echo "Removing $TARGET_DIR..."
    rm -rf "$TARGET_DIR"
    echo ""
    echo "✓ Uninstallation complete!"
else
    echo "Uninstallation cancelled."
    exit 0
fi
