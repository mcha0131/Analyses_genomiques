data <- read.csv("C:/Users/Maxime/Epidemiology/Binome_02/DENV_genomic_analyses_simulated_dataset_2-1.csv")

dates_tempest <- data[, c("ID", "collection_date")]

write.table(dates_tempest,
            "C:/Users/Maxime/Epidemiology/Binome_02/dates_tempest_no_header.txt",
            sep = "\t",
            row.names = FALSE,
            col.names = FALSE,
            quote = FALSE)
