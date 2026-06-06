rgs = {
  rg1 = {
    name     = "rg-test"
    location = "centralindia"
  }
  rg2 = {
    name     = "rg-test2"
    location = "eastus"
  }
  rg3 = {
    name     = "rg-test3"
    location = "westus"
  }
}

stg = {
  stg1 = {
    name                     = "diltopagalstorage"
    resource_group_name      = "rg-test"
    location                 = "centralindia"
    account_tier             = "Standard"
    account_replication_type = "ZRS"
  }
  stg2 = {
    name                     = "diltopagalstorage2"
    resource_group_name      = "rg-test2"
    location                 = "eastus"
    account_tier             = "Standard"
    account_replication_type = "ZRS"
  }
  stg3 = {
    name                     = "diltopagalstorage3"
    resource_group_name      = "rg-test3"
    location                 = "westus"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}
vnet = {
  vnet1 = {
    name                = "testvnet"
    resource_group_name = "rg-test"
    location             = "centralindia"
    address_space       = ["10.10.0.0/16"]
  }
}
subnet = {
  subnet1 = {
    name                 = "testsubnet"
    resource_group_name  = "rg-test"
    virtual_network_name = "testvnet"
    address_prefixes     = ["10.10.1.0/24"]
  }
  subnet2 = {
    name                 = "testsubnet2"
    resource_group_name  = "rg-test"
    virtual_network_name = "testvnet"
    address_prefixes     = ["10.10.2.0/24"] 
  }
  subnet3 = {
    name                 = "testsubnet3"
    resource_group_name  = "rg-test"
    virtual_network_name = "testvnet"
    address_prefixes     = ["10.10.3.0/24"]
  }
}