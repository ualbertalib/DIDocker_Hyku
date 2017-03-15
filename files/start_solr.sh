#!/bin/bash
cd /data
echo 'download_dir: /solr' >> .solr_wrapper
echo 'cloud: false' >> .solr_wrapper
#rm write lock if sorl has not been shut down properly
rm -f /solr/server/server/solr/hydra-development/data/index/write.lock
su solr -c 'bundle exec solr_wrapper --version 6.4.2 -i /solr/server --persist'
