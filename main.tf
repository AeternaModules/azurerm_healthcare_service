resource "azurerm_healthcare_service" "healthcare_services" {
  for_each = var.healthcare_services

  location                                  = each.value.location
  name                                      = each.value.name
  resource_group_name                       = each.value.resource_group_name
  access_policy_object_ids                  = each.value.access_policy_object_ids
  configuration_export_storage_account_name = each.value.configuration_export_storage_account_name
  cosmosdb_key_vault_key_versionless_id     = each.value.cosmosdb_key_vault_key_versionless_id
  cosmosdb_throughput                       = each.value.cosmosdb_throughput
  kind                                      = each.value.kind
  public_network_access_enabled             = each.value.public_network_access_enabled
  tags                                      = each.value.tags

  dynamic "authentication_configuration" {
    for_each = each.value.authentication_configuration != null ? [each.value.authentication_configuration] : []
    content {
      audience            = authentication_configuration.value.audience
      authority           = authentication_configuration.value.authority
      smart_proxy_enabled = authentication_configuration.value.smart_proxy_enabled
    }
  }

  dynamic "cors_configuration" {
    for_each = each.value.cors_configuration != null ? [each.value.cors_configuration] : []
    content {
      allow_credentials  = cors_configuration.value.allow_credentials
      allowed_headers    = cors_configuration.value.allowed_headers
      allowed_methods    = cors_configuration.value.allowed_methods
      allowed_origins    = cors_configuration.value.allowed_origins
      max_age_in_seconds = cors_configuration.value.max_age_in_seconds
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? [each.value.identity] : []
    content {
      type = identity.value.type
    }
  }
}

