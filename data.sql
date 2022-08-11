/* Populate database with sample data. */

INSERT INTO animal(name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES ('Agumon','Feb 3 2020', 10.23, true, 0);
INSERT INTO animal VALUES ('Gebumom','Nov 15 2018', 8, true, 2);
INSERT INTO animal VALUES ('Pikachu','Jan 7 2021', 15.04, false, 1);
INSERT INTO animal VALUES ('Devimon','May 12 2017', 11.0, true, 5);

INSERT INTO animal VALUES ('Charmander','Feb 8 2020', -11.0, false, 0);
INSERT INTO animal VALUES ('Plantmon','Nov 15 2021', -5.7, true, 2);
INSERT INTO animal VALUES ('Squirtle','Apr 2 1993', -12.13, false, 3);
INSERT INTO animal VALUES ('Angemon','Jun 12 2005', -45.0, true, 1);
INSERT INTO animal VALUES ('Boarmon','Jun 7 2005', 20.4, true, 7);
INSERT INTO animal VALUES ('Blossom','Oct 13 1998', 17.0, true, 3);
INSERT INTO animal VALUES ('Ditto','May 14 2022', 22.0, true, 4);

INSERT INTO owners(full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners(full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners(full_name, age) VALUES ('Bob', 45);
INSERT INTO owners(full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners(full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners(full_name, age) VALUES ('Jodie Whittaker', 38); 

UPDATE animal set owner_id = 1 where name = 'Agumon';
UPDATE animal set owner_id = 2 where name in ('Gabumon', 'Pikachu');
UPDATE animal set owner_id = 3 where name in ('Devimon', 'Plantmon');
UPDATE animal set owner_id = 4 where name in ('Charmander', 'Squirtle', 'Blossom');
UPDATE animal set owner_id = 5 where name in ('Angemon', 'Boarmon');


INSERT INTO species(name) VALUES ('Pokemon');
INSERT INTO species(name) VALUES ('Digimon');

UPDATE animal SET species_id = 2 WHERE name like '%mon';

UPDATE animal SET species_id = 1 WHERE species_id IS NULL;