#!/bin/bash

# script to delete all Kubernetes resources for the ESGF Solr Cloud cluster

kubectl delete deployment,svc,jobs,ingress,statefulset,pdb -l stack=esgf-solr-cloud

kubectl delete job solr-harvester

kubectl delete pvc,pv -l stack=esgf-solr-cloud
