#!/bin/bash
source geowave-env.sh
${STAGING_DIR}/setup-accumulo-geowave.sh
${STAGING_DIR}/ingest-gdelt.sh
${STAGING_DIR}/setup-geoserver-geowave-workspace.sh