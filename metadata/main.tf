
provider "azurerm" {
  features {}
}

data "azurerm_virtual_machine" "example" {
  name                = "vm name" 
  resource_group_name = "resourcegroupname"  
}

output "vm_metadata" {
  value = {
    instance_id     = data.azurerm_virtual_machine.example.id
    vm_size         = data.azurerm_virtual_machine.example.hardware_profile.0.vm_size
    os_type         = data.azurerm_virtual_machine.example.storage_os_disk.0.os_type
    os_disk_size_gb = data.azurerm_virtual_machine.example.storage_os_disk.0.disk_size_gb
    private_ip      = data.azurerm_virtual_machine.example.network_interface_ids.0.private_ip_address
    public_ip       = data.azurerm_virtual_machine.example.network_interface_ids.0.ip_configuration_ids.0.public_ip_address
  }
}
