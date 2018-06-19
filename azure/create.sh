echo "name:"
read solname
solname_acr=$(echo $solname | sed 's/[-_!@#$%^&*]//g')
#az acr create -n $solname_acr -g $solname --admin-enabled true --sku Basic
secret=$(az acr credential show -g $solname -n $solname --query passwords[0].value)
url=$(az acr show -g $solname -n $solname --query loginServer)
echo "created acr with url: $url and secret: "$secret


oc create secret docker-registry $solname-secret --docker-server=$url --docker-username=$solname --docker-password=$secret --docker-email=$solname@solname
