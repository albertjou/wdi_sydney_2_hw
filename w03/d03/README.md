# Homework

## My awesome Blog

Create a blogging application with sinatra and active record.

* include a navigation menu with links to the home page and new post form
* the home page should list all blog posts
* clicking on a blog post title should show a single blog post 
* a blog post should have a title and a body


```sql

CREATE TABLE posts
(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  body TEXT
);

```

## Optional extras

* add comments using the diqus service 

