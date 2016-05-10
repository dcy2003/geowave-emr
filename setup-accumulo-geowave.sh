source geowave-env.sh
## configure accumulo
cat <<EOF | accumulo shell -u root -p secret -e "createuser geowave"
geowave
geowave
EOF
accumulo shell -u root -p secret -e "createnamespace geowave"
accumulo shell -u root -p secret -e "grant NameSpace.CREATE_TABLE -ns geowave -u geowave"
accumulo shell -u root -p secret -e "config -s general.vfs.context.classpath.geowave=hdfs://${HOSTNAME}:${HDFS_PORT}/accumulo/classpath/geowave/${GEOWAVE_VERSION}-apache/[^.].*.jar"
accumulo shell -u root -p secret -e "config -ns geowave -s table.classpath.context=geowave"