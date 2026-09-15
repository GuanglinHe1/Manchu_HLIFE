#!/usr/bin/env bash
# TreeMix, m = 0-8 migration edges
source "$(dirname "$0")/../config.sh"

for m in {0..8}; do
    nohup treemix -i ${PREFIX}.treemix.gz -m ${m} -se -bootstrap -k 500 -global -noss \
        -root ${OUTGROUP_TREEMIX} -o treemix_m${m} &
done
wait
