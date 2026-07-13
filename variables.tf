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
    cosmosdb_throughput                       = optional(number)
    kind                                      = optional(string)
    public_network_access_enabled             = optional(bool)
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
  validation {
    condition = alltrue([
      for k, v in var.healthcare_services : (
        length(v.name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.healthcare_services : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.healthcare_services : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.healthcare_services : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.healthcare_services : (
        v.cosmosdb_throughput == null || (v.cosmosdb_throughput >= 1 && v.cosmosdb_throughput <= 100000)
      )
    ])
    error_message = "must be between 1 and 100000"
  }
  validation {
    condition = alltrue([
      for k, v in var.healthcare_services : (
        v.access_policy_object_ids == null || (alltrue([for x in v.access_policy_object_ids : can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", x))]))
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.healthcare_services : (
        v.cors_configuration == null || (v.cors_configuration.allowed_origins == null || (alltrue([for x in v.cors_configuration.allowed_origins : length(x) > 0])))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.healthcare_services : (
        v.cors_configuration == null || (v.cors_configuration.allowed_headers == null || (alltrue([for x in v.cors_configuration.allowed_headers : length(x) > 0])))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.healthcare_services : (
        v.cors_configuration == null || (v.cors_configuration.allowed_methods == null || (alltrue([for x in v.cors_configuration.allowed_methods : contains(["DELETE", "GET", "HEAD", "MERGE", "POST", "OPTIONS", "PUT", "PATCH"], x)])))
      )
    ])
    error_message = "must be one of: DELETE, GET, HEAD, MERGE, POST, OPTIONS, PUT, PATCH"
  }
  validation {
    condition = alltrue([
      for k, v in var.healthcare_services : (
        v.cors_configuration == null || (v.cors_configuration.max_age_in_seconds == null || (v.cors_configuration.max_age_in_seconds >= 0 && v.cors_configuration.max_age_in_seconds <= 2000000000))
      )
    ])
    error_message = "must be between 0 and 2000000000"
  }
  validation {
    condition = alltrue([
      for k, v in var.healthcare_services : (
        v.configuration_export_storage_account_name == null || (length(v.configuration_export_storage_account_name) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.healthcare_services : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 9 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

