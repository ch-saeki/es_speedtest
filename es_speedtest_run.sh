#!/bin/bash

ELASTICSEARCH_URL="http://localhost:9200"

#-----------

# IPA CyberLab (Bunkyo, Japan)
server=$(/usr/bin/speedtest-cli --list | grep "IPA CyberLab" | cut -d' ' -f1 | rev | cut -c 2- | rev)
SPEEDTEST_OPTIONS="--server ${server}"

epoch=$(/usr/bin/date '+%s')
datestr=$(/usr/bin/date -d @${epoch} '+%Y.%m.%d')
result=$(/usr/bin/speedtest-cli --secure --json ${SPEEDTEST_OPTIONS})

/usr/bin/curl --silent -XPUT -H 'Content-Type: application/json' ${ELASTICSEARCH_URL}/speedtest-${datestr}/_doc/${epoch} -d "${result}" >> /dev/null
