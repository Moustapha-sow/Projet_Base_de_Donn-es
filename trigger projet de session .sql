Section 5.1: Donnez le code SQL permettant de réaliser 3 fonctionnalités (procédures/fonctions) choisies
de votre système. Ces fonctionnalités seront discutées avec votre professeure.


fonction 1 : calculer le nombre total de composants utilisés dans un programme donné 


CREATE OR REPLACE FUNCTION TotalComposantsUtilisés(code_programme INT) RETURNS INT AS $$
DECLARE
    total_composants INT;
BEGIN
    SELECT SUM(nbComposant) INTO total_composants
    FROM Utiliser
    WHERE codeProg = code_programme;
    RETURN total_composants;
END;
$$ LANGUAGE plpgsql;



fonction 2 : obtenir le nombre de représentant par client 

CREATE OR REPLACE FUNCTION TotalReprésentantsClient(code_client INT) RETURNS INT AS $$
DECLARE
    total_représentants INT;
BEGIN
    SELECT COUNT(*) INTO total_représentants
    FROM Client
    WHERE noClient = code_client;
    RETURN total_représentants;
END;
$$ LANGUAGE plpgsql;


fonction 3 : calculer la moyenne des notes attribuée a un programme lors des évaluations 

CREATE OR REPLACE FUNCTION MoyenneNotesProgramme(code_programme INT) RETURNS DECIMAL(5,2) as $$
 DECLARE moyenne_notes DECIMAL(5,2);
BEGIN
    SELECT AVG(note) INTO moyenne_notes
    FROM Évaluer
    WHERE codeProg = code_programme;
    RETURN moyenne_notes;
END;



Section 5.2: Veuillez avoir au moins un trigger permettant de gérer plus d’une table.


CREATE OR REPLACE FUNCTION log_program_insert()
RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO AuditTrail (event_type, event_description, event_date)
    VALUES ('New Program Inserted', CONCAT('New program inserted: ', NEW.nomProg), NOW());
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER after_program_insert
AFTER INSERT ON Programme
FOR EACH ROW
EXECUTE FUNCTION log_program_insert();


Section 5.3: Veuillez avoir au moins deux triggers, dont l’événement est du à une seule table (AFTER et BEFORE)

---- trigger avec before 
CREATE OR REPLACE FUNCTION check_nbreComposant()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.nbreComposant > 30 THEN
        RAISE EXCEPTION 'Le nombre de composants ne peut pas dépasser 30.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_insert_utiliser
BEFORE INSERT ON UTILISER
FOR EACH ROW
EXECUTE FUNCTION check_nbreComposant();

----- trigge avec after 
CREATE OR REPLACE FUNCTION update_total_heure()
RETURNS TRIGGER AS $$
DECLARE
    total_heure INT;
BEGIN
    -- Récupérer le total_heure actuel pour le codeProg et matricule concerné
    SELECT SUM(nbreComposant) INTO total_heure
    FROM UTILISER
    WHERE codeProg = NEW.codeProg AND id_composant = NEW.id_composant;

    -- Mettre à jour le total_heure dans la table CONTRIBUER
    UPDATE CONTRIBUER
    SET total_heure = total_heure
    WHERE codeProg = NEW.codeProg;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER after_insert_utiliser
AFTER INSERT ON UTILISER
FOR EACH ROW
EXECUTE FUNCTION update_total_heure();



Section 5.4: Veuillez avoir des données tests de vos contraintes. Choisissez adéquatement des unitests au moins 2 par contraintes/trigger et le cas d’utilisation de vos procédures.

---- trigger avec before 

-- Test pour contrainte de vérification de la quantité de composants (nbreComposant)

-- Insertion invalide

BEGIN;
INSERT INTO UTILISER (nbreComposant, id_composant, codeProg) VALUES (35, 218, 1002); ROLLBACK; 

-- trigger avec after 

-- Test pour la mise à jour du total_heure après l'insertion dans UTILISER
-- Insertion dans UTILISER
INSERT INTO UTILISER (nbreComposant, id_composant, codeProg) VALUES (15, 218, 1002);

-- Vérification de la mise à jour dans CONTRIBUER
SELECT * FROM CONTRIBUER WHERE codeProg = 1002;


