DELETE FROM dictionaries WHERE reference = 'person_roles';

INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO person_roles (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'Member', 'A natural person who has joined the club, is listed in the membership register, and may participate in activities, events, and decision-making processes'),
((SELECT MAX(id) FROM dictionaries), 'de', 'Mitglied', 'Eine natürliche Person, die dem Verein beigetreten ist, im Mitgliederverzeichnis geführt wird und an Aktivitäten, Veranstaltungen und Entscheidungsprozessen des Vereins teilnehmen darf'),
((SELECT MAX(id) FROM dictionaries), 'fr', 'Membre', 'Une personne physique ayant adhéré au club, inscrite au registre des membres et autorisée à participer aux activités, événements et processus décisionnels'),
((SELECT MAX(id) FROM dictionaries), 'it', 'Membro', 'Una persona fisica che ha aderito al club, iscritta nel registro dei membri e autorizzata a partecipare ad attività, eventi e processi decisionali');

INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO person_roles (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'President', 'Overall responsibility for the club'),
((SELECT MAX(id) FROM dictionaries), 'de', 'Präsidium', 'Gesamtverantwortung für den Verein'),
((SELECT MAX(id) FROM dictionaries), 'fr', 'Président', 'Responsabilité générale du club'),
((SELECT MAX(id) FROM dictionaries), 'it', 'Presidente', 'Responsabilità generale del club');

INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO person_roles (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'Vice President', 'Deputy to the president'),
((SELECT MAX(id) FROM dictionaries), 'de', 'Vizepräsidium', 'Stellvertretung des Präsidenten'),
((SELECT MAX(id) FROM dictionaries), 'fr', 'Vice-président', 'Adjoint du président'),
((SELECT MAX(id) FROM dictionaries), 'it', 'Vicepresidente', 'Vice del presidente');

INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO person_roles (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'Finance', 'Finances, accounting, budgeting, membership fees, settlements with associations and authorities'),
((SELECT MAX(id) FROM dictionaries), 'de', 'Finanzen', 'Finanzen, Buchhaltung, Budget, Mitgliederbeiträge, Abrechnung mit Verbänden und Behörden'),
((SELECT MAX(id) FROM dictionaries), 'fr', 'Finances', 'Finances, comptabilité, budget, cotisations des membres, décomptes avec les associations et les autorités'),
((SELECT MAX(id) FROM dictionaries), 'it', 'Finanze', 'Finanze, contabilità, budget, quote dei membri, rendicontazioni con associazioni e autorità');

INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO person_roles (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'Secretary', 'Minutes, correspondence, administration, club register, invitations, general meeting documents'),
((SELECT MAX(id) FROM dictionaries), 'de', 'Aktuariat', 'Protokolle, Korrespondenz, Administration, Vereinsregister, Einladungen, GV-Unterlagen'),
((SELECT MAX(id) FROM dictionaries), 'fr', 'Secrétaire', 'Procès-verbaux, correspondance, administration, registre du club, invitations, documents pour l’assemblée générale'),
((SELECT MAX(id) FROM dictionaries), 'it', 'Segreteria', 'Verbali, corrispondenza, amministrazione, registro del club, inviti, documenti per l’assemblea generale');

INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO person_roles (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'Range Officer', 'Responsible for shooting operations, safety supervision, organization of training and events, and maintenance of the shooting range'),
((SELECT MAX(id) FROM dictionaries), 'de', 'Schützenmeisteramt', 'Verantwortlich für den Schiessbetrieb, Sicherheitsaufsicht, Organisation von Trainings und Schiessanlässen, Betreuung der Schiessanlage'),
((SELECT MAX(id) FROM dictionaries), 'fr', 'Responsable du tir', 'Responsable du tir, supervision de la sécurité, organisation des entraînements et des manifestations, gestion du stand de tir'),
((SELECT MAX(id) FROM dictionaries), 'it', 'Responsabile del tiro', 'Responsabile del tiro, supervisione della sicurezza, organizzazione degli allenamenti e delle manifestazioni, gestione del poligono di tiro');

INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO person_roles (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'Youth Coach', 'Training of young shooters, courses, training sessions, competitions, cooperation with SSV / KSV'),
((SELECT MAX(id) FROM dictionaries), 'de', 'Jungschützenleitung', 'Ausbildung der Jungschützen, Kurse, Trainings, Wettkämpfe, Zusammenarbeit mit SSV / KSV'),
((SELECT MAX(id) FROM dictionaries), 'fr', 'Responsable jeunes tireurs', 'Formation des jeunes tireurs, cours, entraînements, compétitions, collaboration avec la FST / AST'),
((SELECT MAX(id) FROM dictionaries), 'it', 'Responsabile giovani tiratori', 'Formazione dei giovani tiratori, corsi, allenamenti, competizioni, collaborazione con FST / AST');

INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO person_roles (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'Equipment Manager', 'Weapons, targets, ammunition, equipment, maintenance and inventory'),
((SELECT MAX(id) FROM dictionaries), 'de', 'Materialverwaltung', 'Waffen, Scheiben, Munition, Ausrüstung, Unterhalt und Inventar'),
((SELECT MAX(id) FROM dictionaries), 'fr', 'Responsable matériel', 'Armes, cibles, munitions, équipement, entretien et inventaire'),
((SELECT MAX(id) FROM dictionaries), 'it', 'Responsabile materiale', 'Armi, bersagli, munizioni, attrezzatura, manutenzione e inventario');

INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO person_roles (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'Range Operations', 'Operation and maintenance of the shooting range, opening hours, supervision, technical systems'),
((SELECT MAX(id) FROM dictionaries), 'de', 'Standbetrieb', 'Betrieb und Unterhalt der Schiessanlage, Öffnungszeiten, Aufsicht, Technik'),
((SELECT MAX(id) FROM dictionaries), 'fr', 'Exploitation du stand', 'Exploitation et entretien du stand de tir, horaires d’ouverture, surveillance, systèmes techniques'),
((SELECT MAX(id) FROM dictionaries), 'it', 'Gestione del poligono', 'Gestione e manutenzione del poligono di tiro, orari di apertura, sorveglianza, sistemi tecnici');

INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO person_roles (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'Catering & Events', 'Organization of catering, events, and volunteer assignments'),
((SELECT MAX(id) FROM dictionaries), 'de', 'Festwirtschaftsleitung', 'Organisation von Festwirtschaft, Events, Helfereinsätzen'),
((SELECT MAX(id) FROM dictionaries), 'fr', 'Restauration & événements', 'Organisation de la restauration, des événements et des engagements des bénévoles'),
((SELECT MAX(id) FROM dictionaries), 'it', 'Ristorazione & eventi', 'Organizzazione della ristorazione, degli eventi e degli incarichi dei volontari');

INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO person_roles (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'Media & Communications', 'Reports, media relations, social media'),
((SELECT MAX(id) FROM dictionaries), 'de', 'Medien', 'Berichte, Medien, Social Media'),
((SELECT MAX(id) FROM dictionaries), 'fr', 'Médias & communication', 'Rapports, relations avec les médias, réseaux sociaux'),
((SELECT MAX(id) FROM dictionaries), 'it', 'Media & comunicazione', 'Rapporti, relazioni con i media, social media');

INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO person_roles (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'IT & Systems', 'Website, results, communication systems'),
((SELECT MAX(id) FROM dictionaries), 'de', 'Systemverantwortung', 'Website, Resultate, Kommunikation'),
((SELECT MAX(id) FROM dictionaries), 'fr', 'Informatique & systèmes', 'Site web, résultats, systèmes de communication'),
((SELECT MAX(id) FROM dictionaries), 'it', 'IT & sistemi', 'Sito web, risultati, sistemi di comunicazione');

INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO person_roles (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'Board Member', 'Supports projects and represents sections or groups'),
((SELECT MAX(id) FROM dictionaries), 'de', 'Beisitz', 'Unterstützen Projekte, Vertreten Sektionen oder Gruppen'),
((SELECT MAX(id) FROM dictionaries), 'fr', 'Membre du comité', 'Soutient les projets et représente des sections ou des groupes'),
((SELECT MAX(id) FROM dictionaries), 'it', 'Membro del comitato', 'Supporta i progetti e rappresenta sezioni o gruppi');

INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO person_roles (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'Ammunition Manager', 'Ordering, storage, and distribution of ammunition'),
((SELECT MAX(id) FROM dictionaries), 'de', 'Munitionsverwaltung', 'Bestellung, Lagerung, Abgabe'),
((SELECT MAX(id) FROM dictionaries), 'fr', 'Responsable munitions', 'Commande, stockage et distribution des munitions'),
((SELECT MAX(id) FROM dictionaries), 'it', 'Responsabile munizioni', 'Ordine, stoccaggio e distribuzione delle munizioni');

INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO person_roles (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'Safety Officer', 'Safety concepts, supervision training, enforcement of safety regulations'),
((SELECT MAX(id) FROM dictionaries), 'de', 'Sicherheitsverantwortung', 'Sicherheitskonzepte, Aufsichtsschulung, Kontrolle der Sicherheitsvorschriften'),
((SELECT MAX(id) FROM dictionaries), 'fr', 'Responsable sécurité', 'Concepts de sécurité, formation des surveillants, contrôle des règles de sécurité'),
((SELECT MAX(id) FROM dictionaries), 'it', 'Responsabile sicurezza', 'Concetti di sicurezza, formazione della sorveglianza, controllo delle norme di sicurezza');

INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO person_roles (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'Auditor', 'Financial oversight and audit of the annual accounts'),
((SELECT MAX(id) FROM dictionaries), 'de', 'Revisionsstelle', 'Finanzkontrolle, Prüfung der Jahresrechnung'),
((SELECT MAX(id) FROM dictionaries), 'fr', 'Organe de révision', 'Contrôle financier et vérification des comptes annuels'),
((SELECT MAX(id) FROM dictionaries), 'it', 'Revisore', 'Controllo finanziario e revisione del bilancio annuale');

INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO person_roles (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'Association Delegate', 'Represents the club at KSV/SSV assemblies'),
((SELECT MAX(id) FROM dictionaries), 'de', 'Verbandsvertretung', 'Vertretung des Vereins an KSV/SSV-Versammlungen'),
((SELECT MAX(id) FROM dictionaries), 'fr', 'Délégué de l’association', 'Représente le club aux assemblées du KSV/SSV'),
((SELECT MAX(id) FROM dictionaries), 'it', 'Delegato dell’associazione', 'Rappresenta il club alle assemblee KSV/SSV');
