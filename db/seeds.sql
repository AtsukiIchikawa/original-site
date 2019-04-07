drop table if exists contents;
create table contents (
    id integer primary key,
    pagetitle text,
    body text
);

insert into contents (pagetitle, body) values('title1', 'content1');
insert into contents (pagetitle, body) values('title2', 'content2');
