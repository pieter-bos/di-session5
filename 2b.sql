-- read1(x)
select titel from boek where isbn = '0136067018';

-- read1(y)
select titel from boek where isbn = '0321228383';

-- write1(x)
update boek set titel = titel || ' deel 1' where isbn = '0136067018'

-- read2(x)
select titel from boek where isbn = '0136067018';

-- Rollback 1
*magic*