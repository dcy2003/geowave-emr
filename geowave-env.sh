#!/bin/bash
export STAGING_DIR=/tmp
export INSTANCE=accumulo

# GDELT data from 1/1/2016 - 3/31/2016
# 18,152,148 total events
export TIME_REGEX=20160[123][0123][0123456789]
export EAST=180
export WEST=-180
export NORTH=90
export SOUTH=-90

export HDFS_PORT=8020
export RESOURCE_MAN_PORT=8032
export NUM_PARTITIONS=32
export GEOSERVER_HOME=/usr/local/geowave/geoserver                             
export GEOSERVER_DATA_DIR=$GEOSERVER_HOME/data_dir
export GEOWAVE_TOOL_JAVA_OPT=-Xmx4g
export GEOWAVE_TOOLS_HOME=/usr/local/geowave/tools
export GEOWAVE_VERSION=0.9.1
export ACCUMULO_HOME=/opt/accumulo
export PATH=$PATH:${ACCUMULO_HOME}/bin
