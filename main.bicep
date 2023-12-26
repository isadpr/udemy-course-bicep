@description('Tags for the resources')
param tags object = {}

@description('Name of the storage account')
@minLength(3)
@maxLength(24)
param storageAccountName string

@description('Name of the audit storage account')
@minLength(3)
@maxLength(24)
param auditStorageAccountName string

@description('Name of the storage account sku')
@allowed([
    'Standard_LRS'
    'Standard_GRS'
])
param storageAccountSku string

@description('Location of the resources')
param location string = 'westeurope'

// @description('Support HTTPS traffic only')
// param supportHttpsTraffic bool = true

// var storageAccountKind = 'StorageV2'

// var storageAccountProperties = {
//   minimunTlsVersion: 'TLS1_2'
//   supportsHttpsTrafficOnly: supportHttpsTraffic
// }

module storageAccount 'modules/storage-account.bicep' = {
  name: 'deploy-${storageAccountName}' 
  params: {
    location: location
    tags: tags
    storageAccountName: storageAccountName
    storageAccountSku: storageAccountSku
  }
}

module auditStorageAccount 'modules/storage-account.bicep' = {
  name: 'deploy-${auditStorageAccountName}' 
  params: {
    location: location
    tags: tags
    storageAccountName: storageAccountName
    storageAccountSku: storageAccountSku
  }
}


output storageAccountId string = storageAccount.outputs.storageAccountId
output auditStorageAccountId string = auditStorageAccount.outputs.storageAccountId

output storageAccountName string = storageAccount.outputs.storageAccountName
output auditStorageAccountName string = auditStorageAccount.outputs.storageAccountName



// resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
//   name: storageAccountName
//   tags: tags
//   location: location
//   sku: {
//     name: storageAccountSku
//   }
//   kind: storageAccountKind
// }

// resource auditStorageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
//   name: auditStorageAccountName
//   tags: tags
//   location: location
//   sku: {
//     name: storageAccountSku
//   }
//   kind: storageAccountKind
//   properties: storageAccountProperties
// }

