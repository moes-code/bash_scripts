# Moe's Bash Scripts

A collection of utility Bash scripts for Linux system maintenance and file encryption.

## Scripts Overview

| Script | Directory | Description | Arguments |
|---|---|---|---|
| `Update.sh` | `debian/` | Full system update using `apt` (update, upgrade, dist-upgrade, autoclean, autoremove) | none |
| `Update.sh` | `fedora/` | Full system update using `dnf` (update, autoremove, clean) + `flatpak` (update, unused removal) | none |
| `Compress_All_pdfs.sh` | `pdf_compression/` | Batch-compress all PDFs in a folder using Ghostscript | 1 optional preset |
| `Compress_Encrypt_tar_gz_gpg.sh` | `tar_gz_gpg/` | Compress a file/dir to `.tar.gz` and encrypt with a GPG public key | 1 path |
| `Decrypt_Decompress_tar_gz_gpg.sh` | `tar_gz_gpg/` | Decrypt a `.tar.gz.gpg` archive and extract its contents | 1 file |

## Requirements

- **Bash**
- **`sudo`** access (for the update scripts)
- **`gpg`**, **`tar`**, and **`gzip`** (for the encryption scripts)

## Debian — `debian/Update.sh`

Updates all packages using `apt`. Run without arguments:

```bash
sudo ./debian/Update.sh
```

## Fedora — `fedora/Update.sh`

Updates RPM packages via `dnf` and Flatpak applications. Run without arguments:

```bash
sudo ./fedora/Update.sh
```

## tar_gz_gpg

Two scripts for compressing + encrypting and decrypting + extracting files using streaming pipes (no intermediate files).

```bash
# Compress and encrypt a directory
./tar_gz_gpg/Compress_Encrypt_tar_gz_gpg.sh my_data/

# Decrypt and extract
./tar_gz_gpg/Decrypt_Decompress_tar_gz_gpg.sh my_data.tar.gz.gpg
```

**Configuration:** Copy `.env.example` to `.env` and set your GPG recipient email.

See [tar_gz_gpg/README.md](./tar_gz_gpg/README.md) for full setup and usage instructions.

## pdf_compression

Batch-compresses every `*.pdf` / `*.PDF` file in the current directory using Ghostscript. Compressed
files are written to `compressed_<preset>/`; files already in that folder are skipped.

```bash
# Compress with default "ebook" preset
./pdf_compression/Compress_All_pdfs.sh

# Compress with a specific preset
./pdf_compression/Compress_All_pdfs.sh screen
```

The optional preset argument (`screen`, `ebook`, `prepress`, `default`) controls the quality/size
trade-off. The default is `ebook`.

**Requirements:** `ghostscript` (`gs`).

See [pdf_compression/README.md](./pdf_compression/README.md) for details on the presets and
Ghostscript installation.
