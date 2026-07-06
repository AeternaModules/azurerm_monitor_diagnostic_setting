output "monitor_diagnostic_settings" {
  description = "All monitor_diagnostic_setting resources"
  value       = azurerm_monitor_diagnostic_setting.monitor_diagnostic_settings
}
output "monitor_diagnostic_settings_enabled_log" {
  description = "List of enabled_log values across all monitor_diagnostic_settings"
  value       = [for k, v in azurerm_monitor_diagnostic_setting.monitor_diagnostic_settings : v.enabled_log]
}
output "monitor_diagnostic_settings_enabled_metric" {
  description = "List of enabled_metric values across all monitor_diagnostic_settings"
  value       = [for k, v in azurerm_monitor_diagnostic_setting.monitor_diagnostic_settings : v.enabled_metric]
}
output "monitor_diagnostic_settings_eventhub_authorization_rule_id" {
  description = "List of eventhub_authorization_rule_id values across all monitor_diagnostic_settings"
  value       = [for k, v in azurerm_monitor_diagnostic_setting.monitor_diagnostic_settings : v.eventhub_authorization_rule_id]
}
output "monitor_diagnostic_settings_eventhub_name" {
  description = "List of eventhub_name values across all monitor_diagnostic_settings"
  value       = [for k, v in azurerm_monitor_diagnostic_setting.monitor_diagnostic_settings : v.eventhub_name]
}
output "monitor_diagnostic_settings_log_analytics_destination_type" {
  description = "List of log_analytics_destination_type values across all monitor_diagnostic_settings"
  value       = [for k, v in azurerm_monitor_diagnostic_setting.monitor_diagnostic_settings : v.log_analytics_destination_type]
}
output "monitor_diagnostic_settings_log_analytics_workspace_id" {
  description = "List of log_analytics_workspace_id values across all monitor_diagnostic_settings"
  value       = [for k, v in azurerm_monitor_diagnostic_setting.monitor_diagnostic_settings : v.log_analytics_workspace_id]
}
output "monitor_diagnostic_settings_metric" {
  description = "List of metric values across all monitor_diagnostic_settings"
  value       = [for k, v in azurerm_monitor_diagnostic_setting.monitor_diagnostic_settings : v.metric]
}
output "monitor_diagnostic_settings_name" {
  description = "List of name values across all monitor_diagnostic_settings"
  value       = [for k, v in azurerm_monitor_diagnostic_setting.monitor_diagnostic_settings : v.name]
}
output "monitor_diagnostic_settings_partner_solution_id" {
  description = "List of partner_solution_id values across all monitor_diagnostic_settings"
  value       = [for k, v in azurerm_monitor_diagnostic_setting.monitor_diagnostic_settings : v.partner_solution_id]
}
output "monitor_diagnostic_settings_storage_account_id" {
  description = "List of storage_account_id values across all monitor_diagnostic_settings"
  value       = [for k, v in azurerm_monitor_diagnostic_setting.monitor_diagnostic_settings : v.storage_account_id]
}
output "monitor_diagnostic_settings_target_resource_id" {
  description = "List of target_resource_id values across all monitor_diagnostic_settings"
  value       = [for k, v in azurerm_monitor_diagnostic_setting.monitor_diagnostic_settings : v.target_resource_id]
}

