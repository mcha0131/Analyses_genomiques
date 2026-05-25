Read me rédigé par Bousfanj Mohamed et Chaouche Maxime
Professeur : Dellicour Simon

Ce read me contient toutes les étapes nécessaires à la réalisation de ce projet. Les éléments ci-dessous seront 
énumérés selon l'ordre défini par les instructions et travaux pratiques du cours intitulé : Introduction to spatial and molecular epidemiology.



1) Analyse préliminaire : chaque binôme est aussi invité à réaliser une analyse préliminaire non-basée 
sur les données génomiques et visant à estimer et visualiser l’évolution du nombre de reproduction 
effectif du virus (Rt). Cette analyse doit être basée sur les dates d’observation de l’ensemble des 
cas d’infection répertoriés, c’est-à-dire tous ceux associés ou non à la disponibilité d’une séquence 
génomique. Attention, il est possible que certains jeux de données soient trop restreints pour cela.


Cette étape nécessitera le code R_code_Analyses_préliminaires.



2) Vérifier l’absence d’un signal de recombinaison au sein de l’alignement de séquences.

Cette étape nécesite de télécharger iqtree3 sous Windows (iqtree-3.1.2-Windows)


2.1)  Obtenir uen estimation phylogénétique par la méthode du maximum de vraisemblance

Aller dans l'invite de commande et écrire :

"iqtree-3.1.2-Windows\bin\iqtree3.exe" -s "DENV_genomic_analyses_simulated_dataset_2-1.fas" -m MF


2.2)  Trouver le meilleur modèle de substitution le plus adapté

Une fois lancé, l'invite de commande proposera plusieurs modèles. Le BIC (Bayesian Information Criterion) 
sera choisi pour notre cas. Il s'agit du modèle JC+G4


2.3)  Estimer un arbre avec la méthode maximum de vraisemblance en utilisant le modèle le plus adapté

Aller dans l'invite de commande et écrire :

"iqtree-3.1.2-Windows\bin\iqtree3.exe" -s "DENV_genomic_analyses_simulated_dataset_2-1.fas" -m JC+G4 -redo


2.4)  



