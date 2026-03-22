resource "azurerm_public_ip" "publicip" {
    for_each = var.var_pip
  name                = each.value.name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method

}