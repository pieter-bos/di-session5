drop table if exists Boek;
drop table if exists Exemplaar;

create table boek (
    isbn varchar(255) primary key,
    titel varchar(255),
    auteur varchar(255)
);

create table exemplaar (
    boek_isbn varchar(255) references boek(isbn) on update cascade on delete cascade,
    volgnummer int,
    gewicht int,
    kast varchar(255),
    primary key (boek_isbn, volgnummer)
);