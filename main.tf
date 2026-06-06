resource "azurerm_resource_group" "test" {
  for_each = var.rgs
  name     = each.value.name
  location = each.value.location
}
resource "azurerm_storage_account" "teststa" {
  for_each                 = var.stg
  depends_on               = [azurerm_resource_group.test]
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}
resource "azurerm_storage_container" "testcontainer" {
  for_each              = var.stg
  depends_on            = [azurerm_storage_account.teststa]
  name                  = "testcontainer"
  storage_account_id    = azurerm_storage_account.teststa[each.key].id
  container_access_type = "private"
}
resource "azurerm_virtual_network" "testvnet" {
  for_each            = var.vnet
  depends_on          = [azurerm_resource_group.test]
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location             = each.value.location
  address_space       = each.value.address_space
}
resource "azurerm_subnet" "testsubnet" {
  for_each             = var.subnet
  depends_on           = [azurerm_virtual_network.testvnet]
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes
}