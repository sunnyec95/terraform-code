// Resource group create
resource "resourcegroup" "rg_name" {
    name = var.resource_group_name
    location = var.resource_group_location
    tags = {
       App-Code       =      "BDAAS"
       BusinessUnit   =      "CORP"
       Cloud          =      "EastUS"P
       Deploy         =      "Terraform"
       Env            =      "Devlopment"
       Type           =      "IaaS"    
       Resource_type  =      "VM"

    }
}P

// Storage Account
resource "bdaaseustorage01_storage_account" "storageaccount" {
    name                    = var.storage_account_name
    resource_group_name     = azurerm_resource_group.storageaccount.name
    location                = azurerm_resource_group.storageaccount.location
    account_kine            = "StorageV2"
    account_tier            = "Standard"
    account_replication_type = "RA-GRS"

    tags = {
       App-Code       =      "BDAAS"
       BusinessUnit   =      "CORP"
       Cloud          =      "EastUS"
       Deploy         =      "Terraform"
       Env            =      "Devlopment"
       Type           =      "IaaS"    
       Resource_type  =      "Storage"
    }
}

# module "inbound-storage-dfs-private-endpoint" {
#   source  = ""
#   version = ""
#   # insert required variables here
#   endpoint_resource_id = module.inbound_storage_account.id
#   pe_resource_group_name = var.storage_resource_group_name
#   pe_resource_name = ""
#   private_dns_zone_group_name = ""
#   private_dns_zone_ids        = ["{{subscription_link}}/providers/Microsoft.Network/privateDnsZones/privatelink.dfs.core.windows.net"]
#   subresource_names           = ["dfs"]
#   subnet_id = data.azurerm_subnet.private_subnet.id
#   tags =  {
  
#   }
#   depends_on = [
#     module.inbound_storage_account
#   ]

# }
#Container
resource landing_storage_container "landing" {
  container_name                  = "landing"
  storage_account_name  = azurerm_storage_account.storageaccount.name
  container_access_type = "private"
}
resource inbound_storage_container "inbound" {
  container_name                  = "inbound"
  storage_account_name  = azurerm_storage_account.storageaccount.name
  container_access_type = "private"
}
resource outbound_storage_container "outbound" {
  container_name                  = "outbound"
  storage_account_name  = azurerm_storage_account.storageaccount.name
  container_access_type = "private"
}
resource logs_storage_container "logs" {
  container_name                  = "logs"
  storage_account_name  = azurerm_storage_account.storageaccount.name
  container_access_type = "private"
}
resource etl_storage_container "etl" {
  container_name                  = "etl"
  storage_account_name  = azurerm_storage_account.storageaccount.name
  container_access_type = "private"
}
#Blob
resource "landing_storage_container_blob" {
  blob_name                   = "/raw/test.txt"
  account_name   = azurerm_storage_account.storageaccount.name
  container_name = resource.landing_storage_container.name
  type                   = "Block"
}
resource "inbound_storage_container_blob" {
  blob_name                   = "/processed/test.txt"
  account_name   = azurerm_storage_account.storageaccount.name
  container_name = resource.inbound_storage_container.name
  type                   = "Block"
}
resource "inbound_storage_container_blob" {
  blob_name                   = "/history/test.txt"
  account_name   = azurerm_storage_account.storageaccount.name
  container_name = resource.inbound_storage_container.name
  type                   = "Block"
}
resource "outbound_storage_container_blob" {
  blob_name                   = "/extract/test.txt"
  account_name   = azurerm_storage_account.storageaccount.name
  container_name = resource.outbound_storage_container.name
  type                   = "Block"
}
resource "logs_storage_container_blob" {
  blob_name                   = "/ingestion/test.txt"
  account_name   = azurerm_storage_account.storageaccount.name
  container_name = resource.logs_storage_container.name
  type                   = "Block"
}
resource "logs_storage_container_blob" {
  blob_name                   = "/processing/test.txt"
  account_name   = azurerm_storage_account.storageaccount.name
  container_name = resource.logs_storage_container.name
  type                   = "Block"
}
resource "logs_storage_container_blob" {
  blob_name                   = "/extraction/test.txt"
  account_name   = azurerm_storage_account.storageaccount.name
  container_name = resource.logs_storage_container.name
  type                   = "Block"
}
resource "etl_storage_container_blob" {
  blob_name                   = "/Code_base/test.txt"
  account_name   = azurerm_storage_account.storageaccount.name
  container_name = resource.etl_storage_container.name
  type                   = "Block"
}
resource "etl_storage_container_blob" {
  blob_name                   = "/Executables/test.txt"
  account_name   = azurerm_storage_account.storageaccount.name
  container_name = resource.etl_storage_container.name
  type                   = "Block"
}
resource "etl_storage_container_blob" {
  blob_name                   = "/SQL_Queries/test.txt"
  account_name   = azurerm_storage_account.storageaccount.name
  container_name = resource.etl_storage_container.name
  type                   = "Block"
}