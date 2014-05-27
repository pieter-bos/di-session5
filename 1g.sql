drop table if exists bestelling;

create table bestelling (
    boek_isbn varchar(255) references boek(isbn) on update cascade on delete cascade,
    aantal int
);

drop trigger if exists bestel_boeken on boek;
drop function if exists bestel_boeken();

create function bestel_boeken() returns trigger as
$BODY$
begin
    if (select count(*) from boek where boek.auteur = NEW.auteur) = 1 then
        insert into bestelling (boek_isbn, aantal) values (NEW.isbn, 5);
    end if;
    return null;
end;
$BODY$ language plpgsql;

create trigger bestel_boeken after insert on boek for each row execute procedure bestel_boeken();