# azure-openshift-cicd
ci cd demo in vsts, deploy on openshift using helm as package manager. Instructions here: https://youtu.be/CObbl6F_6Dg

# flow:
![screenshot helm flow](docs/helm-flow.png?raw=true "Screenshot VSTS helm flow")

# steps
* create an account on vsts https://visualstudio.microsoft.com/team-services/
* create a project, config your (github) sources and define a build
* setup your openshift origin environment on azure, instructions on: https://docs.microsoft.com/en-us/azure/virtual-machines/linux/openshift-origin
* create a project and setup your needed roles and accounts
* create a container registy on Azure and create the secret on your openshift project, code is in ./azure folder 
* in VSTS create a PAT (Personal Access Token); click on your Profile Icon, then Security, then navigate to access tokens
* Use this Access Token when you create your buildagent with this command: docker build --build-arg USER=' YOUR OPENSHIFT USERNAME ' --build-arg PASSWORD=' YOUR OPENSHIFT PASSWORD ' --build-arg TILLER_NAMESPACE=' YOUR OPENSHFIT PROJECT ' --build-arg VSTS_ACCOUNT=' YOUR VSTS ACCOUNT ' --build-arg VSTS_TOKEN=' YOUR PAT TOKEN ' --build-arg OS_MASTER_URL=' YOUR OS MASTER URL ' -t buildagent:1.0 . 
* start your docker buildagent with this command: docker run -v /var/run/docker.sock:/var/run/docker.sock -it buildagent:1.0 /bin/bash  (You need the docker reference as you should be able to create docker images within your docker buildagent)...have a look in the buildagent folder
* config your initial build and trigger
* config your release 
* the helloworld example can be found in: examples/hworld/  here you will find how the helm package is configure as well

