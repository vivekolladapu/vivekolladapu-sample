# 
# Remove containers from Kubernetes.
#
# Environment variables:
#
#   NAME - The name of the microservice to delete.
#
# Usage:
#
#   ./scripts/cd/delete.sh
#
set -u # or set -o nounset
# : "$NAME"s

envsubst < ./scripts/deployment.yaml | kubectl delete -f -