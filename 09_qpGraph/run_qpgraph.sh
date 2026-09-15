#!/usr/bin/env bash
# Run qpGraph topology search for each target population in ${POP_LIST}
source "$(dirname "$0")/../config.sh"

for z in $(cat ${POP_LIST}); do
    nohup Rscript "$(dirname "$0")/qpgraph_search.R" "${z}" > qpGraph_${z}.log 2>&1 &
done
wait
