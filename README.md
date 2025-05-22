# Android AVD Launcher Script

A failsafe Bash script to launch an Android Virtual Device (AVD) from your local Android SDK setup.

## Features

- Automatically lists all available AVDs
- Validates AVD input
- Minimal dependencies (Bash + Android SDK)

## Requirements

- Android SDK installed
- AVD(s) created via Android Studio or `avdmanager`
- Bash shell

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/android-avd-launcher.git
   cd android-avd-launcher
   ```
2. Make the script executable (required if downloaded or unzipped manually):
   ```bash
   chmod +x launch-avd.sh
   ```
3. Run the script:
   ```bash
   ./launch-avd.sh
   ```

>✅ Note: If you cloned this repository using Git, the executable permission is preserved.
>❗ If you downloaded it as a ZIP file, you must run chmod +x launch-avd.sh.