resource "azurerm_key_vault_secret" "username" {
    for_each = var.var_username
  name         =  each.value.name
  value        =  each.value.value_name
   key_vault_id = data.azurerm_key_vault.kevault[each.key].id
}