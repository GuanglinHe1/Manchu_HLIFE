# f4 statistics (R, admixtools)
library(admixtools)

snps        <- "dataset"                # EIGENSTRAT/PLINK prefix
reference1  <- c("Ref1")                # W
reference2  <- c("Ref2")                # X
studiedpops <- c("Target")              # Y
outgroup    <- "Mbuti.DG"               # Z

result <- f4(data = snps, pop1 = reference1, pop2 = reference2,
             pop3 = studiedpops, pop4 = outgroup)
write.table(result, file = "f4_results.csv", sep = ",", row.names = FALSE)
