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