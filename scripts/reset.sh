#!/bin/bash

NABU="$ALAYACARE_HOME/services/nabu/web/api/v1/tenant"
LOCAL_FILE="alayadev.json"
TEMP_FILE="alayadev.tmp.json"

LOCAL_TENANT="${NABU}/${LOCAL_FILE}"
TEMP="${NABU}/${TEMP_FILE}"


if [ ! -f $TEMP ]; then
        echo "Temporary file does not exist. Exiting..."
        exit 1
fi
mv $TEMP $LOCAL_TENANT 

echo "${LOCAL_FILE} Reset Successful!"
echo ""
