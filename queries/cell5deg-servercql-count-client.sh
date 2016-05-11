#!/bin/bash
echo "Executing cell5deg serverCql count client ..."
source query-config.sh
cd $CURR_BRANCH
java -cp geowave-deploy-0.9.1-SNAPSHOT-tools.jar:geowave-cli-debug-0.9.1-SNAPSHOT.jar mil.nga.giat.geowave.core.cli.GeoWaveMain debug serverCql gdelt-accumulo -cql "BBOX(geometry,40,40,45,45)"
