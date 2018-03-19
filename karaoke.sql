DROP TABLE rooms_songs;
DROP TABLE IF EXISTS guests;
DROP TABLE IF EXISTS rooms;
DROP TABLE songs;
DROP TABLE genres;
DROP TABLE artists;


CREATE TABLE genres (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE artists (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE songs (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  genre_id INT8 REFERENCES genres(id) ON DELETE CASCADE,
  artist_id INT8 REFERENCES artists(id) ON DELETE CASCADE
);

CREATE TABLE rooms (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE guests (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  room_id INT8 REFERENCES rooms(id) ON DELETE CASCADE,
  favourite_song INT8 REFERENCES songs(id) ON DELETE CASCADE
);

CREATE TABLE rooms_songs (
  room_id INT8 REFERENCES rooms(id) ON DELETE CASCADE,
  song_id INT8 REFERENCES songs(id) ON DELETE CASCADE
);


INSERT INTO genres (name) VALUES ('Rock');
INSERT INTO genres (name) VALUES ('Folk');
INSERT INTO genres (name) VALUES ('Metal');

INSERT INTO artists (name) VALUES ('Queen');
INSERT INTO artists (name) VALUES ('Iron Maiden');
INSERT INTO artists (name) VALUES ('Silly Wizard');

INSERT INTO songs (name, genre_id, artist_id)
  VALUES ('Killer Queen', 1, 1);
INSERT INTO songs (name, genre_id, artist_id)
  VALUES ('The Queen of Argyl', 2, 3);
INSERT INTO songs (name, genre_id, artist_id)
  VALUES ('The Trooper', 3, 2);

INSERT INTO rooms (name) VALUES ('Room1');

INSERT INTO rooms_songs (room_id, song_id) VALUES (1, 1);
INSERT INTO rooms_songs (room_id, song_id) VALUES (1, 2);
INSERT INTO rooms_songs (room_id, song_id) VALUES (1, 3);

INSERT INTO guests (name, room_id, favourite_song) VALUES ('Joe', 1, 1);
