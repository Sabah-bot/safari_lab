DROP TABLE animals;
DROP TABLE assignments;
DROP TABLE staff;
DROP TABLE enclosure;

CREATE TABLE enclosure(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    capacity INT,
    closed_for_maintenance BOOLEAN

);

CREATE TABLE staff (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    employee_number INT
);

CREATE TABLE assignments (
    id SERIAL PRIMARY KEY,
    employee_id INTEGER REFERENCES staff(id) NOT NULL,
    enclosure_id INTEGER REFERENCES enclosure(id)NOT NULL,
    day VARCHAR(255)
);


CREATE TABLE animals (
    id SERIAL,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(255),
    age INT,
    enclosure_id INTEGER REFERENCES enclosure(id)
);


INSERT INTO enclosure (name, capacity, closed_for_maintenance) VALUES ('Big Cat Field',30,FALSE);
INSERT INTO enclosure (name, capacity, closed_for_maintenance) VALUES ('Frog Pond',100,FALSE);
INSERT INTO enclosure (name, capacity, closed_for_maintenance) VALUES ('Desert',100,FALSE);
INSERT INTO enclosure (name, capacity, closed_for_maintenance) VALUES ('Forest',45,TRUE);
INSERT INTO enclosure (name, capacity, closed_for_maintenance) VALUES ('Canopy',29,FALSE);

INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Poppy', 'Frog', 10, 2);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Alex', 'Monkey', 10, 4);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Leo', 'Lion', 8, 1);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Bradley', 'Parrot', 20, 5);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Jennifer', 'Camel', 30, 3);

INSERT INTO staff (name, employee_number) VALUES ('Robbie', 108098);
INSERT INTO staff (name, employee_number) VALUES ('Sabah', 809707);
INSERT INTO staff (name, employee_number) VALUES ('Rachel', 097098);
INSERT INTO staff (name, employee_number) VALUES ('Sabrina', 098097);
INSERT INTO staff (name, employee_number) VALUES ('George', 709780);

INSERT INTO assignments (employee_id, enclosure_id, day) VALUES (1, 2, 'Wednesday');
INSERT INTO assignments (employee_id, enclosure_id, day) VALUES (2, 2, 'Monday');
INSERT INTO assignments (employee_id, enclosure_id, day) VALUES (3, 3, 'Tuesday');
INSERT INTO assignments (employee_id, enclosure_id, day) VALUES (4, 4, 'Friday');
INSERT INTO assignments (employee_id, enclosure_id, day) VALUES (5, 5, 'Thursday');

-- The names of the animals in a given enclosure
SELECT animals.name FROM animals
INNER JOIN enclosure
ON animals.enclosure_id = enclosure.id
WHERE enclosure.id = 1;

-- The names of the staff working in a given enclosure
SELECT staff.name FROM staff
INNER JOIN assignments
ON staff.id = assignments.employee_id
INNER JOIN enclosure
ON enclosure.id = assignments.enclosure_id
WHERE enclosure.id = 2;

-- 'ON' describes the shared attribute between two tables i.e. PK and FK