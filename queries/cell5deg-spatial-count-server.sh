#!/bin/bash
echo "Executing cell5deg spatial count server ..."
source query-config.sh
cd $CURR_BRANCH
java -cp geowave-deploy-0.9.1-SNAPSHOT-tools.jar:geowave-cli-debug-0.9.1-SNAPSHOT.jar mil.nga.giat.geowave.core.cli.GeoWaveMain debug bbox gdelt-accumulo -west 40 -south 40 -east 45 -north 45 -useAggregation
