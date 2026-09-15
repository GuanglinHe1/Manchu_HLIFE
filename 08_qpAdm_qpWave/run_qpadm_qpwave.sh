#!/usr/bin/env bash
# qpAdm / qpWave (ADMIXTOOLS); parameter files supplied per model
# Usage: bash run_qpadm_qpwave.sh qpAdm.par qpWave.par

QPADM_PAR="${1:-qpAdm.par}"
QPWAVE_PAR="${2:-qpWave.par}"

qpAdm  -p ${QPADM_PAR}  > ${QPADM_PAR%.par}.log
qpWave -p ${QPWAVE_PAR} > ${QPWAVE_PAR%.par}.log
