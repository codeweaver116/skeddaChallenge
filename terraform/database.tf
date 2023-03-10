resource "random_integer" "rii" {
  min = 10000
  max = 99999
}


resource "azurerm_mssql_server" "skedda_sql_server" {
  name                          = "${var.sql_server_name}${azurerm_service_plan.skedda_app_service_plan.location}-${random_integer.rii.result}"
  resource_group_name           = azurerm_resource_group.skedda_resource_group.name
  location                      = azurerm_resource_group.skedda_resource_group.location
  administrator_login           = var.sql_server_user #bad practice use secret vault
  administrator_login_password  = var.sql_server_password
  version                       = "12.0"
  public_network_access_enabled = true
  tags = {

    environment = "dev"

  }

}

resource "azurerm_mssql_database" "skedda_db" {
  name           = "${var.sql_db_name}${azurerm_service_plan.skedda_app_service_plan.location}"
  server_id      = azurerm_mssql_server.skedda_sql_server.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 1
  read_scale     = true
  sku_name       = "S0"
  #zone_redundant = true #Whether or not this database is zone redundant, which means the replicas of this database will be spread across multiple availability zones. This property is only settable for Premium and Business Critical databases.

  tags = {
    environment = "dev"
  }

  depends_on = [
    azurerm_mssql_server.skedda_sql_server,
  ]

}

resource "azurerm_storage_account" "skedda_blob" {
  name                     = "${var.skedda_blob}${azurerm_service_plan.skedda_app_service_plan.location}"
  resource_group_name      = azurerm_resource_group.skedda_resource_group.name
  location                 = azurerm_resource_group.skedda_resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "dev"
  }
}

resource "azurerm_mssql_firewall_rule" "skedda_sql_firewall" {

  for_each         = toset(azurerm_windows_web_app.skedda_webapp.outbound_ip_address_list)
  name             = each.key
  server_id        = azurerm_mssql_server.skedda_sql_server.id
  start_ip_address = each.key
  end_ip_address   = each.key

}


