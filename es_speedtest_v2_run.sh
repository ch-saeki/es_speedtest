#!/bin/bash
set -e

ELASTICSEARCH_URL="http://localhost:9200"

#-----------
epoch=$(/usr/bin/date '+%s')
datestr=$(/usr/bin/date -d @${epoch} '+%Y.%m.%d')
result=$(/usr/bin/speedtest -s 15047 -f json)

/usr/bin/curl --silent -XPUT -H 'Content-Type: application/json' ${ELASTICSEARCH_URL}/speedtestv2-${datestr}/_doc/${epoch} -d "${result}" >> /dev/null
