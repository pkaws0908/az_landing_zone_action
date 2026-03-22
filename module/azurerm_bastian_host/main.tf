resource "azurerm_bastion_host" "bastian" {
    for_each = var.var_bastian
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                 = "infrapip"
    subnet_id            = data.azurerm_subnet.bastian_subnet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pip.id
  }
}