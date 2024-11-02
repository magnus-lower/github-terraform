# List resources containing a specific string in the name
az resource list --query "[?contains(name, 'sa')]" --output table

# List resources of a specific type
az resource list --resource-type "Microsoft.Storage/storageAccounts" --output table

# Get the id of a specific resource
az resource show --resource-group rg-demo-project-a --name sademo66556564543 --resource-type "Microsoft.Storage/storageAccounts" --query id --output tsv

# Creates a json file with the list of resources
az resource list --resource-group rg-demo-project-a --output json > resources.json


# Remove a resource from terraform state
terraform state rm module.storage.azurerm_storage_account.sa-demo 

# Move a resource to another resource group
az resource move --destination-group rg-demo-project-b --ids /subscriptions/4832bdd9-c568-497f-af42-3c45d1e16ef6/resourceGroups/rg-demo-project-a/providers/Microsoft.Storage/storageAccounts/sademo66556564543