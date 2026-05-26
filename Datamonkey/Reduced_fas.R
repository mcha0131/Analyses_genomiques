# Introduction to spatial and molecular epidemiology (BING-F432)
# Bousfanj Mohamed
# Chaouche Maxime



install.packages("ape")
library(ape)


fichier <- "C:/Users/Maxime/Epidemiology/DENV_genomic_analyses_simulated_dataset_2-1.fas"

align <- read.dna(fichier, format = "fasta")


# ===== 1 Vérifier la taille de l'alignement =====
dim(align)


# ===== 2 Réduire le nombre de séquences =====

set.seed(123)
nb_sequences <- 50

align_reduit <- align[sample(1:nrow(align), nb_sequences), ]


# ===== 3 Identifier automatiquement une zone d'intérêt =====
# On cherche une fenêtre de 2000 sites avec beaucoup de variation

taille_fenetre <- 2000
pas <- 200

positions_depart <- seq(1, ncol(align_reduit) - taille_fenetre, by = pas)

score_variation <- sapply(positions_depart, function(pos) {
  fenetre <- align_reduit[, pos:(pos + taille_fenetre - 1)]
  
  variables <- apply(fenetre, 2, function(colonne) {
    length(unique(colonne[colonne != "-" & colonne != "n" & colonne != "N"])) > 1
  })
  
  sum(variables)
})

meilleure_position <- positions_depart[which.max(score_variation)]

zone_interet <- align_reduit[, meilleure_position:(meilleure_position + taille_fenetre - 1)]

cat("Zone d'intérêt choisie : positions",
    meilleure_position, "à",
    meilleure_position + taille_fenetre - 1, "\n")

# ===== 4 Supprimer les colonnes avec trop de gaps =====
gap_prop <- apply(zone_interet, 2, function(x) mean(x == "-"))

zone_clean <- zone_interet[, gap_prop < 0.5]
 



write.dna(zone_clean,
          file = "DENV_reduit_GARD_50seq_zone_interet.fas",
          format = "fasta",
          nbcol = -1,
          colsep = "")


