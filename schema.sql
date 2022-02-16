/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL, 
    name VARCHAR(100) NOT NULL, 
    date_of_birth DATE NOT NULL, 
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL
  );

ALTER TABLE animals ADD COLUMN species VARCHAR(250);

-- Create a table named owners with the following columns
CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY, 
    full_name VARCHAR(100), 
    age INT,
    PRIMARY KEY(id)
  );


-- Create a table named species with the following columns

CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY, 
    name VARCHAR(100),
    PRIMARY KEY(id)
  );

-- Modify animals table

-- Remove column species
ALTER TABLE animals DROP COLUMN species;

-- Add column species_id which is a foreign key referencing species table
ALTER TABLE animals 
ADD COLUMN species_id INT,
ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id);

-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals
ADD COLUMN owner_id INT,
ADD CONSTRAINT fk_owners FOREIGN KEY (owner_id) REFERENCES owners(id);
