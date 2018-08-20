# Docker image containing Python packege 
# to harvest records from remote ESGF Solr servers

FROM python:2.7

# apply latest security patches
RUN apt-get update && \
    apt-get install -y git

# install python modules
#RUN pip install solrpy

# install ESGF harvesting software
#RUN cd /usr/local && \
#    git clone https://github.com/EarthSystemCoG/esgfpy-publish.git && \
COPY ./esgfpy-publish /usr/local/esgfpy-publish
RUN cd /usr/local/esgfpy-publish && \
    pip install -r requirements.txt
    
ENV PYTHONPATH=/usr/local/esgfpy-publish

