#!/usr/bin/env bash
# Runs of homozygosity (PLINK)
source "$(dirname "$0")/../config.sh"

plink --bfile ${PREFIX} --homozyg --homozyg-density 50 --homozyg-gap 100 --homozyg-kb 500 \
    --homozyg-snp 50 --homozyg-window-het 1 --homozyg-window-snp 50 \
    --homozyg-window-threshold 0.05 --out ${PREFIX}_roh
