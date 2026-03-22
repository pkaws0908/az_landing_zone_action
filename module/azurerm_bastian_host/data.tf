data "azurerm_subnet" "bastian_subnet" {
    for_each = var.var_bastian
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_public_ip" "pip" {
  name                = "infrapip"
  resource_group_name = "pk_rg"
}