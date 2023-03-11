

$rgname='test-rg'
$location='eastus'

New-AzResourceGroup -Name $rgName -Location $location 

az vm create `
  --resource-group $rgName `
  --location $location `
  --name SampleVM `
  --image UbuntuLTS `
  --admin-username azureuser `
  --generate-ssh-keys `
  --verbose 


az vm image list --output table

az vm image list --sku Wordpress --output table --all
#all microsoft images
az vm image list --publisher Microsoft --output table --all

az vm image list --location eastus --output table



#resize existing vm

az vm list-vm-resize-options `
    --resource-group $rgName `
    --name SampleVM `
    --output table

az vm resize `
    --resource-group $rgName `
    --name SampleVM `
    --size Standard_D2s_v3

#get ip add
az vm list-ip-addresses -n SampleVM -o table

az vm show --resource-group [sandbox resource group name] --name SampleVM

az vm show --resource-group $rgName --name SampleVM


#Add filters to queries with JMESPath

az vm show \
    --resource-group [sandbox resource group name] \
    --name SampleVM \
    --query "osProfile.adminUsername"

--query hardwareProfile.vmSize
--query "networkProfile.networkInterfaces[].id"




az vm show `
    --resource-group $rgName `
    --name SampleVM `
    --query "networkProfile.networkInterfaces[].id" -o tsv




#open port in VM

az vm open-port `
    --port 80 `
    --resource-group $rgname `
    --name SampleVM