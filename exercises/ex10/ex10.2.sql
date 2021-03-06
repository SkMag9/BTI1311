-- Exercise 10
-- Miszczuk, Streit

-- Aufhabe 2 - Kino
DROP TABLE IF EXISTS film;
CREATE TABLE film (
filmID INT NOT NULL,
titel TEXT NOT NULL,
regisseurname TEXT NOT NULL,
CONSTRAINT film_pkey
PRIMARY KEY (filmID)
);

DROP TABLE IF EXISTS sprache;
CREATE TABLE sprache(
spracheID INT NOT NULL,
sprachschluessel TEXT NOT NULL,
sprache TEXT NOT NULL,
CONSTRAINT sprache_pkey
PRIMARY KEY (spracheID)
);

DROP TABLE IF EXISTS adresse;
CREATE TABLE adresse (
adresseID int NOT NULL,
adresszeile1 TEXT NOT NULL,
adresszeile2 TEXT,
strasse TEXT NOT NULL,
hausnummer TEXT NOT NULL,
plz TEXT NOT NULL, 
ort TEXT NOT NULL,
CONSTRAINT adresse_pkey
PRIMARY KEY (adresseID)
);

DROP TABLE IF EXISTS kino;
CREATE TABLE kino (
kinoID INT NOT NULL,
adresseID INT NOT NULL,
kinoname TEXT NOT NULL,
telefonnummer TEXT NOT NULL,
CONSTRAINT kino_pkey
PRIMARY KEY (kinoID),
CONSTRAINT kino_adresse_fkey
FOREIGN KEY (adresseID)
REFERENCES adresse (adresseID)
);

DROP TABLE IF EXISTS person;
CREATE TABLE person (
personID INT NOT NULL,
adresseID INT NOT NULL,
cinecardNr INT NOT NULL, 
first_name TEXT NOT NULL,
last_name TEXT NOT NULL,
CONSTRAINT person_pkey
PRIMARY KEY (personID),
CONSTRAINT person_cinecard_fkey
FOREIGN KEY (adresseID)
REFERENCES adresse (adresseID)
);

DROP TABLE IF EXISTS vorstellung;
CREATE TABLE vorstellung (
vorstellungID INT NOT NULL,
kinoID INT NOT NULL,
filmID INT NOT NULL,
spracheID INT NOT NULL,
untertitel_spracheID INT NOT NULL,
datum TEXT NOT NULL,
startzeit TEXT NOT NULL,
endzeit TEXT NOT NULL,
CONSTRAINT vorstellung_pkey
PRIMARY KEY (vorstellungID),
CONSTRAINT vorstellung_kino_fkey
FOREIGN KEY (kinoID)
REFERENCES kino (kinoID),
CONSTRAINT vorstellung_film_fkey
FOREIGN KEY (filmID)
REFERENCES film (filmID),
CONSTRAINT vorstellung_sprache_fkey
FOREIGN KEY (spracheID)
REFERENCES sprache (spracheID),
CONSTRAINT vorstellung_untertitel_sprache_fkey
FOREIGN KEY (untertitel_spracheID)
REFERENCES sprache (spracheID)
);

DROP TABLE IF EXISTS besuch;
CREATE TABLE besuch (
besuchID INT NOT NULL,
personID INT NOT NULL,
vorstellungID INT NOT NULL, 
sitzplatznummer INT NOT NULL,
CONSTRAINT besuch_pkey
PRIMARY KEY (besuchID), 
CONSTRAINT besuch_person_fkey
FOREIGN KEY (personID)
REFERENCES person (personID),
CONSTRAINT besuch_vorstellung_fkey
FOREIGN KEY (vorstellungID)
REFERENCES vorstellung (vorstellungID)
);

