#!/bin/bash

# Directory to search for .html files
SEARCH_DIR="."

# Find all .html files in the directory
find "$SEARCH_DIR" -type f -name "*.html" | while read -r file; do
    # Extract the filename without the path
    DOMAIN="https://$(basename "$(pwd)").github.io"
    FILENAME=$(basename "$file")

    # Use sed to search for canonical link and replace href with _PLACEHOLDER_$FILENAME
    sed -i -E "s|(rel=\"canonical\"[^>]*href=\")[^\"]*\"|\1$DOMAIN/$FILENAME\"|g" "$file"

    echo "Updated: $file"
done
