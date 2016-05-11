#!/bin/bash
echo "Ingesting GDELT data ..."
source geowave-env.sh
source branch-config.sh

cd ../$CURR_BRANCH

# Add Store
java -cp geowave-deploy-0.9.1-SNAPSHOT-tools.jar:geowave-format-gdelt-0.9.1-SNAPSHOT.jar mil.nga.giat.geowave.core.cli.GeoWaveMain config addstore -t accumulo gdelt-accumulo --gwNamespace geowave.gdelt --zookeeper $HOSTNAME:2181 --instance $INSTANCE --user geowave --password geowave
# Add Index
java -cp geowave-deploy-0.9.1-SNAPSHOT-tools.jar:geowave-format-gdelt-0.9.1-SNAPSHOT.jar mil.nga.giat.geowave.core.cli.GeoWaveMain config addindex -t spatial gdelt-spatial --partitionStrategy round_robin --numPartitions $NUM_PARTITIONS
# Ingest
java -cp geowave-deploy-0.9.1-SNAPSHOT-tools.jar:geowave-format-gdelt-0.9.1-SNAPSHOT.jar mil.nga.giat.geowave.core.cli.GeoWaveMain ingest localtogw $STAGING_DIR/gdelt gdelt-accumulo gdelt-spatial -f gdelt --gdelt.cql "BBOX(geometry,-180,-90,180,90)"
