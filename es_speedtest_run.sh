#!/bin/bash

SPEEDTEST_OPTIONS=""
ELASTICSEARCH_URL="http://localhost:9200"

#-----------

# アイドル状態解除のためpingする
ping 192.168.2.1 -w 3 -i 0.2 >> /dev/null

epoch=$(/usr/bin/date '+%s')
datestr=$(/usr/bin/date -d @${epoch} '+%Y.%m.%d')
result=$(/usr/bin/speedtest-cli --secure --json ${SPEEDTEST_OPTIONS})

/usr/bin/curl --silent -XPUT -H 'Content-Type: application/json' ${ELASTICSEARCH_URL}/speedtest-${datestr}/_doc/${epoch} -d "${result}" >> /dev/null
