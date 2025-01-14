// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

@description('Name of the Function App')
param name string = ''

@description('Location to deploy the environment resources')
param location string = 'westus'

var resourceName = !empty(name) ? replace(name, ' ', '-') : 'a${uniqueString(resourceGroup().id)}'

@description('Tags to apply to environment resources')
param tags object = {}

var hostingPlanName = '${resourceName}-hp'
var webAppName = '${resourceName}-web'

resource hostingPlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: hostingPlanName
  location: location
  sku: {
    tier: 'Basic'
    name: 'B1'
    family: 'B'
    capacity: 3
  }
  tags: tags
}

resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: webAppName
  location: location
  properties: {
    serverFarmId: hostingPlan.id
  }
  tags: tags
}
