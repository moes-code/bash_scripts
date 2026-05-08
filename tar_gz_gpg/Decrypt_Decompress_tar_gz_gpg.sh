#!/bin/bash
set -euo pipefail

# Load .env file
source .env

# Decrypt archive
gpg --decrypt --batch --yes --output - "$1" |
    # Decompress archive
    tar -C . -xz
