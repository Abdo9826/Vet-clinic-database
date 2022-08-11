/*Queries that provide answers to the questions from all projects.*/


SELECT * FROM animal WHERE name LIKE '%mon';
SELECT name FROM animal where date_of_birth BETWEEN 'Jan 01 2016' AND ' Dec 31 2019';
SELECT * FROM animal WHERE neutered=true AND escape_attempts < 3;
SELECT date_of_birth FROM animal WHERE name='Pikachu' OR name='Agumon';
SELECT name, escape_attempts FROM animal WHERE weight_kg >10.5;
SELECT * FROM animal WHERE neutered=true;
SELECT * FROM animal WHERE name != 'Gabumon';
SELECT * FROM animal WHERE weight_kg BETWEEN 10.4 AND 17.3;

Update animal set species='unspecified';

Update animal  SET species='digimon' WHERE name LIKE '%mon';
Update animal  SET species='pokemon' WHERE species = 'unspecified';

BEGIN; 
DELETE FROM animal;
ROLLBACK;
Select * from animal;

Delete from animal where date_of_birth > 'Jan 1 2022';
SAVEPOINT saveA;

UPDATE animal set weight_kg= weight_kg * -1 where weight_kg < 0;
Commit;

SELECT COUNT(*) FROM animal;
SELECT COUNT(escape_attempts) FROM animal where escape_attempts = 0;
SELECT AVG(weight_kg) FROM animal;
SELECT species,  MAX(weight_kg) FROM animal Group by species;
SELECT species,  Min(weight_kg) FROM animal Group by species;
SELECT  AVG(escape_attempts) FROM animal where date_of_birth BETWEEN 'Jan 01 1990' AND 'Jan 01 2000';



SELECT name FROM animal a JOIN owners o ON o.Id = a.id;
SELECT name,full_name FROM animal JOIN owners ON animal.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';
Select owners.full_name, animal.name FROM owners JOIN animal on animal.owner_id = owners.id;
SELECT species.name, COUNT(*) FROM animal JOIN species on animal.species_id=species.species_id GROUP BY species.name;
SELECT animal.name FROM animal JOIN owners ON animal.owner_id = owners.id WHERE owners.full_name = 'Jennifer Orwell';
Select animal.name, owners.full_name, species.name FROM animal JOIN owners on animal.owner_id = owners.id 
                                 JOIN species on animal.species_id = species.species_id
                                 where species.name = 'Digimon' AND owners.full_name='Jennifer Orwell';

SELECT animal.name,animal.escape_attempts,owners.full_name FROM animal JOIN owners ON animal.owner_id = owners.id 
WHERE animal.escape_attempts = 0 AND owners.full_name = 'Dean Winchester';

SELECT animal.name,owners.full_name,animal.escape_attempts FROM animal JOIN owners ON animal.owner_id = owners.id 
WHERE owners.full_name = 'Dean Winchester';

SELECT owners.full_name as owner_full_name,COUNT(animal.name) AS Number_of_animals
FROM owners LEFT JOIN animal ON owners.id = animal.owner_id GROUP BY owner_full_name ORDER BY Number_of_animals DESC;