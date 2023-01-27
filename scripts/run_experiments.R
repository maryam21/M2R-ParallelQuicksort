#!/usr/bin/env Rscript

file_path = "~/workspace/M2R-ParallelQuicksort/data/experiments/experiment.csv"

experiment <- read.csv(file_path)

experiment$Type[experiment$Type == "Parallel"] <- 1
experiment$Type[experiment$Type == "Sequential"] <- 0
experiment$Type[experiment$Type == "Built-in"] <- 2
experiment$Time <- 0
# print(nrow(experiment))

for(i in 1:nrow(experiment)) {
    row <- experiment[i,]
    # print(row$Size)
    system('echo 'row$Size)
    x <- '"echo ",row$Size,"\n"'
    # cat("echo ",row$Size)
    cat(x)
    # system('./src/originalParallelQuicksort $row$Size >> row$Time;')
    # row$Time
}
