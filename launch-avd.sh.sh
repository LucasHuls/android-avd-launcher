#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

# Configuration
EMULATOR_DIR="$HOME/Android/Sdk/emulator"
EMULATOR_BINARY="$EMULATOR_DIR/emulator"

# Check if emulator binary exists
if [ ! -x "$EMULATOR_BINARY" ]; then
  echo "[ERROR] Android emulator not found at: $EMULATOR_BINARY" >&2
  exit 1
fi

# Change to the emulator directory
cd "$EMULATOR_DIR" || {
  echo "[ERROR] Failed to change to emulator directory: $EMULATOR_DIR" >&2
  exit 1
}

# List available AVDs
AVDS=($("$EMULATOR_BINARY" -list-avds))

if [ ${#AVDS[@]} -eq 0 ]; then
  echo "[ERROR] No Android Virtual Devices (AVDs) found. Please create one using Android Studio or avdmanager." >&2
  exit 1
fi

# Show the available AVDs
echo "Available AVDs:"
for avd in "${AVDS[@]}"; do
  echo "  - $avd"
done

echo
read -rp "Enter the name of the AVD you want to launch: " AVD_NAME

# Validate AVD name
if [[ ! " ${AVDS[*]} " =~ " $AVD_NAME " ]]; then
  echo "[ERROR] Invalid AVD name: $AVD_NAME" >&2
  exit 1
fi

# Launch the selected AVD
echo "[INFO] Launching AVD: $AVD_NAME"
"$EMULATOR_BINARY" -avd "$AVD_NAME"
