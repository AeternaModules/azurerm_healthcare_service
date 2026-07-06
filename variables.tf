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
        v.cosmosdb_throughput == null || (v.cosmosdb_throughput >= 1 && v.cosmosdb_throughput <= 100000)
      )
    ])
    error_message = "must be between 1 and 100000"
  }
  validation {
    condition = alltrue([
      for k, v in var.healthcare_services : (
        v.access_policy_object_ids == null || (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.access_policy_object_ids)))
      )
    ])
    error_message = "must be a valid UUID"
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
  # --- Unconfirmed validation candidates, derived from azurerm_healthcare_service's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: kind
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: identity.type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: cosmosdb_key_vault_key_versionless_id
  #   source:    [from keyvault.ValidateNestedItemID] !ok
  # path: cosmosdb_key_vault_key_versionless_id
  #   source:    [from keyvault.ValidateNestedItemID] err != nil
  # path: cors_configuration.allowed_origins[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: cors_configuration.allowed_headers[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: cors_configuration.allowed_methods[*]
  #   condition: contains(["DELETE", "GET", "HEAD", "MERGE", "POST", "OPTIONS", "PUT", "PATCH"], value)
  #   message:   must be one of: DELETE, GET, HEAD, MERGE, POST, OPTIONS, PUT, PATCH
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

