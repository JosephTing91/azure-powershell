

#Launch network virtual appliance
az vm create `
    --resource-group sandbox `
    --name nva `
    --vnet-name vnet `
    --subnet dmzsubnet `
    --image UbuntuLTS `
    --admin-username azureuser `
    --admin-password Y@mantaka1991


#enable IP forwarding for the Azure network interface

#Run the following command to get the ID of the NVA network interface.

$NICID= az vm nic list --resource-group sandbox --vm-name nva --query "[].{id:id}" --output tsv

echo $NICID

#Run the following command to get the name of the NVA network interface.

$NICNAME=az vm nic show `
    --resource-group sandbox `
    --vm-name nva `
    --nic $NICID `
    --query "{name:name}" --output tsv

echo $NICNAME

#Run the following command to enable IP forwarding for the network interface.
az network nic update --name $NICNAME `
    --resource-group sandbox `
    --ip-forwarding true

#Enable IP forwarding in the appliance

#get ip address
$NVAIP=az vm list-ip-addresses `
    --resource-group sandbox `
    --name nva `
    --query "[].virtualMachine.network.publicIpAddresses[*].ipAddress" `
    --output tsv

echo $NVAIP

#Run the following command to enable IP forwarding within the NVA.
ssh -t -o StrictHostKeyChecking=no azureuser@$NVAIP 'sudo sysctl -w net.ipv4.ip_forward=1; exit;'


#Exercise - Route traffic through the NVA


#create pub and private VMs

#create user data for VMs
code cloud-init.txt

#paste following, press CTRL+S and CTRL+Q
#cloud-config
package_upgrade: true
packages:
   - inetutils-traceroute



az vm create `
    --resource-group sandbox `
    --name public `
    --vnet-name vnet `
    --subnet publicsubnet `
    --image UbuntuLTS `
    --admin-username azureuser `
    --no-wait `
    --custom-data cloud-init.txt `
    --admin-password Y@mantaka1991


az vm create `
    --resource-group sandbox `
    --name private `
    --vnet-name vnet `
    --subnet privatesubnet `
    --image UbuntuLTS `
    --admin-username azureuser `
    --no-wait `
    --custom-data cloud-init.txt `
    --admin-password Y@mantaka1991



$PUBLICIP=az vm list-ip-addresses `
    --resource-group sandbox `
    --name public `
    --query "[].virtualMachine.network.publicIpAddresses[*].ipAddress" `
    --output tsv

echo $PUBLICIP


$PRIVATEIP=az vm list-ip-addresses `
    --resource-group sandbox `
    --name private `
    --query "[].virtualMachine.network.publicIpAddresses[*].ipAddress" `
    --output tsv

echo $PRIVATEIP


#using bash, run following to trace routes...


ssh -t -o StrictHostKeyChecking=no azureuser@$PUBLICIP 'traceroute private --type=icmp; exit'

#since private is using default route, it goes straight to public instead of through NVA
ssh -t -o StrictHostKeyChecking=no azureuser@$PRIVATEIP 'traceroute public --type=icmp; exit'

