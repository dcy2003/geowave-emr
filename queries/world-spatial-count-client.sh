#!/bin/bash
echo "Executing paris spatial count client ..."
source query-config.sh
cd $CURR_BRANCH
java -cp geowave-deploy-0.9.1-SNAPSHOT-tools.jar:geowave-cli-debug-0.9.1-SNAPSHOT.jar mil.nga.giat.geowave.core.cli.GeoWaveMain -bbox -gwNamespace geowave.gdelt -zookeeper $HOSTNAME:2181 -instance accumulo -user geowave -password geowave -west -180 -south -90 -east 180 -north 90
