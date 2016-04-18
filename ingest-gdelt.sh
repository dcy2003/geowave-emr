#!/bin/bash
echo "Ingesting GeoWave sample data and running kernel density estimate..."
source geowave-env.sh

mkdir $STAGING_DIR/gdelt;cd $STAGING_DIR/gdelt
# just grab whateve data matches the time regex
wget http://data.gdeltproject.org/events/md5sums
for file in `cat md5sums | cut -d' ' -f3 | grep "^${TIME_REGEX}"` ; do wget http://data.gdeltproject.org/events/$file ; done
md5sum -c md5sums 2>&1 | grep "^${TIME_REGEX}"
cd $STAGING_DIR
# ingest it, indexed spatial only, it can be indexed spatial-temporally by changing -dim, pre-split with 24 shard IDs
geowave -localingest -f gdelt -b $STAGING_DIR/gdelt -dim spatial -cql "BBOX(geometry,${WEST},${SOUTH},${EAST},${NORTH})" -gwNamespace geowave.gdelt -datastore accumulo -zookeeper $HOSTNAME:2181 -instance $INSTANCE -user geowave -password geowave -partitionStrategy round_robin -numPartitions $NUM_PARTITIONS
