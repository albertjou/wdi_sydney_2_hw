CREATE TABLE artworks (
  id SERIAL4 PRIMARY KEY,
  name TEXT,
  image TEXT,
  year DATE,
  price MONEY,
  artist_id SERIAL4,
  FOREIGN KEY (artist_id) REFERENCES artists (id)
);