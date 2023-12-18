resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'stbicepcoursedev'
  location: 'westeurope'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
