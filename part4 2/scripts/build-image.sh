#!/bin/bash

# Exit if any variable is unset
set -u  # or set -o nounset

# Ensure required environment variables are set
: "$CONTAINER_REGISTRY"
: "$VERSION"
: "$NAME"
: "$DIRECTORY"

# Print debug information (optional)
echo "Building Docker image for $CONTAINER_REGISTRY/$NAME:$VERSION from directory $DIRECTORY"

# Build the Docker image
docker build -t "$CONTAINER_REGISTRY/$NAME:$VERSION" --file "./$DIRECTORY/Dockerfile" "./$DIRECTORY"

# Check if the build was successful
if [ $? -eq 0 ]; then
    echo "Docker build successful for $CONTAINER_REGISTRY/$NAME:$VERSION"
else
    echo "Docker build failed for $CONTAINER_REGISTRY/$NAME:$VERSION"
    exit 1
fi
