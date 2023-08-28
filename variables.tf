#RG_Name
resourcegroup=  {
  "rg_name"        = "bdaas-eu-rg"
  "location"       = "eastus"
}

variable "resource_group_name" {
  type        = string
  default     = "bdaas-eu-rg"
  description = "Resource Group Name"
}

variable "resource_group_location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group."
}
variable "storage_account_name" {
  type        = string
  default     = "bdaaseustorage01"
  description = "Storage account name."
}