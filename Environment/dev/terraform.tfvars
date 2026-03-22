module_rg = {
  rg1 = {

    name     = "pk_rg"
    location = "Central India"

  }

}

module_sa = {

  sa1 = {

    name                     = "pksavijay005"
    rg_name                  = "pk_rg"
    location                 = "Central India"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
}

module_vnet = {

  vnet1 = {
    name          = "infravnet"
    location      = "Central India"
    rg_name       = "pk_rg"
    address_space = ["10.0.0.0/16"]
  }
}

module_subnet = {
  frontend_subnet = {

    name             = "frontendsubnet"
    vnet_name        = "infravnet"
    rg_name          = "pk_rg"
    address_prefixes = ["10.0.1.0/24"]
  }

  backend_subnet = {

    name             = "backendsubnet"
    vnet_name        = "infravnet"
    rg_name          = "pk_rg"
    address_prefixes = ["10.0.2.0/24"]
  }
  bastion_subnet = {

    name             = "AzureBastionSubnet"
    vnet_name        = "infravnet"
    rg_name          = "pk_rg"
    address_prefixes = ["10.0.3.0/24"]
  }

}
module_nsg = {
  nsg1 = {

    name     = "rule1"
    location = "Central India"
    rg_name  = "pk_rg"
  }
}

module_nic = {
  nic1 = {
    nic_name    = "frontend_nic"
    location    = "Central India"
    rg_name     = "pk_rg"
    subnet_name = "frontendsubnet"
    vnet_name   = "infravnet"
  }

  nic2 = {
    nic_name    = "backend_nic"
    location    = "Central India"
    rg_name     = "pk_rg"
    subnet_name = "backendsubnet"
    vnet_name   = "infravnet"
  }


}

module_pip = {
  pip1 = {

    name              = "infrapip"
    location          = "Central India"
    rg_name           = "pk_rg"
    allocation_method = "Static"

  }

    pip1 = {

    name              = "infrapip01"
    location          = "Central India"
    rg_name           = "pk_rg"
    allocation_method = "Static"

  }
}

module_keyvault = {

  keyvault = {
    name     = "mykeyvault"
    location = "Central India"
    rg_name  = "pk_rg"


  }

}

module_secret = {

  secret1 = {

    name = "mypassword"

    value_secret  = "password"
    keyvault_name = "mykeyvault"

    rg_name = "pk_rg"

  }
}

module_username = {


  secret2 = {

    name = "mysecret"

    value_name    = "sysadmin"
    keyvault_name = "mykeyvault"

    rg_name = "pk_rg"

  }
}

module_vm = {

  frontend_vm = {

    name          = "frontendvm"
    location      = "Central India"
    rg_name       = "pk_rg"
    size          = "Standard_F2"
    nic_name      = "frontend_nic"
    keyvault_name = "mykeyvault"
      secretuser_name = "mysecret"
    secret_name = "mypassword"
    
  }


  backend_vm = {

    name          = "backend"
    location      = "Central India"
    rg_name       = "pk_rg"
    size          = "Standard_F2"
    nic_name      = "backend_nic"
    keyvault_name = "mykeyvault"
    secretuser_name = "mysecret"
    secret_name = "mypassword"

  }
}

module_bastian = {
  bastian_host = {

    name     = "bastianhost"
    location = "Central India"
    rg_name  = "pk_rg"

    subnet_name = "AzureBastionSubnet"
    vnet_name   = "infravnet"
  }
}

module_mssql = {
  mssql = {

    name = "db01"
    rg_name  = "pk_rg"
    location = "Central India"
    keyvault_name = "mykeyvault"
      secretuser_name = "mysecret"
    secret_name = "mypassword"
  }

}

module_sqldb = {
  sqldb = {
    db_name = "mydb01"
    sql_name = "db01"
    rg_name  = "pk_rg"

  }
}

module_lb = {
  lb = {

    name = "mylb"
     location = "Central India"
    rg_name  = "pk_rg"

  }
}