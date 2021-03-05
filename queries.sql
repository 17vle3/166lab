/*1.Count how many parts in NYC have more than 70 parts on hand*/

SELECT  COUNT(p) 
FROM part_nyc p 
WHERE p.on_hand>70;
/*2. Count how many total parts on hand, in both NYC and SFO, are Red 0 = red 1 = green*/

<<<<<<< HEAD
SELECT  SUM(n.on_hand) 
FROM part_nyc n , part_sfo s
WHERE  n.color = 0  and s.color= 0;
=======

select (select count(*) from part_nyc where color .= 'Red') + (select count(*) from part_nyc where color .= 'Red') from dual;
>>>>>>> ec45bd1c631acb2c93fd06b4fc7756325d05d020

/*3. List all the suppliers that have more total on hand parts in NYC than
they do in SFO.*/

SELECT  n.supplier 
FROM part_nyc n , part_sfo s
<<<<<<< HEAD
WHERE  n.on_hand>s.on_hand and n.part_number = s.part_number;
=======
WHERE  n.on_hand>s.on_hand &n.supplier = s.supplier;
>>>>>>> ec45bd1c631acb2c93fd06b4fc7756325d05d020

/*4. List all suppliers that supply parts in NYC that aren’t supplied by
anyone in SFO.*/

SELECT  n.supplier 
FROM part_nyc n , part_sfo s
WHERE  NOT EXISTS(n.part_number= s.part_number);

/*5. Update all of the NYC on hand values to on hand - 10.*/

UPDATE part_nyc 
SET on_hand = 10;

/*6. Delete all parts from NYC which have less than 30 parts on hand.*/
DELETE FROM part_nyc  WHERE on_hand<30;
