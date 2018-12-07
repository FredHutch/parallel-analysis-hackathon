library(scamp)
scampData <- readRDS("/var/analysis/input/levelExprs.rds")
print(paste0("Number of columns: ", ncol(scampData)))
print(paste0("Number of rows: ", nrow(scampData)))
print("Starting SCAMP")
scampOutput <- scamp(dataSet=scampData,
                     numberIterations = 1,
                     numberOfThreads=16)
print("SCAMP complete.")
print("Writing output.")
saveRDS(scampOutput,"/var/analysis/output/scampResult.rds")
