#!/bin/bash

# script to delete all Kubernetes resources for the ESGF Solr Cloud cluster

kubectl delete deployment,svc,jobs,ingress,statefulset -l stack=esgf-solr-cloud

kubectl delete pvc -l stack=esgf-solr-cloud

