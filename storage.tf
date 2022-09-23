resource "azurerm_storage_account" "main" {
  name                     = "devlabsvcsa"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

#   network_rules {
#     default_action             = "Deny"
#     virtual_network_subnet_ids = [azurerm_subnet.db.id]
#   }
}

data "archive_file" "main" {
  type        = "zip"
  source_dir  = "./test"
  output_path = "test.zip"
}


resource "azurerm_storage_account_network_rules" "main2" {
  storage_account_id = azurerm_storage_account.main.id
  default_action             = "Allow"
#   ip_rules                   = ["127.0.0.1"]
  virtual_network_subnet_ids = [azurerm_subnet.web.id]
  bypass                     = ["None"]
}

resource "azurerm_storage_share" "main" {
  name                 = "storagesharefile"
  storage_account_name = azurerm_storage_account.main.name
  quota                = 50
}

resource "azurerm_storage_share_file" "main" {
  name             = "test.zip"
  storage_share_id = azurerm_storage_share.main.id
  source           = "./test.zip"
}