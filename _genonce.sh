#!/bin/bash

# FHIR IG Publisher build script
# This script downloads the IG Publisher if needed and runs a full build

# Exit on error
set -e

echo "FHIR IG Publisher Build Script"
echo "================================"

# Add Homebrew Ruby and Jekyll to PATH
export PATH="/opt/homebrew/lib/ruby/gems/3.4.0/bin:/opt/homebrew/opt/ruby/bin:$PATH"

# Check if Jekyll is available
if command -v jekyll &> /dev/null; then
    echo "Jekyll version: $(jekyll --version)"
else
    echo "WARNING: Jekyll not found. Installing..."
    gem install jekyll bundler
fi

# Check if publisher exists, if not run update script
if [ ! -f "input-cache/publisher.jar" ]; then
    echo "Publisher not found. Downloading..."
    if [ -f "_updatePublisher.sh" ]; then
        chmod +x _updatePublisher.sh
        ./_updatePublisher.sh
    else
        echo "Error: _updatePublisher.sh not found"
        exit 1
    fi
fi

# Run SUSHI first to convert FSH to FHIR
echo ""
echo "Running SUSHI to convert FSH files..."
sushi .

# Run the IG Publisher
echo ""
echo "Running IG Publisher..."
java -jar input-cache/publisher.jar -ig .

echo ""
echo "Build complete! Open output/index.html to view the IG."
