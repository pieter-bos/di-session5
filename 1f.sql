drop table if exists Boek;
drop table if exists Exemplaar;

create table boek (
    isbn varchar(255) primary key,
    titel varchar(255),
    auteur varchar(255)
);

create table exemplaar (
    boek_isbn varchar(255) references boek(isbn) on update cascade,
    volgnummer int,
    gewicht int,
    kast varchar(255),
    primary key (boek_isbn, volgnummer)
);

drop trigger if exists cascade_exemplaren on boek;
drop function if exists cascade_exemplaren();

create function cascade_exemplaren() returns trigger as
$BODY$
begin
    delete from exemplaar where exemplaar.isbn = old.isbn;
end;
$BODY$ language plpgsql;

create trigger cascade_exemplaren before delete on boek for each row execute procedure cascade_exemplaren();