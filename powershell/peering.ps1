

az network vnet peering create \
    --name SalesVNet-To-MarketingVNet \
    --remote-vnet MarketingVNet \
    --resource-group [sandbox resource group name] \
    --vnet-name SalesVNet \
    --allow-vnet-access


az network vnet peering create \
    --name MarketingVNet-To-SalesVNet \
    --remote-vnet SalesVNet \
    --resource-group [sandbox resource group name] \
    --vnet-name MarketingVNet \
    --allow-vnet-access





az network vnet peering list \
    --resource-group [sandbox resource group name] \
    --vnet-name SalesVNet \
    --query "[].{Name:name, Resource:resourceGroup, PeeringState:peeringState, AllowVnetAccess:allowVirtualNetworkAccess}"\
    --output table

az network vnet peering list \
    --resource-group [sandbox resource group name] \
    --vnet-name MarketingVNet \
    --query "[].{Name:name, Resource:resourceGroup, PeeringState:peeringState, AllowVnetAccess:allowVirtualNetworkAccess}"\
    --output table


az network nic show-effective-route-table \
    --resource-group [sandbox resource group name] \
    --name SalesVMVMNic \
    --output table


    
