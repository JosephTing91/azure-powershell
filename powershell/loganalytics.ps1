

az vm create `
  --resource-group testdr `
  --location eastus `
  --name SampleVM1 `
  --image UbuntuLTS `
  --admin-username azureuser `
  --generate-ssh-keys `
  --verbose

  az vm create `
  --resource-group testdr `
  --location eastus `
  --name SampleVM2 `
  --image UbuntuLTS `
  --admin-username azureuser `
  --generate-ssh-keys `
  --verbose