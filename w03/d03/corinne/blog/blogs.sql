CREATE TABLE posts
(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  body TEXT,
  created_at TIMESTAMP
);

CREATE TABLE comments (
  id SERIAL4 PRIMARY KEY,
  name TEXT,
  comment TEXT,
  post_id SERIAL4,
  FOREIGN KEY (post_id) references posts (id)
);

