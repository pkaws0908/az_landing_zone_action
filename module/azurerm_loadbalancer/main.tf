resource "azurerm_lb" "devlb" {
    for_each = var.var_lb

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = data.azurerm_public_ip.datapip.id
  }
}
resource "azurerm_lb_backend_address_pool" "devbackend" {
  for_each = var.var_lb
  loadbalancer_id = azurerm_lb.devlb[each.key].id
  name            = "BackEndAddressPool"
}
resource "azurerm_lb_rule" "devrule" {
for_each = var.var_lb
  loadbalancer_id                = azurerm_lb.devlb[each.key].id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 8080
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
 }

 resource "azurerm_lb_probe" "devprobe" {
  for_each = var.var_lb
  loadbalancer_id = azurerm_lb.devlb[each.key].id
  name            = "http-running-probe"
  port            = 80
}

resource "azurerm_network_interface_backend_address_pool_association" "devniclb" {
  for_each = var.var_lb
  network_interface_id    = data.azurerm_network_interface.nic.id
  ip_configuration_name   = "testconfiguration1"
  backend_address_pool_id = azurerm_lb_backend_address_pool.devbackend[each.key].id
}