
------ Sélectionner tous les programmes avec leurs noms et descriptions

select nomProg, descriptionProg
from Programme;


------  Sélectionner les noms des clients et leurs entreprises associées

select nomclient, nomEntreprise
from Client 
join Entreprise on Client.noclient = Entreprise.noClient;


------ Afficher le nombre total d'heures contribuées par chaque service, trié par ordre décroissant du nombre total d'heures

select codeService, Sum(total_heure) as total_heures
from Salarie 
join Contribuer on Salarie.matricule = Contribuer.matricule
group by codeService
order by total_heures desc;


------ Sélectionner les noms des programmes dont la durée est supérieure à la moyenne de la durée de tous les programmes

select nomProg
from Programme
where (dateFin - dateDebut) > (

	select AVG(dateFin - dateDebut)
	from Programme	
);