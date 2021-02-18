SELECT pid
FROM catalog
WHERE cost < 10

SELECT pname
FROM catalog, parts
WHERE cost < 10

Select address 
FROM suppliers 
WHERE sname = “Fire Hydrant Cap”

Select sname 
FROM catalog, parts,suppliers
WHERE color = “green”

Select sname,pname
FROM catalog, parts,suppliers
