-- read2(x)
select titel from boek where isbn = '0136067018';
-- write2(x)
update boek set titel = titel || ' deel 2' where isbn = '0136067018';