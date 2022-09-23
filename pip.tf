resource "azurerm_public_ip" "web" {
  name                = "webserverpip"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  allocation_method   = "Static"

  tags = {
    environment = "DevOps"
  }
}


