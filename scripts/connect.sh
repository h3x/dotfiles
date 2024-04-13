#!/bin/bash

# if [ $# -ne 2 ]; then
#         echo "Usage: connect.sh <tenant> <environment>"
#         exit 1
# fi
#
#
NABU="$ALAYACARE_HOME/services/nabu/web/api/v1/tenant"
LOCAL_FILE="alayadev.json"
TEMP_FILE="alayadev.tmp.json"

LOCAL_TENANT="${NABU}/${LOCAL_FILE}"
TEMP="${NABU}/${TEMP_FILE}"

input=$(cat)

[[ -z $input ]] && echo "No input from nabu" && exit 1


if [ -f $TEMP ]; then
        echo "Temporary file already exists. Please reset before connecting"
        exit 1
fi

mv $LOCAL_TENANT $TEMP
echo "Temporary file ${TEMP_FILE} created successfully!"

jq --argjson mysql "$(echo $input | jq '.databases.mysql')" '.databases.mysql=$mysql' $TEMP > $LOCAL_TENANT

