resource_group_settings = {
test-rg = {
    name            = "test-demo"
    location        = "East US"
    tags            = "test"
}
}
vnet_address_space   = ["10.0.0.0/16"]
virtual_network_name = "test-demo"

subnet_settings = {
  demo = {
    subnet_name           = "websubnet"
    subnet_address_prefix = ["10.0.1.0/24"]

  }}
windows_settings = {
  web = {
    name            = "web"
    windows_vm_size = "Standard_D4s_v5"
    admin_user_key  = "userkey"
    admin_pw_key    = "password"
  }
  app = {
    name            = "app"
    windows_vm_size = "Standard_D4s_v5"
    admin_user_key  = "userkey"
    admin_pw_key    = "password"
  }
  db = {
    name            = "db"
    windows_vm_size = "Standard_D4s_v5"
    admin_user_key  = "userkey"
    admin_pw_key    = "password"
  }

}
