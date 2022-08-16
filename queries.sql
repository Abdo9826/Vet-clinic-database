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


SELECT
    animal.name
FROM
    animal
    JOIN visits ON animal.id = visits.animal_id
    JOIN vets ON vets.id = visits.vet_id
WHERE
    vets.name = 'William Tatcher'
    AND visits.date_of_visit = (
        SELECT
            MAX(visits.date_of_visit)
        FROM
            visits
            JOIN vets ON vets.id = visits.vet_id
        WHERE
            vets.name = 'William Tatcher'
);


SELECT
    DISTINCT COUNT(animal.name)
FROM
    animal
    JOIN visits ON animal.id = visits.animal_id
    JOIN vets ON vets.id = visits.vet_id
WHERE
    vets.name = 'Stephanie Mendez';


SELECT
    vets.name,
    species.name
FROM
    vets
    LEFT JOIN specialization ON vets.id = specialization.vet_id
    LEFT JOIN species ON species.species_id = specialization.species_id
ORDER BY
    vets.id;


SELECT 
  animal.name
FROM
  animal
  JOIN visits ON visits.animal_id = animal.id
  JOIN vets ON vets.id = visits.vet_id
  WHERE vets.name = 'Stephanie Mendez' 
       AND (visits.date_of_visit  BETWEEN 'Apr 1 2020'
            AND 'Aug 30 2020'
       );



SELECT
    animal.name,
    COUNT(animal.name) AS number_visits
FROM
    animal
    LEFT JOIN visits ON animal.id = visits.animal_id
GROUP BY
    animal.name
ORDER BY
    number_visits DESC;




SELECT 
  animal.name, visits.date_of_visit,vets.name
FROM
  animal
  JOIN visits ON visits.animal_id = animal.id
  JOIN vets ON vets.id = visits.vet_id
  WHERE vets.name = 'Maisy Smith'
      AND visits.date_of_visit = (
        SELECT
            MIN(visits.date_of_visit)
        FROM
            visits
            JOIN vets ON vets.id = visits.vet_id
        WHERE
            vets.name = 'Maisy Smith'
    );



SELECT
    species.name AS "Species name",
    COUNT(*)
FROM
    animal
    JOIN visits on visits.animal_id = animal.id
    JOIN vets on vets.id = visits.vet_id
    JOIN species on species.species_id = animal.species_id
WHERE
    vets.name = 'Maisy Smith'
GROUP by
    species.name
ORDER BY
    count DESC
lIMIT
    1;


//------------------------------------------------------------------------//////////////////////// 

EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 6;
EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2;
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';

CREATE INDEX idx_serial_id ON visits(animal_id);
ANALYZE;


CREATE INDEX idx_vet ON visits(vet_id) WHERE vet_id = 2;
ANALYZE;




CREATE INDEX idx_email ON owners(id)
WHERE email = 'owner_18327@mail.com';
ANALYZE;
