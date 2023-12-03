CREATE TABLE if not exists genre (
    genre_id INT PRIMARY KEY,
    genre_Name VARCHAR(40) NOT NULL
);

CREATE TABLE if not exists songer (
    songer_id INT PRIMARY KEY,
    songer_name VARCHAR(40) NOT NULL
);

create table if not exists album (
	album_id INT primary key,
	album_name varchar(40),
	year date
);

create table if not exists songer_genres (
	songer_id INT references songer(songer_id),
	genre_ID INT references genres(genre_id),
	constraint pk primary key (songer_id,genre_id)
);

create table if not exists songers_album (
	songer_id INT references songer(songer_id),
	album_id INT references album(album_id),
	constraint pk_1 primary key (songer_id,album_id)
);

create table if not exists track (
	track_id int primary key,
	album_id int not null references album(album_id),
	duration time not null,
	track_name varchar(30)
);

create table if not exists collection (
	collelction_id int primary key,
	collection_name varchar(30),	
	year_publication date 
);

create table if not exists collection_track (
	collection_id int not null references collection (collelction_id),
	track_id int not null references track (track_id),
	constraint pk_2 primary key (collection_id,track_id)
);