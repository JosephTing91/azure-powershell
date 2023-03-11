
$rgName = 'sandbox'

#create route table
az network route-table create `
        --name publictable `
        --resource-group $rgName `
        --disable-bgp-route-propagation false


#create route table route
az network route-table route create `
        --route-table-name publictable `
        --resource-group $rgName  `
        --name productionsubnet `
        --address-prefix 10.0.1.0/24 `
        --next-hop-type VirtualAppliance `
        --next-hop-ip-address 10.0.2.4


#create vnet
az network vnet create `
        --name vnet `
        --resource-group $rgName `
        --address-prefixes 10.0.0.0/16 `
        --subnet-name publicsubnet `
        --subnet-prefixes 10.0.0.0/24


#create subnet
az network vnet subnet create `
        --name privatesubnet `
        --vnet-name vnet `
        --resource-group $rgName `
        --address-prefixes 10.0.1.0/24


#create subnet
az network vnet subnet create `
        --name dmzsubnet `
        --vnet-name vnet `
        --resource-group $rgName `
        --address-prefixes 10.0.2.0/24


#show subnets
az network vnet subnet list `
        --resource-group $rgName `
        --vnet-name vnet `
        --output table


#assocate route tabe with public subnet
az network vnet subnet update `
        --name publicsubnet `
        --vnet-name vnet `
        --resource-group $rgName `
        --route-table publictable