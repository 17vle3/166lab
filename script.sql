SELECT pid
FROM catalog
WHERE cost < 10;

SELECT parts.pname
FROM catalog,parts
WHERE cost<10;

Select address 
FROM suppliers 
WHERE suppliers.sname = 'Fire Hydrant Cap';

Select sname 
FROM catalog, parts,suppliers
WHERE parts.color = 'Green';

Select sname,pname
FROM catalog, parts,suppliers;

