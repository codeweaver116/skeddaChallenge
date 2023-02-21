resource "azurerm_monitor_action_group" "ag" {
  name                = var.azure_monitor_action_group
  resource_group_name = var.resouce_group
  short_name          = "Skedda_AG"

  email_receiver {
    name          = "SendToMatsumu"
    email_address = "jereco11@gmail.com"
  }

}

resource "azurerm_monitor_metric_alert" "skedda_webapp_Alert" {
  name                 = "${azurerm_windows_web_app.skedda_webapp.name}-$monitoring"
  resource_group_name  = var.resouce_group
  scopes               = var.metric_alert_scopes
  description          = "description"
  target_resource_type = "Microsoft.Web/sites"
  frequency            = "PT5M"
  severity             = 4
  window_size          = "PT5M"

  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "Number of HTTP Request CPU"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 20
  }

  action {
    action_group_id = azurerm_monitor_action_group.ag.id
  }
}



