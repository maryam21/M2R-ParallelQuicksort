#!/usr/bin/env Rscript

library(DoE.wrapper)
library(tidyverse)

experiment <- lhs.design( type= "maximin" , nruns= 100, nfactors= 1 , randomize = TRUE, digits=0 , seed= 401868 , factor.names=list( Size=c(100,1000000)))

#replicate 3 times so that we can have the same set of experiments for each type
experiment <- do.call("rbind", replicate(3, experiment, simplify = FALSE))

rownames(experiment) <- NULL

#assign experiments to different types
experiment$Type = 1
experiment[101:200,]$Type = 0
experiment[201:300,]$Type = 2

#Add an order variable that will have a randomized order for the rows, so that we can have random order of tests run
experiment$order =  sample(as.numeric(rownames(experiment)))

#sort the data frame by this new random order
experiment <-  arrange(experiment, order)

drops <- c("order")
experiment <- experiment[ , !(names(experiment) %in% drops)]


write.csv(experiment,"~/workspace/M2R-ParallelQuicksort/data/experiments/qs_experiment.csv", row.names = FALSE)