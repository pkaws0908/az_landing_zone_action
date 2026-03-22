resource "azurerm_mssql_server" "example" {
    for_each = var.var_mssql
  name                         = each.value.name
  resource_group_name          = each.value.rg_name
  location                     = each.value.location
  version                      = "12.0"
  administrator_login          = data.azurerm_key_vault_secret.username[each.key].value
  administrator_login_password = data.azurerm_key_vault_secret.secret[each.key].value
  minimum_tls_version          = "1.2"

}