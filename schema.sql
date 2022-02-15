/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL, 
    name VARCHAR(100) NOT NULL, 
    date_of_birth DATE NOT NULL, 
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL
  );

--                                      Table "public.animals"
--      Column      |          Type          | Collation | Nullable |           Default            
-- -----------------+------------------------+-----------+----------+------------------------------
--  id              | integer                |           | not null | generated always as identity
--  name            | character varying(100) |           | not null | 
--  date_of_birth   | date                   |           | not null | 
--  escape_attempts | integer                |           | not null | 
--  neutered        | boolean                |           | not null | 
--  weight_kg       | numeric                |           | not null |


--Add a column species of type string to your animals
ALTER TABLE animals ADD COLUMN species VARCHAR(250);

--                                      Table "public.animals"
--      Column      |          Type          | Collation | Nullable |           Default            
-- -----------------+------------------------+-----------+----------+------------------------------
--  id              | integer                |           | not null | generated always as identity
--  name            | character varying(100) |           | not null | 
--  date_of_birth   | date                   |           | not null | 
--  escape_attempts | integer                |           | not null | 
--  neutered        | boolean                |           | not null | 
--  weight_kg       | numeric                |           | not null | 
--  species         | character varying(250) |           |          | 