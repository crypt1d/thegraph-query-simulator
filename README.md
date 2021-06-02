# The Graph Network Query Simulator
This is a Proof of Concept set of tools for query simulation for The Graph Network indexers.

## How it works

Currently it uses [Goreplay](https://goreplay.org/) to collect and replay query traffic data. There are essentially two scripts:

 - `collect_queries.sh`: Collects data from your local indexer endpoint, removes unnecessary headers and saves it to a file
 - `replay_queries.sh`: Replays the traffic collected by collect_queries.sh

The current PoC already has some example data for the `QmRDGLp6BHwiH9HAE2NYEE3f7LrKuRqziHBv76trT4etgU` subgraph, so you can test the replay without bothering with collecting the data first.

## How to simulate traffic

- To use the tool, you must set the `INDEXER_SERVICE_FREE_QUERY_AUTH_TOKEN` on your indexer-service to a password / token of your choice. This password will be used by the tool to replay traffic without needing a valid receipt.
- You will also need `goreplay` aka `gor` installed on your local system before running the script:
- In the repo directory:

```bash
$ export GOR_AUTH="mytoken"
$ export GOR_HTTP_OUTPUT="http://myindexerendpoint.com"
$ export GOR_SUBGRAPH="QmRDGLp6BHwiH9HAE2NYEE3f7LrKuRqziHBv76trT4etgU"
$ ./replay_queries.sh
```

This would replay the example traffic we currently have in the `query_data/` directory for the `QmRDGLp6BHwiH9HAE2NYEE3f7LrKuRqziHBv76trT4etgU` subgraph to the endpoint of your choice (GOR_HTTP_OUTPUT). To speed up the replay you can tweak the `GOR_REPLAY_SPEED` variable. Eg, setting it to `200` would replay the traffic at 2x the speed.

## How to collect traffic

- You will need `gor` installed.
- You will need access to an indexer service node to collect traffic from. If your indexer is using https, make sure you collect the traffic after SSL termination.

```bash
$ export GOR_SUBGRAPH=ID_OF_THE_SUBGRAPH
$ export GOR_INPUT_PORT=7600
$ ./collect_queries.sh
```

This would collect queries on port `GOR_INPUT_PORT` for the subgraph of your choice for 60 seconds and store it in the `query_data/` directory for later replay. You can adjust the duration of the collection by tweaking the `GOR_TIMEOUT` variable (in seconds)
