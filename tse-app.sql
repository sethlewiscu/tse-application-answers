CREATE TABLE users (
user_id int primary_key,
name text,
role text
);

CREATE TABLE tasks (
task_id int primary_key,
task_name text,
created_by int
);

CREATE TABLE permissions (
user_id int,
task_id int,
can_edit int
);
