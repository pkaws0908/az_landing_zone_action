data "azurerm_key_vault" "kevault" {
    for_each = var.var_username
  name                = each.value.keyvault_name
  resource_group_name = each.value.rg_name
}
