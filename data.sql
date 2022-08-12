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



INSERT INTO
    vets(name, age, date_of_graduation)
VALUES
    ('William Tatcher', 45, 'Apr 23 2000'),
    ('Maisy Smith', 26, 'Jan 17 2019'),
    ('Stephanie Mendez', 64, 'May 04 1981'),
    ('Jack Harkness', 38, 'Jun 08 2008');

INSERT INTO
    visits(animal_id, vet_id, date_of_visit)
VALUES
    (6, 1, 'May 24 2020'),
    (6, 3, 'Jul 22 2020'),
    (7, 4, 'Feb 02 2021'),
    (8, 2, 'Jan 05 2020'),
    (8, 2, 'Mar 08 2020'),
    (8, 2, 'May 14 2020'),
    (9, 3, 'May 04 2021'),
    (10, 4, 'Feb 24 2021'),
    (11, 2, 'Dec 21 2019'),
    (11, 1, 'Aug 10 2020'),
    (11, 2, 'Apr 07 2021'),
    (12, 3, 'Sep 29 2019'),
    (13, 4, 'Oct 03 2020'),
    (13, 4, 'Nov 04 2020'),
    (14, 2, 'Jan 24 2019'),
    (14, 2, 'May 15 2019'),
    (14, 2, 'Feb 27 2020'),
    (14, 2, 'Aug 03 2020'),
    (15, 3, 'May 24 2020'),
    (15, 1, 'Jan 01 2021');


    INSERT INTO
    specialization(vet_id, species_id)
VALUES
    (1, 1),
    (3, 1),
    (4, 2);