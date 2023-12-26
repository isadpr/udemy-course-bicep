//string
var myFirstString = 'mystring${storageAccountName}'
var lowerCase = toLower(myFirstString)
var upperCase = toUpper(myFirstString)
var trimmed = trim(' spaces ')
var sub = substring(trimmed, 0, 2)

//data conversions
var myBool = bool('true')
var myInteger = int('10')
var myString = string(10)

//arrays
var myArray = [
  'mystring'
  'myotherstring'
]

var mySecondArray = [
  'mystring'
  'myotherstring'
]

var myFirstElement = first(myArray)
var arrayContains = contains(myArray, 'mystring') //return boolean
var isArrayEmpty = empty(myArray)

var splitString = split('header1,header2,header3', ',')

var combinedArray = concat(myArray, mySecondArray)
var unionArray = union(myArray, mySecondArray) //doesn't include duplicate values

//scope funcions
var resourceGroupName = resourceGroup().name
var subscriptionId = subscription().id

var storageAccountKey = storageAccount.listKeys().keys[0]

//loading files
var loadedJson = loadJsonContent('example.json')
var jsonContent = loadedJson.storageAccounts[0].name

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

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  tags: tags
  location: location
  sku: {
    name: storageAccountSku
  }
  kind: storageAccountKind
}

