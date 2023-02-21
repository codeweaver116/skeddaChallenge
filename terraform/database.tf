resource "azurerm_mssql_server" "skedda_sql_server" {
  name                          = "${var.sql_server_name}${data.azurerm_service_plan.skedda_app_service_plan.location}"
  location                      = data.azurerm_service_plan.skedda_app_service_plan.location
  resource_group_name           = var.resouce_group
  administrator_login           = var.sql_server_user #bad practice use secret vault
  administrator_login_password  = var.sql_server_password
  version                       = "12.0"
  public_network_access_enabled = true
  tags = {

    environment = "dev"

  }

}

resource "azurerm_mssql_database" "skedda_db" {
  name         = "${var.sql_db_name}${data.azurerm_service_plan.skedda_app_service_plan.location}"
  server_id    = azurerm_mssql_server.skedda_sql_server.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  tags = {
    environment = "dev"
  }

  depends_on = [
    azurerm_mssql_server.skedda_sql_server,
  ]

}

resource "azurerm_storage_account" "skedda_blob" {
  name                     = "${var.skedda_blob}${data.azurerm_service_plan.skedda_app_service_plan.location}"
  location                 = data.azurerm_service_plan.skedda_app_service_plan.location
  resource_group_name      = var.resouce_group
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "dev"
  }
}

# resource "azurerm_mssql_firewall_rule" "skedda_sql_firewall" {
#   for_each         = toset(azurerm_windows_web_app.skedda_webapp.outbound_ip_address_list)
#   name             = each.key
#   server_id        = azurerm_mssql_server.skedda_sql_server.id
#   start_ip_address = each.key
#   end_ip_address   = each.key

#   depends_on = [

#     azurerm_mssql_server.skedda_sql_server,
#     azurerm_mssql_database.skedda_db,
#     azurerm_windows_web_app.skedda_webapp,
#     azurerm_storage_account.skedda_blob,


#   ]
# }


