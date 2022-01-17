#!/bin/bash
set -e

ELASTICSEARCH_URL="http://localhost:9200"
SPEEDTEST_OPTIONS=""

#-----------

# select Japan server
# SERVER=$(speedtest-cli --list | grep -m 1 -e "IPA CyberLab" -e "Rakuten" | cut -d' ' -f1 | rev | cut -c 2- | rev)
# if [ "$SERVER" != "" ]; then
#   SPEEDTEST_OPTIONS="--server ${SERVER}"
#   echo "server is ${SERVER}"
# fi

epoch=$(/usr/bin/date '+%s')
datestr=$(/usr/bin/date -d @${epoch} '+%Y.%m.%d')
result=$(/usr/bin/speedtest-cli --secure --json ${SPEEDTEST_OPTIONS})

/usr/bin/curl --silent -XPUT -H 'Content-Type: application/json' ${ELASTICSEARCH_URL}/speedtest-${datestr}/_doc/${epoch} -d "${result}" >> /dev/null
