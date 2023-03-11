
$rgname='sandbox2'
$location='eastus'

New-AzResourceGroup -Name $rgName -Location $location 


az network vnet create `
    --resource-group $rgname `
    --name CoreServicesVnet `
    --address-prefixes 10.20.0.0/16 `
    --location $location

az network vnet subnet create `
    --resource-group $rgname `
    --vnet-name CoreServicesVnet `
    --name GatewaySubnet `
    --address-prefixes 10.20.0.0/27

az network vnet subnet create `
    --resource-group $rgname `
    --vnet-name CoreServicesVnet `
    --name SharedServicesSubnet `
    --address-prefixes 10.20.10.0/24

az network vnet subnet create `
    --resource-group $rgname `
    --vnet-name CoreServicesVnet `
    --name DatabaseSubnet `
    --address-prefixes 10.20.20.0/24

az network vnet subnet create `
    --resource-group $rgname `
    --vnet-name CoreServicesVnet `
    --name PublicWebServiceSubnet `
    --address-prefixes 10.20.30.0/24



az network vnet subnet list `
    --resource-group $rgname `
    --vnet-name CoreServicesVnet `
    --output table




$rgname='sandbox2'

az network vnet create `
    --resource-group $rgname `
    --name ManufacturingVnet `
    --address-prefixes 10.30.0.0/16 `
    --location westus

az network vnet subnet create `
    --resource-group $rgname `
    --vnet-name ManufacturingVnet `
    --name ManufacturingSystemSubnet `
    --address-prefixes 10.30.10.0/24

az network vnet subnet create `
    --resource-group $rgname `
    --vnet-name ManufacturingVnet `
    --name SensorSubnet1 `
    --address-prefixes 10.30.20.0/24

az network vnet subnet create `
    --resource-group $rgname `
    --vnet-name ManufacturingVnet `
    --name SensorSubnet2 `
    --address-prefixes 10.30.21.0/24

az network vnet subnet create `
    --resource-group $rgname `
    --vnet-name ManufacturingVnet `
    --name SensorSubnet3 `
    --address-prefixes 10.30.22.0/24


az network vnet subnet list `
    --resource-group $rgname `
    --vnet-name ManufacturingVnet `
    --output table


    #create ResearchVnet vnet

    az network vnet create `
    --resource-group $rgname `
    --name ResearchVnet `
    --address-prefixes 10.40.40.0/24 `
    --location canadacentral


    az network vnet subnet create `
    --resource-group $rgname `
    --vnet-name ResearchVnet `
    --name ResearchSystemSubnet `
    --address-prefixes 10.40.40.0/24

az network vnet subnet list `
    --resource-group $rgname `
    --vnet-name ResearchVnet `
    --output table
