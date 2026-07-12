output "healthcare_services_access_policy_object_ids" {
  description = "Map of access_policy_object_ids values across all healthcare_services, keyed the same as var.healthcare_services"
  value       = { for k, v in azurerm_healthcare_service.healthcare_services : k => v.access_policy_object_ids }
}
output "healthcare_services_authentication_configuration" {
  description = "Map of authentication_configuration values across all healthcare_services, keyed the same as var.healthcare_services"
  value       = { for k, v in azurerm_healthcare_service.healthcare_services : k => v.authentication_configuration }
}
output "healthcare_services_configuration_export_storage_account_name" {
  description = "Map of configuration_export_storage_account_name values across all healthcare_services, keyed the same as var.healthcare_services"
  value       = { for k, v in azurerm_healthcare_service.healthcare_services : k => v.configuration_export_storage_account_name }
}
output "healthcare_services_cors_configuration" {
  description = "Map of cors_configuration values across all healthcare_services, keyed the same as var.healthcare_services"
  value       = { for k, v in azurerm_healthcare_service.healthcare_services : k => v.cors_configuration }
}
output "healthcare_services_cosmosdb_key_vault_key_versionless_id" {
  description = "Map of cosmosdb_key_vault_key_versionless_id values across all healthcare_services, keyed the same as var.healthcare_services"
  value       = { for k, v in azurerm_healthcare_service.healthcare_services : k => v.cosmosdb_key_vault_key_versionless_id }
}
output "healthcare_services_cosmosdb_throughput" {
  description = "Map of cosmosdb_throughput values across all healthcare_services, keyed the same as var.healthcare_services"
  value       = { for k, v in azurerm_healthcare_service.healthcare_services : k => v.cosmosdb_throughput }
}
output "healthcare_services_identity" {
  description = "Map of identity values across all healthcare_services, keyed the same as var.healthcare_services"
  value       = { for k, v in azurerm_healthcare_service.healthcare_services : k => v.identity }
}
output "healthcare_services_kind" {
  description = "Map of kind values across all healthcare_services, keyed the same as var.healthcare_services"
  value       = { for k, v in azurerm_healthcare_service.healthcare_services : k => v.kind }
}
output "healthcare_services_location" {
  description = "Map of location values across all healthcare_services, keyed the same as var.healthcare_services"
  value       = { for k, v in azurerm_healthcare_service.healthcare_services : k => v.location }
}
output "healthcare_services_name" {
  description = "Map of name values across all healthcare_services, keyed the same as var.healthcare_services"
  value       = { for k, v in azurerm_healthcare_service.healthcare_services : k => v.name }
}
output "healthcare_services_public_network_access_enabled" {
  description = "Map of public_network_access_enabled values across all healthcare_services, keyed the same as var.healthcare_services"
  value       = { for k, v in azurerm_healthcare_service.healthcare_services : k => v.public_network_access_enabled }
}
output "healthcare_services_resource_group_name" {
  description = "Map of resource_group_name values across all healthcare_services, keyed the same as var.healthcare_services"
  value       = { for k, v in azurerm_healthcare_service.healthcare_services : k => v.resource_group_name }
}
output "healthcare_services_tags" {
  description = "Map of tags values across all healthcare_services, keyed the same as var.healthcare_services"
  value       = { for k, v in azurerm_healthcare_service.healthcare_services : k => v.tags }
}

