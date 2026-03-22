data "azurerm_key_vault" "kevault" {
    for_each = var.var_secret
  name                = each.value.keyvault_name
  resource_group_name = each.value.rg_name
}
