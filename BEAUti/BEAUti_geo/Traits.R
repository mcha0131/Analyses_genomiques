# Introduction to spatial and molecular epidemiology (BING-F432)
# Bousfanj Mohamed
# Chaouche Maxime



# Charger le fichier traits
data <- read.table(
  "traits.txt",
  header = TRUE,
  stringsAsFactors = FALSE
)

# Garder seulement ID et location
data2 <- data[, c("ID", "location")]

# Renommer les colonnes
colnames(data2) <- c("traits", "state")

# Exporter le vrai fichier BEAST
write.table(
  data2,
  file = "traits_BEAST.txt",
  sep = "\t",
  quote = FALSE,
  row.names = FALSE,
  col.names = TRUE
)
