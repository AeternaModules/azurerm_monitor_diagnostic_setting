resource "azurerm_monitor_diagnostic_setting" "monitor_diagnostic_settings" {
  for_each = var.monitor_diagnostic_settings

  name                           = each.value.name
  target_resource_id             = each.value.target_resource_id
  eventhub_authorization_rule_id = each.value.eventhub_authorization_rule_id
  eventhub_name                  = each.value.eventhub_name
  log_analytics_destination_type = each.value.log_analytics_destination_type
  log_analytics_workspace_id     = each.value.log_analytics_workspace_id
  partner_solution_id            = each.value.partner_solution_id
  storage_account_id             = each.value.storage_account_id

  dynamic "enabled_log" {
    for_each = each.value.enabled_log != null ? [each.value.enabled_log] : []
    content {
      category       = enabled_log.value.category
      category_group = enabled_log.value.category_group
      dynamic "retention_policy" {
        for_each = enabled_log.value.retention_policy != null ? [enabled_log.value.retention_policy] : []
        content {
          days    = retention_policy.value.days
          enabled = retention_policy.value.enabled
        }
      }
    }
  }

  dynamic "enabled_metric" {
    for_each = each.value.enabled_metric != null ? [each.value.enabled_metric] : []
    content {
      category = enabled_metric.value.category
    }
  }

  dynamic "metric" {
    for_each = each.value.metric != null ? [each.value.metric] : []
    content {
      category = metric.value.category
      enabled  = metric.value.enabled
      dynamic "retention_policy" {
        for_each = metric.value.retention_policy != null ? [metric.value.retention_policy] : []
        content {
          days    = retention_policy.value.days
          enabled = retention_policy.value.enabled
        }
      }
    }
  }
}

