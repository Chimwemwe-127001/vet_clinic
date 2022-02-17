/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id SERIAL PRIMARY KEY, 
    name VARCHAR(100), 
    date_of_birth DATE, 
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
  );

ALTER TABLE animals ADD COLUMN species VARCHAR(250);

-- Create a table named owners with the following columns
CREATE TABLE owners (
    id SERIAL PRIMARY KEY, 
    full_name VARCHAR(200), 
    age INT
  );


-- Create a table named species with the following columns

CREATE TABLE species (
    id SERIAL PRIMARY KEY, 
    name VARCHAR(255)
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


--Create a table named vets 
CREATE TABLE vets(
   id SERIAL PRIMARY KEY,
   name VARCHAR(255),
   age INT,
   date_of_graduation DATE
   );


-- Create a "join table" called specializations to handle this relationship.
CREATE TABLE specializations (
    species_id int,
    vets_id int,
    CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id),
    CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id)
);


-- Create a "join table" called visits to handle this relationship, it should also keep track of the date of the visit.
CREATE TABLE visits (
  animal_id INT,
  vet_id INT ,
  date_of_visit DATE,
  CONSTRAINT fk_animals
    FOREIGN KEY(animal_id)
      REFERENCES animals (id),
  CONSTRAINT fk_vets
    FOREIGN KEY(vet_id)
      REFERENCES vets(id)
);