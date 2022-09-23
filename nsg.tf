resource "azurerm_network_security_group" "main" {
  name                = "Server-NSG"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name


  security_rule {
    name                       = "Allow-SSH"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow-Storage"
    priority                   = 115
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "Storage"
  }

  security_rule {
    name                       = "Deny-Internet-"
    priority                   = 125
    direction                  = "Outbound"
    access                     = "Deny"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "Internet"
  }

  # security_rule {
  #   name                       = "Allow-App"
  #   priority                   = 120
  #   direction                  = "Inbound"
  #   access                     = "Deny"
  #   protocol                   = "Tcp"
  #   source_port_range          = "*"
  #   destination_port_range     = "80"
  #   # source_address_prefixes      = ["10.0.2.0/24"]
  #   source_application_security_group_ids = [azurerm_application_security_group.dbs.id]
  #   # destination_address_prefixes = ["10.0.1.0/24"]
  #   destination_application_security_group_ids = [azurerm_application_security_group.web.id]
  # }

#   security_rule {
#     name                       = "Allow-App-out"
#     priority                   = 120
#     direction                  = "Outbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "80"
#     source_address_prefixes      = ["10.0.2.4"]
#     destination_address_prefixes = ["10.0.1.4"]
#   }
}

resource "azurerm_network_interface_security_group_association" "app" {
  network_interface_id      = azurerm_network_interface.web.id
  network_security_group_id = azurerm_network_security_group.main.id
}

