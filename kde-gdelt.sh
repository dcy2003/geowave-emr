#!/bin/bash

echo "Running Geowave Yarn Script To Generate KDE ..."
source geowave-env.sh

#export HADOOP_USER_CLASSPATH_FIRST=true
#export HADOOP_CLASSPATH=$(echo /data/06-20-2016/jai/*.jar /data/06-20-2016/*.jar | tr ' ' ':')
#echo "HADOOP_CLASSPATH: " ${HADOOP_CLASSPATH}

#java -cp geowave-tools.jar mil.nga.giat.geowave.core.cli.GeoWaveMain config addstore -t accumulo gdelt-accumulo --gwNamespace geowave.gdelt --zookeeper $HOSTNAME:2181 --instance $INSTANCE --user geowave --password geowave
#java -cp geowave-tools.jar mil.nga.giat.geowave.core.cli.GeoWaveMain config addindex -t spatial gdelt-spatial --partitionStrategy round_robin --numPartitions $NUM_PARTITIONS
java -cp geowave-tools.jar mil.nga.giat.geowave.core.cli.GeoWaveMain config addstore -t accumulo gdelt-accumulo-out --gwNamespace geowave.kde_gdelt --zookeeper $HOSTNAME:2181 --instance $INSTANCE --user geowave --password geowave

ln -s /home/ec2-user/.geowave/0.9.1-config.properties /home/ec2-user/.geowave/unknownversion-config.properties

#yarn jar geowave-tools.jar --debug analytic kde \
hadoop jar geowave-tools.jar analytic kde \
	--featureType gdeltevent \
	--minLevel 5 \
	--maxLevel 26 \
	--minSplits 24 \
	--maxSplits 120 \
	--coverageName gdeltevent_kde \
	--hdfsHostPort ${HOSTNAME}:${HDFS_PORT} \
	--jobSubmissionHostPort ${HOSTNAME}:${RESOURCE_MAN_PORT} \
	--tileSize 1 \
	gdelt-accumulo \
	gdelt-accumulo-out
