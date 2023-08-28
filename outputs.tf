output "resource_group_id" {
  description = "ID of the created Azure Resource Group"
  value       = azurerm_resource_group.my_resource_group.id
}

output "resource_group_name" {
  description = "Name of the created Azure Resource Group"
  value       = azurerm_resource_group.my_resource_group.name
}

output "resource_group_location" {
  description = "Location of the created Azure Resource Group"
  value       = azurerm_resource_group.my_resource_group.location
}
