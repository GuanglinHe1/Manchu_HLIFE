#!/usr/bin/env bash
# ADMIXTURE
source "$(dirname "$0")/../config.sh"

# LD pruning
plink --bfile ${PREFIX} --indep-pairwise 200 25 0.4 --allow-no-sex --out ${PREFIX}_ld
plink --bfile ${PREFIX} --extract ${PREFIX}_ld.prune.in --make-bed --allow-no-sex --out ${PREFIX}_pruned

# Unsupervised, K = 2-20
for K in {2..20}; do
    nohup admixture -B100 --cv=10 -s time -j${THREADS} ${PREFIX}_pruned.bed ${K} > admixture_K${K}.log &
done

# Supervised (requires ${PREFIX}_pruned.pop; set K to the number of source groups)
K_SUP=K
admixture -B100 --cv=10 -s time -j${THREADS} ${PREFIX}_pruned.bed ${K_SUP} --supervised > admixture_supervised_K${K_SUP}.log &
wait
