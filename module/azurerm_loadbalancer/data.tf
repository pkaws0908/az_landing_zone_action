data "azurerm_public_ip" "datapip" {
  name                = "infrapip01"
  resource_group_name = "pk_rg"
}

data "azurerm_network_interface" "nic" {
      name            = "frontend_nic"
  resource_group_name =  "pk_rg"
}
