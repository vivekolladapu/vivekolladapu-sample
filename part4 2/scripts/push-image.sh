# #
# # Publishes a Docker image.
# #
# # Environment variables:
# #
# #   CONTAINER_REGISTRY - The hostname of your container registry.
# #   REGISTRY_UN - User name for your container registry.
# #   REGISTRY_PW - Password for your container registry.
# #   VERSION - The version number to tag the images with.
# #
# # Usage:
# #
# #       ./scripts/push-image.sh
# #

# set -u # or set -o nounset
# : "$CONTAINER_REGISTRY"
# : "$VERSION"
# : "$REGISTRY_UN"
# : "$REGISTRY_PW"
# : "$NAME"

# echo $REGISTRY_PW | docker login $CONTAINER_REGISTRY --username $REGISTRY_UN --password-stdin
# docker push $CONTAINER_REGISTRY/$NAME:$VERSION

# #!/bin/bash

# # Pushes a Docker image to a container registry.
# #
# # Environment variables:
# #   CONTAINER_REGISTRY - The hostname of your container registry.
# #   VERSION - The version number of the image to push.
# #   REGISTRY_UN - The username for the container registry.
# #   REGISTRY_PW - The password for the container registry.
# #   NAME - The name of the image to push.
# #
# # Usage:
# #   ./scripts/push-image.sh

set -u  # Treat unset variables as an error
: "$CONTAINER_REGISTRY"
: "$VERSION"
: "$REGISTRY_UN"
: "$REGISTRY_PW"
: "$NAME"

# Log the registry and image name (but not the password)
echo "Logging in to $CONTAINER_REGISTRY as $REGISTRY_UN"
echo "$REGISTRY_PW" | docker login "$CONTAINER_REGISTRY" --username "$REGISTRY_UN" --password-stdin

# Check if docker login was successful
if [ $? -ne 0 ]; then
  echo "Docker login failed for $REGISTRY_UN at $CONTAINER_REGISTRY"
  exit 1
fi

# Push the Docker image
echo "Pushing Docker image: $CONTAINER_REGISTRY/$NAME:$VERSION"
docker push "$CONTAINER_REGISTRY/$NAME:$VERSION"

# Check if docker push was successful
if [ $? -ne 0 ]; then
  echo "Docker push failed for $CONTAINER_REGISTRY/$NAME:$VERSION"
  exit 1
fi

echo "Docker image $CONTAINER_REGISTRY/$NAME:$VERSION pushed successfully!"
