#!/bin/bash
echo "Downloading GDELT data ..."
source geowave-env.sh

mkdir $STAGING_DIR/gdelt;cd $STAGING_DIR/gdelt
# just grab whatever data matches the time regex
wget http://data.gdeltproject.org/events/md5sums
for file in `cat md5sums | cut -d' ' -f3 | grep "^${TIME_REGEX}"` ; do wget http://data.gdeltproject.org/events/$file ; done
md5sum -c md5sums 2>&1 | grep "^${TIME_REGEX}"
