--Not good
CREATE TABLE Airline_info (
    airline_id INT,
    airline_code VARCHAR(30),
    airline_name VARCHAR(50),
    airline_country VARCHAR(50),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    info VARCHAR(50)
);

CREATE TABLE Airport (
    airport_id INT,
    airport_name VARCHAR(50),
    country VARCHAR(50),
    state VARCHAR(50),
    city VARCHAR(50),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE Baggage_check (
    baggage_check_id INT,
    check_result VARCHAR(50),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    booking_id INT,
    passenger_id INT
);

CREATE TABLE Baggage (
    baggage_id INT,
    weight_in_kg DECIMAL(4,2),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    booking_id INT
);

CREATE TABLE Boarding_pass (
    boarding_pass_id INT,
    booking_id INT,
    seat VARCHAR(50),
    boarding_time TIMESTAMP,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE Booking_flight (
    booking_flight_id INT,
    booking_id INT,
    flight_id INT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE Booking (
    booking_id INT,
    flight_id INT,
    passenger_id INT,
    booking_platform VARCHAR(50),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    status VARCHAR(50),
    price DECIMAL(7,2)
);

CREATE TABLE Flights (
    flight_id INT,
    sch_departure_time TIMESTAMP,
    sch_arrival_time TIMESTAMP,
    departing_airport_id INT,
    arriving_airport_id INT,
    departing_gate VARCHAR(50),
    arriving_gate VARCHAR(50),
    airline_id INT,
    act_departure_time TIMESTAMP,
    act_arrival_time TIMESTAMP,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE Passengers (
    passenger_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    gender VARCHAR(50),
    country_of_citizenship VARCHAR(50),
    country_of_residence VARCHAR(50),
    passport_number VARCHAR(20),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE Security_check (
    security_check_id INT,
    check_result VARCHAR(20),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    passenger_id INT
);

--Good creation of tables


CREATE TABLE Airline_info (
    airline_id INT PRIMARY KEY,
    airline_code VARCHAR(30) NOT NULL,
    airline_name VARCHAR(50) NOT NULL,
    airline_country VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    info VARCHAR(50) NOT NULL
);

CREATE TABLE Airport (
    airport_id INT PRIMARY KEY,
    airport_name VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

CREATE TABLE Baggage_check (
    baggage_check_id INT PRIMARY KEY,
    check_result VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    booking_id INT NOT NULL,
    passenger_id INT NOT NULL
);

CREATE TABLE Baggage (
    baggage_id INT PRIMARY KEY,
    weight_in_kg DECIMAL(4,2) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    booking_id INT NOT NULL
);

CREATE TABLE Boarding_pass (
    boarding_pass_id INT PRIMARY KEY,
    booking_id INT NOT NULL,
    seat VARCHAR(50) NOT NULL,
    boarding_time TIMESTAMP NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

CREATE TABLE Booking_flight (
    booking_flight_id INT PRIMARY KEY,
    booking_id INT NOT NULL,
    flight_id INT NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

CREATE TABLE Booking (
    booking_id INT PRIMARY KEY,
    flight_id INT NOT NULL,
    passenger_id INT NOT NULL,
    booking_platform VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    status VARCHAR(50) NOT NULL,
    price DECIMAL(7,2) NOT NULL
);

CREATE TABLE Flights (
    flight_id INT PRIMARY KEY,
    sch_departure_time TIMESTAMP NOT NULL,
    sch_arrival_time TIMESTAMP NOT NULL,
    departing_airport_id INT NOT NULL,
    arriving_airport_id INT NOT NULL,
    departing_gate VARCHAR(50) NOT NULL,
    arriving_gate VARCHAR(50) NOT NULL,
    airline_id INT NOT NULL,
    act_departure_time TIMESTAMP NOT NULL,
    act_arrival_time TIMESTAMP NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

CREATE TABLE Passengers (
    passenger_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(50) NOT NULL,
    country_of_citizenship VARCHAR(50) NOT NULL,
    country_of_residence VARCHAR(50) NOT NULL,
    passport_number VARCHAR(20) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

CREATE TABLE Security_check (
    security_check_id INT PRIMARY KEY,
    check_result VARCHAR(20) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    passenger_id INT NOT NULL
);


--Changes

ALTER TABLE Airline_info RENAME TO airline;

ALTER TABLE booking RENAME COLUMN price TO ticket_price;

ALTER TABLE Flights ALTER COLUMN departing_gate TYPE TEXT;

ALTER TABLE Airline DROP COLUMN info;

--FK forgein keys

--Passengers
ALTER TABLE security_check 
ADD CONSTRAINT fk_security_check_passenger 
FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id);

ALTER TABLE booking
ADD CONSTRAINT fk_booking_passenger
FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id);

ALTER TABLE baggage_check
ADD CONSTRAINT fk_baggage_check_passenger
FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id);

--Booking
ALTER TABLE Baggage_check 
ADD CONSTRAINT fk_baggage_check_booking 
FOREIGN KEY (booking_id) REFERENCES booking(booking_id);

ALTER TABLE Baggage 
ADD CONSTRAINT fk_baggage_booking 
FOREIGN KEY (booking_id) REFERENCES booking(booking_id);

ALTER TABLE Boarding_pass 
ADD CONSTRAINT fk_boarding_pass_booking 
FOREIGN KEY (booking_id) REFERENCES booking(booking_id);

ALTER TABLE Booking_flight 
ADD CONSTRAINT fk_booking_flight_booking 
FOREIGN KEY (booking_id) REFERENCES booking(booking_id);

-- Flights 
ALTER TABLE Booking_flight 
ADD CONSTRAINT fk_booking_flight_flight 
FOREIGN KEY (flight_id) REFERENCES flights(flight_id);

ALTER TABLE Booking 
ADD CONSTRAINT fk_booking_flight 
FOREIGN KEY (flight_id) REFERENCES flights(flight_id);

-- Airport 
ALTER TABLE Flights 
ADD CONSTRAINT fk_flights_departing_airport 
FOREIGN KEY (departing_airport_id) REFERENCES airport(airport_id);

ALTER TABLE Flights 
ADD CONSTRAINT fk_flights_arriving_airport 
FOREIGN KEY (arriving_airport_id) REFERENCES airport(airport_id);

-- Airline
ALTER TABLE Flights 
ADD CONSTRAINT fk_flights_airline 
FOREIGN KEY (airline_id) REFERENCES airline(airline_id);

--To seee
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';

--To delete
DROP TABLE IF EXISTS Security_check;
DROP TABLE IF EXISTS Baggage_check;
DROP TABLE IF EXISTS Baggage;
DROP TABLE IF EXISTS Boarding_pass;
DROP TABLE IF EXISTS Booking_flight;
DROP TABLE IF EXISTS Booking;
DROP TABLE IF EXISTS Flights;
DROP TABLE IF EXISTS Passengers;
DROP TABLE IF EXISTS Airport;
DROP TABLE IF EXISTS Airline_info;

--DML
INSERT INTO airport (airport_id, airport_name, country, state, city, created_at, updated_at)
SELECT 
    id,
    'Airport_' || id,
    'Country_' || (id % 40 + 1),
    'State_' || (id % 20 + 1),
    'City_' || (id % 80 + 1),
    NOW() - (random() * INTERVAL '365 days'),
    NOW()
FROM generate_series(1, 200) AS id;
--
INSERT INTO airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at)
VALUES (1, 'KZR', 'KazAir', 'Kazakhstan', NOW(), NOW());
--
UPDATE airline SET airline_country = 'Turkey' WHERE airline_name = 'KazAir';
--
INSERT INTO airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at)
VALUES 
(2, 'AEZ', 'AirEasy', 'France', NOW(), NOW()),
(3, 'FLH', 'FlyHigh', 'Brazil', NOW(), NOW()),
(4, 'FLF', 'FlyFly', 'Poland', NOW(), NOW());

--
DELETE FROM flights WHERE EXTRACT(YEAR FROM sch_arrival_time) = 2024;

UPDATE booking SET ticket_price = ticket_price * 1.15;

DELETE FROM booking WHERE ticket_price < 10000;