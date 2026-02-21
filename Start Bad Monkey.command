#!/bin/bash
set -euo pipefail

DIR="/Users/johnniemiller/Documents/Codex/arcade-rescue"
cd "$DIR"

if ! command -v npm >/dev/null 2>&1; then
  echo "npm is not installed. Install Node.js first: https://nodejs.org/"
  read -r -p "Press Enter to close..."
  exit 1
fi

if [ ! -f ".env" ] && [ -f ".env.example" ]; then
  cp ".env.example" ".env"
  echo "Created .env from .env.example. Add your OPENAI_API_KEY if needed."
fi

URL="http://localhost:8080"
echo "Starting Bad Monkey at $URL"
open "$URL"
npm start
