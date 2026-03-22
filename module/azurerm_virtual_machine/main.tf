
resource "azurerm_linux_virtual_machine" "example" {
for_each = var.var_vm

  name                = each.value.name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = data.azurerm_key_vault_secret.username[each.key].value
  disable_password_authentication = false
admin_password =data.azurerm_key_vault_secret.secret[each.key].value
  network_interface_ids = [
    data.azurerm_network_interface.nic[each.key].id,]
  

  # admin_ssh_key {
  #   username   = "adminuser"
  #   public_key = file("~/.ssh/id_rsa.pub")
  # }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}