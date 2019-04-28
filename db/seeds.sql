drop table if exists contents;
create table contents (
    id integer primary key,
    pagetitle text,
    body text
);

drop table if exists users;
create table users (
    id integer primary key,
    username text,
    password text
);
