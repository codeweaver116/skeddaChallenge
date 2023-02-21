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
  default = "mm"
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