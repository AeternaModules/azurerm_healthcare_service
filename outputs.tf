output "healthcare_services" {
  description = "All healthcare_service resources"
  value       = azurerm_healthcare_service.healthcare_services
}
output "healthcare_services_access_policy_object_ids" {
  description = "List of access_policy_object_ids values across all healthcare_services"
  value       = [for k, v in azurerm_healthcare_service.healthcare_services : v.access_policy_object_ids]
}
output "healthcare_services_authentication_configuration" {
  description = "List of authentication_configuration values across all healthcare_services"
  value       = [for k, v in azurerm_healthcare_service.healthcare_services : v.authentication_configuration]
}
output "healthcare_services_configuration_export_storage_account_name" {
  description = "List of configuration_export_storage_account_name values across all healthcare_services"
  value       = [for k, v in azurerm_healthcare_service.healthcare_services : v.configuration_export_storage_account_name]
}
output "healthcare_services_cors_configuration" {
  description = "List of cors_configuration values across all healthcare_services"
  value       = [for k, v in azurerm_healthcare_service.healthcare_services : v.cors_configuration]
}
output "healthcare_services_cosmosdb_key_vault_key_versionless_id" {
  description = "List of cosmosdb_key_vault_key_versionless_id values across all healthcare_services"
  value       = [for k, v in azurerm_healthcare_service.healthcare_services : v.cosmosdb_key_vault_key_versionless_id]
}
output "healthcare_services_cosmosdb_throughput" {
  description = "List of cosmosdb_throughput values across all healthcare_services"
  value       = [for k, v in azurerm_healthcare_service.healthcare_services : v.cosmosdb_throughput]
}
output "healthcare_services_identity" {
  description = "List of identity values across all healthcare_services"
  value       = [for k, v in azurerm_healthcare_service.healthcare_services : v.identity]
}
output "healthcare_services_kind" {
  description = "List of kind values across all healthcare_services"
  value       = [for k, v in azurerm_healthcare_service.healthcare_services : v.kind]
}
output "healthcare_services_location" {
  description = "List of location values across all healthcare_services"
  value       = [for k, v in azurerm_healthcare_service.healthcare_services : v.location]
}
output "healthcare_services_name" {
  description = "List of name values across all healthcare_services"
  value       = [for k, v in azurerm_healthcare_service.healthcare_services : v.name]
}
output "healthcare_services_public_network_access_enabled" {
  description = "List of public_network_access_enabled values across all healthcare_services"
  value       = [for k, v in azurerm_healthcare_service.healthcare_services : v.public_network_access_enabled]
}
output "healthcare_services_resource_group_name" {
  description = "List of resource_group_name values across all healthcare_services"
  value       = [for k, v in azurerm_healthcare_service.healthcare_services : v.resource_group_name]
}
output "healthcare_services_tags" {
  description = "List of tags values across all healthcare_services"
  value       = [for k, v in azurerm_healthcare_service.healthcare_services : v.tags]
}

