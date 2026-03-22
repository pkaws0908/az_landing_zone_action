data "azurerm_network_interface" "nic" {
    for_each = var.var_vm
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault" "kevault" {
    for_each = var.var_vm
  name                = each.value.keyvault_name
  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault_secret" "secret" {
  for_each =var.var_vm
  name = each.value.secret_name
  key_vault_id = data.azurerm_key_vault.kevault[each.key].id
}

data "azurerm_key_vault_secret" "username" {
    for_each = var.var_vm
name = each.value.secretuser_name
  key_vault_id = data.azurerm_key_vault.kevault[each.key].id
}