#!/usr/bin/env bash
# Maximum-likelihood phylogeny of mtDNA sequences (IQ-TREE 3), rooted at RSRS

ALIGNMENT="alignment.fasta"     # multiple sequence alignment
OUT_DIR="iqtree_output"
mkdir -p ${OUT_DIR}

# 1. Mixture-model selection (MixtureFinder)
iqtree3 -s ${ALIGNMENT} -m MIX+MF -T 32 -pre ${OUT_DIR}/mixturefinder

# 2. Final tree with the selected model
iqtree3 -s ${ALIGNMENT} -m 'MIX{GTR+FO,HKY+FO}+I+R7' -o RSRS -T 64 -pre ${OUT_DIR}/final
