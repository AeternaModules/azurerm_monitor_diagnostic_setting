variable "monitor_diagnostic_settings" {
  description = <<EOT
Map of monitor_diagnostic_settings, attributes below
Required:
    - name
    - target_resource_id
Optional:
    - eventhub_authorization_rule_id
    - eventhub_name
    - log_analytics_destination_type
    - log_analytics_workspace_id
    - partner_solution_id
    - storage_account_id
    - enabled_log (block):
        - category (optional)
        - category_group (optional)
    - enabled_metric (block):
        - category (required)
EOT

  type = map(object({
    name                           = string
    target_resource_id             = string
    eventhub_authorization_rule_id = optional(string)
    eventhub_name                  = optional(string)
    log_analytics_destination_type = optional(string)
    log_analytics_workspace_id     = optional(string)
    partner_solution_id            = optional(string)
    storage_account_id             = optional(string)
    enabled_log = optional(list(object({
      category       = optional(string)
      category_group = optional(string)
    })))
    enabled_metric = optional(list(object({
      category = string
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.monitor_diagnostic_settings : (
        v.log_analytics_destination_type == null || (contains(["Dedicated", "AzureDiagnostics"], v.log_analytics_destination_type))
      )
    ])
    error_message = "must be one of: Dedicated, AzureDiagnostics"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_diagnostic_settings : (
        v.enabled_log == null || alltrue([for item in v.enabled_log : (item.category == null || (length(item.category) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_diagnostic_settings : (
        v.enabled_log == null || alltrue([for item in v.enabled_log : (item.category_group == null || (length(item.category_group) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_diagnostic_settings : (
        v.enabled_metric == null || alltrue([for item in v.enabled_metric : (length(item.category) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 15 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

