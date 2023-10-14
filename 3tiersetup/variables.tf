# resource group common vars
variable "rg_name" {
  type        = string
  description = "Resource group name"
  default     = ""
}

variable "location" {
  type        = string
  description = "The Azure Region"
  default     = ""
}

variable "rg_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
}

variable "virtual_network_name" {
  description = "Name of your Azure Virtual Network"
  type        = string
}

variable "vnet_address_space" {
  description = "The address space to be used for the Azure virtual network."
  type        = list(string)
}

variable "subnet_address_prefix" {
  description = "The address prefix list to use for the subnet"
  type        = list(string)
}

## windows_vm common vars

variable "windows_vm_name" {
  description = "name of the azure vm"
  type        = string
  default     = ""
}

variable "availability_set_id" {
  description = "The ID of the Availability Set in which the Virtual Machine should exist"
  type        = string
  default     = null
}

variable "windows_vm_size" {
  description = "Specifies the size of the virtual machine."
  type        = string
  default     = "Standard_D2s_v3"
}

variable "network_interface_ids" {
  description = "A list of Network Interface ID's which should be associated with the Virtual Machine"
  type        = list(string)
  default     = []
}

# storage os disk vars
variable "storage_os_disk" {
  description = "os disk storage details"
  type        = map(string)
  default     = {}
}

# storage image reference vars
variable "storage_image_reference" {
  description = "Azure Platform Image (e.g. Ubuntu/Windows Server) or a Custom Image"
  type        = map(string)
  default     = {}
}

# os profile vars
variable "os_profile" {
  description = "data disk storage details"
  type        = map(string)
  default     = {}
}

# boot diagnostics vars
variable "boot_diagnostics" {
  description = "boot diagnostics block"
  type        = map(string)
  default     = {}
}
