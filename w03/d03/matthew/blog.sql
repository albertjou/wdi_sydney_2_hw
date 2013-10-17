CREATE TABLE posts (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  body TEXT,
  created_at TIMESTAMP
);