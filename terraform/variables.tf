variable "resouce_group" {
  type = string
  default = "MM_Skedda_Accessment"
}

variable "resource_location" {
  type = string
  default = "e east-us-2"
}

variable "sql_server_name" {
  type = string
  default = "MM_skedda_db_server"
}

variable "sql_db_name" {
  type = string
  default = "MM_skedda_db"
}


variable "sql_server_user" {
  type = string
  default = "mysqladminun"
}

variable "sql_server_password" {
  # Bad practice
  type = string
  default = "H@Sh1CoR3!"
}

variable "skedda_blob" {
  type = string
  default = "MM_skedda_blob"
}

variable "skedda_app_service_plan" {
   type = string
  default = "MM_skedda_app_plan"
}

variable "skedda_app_service_name" {
   type = string
  default = "MM_skedda_app_webapp"
}


variable "skedda_app_github_url" {
   type = string
  default = "https://github.com/codeweaver116/skeddaChallenge"
}

variable "skedda_app_service_os" {
   type = string
  default = "Linux"
}