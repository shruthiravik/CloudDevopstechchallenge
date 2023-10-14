locals {
  rgname = module.azure_resource_group["test"].az_resource_group_name
  subnet = module.azure_subnet["demo"].az_subnet_name
}
module "azure_resource_group" {
  source   = 
  for_each = var.resource_group_settings
  name     = each.value["name"]
  location = var.location
  rg_tags =  var.tags
}

module "azure_vnet" {
  source               = ""
  virtual_network_name = var.virtual_network_name
  location             = var.location
  resource_group_name  = local.rgname
  vnet_address_space   = var.vnet_address_space
}

module "azure_subnet" {
  source                               = ""
  for_each                             = var.subnet_settings
  subnet_name                          = each.value["subnet_name"]
  subnet_address_prefix                = each.value["subnet_address_prefix"]
  resource_group_name                  = local.zone0_resource_group
  virtual_network_name                 = module.azure_vnet.az_virtual_network_name
}

module "azure_network_interface" {
  source                 = ""
  for_each               = var.windows_settings
  network_interface_name = "${each.value["name"]}-nic-1"
  location               = var.location
  resource_group_name    = local.rg_name
  ip_configuration = [{
    subnet_id = local.subnet
  }]
}

module "azure_windows_virtual_machine" {
  source                           = ""
  for_each                         = var.windows_settings
  windows_vm_name                  = each.value["name"]
  location                         = var.location
  resource_group_name              = local.zone2_ecomeu_rgname
  windows_vm_size                  = each.value["windows_vm_size"]
  admin_username                   = admin
  admin_password                   = password
  network_interface_ids            = [lookup(module.azure_network_interface, each.key)["az_network_interface_id"]]
  license_type                     = "Windows_Server"
  identity                         = var.identity
}
