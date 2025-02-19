param accessPolicies array = []
param kvName string
param location string = resourceGroup().location

resource keyvault 'Microsoft.KeyVault/vaults@2020-04-01-preview' = {
  name: kvName
  location: location
  properties: {
    tenantId: subscription().tenantId
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: accessPolicies
    enableSoftDelete: false
  }
}

output name string = keyvault.name
