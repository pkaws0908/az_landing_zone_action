terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.42"
    }
  }

  backend "azurerm" {
 tenant_id = "01243cc1-e80d-488d-9e34-c0c5f65a9974"
    use_cli              = true
    storage_account_name = "stgaccount1290"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
    resource_group_name = "Dev-RG"
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }

  subscription_id = "b45fb524-5427-4292-b739-56b83ea60765"
}
