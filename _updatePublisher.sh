#!/bin/bash

# Update/Download FHIR IG Publisher
# This script downloads the latest IG Publisher to input-cache/

set -e

echo "FHIR IG Publisher Update Script"
echo "================================"

# Create input-cache directory if it doesn't exist
mkdir -p input-cache

# Publisher download URL
PUBLISHER_URL="https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar"

echo "Downloading IG Publisher from:"
echo "$PUBLISHER_URL"
echo ""

# Download the publisher
curl -L "$PUBLISHER_URL" -o input-cache/publisher.jar

echo ""
echo "Publisher downloaded successfully to input-cache/publisher.jar"
echo ""

# Check Java version
if command -v java &> /dev/null; then
    JAVA_VERSION=$(java -version 2>&1 | head -n 1)
    echo "Java version detected: $JAVA_VERSION"
else
    echo "WARNING: Java not found. Please install Java 11 or higher."
fi

echo ""
echo "Update complete!"
