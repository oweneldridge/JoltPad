-- CREATE TABLES
CREATE TABLE users (
  "user_id" serial NOT NULL PRIMARY KEY,
  "first_name" varchar(25) NOT NULL,
  "last_name" varchar(25) NOT NULL,
  "email" varchar(60) UNIQUE NOT NULL,
  "username" varchar(25) UNIQUE NOT NULL,
  "phone" integer,
  "avatar_path" varchar,
  "password_hash" varchar(60) NOT NULL
);
CREATE TABLE categories (
  "category_id" serial NOT NULL PRIMARY KEY,
  "category_name" varchar
);
CREATE TABLE notes (
  "note_id" serial NOT NULL PRIMARY KEY,
  "user_id" integer,
  "category_id" integer,
  "date_created" date DEFAULT CURRENT_DATE,
  "contents" varchar,
  FOREIGN KEY ("user_id") REFERENCES users("user_id"),
  FOREIGN KEY ("category_id") REFERENCES categories("category_id")
);

-- ADD USERS
INSERT INTO users VALUES (1, 'adam', 'berri', 'hello@adam.com', 'adamberri', 1234567890, NULL, 'password');
INSERT INTO users VALUES (2, 'johnny', 'bryan', 'hello@gmail.com', 'johnnyb', 1234567890, NULL, 'password');
INSERT INTO users VALUES (3, 'joshua', 'jordan', 'hello@josh.com', 'jj', 1234567890, NULL, 'password');
INSERT INTO users VALUES (4, 'sardor', 'akhmedov', 'hello@sardor.com', 'sardorakhmedov', 1234567890, NULL, 'password');
INSERT INTO users VALUES (5, 'owen', 'eldridge', 'hello@owen.com', 'oweneldridge', 1234567890, NULL, 'password');

-- ADD CATEGORIES
INSERT INTO categories VALUES (1, 'todos');
INSERT INTO categories VALUES (2, 'groceries');
INSERT INTO categories VALUES (3, 'ideas');
INSERT INTO categories VALUES (4, 'algos');

-- ADD NOTES
INSERT INTO notes VALUES (1, 1, 1, CURRENT_DATE, 'buy firewood');
INSERT INTO notes VALUES (2, 1, 1, CURRENT_DATE, 'make borscht');
INSERT INTO notes VALUES (3, 1, 2, CURRENT_DATE, 'eggs, raw milk, honey, tortillas, kiwis');
INSERT INTO notes VALUES (4, 1, 3, CURRENT_DATE, 'what about tinder but for taking notes?');

-- GET NOTES BY CATEGORY
SELECT * FROM notes WHERE user_id = 1 AND category_id = 1;
-- GET NOTES BY DATE (TODAY) ????
SELECT * FROM notes WHERE user_id = 1 AND date_created >= NOW() - '1 DAY'::INTERVAL;

-- UPDATE NOTE by id
UPDATE notes SET contents = 'get job' WHERE note_id = 1;

-- DELETE NOTE by ID
DELETE FROM notes WHERE user_id = 1 AND note_id = 1;
