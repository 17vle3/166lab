CREATE TABLE Professor ( SSN  CHAR(11) NOT NULL,  name text, age INTEGER, rank text, specialty text,  PRIMARY KEY (SSN) ); 
CREATE TABLE Project( pno  INTEGER NOT NULL,  budget  float,  sponsor text, start_date CHAR(8), end_date CHAR(8),  PRIMARY KEY (pno) );
CREATE TABLE Dept( pno  INTEGER NOT NULL,  budget  float,  sponsor text, start_date CHAR(8), end_date CHAR(8),  PRIMARY KEY (pno) );
CREATE TABLE Graduate(  SSN  CHAR(11) NOT NULL,  name text, age INTEGER, deg_pg text , PRIMARY KEY (SSN)  );

--senior to grad relations
CREATE TABLE seniorGrad(  sSSN  CHAR(11) NOT NULL,  PRIMARY KEY (SSN), FOREIGN KEY (SSN)  REFERENCES Graduate  );
CREATE TABLE gradGraduate(  gSSN  CHAR(11) NOT NULL, PRIMARY KEY (SSN), FOREIGN KEY (SSN)  REFERENCES Graduate  );

--prof-proj
CREATE TABLE Project( dno  INTEGER NOT NULL, dname text, office text,  PRIMARY KEY (pno) );
