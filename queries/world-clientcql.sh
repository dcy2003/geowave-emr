#!/bin/bash
echo "Executing world clientCql ..."
source query-config.sh
cd $CURR_BRANCH
java -cp geowave-deploy-0.9.1-SNAPSHOT-tools.jar:geowave-cli-debug-0.9.1-SNAPSHOT.jar mil.nga.giat.geowave.core.cli.GeoWaveMain -clientCql -gwNamespace geowave.gdelt -zookeeper $HOSTNAME:2181 -instance accumulo -user geowave -password geowave -cql "BBOX(geometry,-180,-90,180,90)"
