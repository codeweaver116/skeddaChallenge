
# Generate a random integer to create a globally unique name
resource "random_integer" "ri" {
  min = 10000
  max = 99999
}

# Create the Linux App Service Plan
resource "azurerm_service_plan" "skedda_app_service_plan" {
  name                = "${var.skedda_app_service_plan}-${random_integer.ri.result}"
  location = azurerm_resource_group.skedda_resource.location
  resource_group_name = azurerm_resource_group.skedda_resource.name
  os_type             = var.skedda_app_service_os
  sku_name            = "Standard"
  app_settings {
     "DbConnectionString" = "Server=tcp:${azurerm_mssql_server.skedda_sql_server.fully_qualified_domain_name},1433;Initial Catalog=${azurerm_mssql_database.skedda_db.name};Persist Security Info=False;User ID=${azurerm_mssql_server.skedda_sql_server.administrator_login};Password=${azurerm_mssql_server.skedda_sql_server.administrator_login_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
   }
  tags = {

    environment = "dev"
 }
}

# Create the web app, pass in the App Service Plan ID
resource "azurerm_linux_web_app" "webapp" {
  name                  = "${var.skedda_app_service_name}-${random_integer.ri.result}"
  location = azurerm_resource_group.skedda_resource.location
  resource_group_name = azurerm_resource_group.skedda_resource.name
  service_plan_id       = azurerm_service_plan.skedda_app_service_plan.id
  https_only            = true
  site_config { 
    minimum_tls_version = "1.2"
  }

  depends_on = [
    
    azurerm_service_plan.skedda_app_service_plan,
    azurerm_mssql_server.skedda_sql_server,
    azurerm_mssql_database.skedda_db,

  ]

  tags = {
    environment = "dev"
 }

}

#  Deploy code from a public GitHub repo
resource "azurerm_app_service_source_control" "sourcecontrol" {
  app_id             = azurerm_linux_web_app.webapp.id
  repo_url           = var.skedda_app_github_url
  branch             = "main"
  use_manual_integration = true
  use_mercurial      = false

  tags = {
    environment = "dev"
 }

}

