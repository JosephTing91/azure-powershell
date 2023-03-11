RESOURCE_GROUP='kubernetes'
AKS_CLUSTER='cluster1'

#connect to the cluster
az aks get-credentials --resource-group $RESOURCE_GROUP --name $AKS_CLUSTER


kubectl create deployment nginx-deployment --image=nginx
kubectl expose deployment nginx-deployment --port=80 --type=LoadBalancer

kubectl scale --replicas=3 deployment/nginx-deployment

#scale nubmer of nodes in cluster with aks

az aks scale --resource-group $RESOURCE_GROUP --name $AKS_CLUSTER --node-count 2


kubectl scale --replicas=10 deployment/nginx-deployment


