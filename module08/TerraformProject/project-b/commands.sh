terraform state rm module.storage.azurerm_storage_account.sa-demo 

az resource move --destination-group rg-demo-project-b \
  --ids /subscriptions/4832bdd9-c568-497f-af42-3c45d1e16ef6/resourceGroups/rg-demo-project-a/providers/Microsoft.Storage/storageAccounts/sabetfs59c04d076a



# List resources of a specific type
az resource list --resource-type "Microsoft.Storage/storageAccounts" --output table

# Get the id of a specific resource
az resource show --resource-group rg-demo-project-b --name sademo66556564543 --resource-type "Microsoft.Storage/storageAccounts" --query id --output tsv


# List tfstate file located in storae account
az storage blob list --account-name sabetfs59c04d076a --container-name tfstate --output table

# Create a json file with the current state file
az storage blob download --account-name sabetfs59c04d076a --container-name tfstate --name åroject_a.tfstate --file project_a.tfstate
az storage blob download --account-name sabetfs59c04d076a --container-name tfstate --name project_b.tfstate --file project_b.tfstate

# Delete tfstate file from storage account
az storage blob delete --account-name sabetfs59c04d076a --container-name tfstate --name åroject_a.tfstate
az storage blob delete --account-name sabetfs59c04d076a --container-name tfstate --name project_b.tfstate