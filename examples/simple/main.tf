module "simple" {
  source = "../../"

  name                = "simple"
  resource_group_name = "simple-kv-rg"
  location            = "westeurope"
}