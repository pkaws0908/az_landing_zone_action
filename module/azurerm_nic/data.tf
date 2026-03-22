data "azurerm_subnet" "frontend_subnet" {
    for_each = var.var_nic

  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

