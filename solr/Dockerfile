#####
## Solr image with custom configuration
#####

FROM solr:7.4

USER root

# Install netcat so we can check if zookeeper is up
RUN apt-get update && apt-get install -y netcat && rm -rf /var/lib/apt/lists/*

# But we want to run the solr command as the solr user
# Use gosu for better sudo, as recommended here: https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#user
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        cron \
        gosu \
    && rm -rf /var/lib/apt/lists/*

# Custom Docker entrypoint script that sets SOLR_HOME permissions and switches to Solr user
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["solr-foreground"]
