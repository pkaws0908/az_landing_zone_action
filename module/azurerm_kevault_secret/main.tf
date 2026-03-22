resource "azurerm_key_vault_secret" "secret" {
    for_each = var.var_secret
  name         =  each.value.name
  value        =  each.value.value_secret
  key_vault_id = data.azurerm_key_vault.kevault[each.key].id
}




