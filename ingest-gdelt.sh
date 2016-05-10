#!/bin/bash
echo "Ingesting GDELT data ..."
source geowave-env.sh

cd ../0.9.1

java -cp geowave-deploy-0.9.1-SNAPSHOT-tools.jar:geowave-format-gdelt-0.9.1-SNAPSHOT.jar mil.nga.giat.geowave.core.cli.GeoWaveMain -localingest -f gdelt -b $STAGING_DIR/gdelt -dim spatial -cql "BBOX(geometry,-180,-90,180,90)" -gwNamespace geowave.gdelt -datastore accumulo -zookeeper $HOSTNAME:2181 -instance $INSTANCE -user geowave -password geowave -partitionStrategy round_robin -numPartitions $NUM_PARTITIONS
