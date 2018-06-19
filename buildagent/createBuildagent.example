docker pull microsoft/vsts-agent:ubuntu-16.04-tfs-2018


docker run  \
   -v /var/run/docker.sock:/var/run/docker.sock \
  -it buildagent:2.0 /bin/bash

#  Template
docker build --build-arg USER=' YOUR OPENSHIFT USERNAME ' --build-arg PASSWORD=' YOUR OPENSHIFT PASSWORD ' --build-arg TILLER_NAMESPACE=' YOUR OPENSHFIT PROJECT ' --build-arg VSTS_ACCOUNT=' YOUR VSTS ACCOUNT ' --build-arg VSTS_TOKEN=' YOUR PAT TOKEN ' --build-arg OS_MASTER_URL=' YOUR OS MASTER URL ' -t test:1.0 .


# for eg 
docker build --build-arg USER='chris' --build-arg PASSWORD='SuperSecretPassword' --build-arg TILLER_NAMESPACE='testproject' --build-arg VSTS_ACCOUNT='cvugrinec1' --build-arg VSTS_TOKEN='3z2ceys3kwr3eexf6zchr2for4a6kgxb2gsbc6ojaqjzwudelq4' --build-arg OS_MASTER_URL='https://masterdnss3cwtguwwtmds.westeurope.cloudapp.azure.com:443' -t buildagent:2.0 .
