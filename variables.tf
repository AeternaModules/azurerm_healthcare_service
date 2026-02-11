variable "healthcare_services" {
  description = <<EOT
Map of healthcare_services, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - access_policy_object_ids
    - configuration_export_storage_account_name
    - cosmosdb_key_vault_key_versionless_id
    - cosmosdb_throughput
    - kind
    - public_network_access_enabled
    - tags
    - authentication_configuration (block):
        - audience (optional)
        - authority (optional)
        - smart_proxy_enabled (optional)
    - cors_configuration (block):
        - allow_credentials (optional)
        - allowed_headers (optional)
        - allowed_methods (optional)
        - allowed_origins (optional)
        - max_age_in_seconds (optional)
    - identity (block):
        - type (required)
EOT

  type = map(object({
    location                                  = string
    name                                      = string
    resource_group_name                       = string
    access_policy_object_ids                  = optional(set(string))
    configuration_export_storage_account_name = optional(string)
    cosmosdb_key_vault_key_versionless_id     = optional(string)
    cosmosdb_throughput                       = optional(number) # Default: 1000
    kind                                      = optional(string) # Default: "fhir"
    public_network_access_enabled             = optional(bool)   # Default: true
    tags                                      = optional(map(string))
    authentication_configuration = optional(object({
      audience            = optional(string)
      authority           = optional(string)
      smart_proxy_enabled = optional(bool)
    }))
    cors_configuration = optional(object({
      allow_credentials  = optional(bool)
      allowed_headers    = optional(set(string))
      allowed_methods    = optional(list(string))
      allowed_origins    = optional(set(string))
      max_age_in_seconds = optional(number)
    }))
    identity = optional(object({
      type = string
    }))
  }))
}

