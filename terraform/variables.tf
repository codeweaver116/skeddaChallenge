variable "resouce_group" {
  type    = string
  default = "mm"
}

variable "resource_location" {
  type    = string
  default = "eastus"
}

variable "sql_server_name" {
  type    = string
  default = "mm-skedda-db-server"
}

variable "sql_db_name" {
  type    = string
  default = "mm-skedda-db"
}


variable "sql_server_user" {
  type    = string
  default = "mysqladminun"
}

variable "sql_server_password" {
  # Bad practice
  type    = string
  default = "H@Sh1CoR3!"
}

variable "skedda_blob" {
  type    = string
  default = "mmskeddablob564235"
}

variable "skedda_app_service_plan" {
  type    = string
  default = "ASP-mm-915f"
}

variable "skedda_app_service_name" {
  type    = string
  default = "mm-skedda-app-webapp"
}


variable "skedda_app_github_url" {
  type    = string
  default = "https://github.com/codeweaver116/skeddaChallenge"
}

variable "skedda_app_service_os" {
  type    = string
  default = "Windows"
}

variable "skedda_mssql_firewall_rule" {
  type    = string
  default = "Mssql_FirewallRule"
}

variable "azure_monitor_action_group" {
  type    = string
  default = "skedda_monitor_action_group"
}

variable "metric_alert_scopes" {
  description = "scope of the resource"
  type        = list(string)
  default     = ["/subscriptions"]
}

#All sensitive values should be moved to azure vault.
variable "tenant_id" {
  type    = string
  default = "8af79369-0252-4816-893a-d143b54885e3"
}

variable "client_id" {
  type    = string
  default = "e86f1bfa-58b0-47f2-9dac-6f61de199e08"
}

variable "client_secret" {
  type    = string
  default = "gw88Q~N1Udw_fEEkpneMtwb3idoZhkK2bnywWbMP"
}

variable "subscription_id" {
  type    = string
  default = "b29e0319-fc3e-4a92-a329-2f42a6b55708"
}

