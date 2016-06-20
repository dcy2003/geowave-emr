#!/bin/bash
echo "Generating heatmap ..."
source geowave-env.sh

java -cp geowave-tools.jar:geowave-format-gdelt-0.9.1.jar mil.nga.giat.geowave.core.cli.GeoWaveMain config addstore -t accumulo gdelt-accumulo-out --gwNamespace geowave.kde_gdelt --zookeeper $HOSTNAME:2181 --instance $INSTANCE --user geowave --password geowave
java -cp geowave-tools.jar:geowave-format-gdelt-0.9.1.jar mil.nga.giat.geowave.core.cli.GeoWaveMain analytic kde --featureType gdeltevent --minLevel 5 --maxLevel 26 --minSplits $NUM_PARTITIONS --maxSplits $NUM_PARTITIONS --coverageName gdeltevent_kde --hdfsHostPort ${HOSTNAME}:${HDFS_PORT} --jobSubmissionHostPort ${HOSTNAME}:${RESOURCE_MAN_PORT} --tileSize 1 gdelt-accumulo gdelt-accumulo-out

