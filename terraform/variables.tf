variable "resouce_group" {
  type    = string
  default = "mm"
}

variable "resource_location" {
  type    = string
  default = "eastus2"
}

variable "sql_server_name" {
  type    = string
  default = "MM-skedda-db-server"
}

variable "sql_db_name" {
  type    = string
  default = "MM-skedda-db"
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
  default = "MM-skedda-blob"
}

variable "skedda_app_service_plan" {
  type    = string
  default = "ASP-mm-81b0"
}

variable "skedda_app_service_name" {
  type    = string
  default = "MM-skedda-app-webapp"
}


variable "skedda_app_github_url" {
  type    = string
  default = "https://github.com/codeweaver116/skeddaChallenge"
}

variable "skedda_app_service_os" {
  type    = string
  default = "Linux"
}