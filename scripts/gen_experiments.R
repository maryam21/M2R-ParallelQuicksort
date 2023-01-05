#!/usr/bin/env Rscript

library(DoE.wrapper)

lhs_design <- lhs.design( type= "maximin" , nruns= 2000, nfactors= 2 , randomize = TRUE,
                          digits=0 , seed= 401868 , factor.names=list( size=c(100,1000000),type=c(0,2) ))


lhs_design$type[lhs_design$type == 1] <- "Parallel"
lhs_design$type[lhs_design$type == 0] <- "Sequential"
lhs_design$type[lhs_design$type == 2] <- "Built-in"

write.csv(lhs_design,"~/workspace/M2R-ParallelQuicksort/data/experiments/lhs_design.csv", row.names = FALSE)