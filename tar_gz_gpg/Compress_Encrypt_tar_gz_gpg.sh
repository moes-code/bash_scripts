#!/bin/bash
set -euo pipefail

# Load .env file
source .env

# Remove trailing slash
INPUT_FILE="${1%/}"

# Create archive
tar -czf - "$INPUT_FILE" |
    # Encrypt archive
    gpg --batch --yes --encrypt --recipient "$GPG_RECIPIENT_EMAIL" -o "${INPUT_FILE}.tar.gz.gpg"
