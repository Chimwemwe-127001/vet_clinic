INSERT INTO animals(
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUES ( 
        'Agumon',
        '2020-02-03',
        0,
        TRUE,
        10.23
);

INSERT INTO animals(
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUES (
    'Gabumon',
    '2018-11-15',
    2,
    TRUE,
    8
);

INSERT INTO animals(
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUES(
    'Pikachu',
    '2021-01-7',
    1,
    FALSE,
    15.08
);

INSERT INTO animals(
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUES(
    'Devimon',
    '2017-05-12',
    5,
    TRUE,
    11
);

INSERT INTO animals(
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUES(
    'Charmander',
    '2020-02-08',
    0,
    FALSE,
    -11
);

INSERT INTO animals(
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUES(
    'Plantmon',
    '2022-11-15',
    2,
    TRUE,
    -5.7
);

INSERT INTO animals(
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUES(
    'Squirtle',
    '1993-04-02',
    3,
    FALSE,
    -12.13
);

INSERT INTO animals(
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUES(
    'Angemon',
    '2005-06-12',
    1,
    TRUE,
    -45
);

INSERT INTO animals(
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUES(
    'Boarmon',
    '2005-06-07',
    7,
    TRUE,
    20.4
);

INSERT INTO animals(
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUES(
    'Blossom',
    '1998-10-13',
    3,
    TRUE,
    17
);

--Sam Smith 34 years old.
INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34);

--Jennifer Orwell 19 years old.
INSERT INTO owners (full_name, age)
VALUES ('Jennifer Orwell', 19);

--Bob 45 years old.
INSERT INTO owners (full_name, age)
VALUES ('Bob', 45);

--Melody Pond 77 years old.
INSERT INTO owners (full_name, age)
VALUES ('Melody Pond', 77);

--Dean Winchester 14 years old.
INSERT INTO owners (full_name, age)
VALUES ('Dean Winchester', 14);

--Jodie Whittaker 38 years old.
INSERT INTO owners (full_name, age)
VALUES ('Jodie Whittaker ', 38);

-- Pokemon
INSERT INTO species (name)
VALUES ('Pokemon');

-- Digimon
INSERT INTO species (name)
VALUES ('Digimon');

-- Modify your inserted animals so it includes the species_id value:
-- If the name ends in "mon" it will be Digimon
UPDATE animals 
SET species_id = (SELECT id FROM species WHERE name = 'Digimon')
WHERE name LIKE '%mon';

-- All other animals are Pokemon
UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Pokemon')
WHERE species_id IS NULL;

-- Modify your inserted animals to include owner information (owner_id):
-- Sam Smith owns Agumon.
UPDATE animals 
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';

-- Jennifer Orwell owns Gabumon and Pikachu.
UPDATE animals 
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name IN ('Gabumon', 'Pikachu');


-- Bob owns Devimon and Plantmon.
UPDATE animals 
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name IN ('Devimon', 'Plantmon');

-- Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE animals 
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');


-- Dean Winchester owns Angemon and Boarmon.
UPDATE animals 
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name IN ('Angemon', 'Boarmon');


--Vet William Tatcher is 45 years old and graduated Apr 23rd, 2000.
--Vet Maisy Smith is 26 years old and graduated Jan 17th, 2019.
--Vet Stephanie Mendez is 64 years old and graduated May 4th, 1981.
--Vet Jack Harkness is 38 years old and graduated Jun 8th, 2008.
INSERT INTO vets(NAME,AGE,DATE_OF_GRADUATION) VALUES('William Tatche', 45,'2000-04-23'),
(' Maisy Smith', 26, '2019-01-17'),('Stephanie Mendez',64,'1981-05-04'),
('Jack Harkness', 38,'2008-06-08');


--Vet William Tatcher is specialized in Pokemon.
--Vet Stephanie Mendez is specialized in Digimon and Pokemon.
--Vet Jack Harkness is specialized in Digimon.
INSERT INTO specializations (species_id,vets_id) VALUES (1,1),(2,3),(1,3),(2,4);

/*
Agumon(1) visited William Tatcher(1) on May 24th, 2020.
Agumon visited Stephanie Mendez(3) on Jul 22th, 2020.
Gabumon(2) visited Jack Harkness(4) on Feb 2nd, 2021.
Pikachu(3) visited Maisy Smith(2) on Jan 5th, 2020.
*/
INSERT INTO visits (animals_id,vets_id,date_of_visit) VALUES (1, 1, '2020-05-24'),(1, 3, '2020-07-22'),(2, 4, '2021-02-02'),(3, 2, '2020-01-05');

/*
Pikachu visited Maisy Smith(2) on Mar 8th, 2020.
Pikachu visited Maisy Smith(2) on May 14th, 2020.
Devimon(4) visited Stephanie Mendez(3) on May 4th, 2021.
Charmander(5) visited Jack Harkness(4) on Feb 24th, 2021.
*/
INSERT INTO visits (animals_id,vets_id,date_of_visit) VALUES (3, 2, '2020-03-08'),(3, 2, '2020-05-14'),(4, 2, '2021-05-04'),(5, 4, '2021-02-24');

/*
Plantmon(6) visited Maisy Smith(2) on Dec 21st, 2019.
Plantmon visited William Tatcher(1) on Aug 10th, 2020.
Plantmon visited Maisy Smith(2) on Apr 7th, 2021.
Squirtle(7) visited Stephanie Mendez(3) on Sep 29th, 2019.
*/
INSERT INTO visits (animals_id,vets_id,date_of_visit) VALUES (6, 2, '2019-12-21'),(6, 1, '2020-08-10'),(6, 2, '2021-04-07'),(7, 3, '2019-09-29');

/*
Angemon(8) visited Jack Harkness(4) on Oct 3rd, 2020.
Angemon visited Jack Harkness(4) on Nov 4th, 2020.
Boarmon(9) visited Maisy Smith(2) on Jan 24th, 2019.
Boarmon visited Maisy Smith(2) on May 15th, 2019.
*/
INSERT INTO visits (animals_id,vets_id,date_of_visit) VALUES (8, 4, '2020-10-03'),(8, 4, '2020-11-04'),(9, 2, '2019-01-24'),(9, 2, '2019-05-15');

/*
Boarmon visited Maisy Smith(2) on Feb 27th, 2020.
Boarmon visited Maisy Smith(2) on Aug 3rd, 2020.
Blossom(10) visited Stephanie Mendez(3) on May 24th, 2020.
Blossom visited William Tatcher(1) on Jan 11th, 2021.
*/
INSERT INTO visits (animals_id,vets_id,date_of_visit) VALUES (9, 2, '2020-02-27'),(9, 2, '2020-08-03'),(10, 3, '2020-05-24'),(10, 1, '2021-01-11');


© 2022 