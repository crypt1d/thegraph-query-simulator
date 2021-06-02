#!/bin/sh

GOR_PATH=${GOR_PATH:-/usr/local/bin/gor}
GOR_TIMEOUT=${GOR_TIMEOUT:-60}
GOR_INPUT_PORT=${GOR_INPUT_PORT:-80}
GOR_SUBGRAPH=${GOR_SUBGRAPH:-QmRDGLp6BHwiH9HAE2NYEE3f7LrKuRqziHBv76trT4etgU}

timeout --preserve-status $GOR_TIMEOUT $GOR_PATH --input-raw :$GOR_INPUT_PORT --midleware ./middleware/strip_headers.rb --output-file query_data/$GOR_SUBGRAPH.log --output-file-append --http-allow-url /subgraphs/id/$GOR_SUBGRAPH
