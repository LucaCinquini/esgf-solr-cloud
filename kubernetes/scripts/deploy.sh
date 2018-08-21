#!/bin/bash

# script to create the ESGF Solr Cloud cluster
set -e

# root directory of this source code repository
SOURCE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PARENT_DIR="$(dirname $SOURCE_DIR)"
cd $PARENT_DIR

# create Zookeeper deployment
kubectl create -f zookeeper.yaml

# create Solrs statefulset
sleep 5
kubectl create -f solr-nodes.yaml

# minikube: create ingress to cluster
#kubectl create -f ingress.yaml

# GKE: expose through LoadBalancer
# NOTE: must edit file to insert specific static IP
# kubectl create -f solr-proxy.yaml

# run job to configure Solrs
#kubectl create -f solr-config.yaml
