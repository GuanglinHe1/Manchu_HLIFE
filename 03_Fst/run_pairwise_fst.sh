#!/usr/bin/env bash
# Pairwise Fst
source "$(dirname "$0")/../config.sh"

perl pairwise.perl ${PREFIX} 0 0
