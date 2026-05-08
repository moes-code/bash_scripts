# Moe's Bash Scripts

A collection of utility Bash scripts for Linux system maintenance and file encryption.

## Scripts Overview

| Script | Directory | Description | Arguments |
|---|---|---|---|
| `Update.sh` | `debian/` | Full system update using `apt` (update, upgrade, dist-upgrade, autoclean, autoremove) | none |
| `Update.sh` | `fedora/` | Full system update using `dnf` (update, autoremove, clean) + `flatpak` (update, unused removal) | none |
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
