SELECT S.sname,COUNT(*) as PartCount FROM Suppliers S, Catalog C, Parts P WHERE C.sid = S.sid and P.pid = C.pid GROUP BY  S.sname, S.sid;

SELECT S.sname,COUNT(*) as PartCount FROM Suppliers S, Catalog C, Parts P WHERE C.sid = S.sid and P.pid = C.pid GROUP BY  S.sname, S.sid HAVING COUNT(P.pid) <=3;

SELECT S.sname, COUNT(*) as PartCount FROM Suppliers S, Catalog C, Parts P WHERE C.sid = S.sid and P.pid = C.pid and P.color like 'Green%' GROUP BY S.sname, S.sid;

SELECT DISTINCT S.sname, Max(C.cost) FROM Suppliers S, Catalog C, Parts P WHERE C.sid=S.sid and P.pid = C.pid and P.color like 'Red%' GROUP BY S.sname, S.sid
INTERSECT SELECT DISTINCT S1.sname, Max(C1.cost) FROM Suppliers S1, Catalog C1, Parts P1 WHERE C1.sid=S1.sid and P1.pid = C1.pid and P1.color like 'Green%' GROUP BY S1.sname, S1.sid;

SELECT pname FROM catalog C,parts P WHERE P.pid = C.pid and C.cost < 3;

SELECT address FROM catalog C,parts P,suppliers S WHERE S.sid = C.sid AND P.pid = C.pid AND pname = 'Smoke Shifter End';
