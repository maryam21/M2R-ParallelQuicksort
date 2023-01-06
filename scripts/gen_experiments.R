#!/usr/bin/env Rscript

library(DoE.wrapper)

lhs_design <- lhs.design( type= "maximin" , nruns= 2000, nfactors= 1 , randomize = TRUE, digits=0 , seed= 401868 , factor.names=list( size=c(100,1000000)) )

write.csv(lhs_design,"~/workspace/M2R-ParallelQuicksort/data/experiments/lhs_design.csv", row.names = FALSE)