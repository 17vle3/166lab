/*1.Count how many parts in NYC have more than 70 parts on hand*/

SELECT  COUNT(p) 
FROM part_nyc p 
WHERE p.on_hand>70;
/*2. Count how many total parts on hand, in both NYC and SFO, are Red 0 = red 1 = green*/

/*<<<<<<< HEAD
SELECT  SUM(n.on_hand) 
FROM part_nyc n , part_sfo s
WHERE  n.color = 0  and s.color= 0;
=======*/

select COALESCE((select SUM(n.on_hand)  from part_nyc n, color c where n.color = C.color_id AND color_name = 'Red'),0) + COALESCE((select SUM(s.on_hand) from part_sfo s,color c where s.color = C.color_id AND color_name = 'Red'),0) AS numTwo ;

/*3. List all the suppliers that have more total on hand parts in NYC than
they do in SFO.*/

/*SELECT  DISTINCT n.supplier 
FROM part_nyc n , part_sfo s
WHERE  (select SUM(n1.on_hand)  from part_nyc n1 where n1.supplier = n.supplier) > (select SUM(s2.on_hand)  from part_sfo s2 where s.supplier = s2.supplier);
*/

SELECT S.supplier_id, S.supplier_name
FROM supplier S
WHERE (SELECT SUM(SFO.on_hand) FROM part_sfo SFO WHERE S.supplier_id = SFO.supplier) < (SELECT SUM(NYC.on_hand) FROM part_nyc NYC WHERE S.supplier_id = NYC.supplier)
ORDER BY S.supplier_id;


/*4. List all suppliers that supply parts in NYC that aren’t supplied by
anyone in SFO.*/

SELECT DISTINCT sup.supplier_id, sup.supplier_name
FROM supplier sup, part_nyc n
WHERE sup.supplier_id = n.supplier AND n.part_number IN
(SELECT n1.part_number FROM supplier sup, part_nyc n1 WHERE sup.supplier_id = n1.supplier
  EXCEPT
  SELECT s.part_number FROM supplier sup, part_sfo s WHERE sup.supplier_id = s.supplier)
ORDER BY sup.supplier_id;


/*5. Update all of the NYC on hand values to on hand - 10.*/

UPDATE part_nyc 
SET on_hand = on_hand-10
WHERE on_hand>=10;

/*6. Delete all parts from NYC which have less than 30 parts on hand.*/
DELETE FROM part_nyc  WHERE on_hand<30;
