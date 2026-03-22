data "azurerm_mssql_server" "sqlserver" {
    for_each = var.var_sqldb
  name                = each.value.sql_name
  resource_group_name = each.value.rg_name
}