@description('Tags for the resources')
param tags object = {}

@description('Name of the storage account')
@minLength(3)
@maxLength(24)
param storageAccountName string

@description('Name of the storage account sku')
@allowed([
    'Standard_LRS'
    'Standard_GRS'
])
param storageAccountSku string

@description('Location of the resources')
param location string = 'westeurope'

var storageAccountKind = 'StorageV2'

@description('Support HTTPS traffic only')
param supportHttpsTraffic bool = true

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  tags: tags
  location: location
  sku: {
    name: storageAccountSku
  }
  kind: storageAccountKind
  properties: {
    minimumTlsVersion: 'TLS1_2'
    supportsHttpsTrafficOnly: supportHttpsTraffic
  }
}

output storageAccountName string = storageAccount.name
output storageAccountId string = storageAccount.id

