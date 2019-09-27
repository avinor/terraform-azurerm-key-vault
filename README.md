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
