variables {
  name                = "simple"
  resource_group_name = "simple-kv-rg"
  location            = "westeurope"
}
run "simple" {
  command = plan
}