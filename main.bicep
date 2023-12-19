resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'stcoursedev'
  location: 'westeurope'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

resource auditStorageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'stcoursedevaudit'
  location: 'westeurope'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    minimumTlsVersion: 'TLS1_2'
    supportsHttpsTrafficOnly:true
  }
}
