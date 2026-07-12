output "monitor_diagnostic_settings_enabled_log" {
  description = "Map of enabled_log values across all monitor_diagnostic_settings, keyed the same as var.monitor_diagnostic_settings"
  value       = { for k, v in azurerm_monitor_diagnostic_setting.monitor_diagnostic_settings : k => v.enabled_log }
}
output "monitor_diagnostic_settings_enabled_metric" {
  description = "Map of enabled_metric values across all monitor_diagnostic_settings, keyed the same as var.monitor_diagnostic_settings"
  value       = { for k, v in azurerm_monitor_diagnostic_setting.monitor_diagnostic_settings : k => v.enabled_metric }
}
output "monitor_diagnostic_settings_eventhub_authorization_rule_id" {
  description = "Map of eventhub_authorization_rule_id values across all monitor_diagnostic_settings, keyed the same as var.monitor_diagnostic_settings"
  value       = { for k, v in azurerm_monitor_diagnostic_setting.monitor_diagnostic_settings : k => v.eventhub_authorization_rule_id }
}
output "monitor_diagnostic_settings_eventhub_name" {
  description = "Map of eventhub_name values across all monitor_diagnostic_settings, keyed the same as var.monitor_diagnostic_settings"
  value       = { for k, v in azurerm_monitor_diagnostic_setting.monitor_diagnostic_settings : k => v.eventhub_name }
}
output "monitor_diagnostic_settings_log_analytics_destination_type" {
  description = "Map of log_analytics_destination_type values across all monitor_diagnostic_settings, keyed the same as var.monitor_diagnostic_settings"
  value       = { for k, v in azurerm_monitor_diagnostic_setting.monitor_diagnostic_settings : k => v.log_analytics_destination_type }
}
output "monitor_diagnostic_settings_log_analytics_workspace_id" {
  description = "Map of log_analytics_workspace_id values across all monitor_diagnostic_settings, keyed the same as var.monitor_diagnostic_settings"
  value       = { for k, v in azurerm_monitor_diagnostic_setting.monitor_diagnostic_settings : k => v.log_analytics_workspace_id }
}
output "monitor_diagnostic_settings_metric" {
  description = "Map of metric values across all monitor_diagnostic_settings, keyed the same as var.monitor_diagnostic_settings"
  value       = { for k, v in azurerm_monitor_diagnostic_setting.monitor_diagnostic_settings : k => v.metric }
}
output "monitor_diagnostic_settings_name" {
  description = "Map of name values across all monitor_diagnostic_settings, keyed the same as var.monitor_diagnostic_settings"
  value       = { for k, v in azurerm_monitor_diagnostic_setting.monitor_diagnostic_settings : k => v.name }
}
output "monitor_diagnostic_settings_partner_solution_id" {
  description = "Map of partner_solution_id values across all monitor_diagnostic_settings, keyed the same as var.monitor_diagnostic_settings"
  value       = { for k, v in azurerm_monitor_diagnostic_setting.monitor_diagnostic_settings : k => v.partner_solution_id }
}
output "monitor_diagnostic_settings_storage_account_id" {
  description = "Map of storage_account_id values across all monitor_diagnostic_settings, keyed the same as var.monitor_diagnostic_settings"
  value       = { for k, v in azurerm_monitor_diagnostic_setting.monitor_diagnostic_settings : k => v.storage_account_id }
}
output "monitor_diagnostic_settings_target_resource_id" {
  description = "Map of target_resource_id values across all monitor_diagnostic_settings, keyed the same as var.monitor_diagnostic_settings"
  value       = { for k, v in azurerm_monitor_diagnostic_setting.monitor_diagnostic_settings : k => v.target_resource_id }
}

