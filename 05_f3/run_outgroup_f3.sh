#!/usr/bin/env bash
# Outgroup f3
source "$(dirname "$0")/../config.sh"

Rscript allF3pairs.R ${PREFIX} outgroup_pops.txt outgroups.txt yes list
