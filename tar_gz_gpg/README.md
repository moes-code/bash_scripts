# tar_gz_gpg

A pair of Bash scripts to compress, encrypt, decrypt, and extract files using `tar`, `gzip`, and `GPG`.

## Overview

| Script | Purpose |
|---|---|
| `Compress_Encrypt_tar_gz_gpg.sh` | Compresses a file or directory into a `.tar.gz` archive and encrypts it with a GPG public key |
| `Decrypt_Decompress_tar_gz_gpg.sh` | Decrypts a `.tar.gz.gpg` file and extracts its contents |

## Prerequisites

- Bash
- `tar` and `gzip`
- `gpg` (GnuPG) with a configured key pair
- A GPG public key imported for the recipient

## Setup

1. **Configure the recipient email:**
   ```bash
   cp .env.example .env
   ```
   Edit `.env` and set your GPG recipient email:
   ```env
   GPG_RECIPIENT_EMAIL="your-email@example.com"
   ```

2. **Make the scripts executable:**
   ```bash
   chmod +x Compress_Encrypt_tar_gz_gpg.sh Decrypt_Decompress_tar_gz_gpg.sh
   ```

## Usage

Both scripts operate in your current working directory.

### Encrypt & Compress

```bash
./Compress_Encrypt_tar_gz_gpg.sh <file_or_directory>
```

This produces `<name>.tar.gz.gpg` in the current directory.

**Example:**
```bash
./Compress_Encrypt_tar_gz_gpg.sh my_data/
# Output: my_data.tar.gz.gpg
```

### Decrypt & Extract

```bash
./Decrypt_Decompress_tar_gz_gpg.sh <encrypted_archive.tar.gz.gpg>
```

This decrypts and extracts the archive contents into the current directory.

**Example:**
```bash
./Decrypt_Decompress_tar_gz_gpg.sh my_data.tar.gz.gpg
# Output: my_data/ (extracted in place)
```

## How It Works

1. **Encryption flow:** `tar` creates a gzip-compressed stream → piped directly to `gpg --encrypt` using the recipient's public key → output saved as `.tar.gz.gpg`
2. **Decryption flow:** `gpg --decrypt` decrypts the file → piped directly to `tar -xz` for extraction

No intermediate files are created on disk during either process.

## Security Notes

- Never commit your `.env` file to version control — it contains your GPG recipient email
- Always use `.env.example` as the template for new setups
- Ensure the GPG private key is available on any machine where you decrypt archives
- The `--batch --yes` flags run GPG non-interactively; verify you trust the key before encrypting
