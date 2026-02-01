#!/bin/bash

set -e

REPO_URL="git@github.com:omni-ecosystem/omni-ui-kit.git"
INSTALL_DIR="$HOME/.omni-ecosystem"
TARGET_DIR="$INSTALL_DIR/omni-ui-kit"

echo "=== Omni UI Kit Installer ==="
echo ""

# Create installation directory if it doesn't exist
if [ ! -d "$INSTALL_DIR" ]; then
    echo "Creating installation directory: $INSTALL_DIR"
    mkdir -p "$INSTALL_DIR"
fi

# Check if omni-ui-kit already exists
if [ -d "$TARGET_DIR" ]; then
    echo "omni-ui-kit already exists at $TARGET_DIR"
    echo "Updating existing installation..."

    cd "$TARGET_DIR"

    # Check if it's a git repository
    if [ -d ".git" ]; then
        echo "Fetching latest changes..."
        git fetch origin

        echo "Pulling updates..."
        git pull origin main || git pull origin master

        echo ""
        echo "✓ Update complete!"
    else
        echo "ERROR: $TARGET_DIR exists but is not a git repository"
        exit 1
    fi
else
    echo "Installing omni-ui-kit to $TARGET_DIR..."

    cd "$INSTALL_DIR"
    git clone "$REPO_URL"

    echo ""
    echo "✓ Installation complete!"
fi

echo ""
echo "omni-ui-kit is located at: $TARGET_DIR"
