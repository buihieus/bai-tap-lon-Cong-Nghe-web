create database motogp;
use motogp;

/*Calendar Database*/
CREATE TABLE circuits (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL
);
CREATE TABLE events (
    id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    circuit_id INT,
    sponsor VARCHAR(255),
    FOREIGN KEY (circuit_id) REFERENCES circuits(id)
);
create table race_type(
	id int primary key not null,
    name varchar(255) not null
);

/*Riders and teams Database*/
create table riders(
	id int primary key,
    name varchar(255) not null,
    country varchar(255) not null,
    team_id int,
    rider_number int not null,
    foreign key (team_id) references teams(id)
);
create table teams(
	id int primary key,
    team_name varchar(255) not null,
    manufacturer varchar(255) not null,
	country varchar(255) not null,
    manager varchar(255) not null
);

/*Results Database*/
create table points(
	event_id int,
    rider_id int,
    sum int not null,
    sprint int not null,
    grand_prix int not null,
    foreign key (event_id) references events(id),
    foreign key (rider_id) references riders(id)
);
create table positions(
	event_id int,
    rider_id int,
    race_type_id int,
    foreign key (event_id) references events(id),
    foreign key (rider_id) references riders(id),
    foreign key (race_type_id) references race_type(id),
    time time not null,
    gap time not null default '0',
    position int not null default '0'
);

/*Standing Database*/
create table standing(
	id int primary key not null,
    rider_id int,
    foreign key (rider_id) references riders(id),
    season varchar(50) not null,
    points int not null,
    position int not null,
    leader int not null default '0',
    prev int not null,
    race_complete varchar(20)
);
create table seasons(
	id int primary key not null,
    year year not null,
    champion varchar(255)
);


