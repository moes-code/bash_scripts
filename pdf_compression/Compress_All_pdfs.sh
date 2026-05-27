#!/bin/bash

# Determine the preset
PRESET_INPUT=${1:-ebook}
PRESET="/$PRESET_INPUT"

# Destination folder
DESTINATION_FOLDER="compressed_${PRESET_INPUT}"

# Check if PDF files exist in the current folder
shopt -s nullglob
PDF_FILES=( *.pdf *.PDF )

if [ ${#PDF_FILES[@]} -eq 0 ]; then
    echo ""
    echo "Error: No PDF files found in the current folder"
    echo ""
    exit 1
fi

# Create the destination folder
if [ ! -d "$DESTINATION_FOLDER" ]; then
    mkdir "$DESTINATION_FOLDER"
fi

echo ""
echo "Starting compression of ${#PDF_FILES[@]} files using profile '$PRESET_INPUT'"
echo ""

# Loop through all found PDF files.
for FILE in "${PDF_FILES[@]}"; do
    # Prevent already compressed files from being processed again
    if [[ "$FILE" == "$DESTINATION_FOLDER/"* ]]; then
        continue
    fi

    echo ""
    echo "Process: $FILE"
    echo ""

    # Ghostscript
    gs -sDEVICE=pdfwrite \
       -dCompatibilityLevel=1.4 \
       -dPDFSETTINGS="$PRESET" \
       -dNOPAUSE \
       -dQUIET \
       -dBATCH \
       -sOutputFile="$DESTINATION_FOLDER/$FILE" \
       "$FILE"
done

echo ""
echo "All compressed PDFs are located in the folder: $DESTINATION_FOLDER/"
echo ""
