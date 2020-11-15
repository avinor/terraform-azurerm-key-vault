# Key vault

Terraform module to deploy an Azure Key Vault. It is more or less a simple wrapper around the key vault resource that enforce policies. It can also assign access policies using the `access_policies` variable.

## Usage

A simple example that deploys a key vault with no access policies.

Example uses [tau](https://github.com/avinor/tau) for deployment.

```terraform
module {
    source = "avinor/key-vault/azurerm"
    version = "1.0.0"
}

inputs {
    name = "simple"
    resource_group_name = "simple-kv-rg"
    location = "westeurope"
}
```

It is recommended the to assign access using the `access_policies`variable.

```terraform
module {
    source = "avinor/key-vault/azurerm"
    version = "1.0.0"
}

inputs {
    name = "simple"
    resource_group_name = "simple-kv-rg"
    location = "westeurope"

    access_policies = [
        {
            object_id = "0000-0000-0000"
            certificate_permissions = ["get"]
            key_permissions = ["get"]
            secret_permissions  = ["get"]
            storage_permissions = []
        }
    ]
}
```

## Diagnostics

Diagnostics settings can be sent to either storage account, event hub or Log Analytics workspace. The variable `diagnostics.destination` is the id of receiver, ie. storage account id, event namespace authorization rule id or log analytics resource id. Depending on what id is it will detect where to send. Unless using event namespace the `eventhub_name` is not required, just set to `null` for storage account and log analytics workspace.

Setting `all` in logs and metrics will send all possible diagnostics to destination. If not using `all` type name of categories to send.