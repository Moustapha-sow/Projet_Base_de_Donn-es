------- INSERTION DE DONNÉES 

INSERT INTO SERVICE (codeService, nomService) VALUES
(19, 'Service Technique'),
(29, 'Service RH'),
(39, 'Service Commercial'),
(49, 'Service Production'),
(59, 'Service Logistique'),
(69, 'Service Informatique');

-- Insertion de données dans la table Représentant
INSERT INTO REPRESENTANT (noRepre, nomRepre, prenomRepre) VALUES
(11, 'Dupont', 'Jean'),
(21, 'Dubois', 'Marie'),
(31, 'Lefebvre', 'Pierre'),
(41, 'Martin', 'Sophie'),
(51, 'Leroy', 'Luc'),
(61, 'Moreau', 'Julie');

-- Insertion de données dans la table Panel
INSERT INTO PANEL (noPanel, dateSession) VALUES
(16, '2024-03-01'),
(26, '2024-03-15'),
(36, '2024-03-30'),
(46, '2024-04-10'),
(56, '2024-04-25'),
(66, '2024-05-05');

-- Insertion de données dans la table Client
INSERT INTO CLIENT (noClient, nomClient, prenomClient, noRepre) VALUES
(1, 'Client1', 'PrenomClient1', 11),
(2, 'Client2', 'PrenomClient2', 21),
(3, 'Client3', 'PrenomClient3', 31),
(4, 'Client4', 'PrenomClient4', 41),
(5, 'Client5', 'PrenomClient5', 51),
(6, 'Client6', 'PrenomClient6', 61);

-- Insertion de données dans la table Client_PARTICULIER
INSERT INTO CLIENT_Particulier (noclient_Part, nomClient_Part, notelephone, noClient) VALUES
(101, 'ClientPart1', '0123456789', 1),
(102, 'ClientPart2', '0987654321', 2),
(103, 'ClientPart3', '1234567890', 3),
(104, 'ClientPart4', '9876543210', 4),
(105, 'ClientPart5', '1112223333', 5),
(106, 'ClientPart6', '4445556666', 6);

-- Insertion de données dans la table Entreprise
INSERT INTO ENTREPRISE (noEntreprise, nomEntreprise, activite, noClient) VALUES
(201, 'Entreprise1', 'Activite1', 1),
(202, 'Entreprise2', 'Activite2', 2),
(203, 'Entreprise3', 'Activite3', 3),
(204, 'Entreprise4', 'Activite4', 4),
(205, 'Entreprise5', 'Activite5', 5),
(206, 'Entreprise6', 'Activite6', 6);

-- Insertion de données dans la table Programme
INSERT INTO PROGRAMME (codeProg, nomProg, descriptionProg, dateDebut, dateFin) VALUES
(1001, 'Programme1', 'Description Programme1', '2024-03-01', '2024-03-15'),
(1002, 'Programme2', 'Description Programme2', '2024-03-15', '2024-03-30'),
(1003, 'Programme3', 'Description Programme3', '2024-03-30', '2024-04-10'),
(1004, 'Programme4', 'Description Programme4', '2024-04-10', '2024-04-25'),
(1005, 'Programme5', 'Description Programme5', '2024-04-25', '2024-05-05'),
(1006, 'Programme6', 'Description Programme6', '2024-05-05', '2024-05-20');

-- Insertion de données dans la table Salarié
INSERT INTO SALARIE (matricule, nomSalarie, prenomSalarie, email, codeService) VALUES
(341, 'Salarié1', 'PrenomSalarié1', 'salarie1@example.com', 19),
(1232, 'Salarié2', 'PrenomSalarié2', 'salarie2@example.com', 29),
(1243, 'Salarié3', 'PrenomSalarié3', 'salarie3@example.com', 39),
(9044, 'Salarié4', 'PrenomSalarié4', 'salarie4@example.com', 49),
(3405, 'Salarié5', 'PrenomSalarié5', 'salarie5@example.com', 59),
(506, 'Salarié6', 'PrenomSalarié6', 'salarie6@example.com', 69);

-- Insertion de données dans la table Contribuer
INSERT INTO CONTRIBUER (codeProg, matricule, total_heure) VALUES
(1001, 341, 20),
(1002, 1232, 25),
(1003, 1243, 30),
(1004, 9044, 35),
(1005, 3405, 40),
(1006, 506, 45);

-- Insertion de données dans la table Évaluer
INSERT INTO EVALUER (codeProg, noPanel, note, rapport) VALUES
(1001, 16, 4.5, 'Excellent travail.'),
(1002, 26, 4.0, 'Travail satisfaisant.'),
(1003, 36, 3.8, 'Peut être amélioré.'),
(1004, 46, 4.2, 'Très bon travail.'),
(1005, 56, 4.7, 'Très impressionnant.'),
(1006, 66, 4.3, 'Bonne contribution.');

-- Insertion de données dans la table Participer
INSERT INTO PARTICIPER (noPanel, noRepre) VALUES
(16, 11),
(26, 21),
(36, 31),
(46, 41),
(56, 51),
(66, 61);

-- Insertion de données dans la table Composant
INSERT INTO COMPOSANT (id_composant, libelle, prix) VALUES
(118, 'Composant1', 10.50),
(218, 'Composant2', 15.75),
(318, 'Composant3', 20.00),
(418, 'Composant4', 12.00),
(518, 'Composant5', 18.50),
(618, 'Composant6', 22.75);

-- Insertion de données dans la table Utiliser
INSERT INTO UTILISER (nbreComposant, id_composant, codeProg) VALUES
(10, 118, 1001),
(15, 218, 1002),
(20, 318, 1003),
(12, 418, 1004),
(18, 518, 1005),
(22, 618, 1006);
