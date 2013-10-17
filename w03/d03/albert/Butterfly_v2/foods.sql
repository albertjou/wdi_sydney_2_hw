CREATE TABLE foods (
  id SERIAL4 PRIMARY KEY,
  plant TEXT,
  photo TEXT,
  season TEXT,
  butterfly_id SERIAL4,
  FOREIGN KEY (butterfly_id) REFERENCES butterflies (id)
);