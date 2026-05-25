# Introduction to spatial and molecular epidemiology (BING-F432)
# Bousfanj Mohamed
# Chaouche Maxime



data <- read.csv("DENV_genomic_analyses_simulated_dataset_2-1.csv")

dates_tempest <- data[, c("ID", "collection_date")]

write.table(dates_tempest,
            "dates_tempest_no_header.txt",
            sep = "\t",
            row.names = FALSE,
            col.names = FALSE,
            quote = FALSE)
