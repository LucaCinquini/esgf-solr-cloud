#!/bin/bash

# script to create the ESGF Solr Cloud cluster
set -e
cd ..

# create Zookeeper deployment
kubectl create -f zookeeper.yaml

# create Solrs statefulset
sleep 5
kubectl create -f solr-nodes.yaml

# create ingress to cluster
kubectl create -f ingress.yaml

# run job to configure Solrs
#kubectl create -f solr-config.yaml
