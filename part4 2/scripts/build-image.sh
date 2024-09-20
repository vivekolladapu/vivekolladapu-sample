# #
# # Builds a Docker image.
# #
# # Environment variables:
# #
# #   CONTAINER_REGISTRY - The hostname of your container registry.
# #   VERSION - The version number to tag the images with.
# #   NAME - The name of the image to build.
# #   DIRECTORY - The directory form which to build the image.
# #
# # Usage:
# #
# #       ./scripts/build-image.sh
# #

# set -u # or set -o nounset
# : "$CONTAINER_REGISTRY"
# : "$VERSION"
# : "$NAME"
# : "$DIRECTORY"

# docker build -t $CONTAINER_REGISTRY/$NAME:$VERSION --file ./$DIRECTORY/Dockerfile ./$DIRECTORY

#!/bin/bash

# Builds a Docker image.
# Environment variables:
#   CONTAINER_REGISTRY - The hostname of your container registry.
#   VERSION - The version number to tag the images with.
#   NAME - The name of the image to build.
#   DIRECTORY - The directory from which to build the image.
#
# Usage:
#   ./scripts/build-image.sh

set -u # Treat unset variables as an error
: "$CONTAINER_REGISTRY"
: "$VERSION"
: "$NAME"
: "$DIRECTORY"

# Debug: Log the values of the variables
echo "Building Docker image for $CONTAINER_REGISTRY/$NAME:$VERSION from directory $DIRECTORY"

# Run the Docker build command
docker build -t "$CONTAINER_REGISTRY/$NAME:$VERSION" --file "./$DIRECTORY/Dockerfile" "./$DIRECTORY"

# Check if the build was successful
if [ $? -ne 0 ]; then
  echo "Docker build failed for $CONTAINER_REGISTRY/$NAME:$VERSION"
  exit 1
fi
