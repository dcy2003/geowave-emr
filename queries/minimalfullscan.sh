#!/bin/bash
echo "Executing minimalfullscan ..."
source query-config.sh
cd $CURR_BRANCH
java -cp geowave-deploy-0.9.1-SNAPSHOT-tools.jar:geowave-cli-debug-0.9.1-SNAPSHOT.jar mil.nga.giat.geowave.core.cli.GeoWaveMain -fullscanMinimal -gwNamespace geowave.gdelt -zookeeper $HOSTNAME:2181 -instance accumulo -user geowave -password geowave -indexId "SPATIAL_IDX_ROUND_ROBIN_32"
