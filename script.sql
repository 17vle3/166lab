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
WHERE C.sid = S.sid and P.pid = C.pid and P.color like 'Green%'
GROUP BY S.sname, S.sid;

SELECT DISTINCT S.sname, Max(C.cost)
FROM Suppliers S, Catalog C, Parts P
WHERE C.sid=S.sid and P.pid = C.pid and P.color like 'Red%'
INTERSECT
SELECT DISTINCT S1.sname, Max(C1.cost), 
FROM Suppliers S1, Catalog C1, Parts P1
WHERE C1.sid=S1.sid and P1.id = C1.pid and P1.color like 'Green%';


