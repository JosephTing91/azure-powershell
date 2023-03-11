export RESOURCE_GROUP=rg-contoso-video
export CLUSTER_NAME=aks-contoso-video
export LOCATION=eastus


az group create --name=$RESOURCE_GROUP --location=$LOCATION

az aks create \
    --resource-group $RESOURCE_GROUP \
    --name $CLUSTER_NAME \
    --node-count 2 \
    --enable-addons http_application_routing \
    --generate-ssh-keys \
    --node-vm-size Standard_B2s \
    --network-plugin azure \
    --windows-admin-username localadmin

az aks nodepool add \
    --resource-group $RESOURCE_GROUP \
    --cluster-name $CLUSTER_NAME \
    --name uspool \
    --node-count 2 \
    --node-vm-size Standard_B2s \
    --os-type Windows


az aks get-credentials --name $CLUSTER_NAME --resource-group $RESOURCE_GROUP




#query azure dns zone list

az aks show \
  -g $RESOURCE_GROUP \
  -n $CLUSTER_NAME \
  -o tsv \
  --query addonProfiles.httpApplicationRouting.config.HTTPApplicationRoutingZoneName

#e.g. here is the output
a6eb111c623342adbce6.eastus.aksapp.io





kubectl config delete-context aks-contoso-video



deleted context aks-contoso-video from /home/user/.kube/config

