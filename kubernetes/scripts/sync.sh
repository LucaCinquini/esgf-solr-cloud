#!/bin/bash
# Script to sync all remote ESGF Solr servers to the local Solr Cloud server

# GFDL
kubectl run solr-sync-gfdl --image=esgfhub/esgfpy-solr --restart=OnFailure\
	--schedule="5 * * * *" --overrides='{"spec": {"concurrencyPolicy": "Forbid"}}'\
	--image-pull-policy=Always -- /usr/local/esgfpy-solr/scripts/solr_sync.sh https://esgdata.gfdl.noaa.gov/solr http://solr-load-balancer:8983/solr

# NCCS
kubectl run solr-sync-nccs --image=esgfhub/esgfpy-solr --restart=OnFailure\
	--schedule="10 * * * *" --overrides='{"spec": {"concurrencyPolicy": "Forbid"}}'\
	--image-pull-policy=Always -- /usr/local/esgfpy-solr/scripts/solr_sync.sh https://esgf.nccs.nasa.gov/solr http://solr-load-balancer:8983/solr

# IPSL
kubectl run solr-sync-ipsl --image=esgfhub/esgfpy-solr --restart=OnFailure\
	--schedule="15 * * * *" --overrides='{"spec": {"concurrencyPolicy": "Forbid"}}'\
	--image-pull-policy=Always -- /usr/local/esgfpy-solr/scripts/solr_sync.sh https://esgf-node.ipsl.upmc.fr/solr http://solr-load-balancer:8983/solr

# LLNL
kubectl run solr-sync-llnl --image=esgfhub/esgfpy-solr --restart=OnFailure\
	--schedule="20 * * * *" --overrides='{"spec": {"concurrencyPolicy": "Forbid"}}'\
	--image-pull-policy=Always -- /usr/local/esgfpy-solr/scripts/solr_sync.sh https://esgf-node.llnl.gov/solr http://solr-load-balancer:8983/solr

# DKRZ
kubectl run solr-sync-dkrz --image=esgfhub/esgfpy-solr --restart=OnFailure\
	--schedule="25 * * * *" --overrides='{"spec": {"concurrencyPolicy": "Forbid"}}'\
	--image-pull-policy=Always -- /usr/local/esgfpy-solr/scripts/solr_sync.sh https://esgf-data.dkrz.de/solr http://solr-load-balancer:8983/solr

# LIU
kubectl run solr-sync-liu --image=esgfhub/esgfpy-solr --restart=OnFailure\
	--schedule="30 * * * *" --overrides='{"spec": {"concurrencyPolicy": "Forbid"}}'\
	--image-pull-policy=Always -- /usr/local/esgfpy-solr/scripts/solr_sync.sh https://esg-dn1.nsc.liu.se/solr http://solr-load-balancer:8983/solr

# PIK
kubectl run solr-sync-pik --image=esgfhub/esgfpy-solr --restart=OnFailure\
	--schedule="35 * * * *" --overrides='{"spec": {"concurrencyPolicy": "Forbid"}}'\
	--image-pull-policy=Always -- /usr/local/esgfpy-solr/scripts/solr_sync.sh https://esg.pik-potsdam.de/solr http://solr-load-balancer:8983/solr

# CEDA INDEX1
kubectl run solr-sync-ceda --image=esgfhub/esgfpy-solr --restart=OnFailure\
	--schedule="40 * * * *" --overrides='{"spec": {"concurrencyPolicy": "Forbid"}}'\
	--image-pull-policy=Always -- /usr/local/esgfpy-solr/scripts/solr_sync.sh https://esgf-index1.ceda.ac.uk/solr http://solr-load-balancer:8983/solr

# JPL
kubectl run solr-sync-jpl --image=esgfhub/esgfpy-solr --restart=OnFailure\
	--schedule="45 * * * *" --overrides='{"spec": {"concurrencyPolicy": "Forbid"}}'\
	--image-pull-policy=Always -- /usr/local/esgfpy-solr/scripts/solr_sync.sh https://esgf-node.jpl.nasa.gov/solr http://solr-load-balancer:8983/solr

# NCI
kubectl run solr-sync-nci --image=esgfhub/esgfpy-solr --restart=OnFailure\
	--schedule="50 * * * *" --overrides='{"spec": {"concurrencyPolicy": "Forbid"}}'\
	--image-pull-policy=Always -- /usr/local/esgfpy-solr/scripts/solr_sync.sh http://esgf.nci.org.au/solr http://solr-load-balancer:8983/solr
