# qpGraph topology search (R, admixtools)
# Up to 2 admixture events, 50 independent runs per event number.
# Usage: Rscript qpgraph_search.R <target_population>
library(dplyr)
library(admixtools)
library(ggplot2)

target        <- commandArgs(trailingOnly = TRUE)[1]
genotype_data <- "dataset"
outpop        <- "Mbuti.DG"
max.admix     <- 2
run_time      <- 50

best.score <- matrix(0, nrow = run_time, ncol = max.admix + 1,
                     dimnames = list(paste0("run_time=", 1:run_time),
                                     paste0("admix_event=", 0:max.admix)))
best.array <- rep(0, times = max.admix + 1)

f2_results <- f2_from_geno(pref = genotype_data,
                           pops = c("pop1", "pop2", "pop3", "pop4",
                                    "pop5", "pop6", "pop7", target))

# pop1-pop3 are not allowed to receive admixture
adm_constraints <- tribble(
  ~pop,   ~min, ~max,
  "pop1", NA,   0,
  "pop2", NA,   0,
  "pop3", NA,   0)

for (i in 1:max.admix) {
  opt_results <- find_graphs(f2_results, numadmix = i, outpop = outpop,
                             stop_gen = 100, admix_constraints = adm_constraints)
  winner <- opt_results %>% slice_min(score, with_ties = FALSE)
  for (j in 1:run_time) {
    opt_results <- find_graphs(f2_results, numadmix = i, outpop = outpop,
                               stop_gen = 100, admix_constraints = adm_constraints)
    winner.new <- opt_results %>% slice_min(score, with_ties = FALSE)
    if (winner$score > winner.new$score) winner <- winner.new
    best.score[j, i + 1] <- winner.new$score
    p <- plot_graph(winner.new$edges[[1]])
    ggsave(p, file = paste0("qpGraph_", target, "_admix", i, "_run", j, ".pdf"),
           height = 5, width = 5)
  }
  p.best <- plot_graph(winner$edges[[1]])
  ggsave(p.best, file = paste0("qpGraph_", target, "_admix", i, "_best.pdf"),
         height = 5, width = 5)
  best.array[i + 1] <- winner$score
}
write.table(best.score, file = paste0("qpGraph_", target, "_best_loglik_score.csv"),
            quote = FALSE, row.names = TRUE, col.names = TRUE)
