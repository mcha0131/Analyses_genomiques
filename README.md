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

Le fichier DENV_genomic_analyses_dataset_2-1.fas.treefile sera alors crée.


2.4)  Evaluation de la présence d'un signal temporel en utilisant TempEst 

Cette étape nécesite de télécharger TempEst sous Windows 

2.4.1) Créer un fichier .txt à partir du fichier DENV_genomic_analyses_simulated_dataset_2-1.csv sous R ,sans les titres (dates_tempest_no_header.txt) . 


2.4.2) Importer le fichier généré par IQtree3 sur TempEst. Aller sur Import Dates et sélectionner le fichier .txt. Sélectionner "Parse as calendar dates" et "OK".

Les données sont disponible dans le document TempEst data. Il nous montre un signal temporel suffisant pour calibrer et utiliser un modèle d’horloge moléculaire permettant d’inférer des phylogénies dont la longueur des branches est en unité de temps.




3) 





















