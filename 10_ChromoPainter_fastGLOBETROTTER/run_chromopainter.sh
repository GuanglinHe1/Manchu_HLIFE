#!/usr/bin/env bash
# ChromoPainter v2 / fastGLOBETROTTER
# Input: phased haplotypes (*.phase) and GRCh37 recombination maps per chr.
# N_EST / M_EST: values of -n / -M estimated in step 1.
source "$(dirname "$0")/../config.sh"

IDFILE="pops.ids"
N_EST=xx
M_EST=xx

# 1. EM estimation of -n / -M
for chr in {1..22}; do
    ChromoPainterv2 -g ${PREFIX}.chr${chr}.phased.phase -r genetic_map_GRCh37_chr${chr}.recombfile \
        -t ${IDFILE} -f popfile_EM.txt 1 10 -s 0 -i 10 -in -iM -o ${PREFIX}.chr${chr}_estimateEM
done

# 2. Donors painted by donors
for chr in {1..22}; do
    ChromoPainterv2 -g ${PREFIX}.chr${chr}.phased.phase -r genetic_map_GRCh37_chr${chr}.recombfile \
        -t ${IDFILE} -f popfile_donor_v_donor.txt 0 0 -s 0 -n ${N_EST} -M ${M_EST} \
        -o ${PREFIX}.chr${chr}_Donor_v_Donor &
done

# 3. Targets painted by donors
for chr in {1..22}; do
    ChromoPainterv2 -g ${PREFIX}.chr${chr}.phased.phase -r genetic_map_GRCh37_chr${chr}.recombfile \
        -t ${IDFILE} -f popfile_donor_v_target.txt 0 0 -s 10 -n ${N_EST} -M ${M_EST} \
        -o ${PREFIX}.chr${chr}_Donor_v_Target &
done
wait
