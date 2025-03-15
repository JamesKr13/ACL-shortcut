#!/bin/bash

SCRIPT_NAME="luacl"
INSTALL_DIR="/usr/local/bin"

sudo cp "$SCRIPT_NAME.sh" "$INSTALL_DIR/$SCRIPT_NAME"

sudo chmod +x "$INSTALL_DIR/$SCRIPT_NAME"

echo "$SCRIPT_NAME installed successfully"
