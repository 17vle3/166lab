SELECT S.sname,COUNT(*) as PartCount
FROM Suppliers S, Catalog C, Parts P
WHERE C.sid = S.sid and P.pid = C.pid
GROUP BY  S.sname, S.sid;

SELECT S.sname,COUNT(*) as PartCount
FROM Suppliers S, Catalog C, Parts P
WHERE C.sid = S.sid and P.pid = C.pid
GROUP BY  S.sname, S.sid
HAVING COUNT(P.pid) <=3;

SELECT S.sname, COUNT(*) as PartCount
FROM Suppliers S, Catalog C, Parts P
WHERE C.sid = S.sid and P.sid = C.pid and P.color like 'Green%'
GROUP BY S.sname, S.sid;

create view temp
as
SELECT DISTINCT C.sid
FROM Catalog C, Parts P
WHERE P.pid = C.pid and P.color like 'Red%'
INTERSECT
SELECT DISTINCT C1.sid 
FROM Suppliers S1, Catalog C1, Parts P1
WHERE P1.id = C1.pid and P.color like 'Green%';

SELECT S.sname,Max(C.cost)
from temp,Catalog C,suppliers S
where temp.sid=C.sid and C.sid=S.id
GROUP BY S.sname, S.id;
