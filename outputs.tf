output "id" {
  description = "The ID of the Key Vault."
  value       = azurerm_key_vault.main.id
}

output "name" {
  description = "Name of key vault created."
  value       = azurerm_key_vault.main.name
}

output "vault_uri" {
  description = "The URI of the Key Vault, used for performing operations on keys and secrets."
  value       = azurerm_key_vault.main.vault_uri
}