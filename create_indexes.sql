/*1.Count how many parts in NYC have more than 70 parts on hand*/
CREATE INDEX numOne
ON part_nyc(on_hand)
WHERE on_hand>70;

/*2. Count how many total parts on hand, in both NYC and SFO, are Red 0 = red 1 = green*/

CREATE INDEX numTwo
ON part_nyc(on_hand)
WHERE on_hand>70;

SELECT  SUM(n.on_hand+s.on_hand) 
FROM part_nyc n , part_sfo s
WHERE  n.color = 'Red' and s.color = 'Red';

/*3. List all the suppliers that have more total on hand parts in NYC than
they do in SFO.*/

SELECT  n.supplier 
FROM part_nyc n , part_sfo s
WHERE  n.on_hand>s.on_hand;

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
