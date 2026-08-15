output "healthcare_services_id" {
  description = "Map of id values across all healthcare_services, keyed the same as var.healthcare_services"
  value       = { for k, v in azurerm_healthcare_service.healthcare_services : k => v.id if v.id != null && length(v.id) > 0 }
}
output "healthcare_services_access_policy_object_ids" {
  description = "Map of access_policy_object_ids values across all healthcare_services, keyed the same as var.healthcare_services"
  value       = { for k, v in azurerm_healthcare_service.healthcare_services : k => v.access_policy_object_ids if v.access_policy_object_ids != null && length(v.access_policy_object_ids) > 0 }
}
output "healthcare_services_authentication_configuration" {
  description = "Map of authentication_configuration values across all healthcare_services, keyed the same as var.healthcare_services"
  value       = { for k, v in azurerm_healthcare_service.healthcare_services : k => one(v.authentication_configuration) if v.authentication_configuration != null && length(v.authentication_configuration) > 0 }
}
output "healthcare_services_configuration_export_storage_account_name" {
  description = "Map of configuration_export_storage_account_name values across all healthcare_services, keyed the same as var.healthcare_services"
  value       = { for k, v in azurerm_healthcare_service.healthcare_services : k => v.configuration_export_storage_account_name if v.configuration_export_storage_account_name != null && length(v.configuration_export_storage_account_name) > 0 }
}
output "healthcare_services_cors_configuration" {
  description = "Map of cors_configuration values across all healthcare_services, keyed the same as var.healthcare_services"
  value       = { for k, v in azurerm_healthcare_service.healthcare_services : k => one(v.cors_configuration) if v.cors_configuration != null && length(v.cors_configuration) > 0 }
}
output "healthcare_services_cosmosdb_key_vault_key_versionless_id" {
  description = "Map of cosmosdb_key_vault_key_versionless_id values across all healthcare_services, keyed the same as var.healthcare_services"
  value       = { for k, v in azurerm_healthcare_service.healthcare_services : k => v.cosmosdb_key_vault_key_versionless_id if v.cosmosdb_key_vault_key_versionless_id != null && length(v.cosmosdb_key_vault_key_versionless_id) > 0 }
}
output "healthcare_services_cosmosdb_throughput" {
  description = "Map of cosmosdb_throughput values across all healthcare_services, keyed the same as var.healthcare_services"
  value       = { for k, v in azurerm_healthcare_service.healthcare_services : k => v.cosmosdb_throughput if v.cosmosdb_throughput != null }
}
output "healthcare_services_identity" {
  description = "Map of identity values across all healthcare_services, keyed the same as var.healthcare_services"
  value       = { for k, v in azurerm_healthcare_service.healthcare_services : k => one(v.identity) if v.identity != null && length(v.identity) > 0 }
}
output "healthcare_services_kind" {
  description = "Map of kind values across all healthcare_services, keyed the same as var.healthcare_services"
  value       = { for k, v in azurerm_healthcare_service.healthcare_services : k => v.kind if v.kind != null && length(v.kind) > 0 }
}
output "healthcare_services_location" {
  description = "Map of location values across all healthcare_services, keyed the same as var.healthcare_services"
  value       = { for k, v in azurerm_healthcare_service.healthcare_services : k => v.location if v.location != null && length(v.location) > 0 }
}
output "healthcare_services_name" {
  description = "Map of name values across all healthcare_services, keyed the same as var.healthcare_services"
  value       = { for k, v in azurerm_healthcare_service.healthcare_services : k => v.name if v.name != null && length(v.name) > 0 }
}
output "healthcare_services_public_network_access_enabled" {
  description = "Map of public_network_access_enabled values across all healthcare_services, keyed the same as var.healthcare_services"
  value       = { for k, v in azurerm_healthcare_service.healthcare_services : k => v.public_network_access_enabled if v.public_network_access_enabled != null }
}
output "healthcare_services_resource_group_name" {
  description = "Map of resource_group_name values across all healthcare_services, keyed the same as var.healthcare_services"
  value       = { for k, v in azurerm_healthcare_service.healthcare_services : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "healthcare_services_tags" {
  description = "Map of tags values across all healthcare_services, keyed the same as var.healthcare_services"
  value       = { for k, v in azurerm_healthcare_service.healthcare_services : k => v.tags if v.tags != null && length(v.tags) > 0 }
}

