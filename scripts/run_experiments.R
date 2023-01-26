#!/usr/bin/env Rscript

file_path = "~/workspace/M2R-ParallelQuicksort/data/experiments/lhs_design.csv"

experiment <- read.csv(file_path)

experiment$type[experiment$type == "Parallel"] <- 1
experiment$type[experiment$type == "Sequential"] <- 0
experiment$type[experiment$type == "Built-in"] <- 2

