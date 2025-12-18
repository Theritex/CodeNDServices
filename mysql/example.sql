create database if not exists projects;
use proytectos;
create table asimpleproject (
    id int unsigned not null,
    author varchar(15) not null,
    date_created datetime not null,
    last_updated datetime not null,
    contributors varchar(100) not null,
    primary key (id)
);
insert into asimpleproject (id, author, date_created, last_updated, contributors);
values (1, 'Nisamov', '2025-12-18 18:05:00', '2025-12-18 18:05:00', 'Unknown,Random');