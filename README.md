# Population history analyses of the Manchu population

All input/output names are generic placeholders; shared settings are in `config.sh`.
Analysis parameters are those used in the study.

| Folder | Analysis | Software |
|---|---|---|
| `01_PCA` | Principal component analysis | EIGENSOFT (smartpca) |
| `02_ADMIXTURE` | LD pruning, unsupervised / supervised ADMIXTURE | PLINK 1.9, ADMIXTURE |
| `03_Fst` | Pairwise Fst | `pairwise.perl` |
| `04_TreeMix` | TreeMix, m = 0-8 | TreeMix |
| `05_f3` | Outgroup f3 | `allF3pairs.R` |
| `06_f4` | f4 statistics | R package admixtools |
| `07_ROH` | Runs of homozygosity | PLINK 1.9 |
| `08_qpAdm_qpWave` | qpAdm / qpWave | ADMIXTOOLS |
| `09_qpGraph` | qpGraph topology search | R package admixtools |
| `10_ChromoPainter_fastGLOBETROTTER` | Chromosome painting | ChromoPainter v2 / fastGLOBETROTTER |
| `11_Haplogroup_frequency` | Haplogroup frequency bar plots | R (tidyplots, patchwork), Python (pandas, matplotlib) |
| `12_Haplogroup_PCA` | PCA of haplogroup frequency matrix | Python (scikit-learn, seaborn) |
| `13_IQ-TREE` | Maximum-likelihood mtDNA phylogeny | IQ-TREE 3 |

Run shell scripts from the directory containing the input data, e.g.
`bash /path/to/02_ADMIXTURE/run_admixture.sh`.
