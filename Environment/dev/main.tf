module "resource_group" {
  rg     = var.module_rg
  source = "../../module/azurerm_resource_group"
}

#---------------------azurerm_storage_ac--------------

module "storage_account" {

  source = "../../module/azurerm_storage_account"

  var_sa = var.module_sa

  depends_on = [module.resource_group]

}
#------------Vnet-------------------

module "vnet" {
  var_vnet   = var.module_vnet
  source     = "../../module/azurerm_virtual_network"
  depends_on = [module.resource_group]

}

#--------------subnet------------
module "subnet" {
  var_subnet = var.module_subnet
  source     = "../../module/azurern_subnet"
  depends_on = [var.module_vnet]
}

#---------------NSG------------------

module "nsg" {
  var_nsg    = var.module_nsg
  source     = "../../module/azurerm_nsg"
  depends_on = [module.vnet]
}

#----------------nic-----------

module "nic" {
  var_nic    = var.module_nic
  source     = "../../module/azurerm_nic"
  depends_on = [module.subnet]

}

#---------------PIP-----------------
module "pip" {
  var_pip = var.module_pip
  source  = "../../module/azurerm_publicip"

}
#----------------keyvault----------------

module "keyvault" {
  var_keyvault = var.module_keyvault
  source       = "../../module/azurerm_key_vault"
  depends_on   = [module.resource_group]
}

#---------------kevaule_Secret----------------

module "keyvault_secret" {
  var_secret = var.module_secret
  source     = "../../module/azurerm_kevault_secret"

  depends_on = [module.keyvault]

}

module "keyvault_user" {
  var_username = var.module_username
  source       = "../../module/azurerm_keyvault_username"
  depends_on   = [module.keyvault]

}

#-------------------------vm-------------

# module "vm" {

#   var_vm = var.module_vm

#   source     = "../../module/azurerm_virtual_machine"
#   depends_on = [module.resource_group, module.keyvault, module.vnet]


# }

#-----------------bastian_Host-----------------

module "bastian_host" {
  var_bastian = var.module_bastian
  source      = "../../module/azurerm_bastian_host"

  depends_on = [module.subnet, module.pip]

}

#------------------sqlserver---------------------------

module "sql_server" {
  var_mssql = var.module_mssql
  source    = "../../module/azurerm_sql_server"

  depends_on = [module.resource_group, module.keyvault]

}

module "sql_db" {
  var_sqldb  = var.module_sqldb
  source     = "../../module/azurerm_mssql_database"
  depends_on = [module.sql_server]

}

#---------------LoadBalancer-------------

module "lb" {
  var_lb     = var.module_lb
  source     = "../../module/azurerm_loadbalancer"
  depends_on = [module.resource_group, module.pip]
}

#---------------------------------VMSS-----------------

module "vmss" {
  var_vmss   = var.module_vmss
  source     = "../../module/azurerm_vmss"
  depends_on = [module.resource_group, module.keyvault, module.vnet]

}