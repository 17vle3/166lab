SELECT pid
FROM catalog
WHERE cost < 10;

SELECT parts.pname
FROM catalog,parts
WHERE cost<10
