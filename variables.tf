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
        - retention_policy (optional, block):
            - days (optional)
            - enabled (required)
    - enabled_metric (block):
        - category (required)
    - metric (block):
        - category (required)
        - enabled (optional)
        - retention_policy (optional, block):
            - days (optional)
            - enabled (required)
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
    enabled_log = optional(object({
      category       = optional(string)
      category_group = optional(string)
      retention_policy = optional(object({
        days    = optional(number)
        enabled = bool
      }))
    }))
    enabled_metric = optional(object({
      category = string
    }))
    metric = optional(object({
      category = string
      enabled  = optional(bool) # Default: true
      retention_policy = optional(object({
        days    = optional(number)
        enabled = bool
      }))
    }))
  }))
}

