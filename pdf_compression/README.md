# PDF Compression

Batch-compress all PDF files in the current directory using Ghostscript (`gs`).

## Usage

```bash
./pdf_compression/Compress_All_pdfs.sh [preset]
```

The script finds every `*.pdf` and `*.PDF` file in the current folder, compresses them with
Ghostscript, and places the output in `compressed_<preset>/`.

Already-compressed files (inside the destination folder) are automatically skipped.

## Preset

The optional `preset` argument controls the output quality / file size. It maps directly to
Ghostscript's `-dPDFSETTINGS` parameter.

| Preset     | Quality        | Use case                |
|------------|----------------|-------------------------|
| `screen`   | lowest         | web previews, tiny size |
| `ebook`    | medium         | good for screen reading (default) |
| `prepress` | high           | print quality           |
| `default`  | balanced       | general purpose         |

## Requirements

- **Ghostscript** (`gs`)

Install on Debian/Ubuntu:

```bash
sudo apt install ghostscript
```

Install on Fedora:

```bash
sudo dnf install ghostscript
```

## Examples

Compress with the default `ebook` preset:

```bash
./pdf_compression/Compress_All_pdfs.sh
```

Compress with `screen` preset for maximum size reduction:

```bash
./pdf_compression/Compress_All_pdfs.sh screen
```

Output will be written to `compressed_screen/`.
