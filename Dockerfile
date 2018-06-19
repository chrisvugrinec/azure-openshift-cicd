FROM microsoft/vsts-agent:ubuntu-16.04-docker-17.12.0-ce

ARG USER
ARG PASSWORD
ARG TILLER_NAMESPACE
ARG VSTS_ACCOUNT
ARG VSTS_TOKEN
ARG OS_MASTER_URL

COPY bin/oc /usr/local/bin/oc
COPY bin/helm /usr/local/bin/helm

ENV VSTS_ACCOUNT $VSTS_ACCOUNT
ENV VSTS_TOKEN $VSTS_TOKEN
ENV TILLER_NAMESPACE=$TILLER_NAMESPACE

RUN oc login $OS_MASTER_URL -u=$USER -p=$PASSWORD --insecure-skip-tls-verify
RUN oc process -f https://github.com/openshift/origin/raw/master/examples/helm/tiller-template.yaml -p TILLER_NAMESPACE=$TILLER_NAMESPACE -p HELM_VERSION=v2.9.0 | oc create -f -
RUN helm init --tiller-namespace=$TILLER_NAMESPACE
RUN oc adm policy add-role-to-user admin system:serviceaccount:$TILLER_NAMESPACE:tiller
