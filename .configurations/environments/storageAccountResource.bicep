param name string 

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: uniqueString(name,subscription().id,resourceGroup().id)
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
