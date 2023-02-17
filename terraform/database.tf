resource "azurerm_mssql_server" "skedda_sql_server" {
  name                = var.sql_server_name
  location            = azurerm_resource_group.skedda_resource.location
  resource_group_name = azurerm_resource_group.skedda_resource.name

  administrator_login          = var.sql_server_user #bad practice use secret vault by automaticaly using terra
  administrator_login_password = var.sql_server_password

  sku_name   = "GP_Gen5_2"
  storage_mb = 5120
  version    =  "12.0"

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = true #Geo-backup_enabled for replication
  infrastructure_encryption_enabled = true  
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"

   tags = {
    environment = "Assesment"
  }
}

resource "azurerm_mssql_database" "skedda_db" {
  name           = "acctest-db-d"
  server_id      = azurerm_mssql_server.skedda_sql_server.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 4
  read_scale     = true
  sku_name       = "S0"
  zone_redundant = true

 tags = {
    environment = "Assesment"
  }
}

resource "azurerm_storage_account" "skedda_blob" {
  name                     = var.skedda_blob
  resource_group_name      = azurerm_resource_group.skedda_resource.name
  location                 = azurerm_resource_group.skedda_resource.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "mssql_user" "example" {
  server {
    host = "example-sql-server.database.windows.net"
    azure_login {
      tenant_id     = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
      client_id     = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
      client_secret = "terriblySecretSecret"
    }
  }
  username = "user@example.com"
  roles    = [ "db_owner" ]
}