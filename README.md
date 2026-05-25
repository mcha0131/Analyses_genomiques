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

Cette étape nécessite de télécharger TempEst v1.5.3 sous Windows 

2.4.1) Créer un fichier .txt à partir du fichier DENV_genomic_analyses_simulated_dataset_2-1.csv sous R ,sans les titres (dates_tempest_no_header.txt) . 


2.4.2) Importer le fichier généré par IQtree3 sur TempEst. Aller sur Import Dates et sélectionner le fichier .txt. Sélectionner "Parse as calendar dates" et "OK".

Les données sont disponible dans le document TempEst data. Il nous montre un signal temporel suffisant pour calibrer et utiliser un modèle d’horloge moléculaire permettant d’inférer des phylogénies dont la longueur des branches est en unité de temps.


3) Effectuer une inférence phylogénétique Bayésienne avec un modèle d’horloge moléculaire, ainsi qu’un modèle de coalescence vous permettant d’estimer le taux de reproduction de base du virus (R0).

Cette étape nécessite de télécharger :  BEAST X v10.5.0
                                        Beagle
                                        Tracer.v.1.7.2
                                        FigTree v1.4.4
                                  


3.1) Ouvrir le logiciel BEAUti et importer le fichier "DENV_genomic_analyses_simulated_dataset_2-1.fas" en sélectionnant "Import Data".

3.2) Aller sur l'onglet Tips et sélectionner Use tip dates. Sélectionner Import Dates et choisir "dates_tempest_no_header.txt". Sélectionner Parse as calendar date.

3.3) Le reste des paramètres BEAUti sont disponible dans le fichier "BEAUti_Ro".

3.4) Une fois la génération du fichier XML pour BEAST terminé, aller sur le logiciel BEAST et importer le fichier 
"BEAUti_R0_final" et attendre la fin de l'acquisition.

3.5) Une fois l'acquisition terminé, les fichiers "BEAUti_Ro_final.citations","BEAUti_Ro_final.log","BEAUti_Ro_final.ops","BEAUti_Ro_final.trees" sont générés.

3.6) Ouvrir le logiciel Tracer et importer le fichier "BEAUti_Ro_final.log". Une fois l'importation terminée, on vérifie que tous les ESS sont significatif (>200). 

3.7) Réalisation d'une reconstruction démographique. A partir de Tracer, aller dans l'onglet Analysis et sélectionner "Demographic Reconstruction".

Les paramètre sont les suivants:  Demographic model = Exponential Growth (Growth Rate)  
                                  Population Size = exponential.popSize
                                  Growth Rate = exponential.growthRate
                                  Maximum time is the root height's = rootHeight
                                  Number of bins = 100
                                  Use manual range for bins : Minimum time = 2023.4
                                                              Maximum time = 2023.6
                                  Age of youngest tip = 2023.5972602739726


3.8) Calcul du R0

Ce calcul est directement inspiré de la formule retrouvé sur : https://beast.community/phylodynamics_of_epidemic_influenza

R0 = (1+r/b)^a
a = ((mu)^2)/((sigma)^2)
b = (mu)/((sigma)^2)
mu = [13 17]
sigma = [4 6]
Les valeur des moyennes (mu) et des déviations standards (sigma) sont fournis par Mr.Dellicour Simon


Nous calculerons les valeurs de R0_min et R0_max comme suit :

R0_min(mu,sigma) = R0_min(17,4) = 4.5
R0_max(mu,sigma) = R0_max(13,7) = 8.8

3.9) Calcul du Ne

Ce calcul est directement obtenu via la valeur médiane du paramètre exponential.popSize. 

Ne = 257.344





4) Effectuer une analyse de phylogéographie discrète ou continue pour reconstruire et analyser l’histoire de dispersion des lignées virales échantillonnées. 


4.1.1) Ouvrir le logiciel BEAUti et importer le fichier "DENV_genomic_analyses_simulated_dataset_2-1.fas" en sélectionnant "Import Data".

4.1.2) Aller sur l'onglet Traits et importer le fichier ".txt" contenant cette fois les bons titres sur R. Sélectionner le paramètre :  Type = discrete et sélectionner "Create a corresponding data partition".
Sélectionner Yes et OK aux deux prochaines fenêtres pour la création du Trait et de Partition.
                                
4.2) Aller sur l'onglet Tips et sélectionner Use tip dates. Sélectionner Import Dates et choisir "dates_tempest_no_header.txt". Sélectionner Parse as calendar date.

4.3) Le reste des paramètres BEAUti sont disponible dans le fichier "BEAUti_geo".


4.4) Une fois la génération du fichier XML pour BEAST terminé, aller sur le logiciel BEAST et importer le fichier "phylogeo_final" et attendre la fin de l'acquisition.

4.5) Une fois l'acquisition terminé, les fichiers "phylogeo_final","phylogeo_final.log","phylogeo_final.ops","phylogeo_final.trees" sont générés.

4.6) Ouvrir le logiciel Tracer et importer le fichier "phylogeo_final.log". Une fois l'importation terminée, on vérifie que tous les ESS sont significatif (>200). 

4.7) Ouvrir le logiciel LogCombiner v10.5.0



2023.4575342465753




















