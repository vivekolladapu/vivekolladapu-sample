#!/bin/bash

# Exit if any variable is unset
set -u

# Ensure required environment variables are set
: "$CONTAINER_REGISTRY"
: "$VERSION"
: "$NAME"
: "$DIRECTORY"

# Debug print
echo "Container registry: '$CONTAINER_REGISTRY'"
echo "Name: '$NAME'"
echo "Version: '$VERSION'"
echo "Directory: '$DIRECTORY'"

# Build the Docker image
docker build -t "$CONTAINER_REGISTRY/$NAME:$VERSION" --file "./$DIRECTORY/Dockerfile" "./$DIRECTORY"

# Check if the build was successful
if [ $? -eq 0 ]; then
    echo "Docker build successful for $CONTAINER_REGISTRY/$NAME:$VERSION"
else
    echo "Docker build failed for $CONTAINER_REGISTRY/$NAME:$VERSION"
    exit 1
fi
