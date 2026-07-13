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
    enabled_log = optional(list(object({
      category       = optional(string)
      category_group = optional(string)
      retention_policy = optional(object({
        days    = optional(number)
        enabled = bool
      }))
    })))
    enabled_metric = optional(list(object({
      category = string
    })))
    metric = optional(list(object({
      category = string
      enabled  = optional(bool)
      retention_policy = optional(object({
        days    = optional(number)
        enabled = bool
      }))
    })))
  }))
  # --- Unconfirmed validation candidates, derived from azurerm_monitor_diagnostic_setting's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.MonitorDiagnosticSettingName] regexp.MustCompile(`[<>*%&:\\?+\/]+`).MatchString(value)
  # path: name
  #   source:    [from validate.MonitorDiagnosticSettingName] len(value) < 1 || len(value) > 260
  # path: target_resource_id
  #   source:    validation.Any(...) - no translation rule yet, add one
  # path: eventhub_name
  #   source:    eventhubValidate.ValidateEventHubName: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: eventhub_authorization_rule_id
  #   source:    [from authRuleParse.ValidateAuthorizationRuleID] !ok
  # path: eventhub_authorization_rule_id
  #   source:    [from authRuleParse.ValidateAuthorizationRuleID] err != nil
  # path: log_analytics_workspace_id
  #   source:    [from workspaces.ValidateWorkspaceID] !ok
  # path: log_analytics_workspace_id
  #   source:    [from workspaces.ValidateWorkspaceID] err != nil
  # path: storage_account_id
  #   source:    [from commonids.ValidateStorageAccountID] !ok
  # path: storage_account_id
  #   source:    [from commonids.ValidateStorageAccountID] err != nil
  # path: partner_solution_id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: partner_solution_id
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: log_analytics_destination_type
  #   condition: contains(["Dedicated", "AzureDiagnostics"], value)
  #   message:   must be one of: Dedicated, AzureDiagnostics
  # path: enabled_log.category
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: enabled_log.category_group
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: enabled_metric.category
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: days
  #   condition: value >= 0
  #   message:   must be at least 0
  # path: category
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: retention_policy.days
  #   condition: value >= 0
  #   message:   must be at least 0
}

