#!/bin/bash

# Build script for ITER bookdown project

set -e  # exit on error

echo "Starting bookdown build process..."

# Build the bookdown project
echo "Building bookdown project..."
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"

echo "Bookdown build completed successfully!"

# Copy fonts folder to docs
echo "Copying fonts folder to docs directory..."
if [ -d "fonts" ]; then
    # rm existing fonts folder in docs if it exists
    if [ -d "docs/fonts" ]; then
        echo "Removing existing docs/fonts folder..."
        rm -rf docs/fonts
    fi
    
    # Copy fonts folder to docs
    cp -r fonts docs/
    echo "Fonts folder copied successfully to docs/"
else
    echo "Warning: fonts folder not found in root directory"
    exit 1
fi

echo ""
echo "Build completed successfully!"