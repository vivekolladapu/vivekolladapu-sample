# Output for Azure Container Registry login URL
output "container_registry" {
  description = "The login URL of the Azure Container Registry"
  value       = azurerm_container_registry.container_registry.login_server
}

# Output for Azure Container Registry username
output "registry_username" {
  description = "The admin username for the Azure Container Registry"
  value       = azurerm_container_registry.container_registry.admin_username
}

# Output for Azure Container Registry password
output "registry_password" {
  description = "The admin password for the Azure Container Registry"
  value       = azurerm_container_registry.container_registry.admin_password
  sensitive   = true  # Marks this as a sensitive value so it doesn't get logged in plaintext
}

# Output for Kubernetes cluster kubeconfig (base64-encoded)
output "kube_config" {
  description = "Base64 encoded kubeconfig for the AKS cluster"
  value       = base64encode(azurerm_kubernetes_cluster.container_registry.kube_config_raw)
  sensitive   = true  # Sensitive to ensure it's handled securely
}
