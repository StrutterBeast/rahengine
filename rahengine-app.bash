#!/usr/bin/env bash

# RahEngine Cross-Platform Launcher
# Detects OS and launches the Python WebView application

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PYTHON_CMD=""

# 1. Detect OS and Select Python Command
OS="$(uname -s)"

case "$OS" in
    Linux*)
        # Linux usually uses python3
        PYTHON_CMD="python3"
        ;;
    Darwin*)
        # macOS uses python3
        PYTHON_CMD="python3"
        ;;
    MINGW*|MSYS*|CYGWIN*)
        # Windows (Git Bash/WSL) usually uses 'python'
        PYTHON_CMD="python"
        ;;
    *)
        echo "Unknown OS: $OS. Attempting with python3..."
        PYTHON_CMD="python3"
        ;;
esac

echo "Detected OS: $OS"
echo "Launching RahEngine..."

# 2. Check if pywebview is installed, if not, attempt to install it
# This makes the app more portable for first-time users
$PYTHON_CMD -c "import webview" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "Installing required library (pywebview)..."
    $PYTHON_CMD -m pip install pywebview
fi

# 3. Launch the Application
# Running in background (&) allows the script to exit if desired
"$PYTHON_CMD" "$SCRIPT_DIR/rahengine_app.py"   