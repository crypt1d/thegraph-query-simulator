#!/bin/sh

GOR_PATH=${GOR_PATH:-/usr/local/bin/gor}
GOR_SUBGRAPH=${GOR_SUBGRAPH:-QmRDGLp6BHwiH9HAE2NYEE3f7LrKuRqziHBv76trT4etgU}
GOR_AUTH=${GOR_AUTH:-"mytoken"}
GOR_HTTP_OUTPUT=${GOR_HTTP_OUTPUT:-""}


$GOR_PATH --input-file query_data/$GOR_SUBGRAPH.log --http-set-header "Authorization: Bearer $GOR_AUTH" --output-http $GOR_HTTP_OUTPUT
