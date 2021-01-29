CREATE TABLE employees ( SSN  CHAR(11) NOT NULL,  salary  float,  phone  numeric ( 10 , 0 ),  PRIMARY KEY (SSN) ); 
CREATE TABLE departments ( dno  INTEGER NOT NULL,  budget  float,  dname text,  PRIMARY KEY (dno) );
CREATE TABLE works ( SSN CHAR(11) NOT NULL,  dno INTEGER NOT NULL,  PRIMARY KEY (SSN, dno),  FOREIGN KEY (SSN)  REFERENCES employees ,  FOREIGN KEY (dno)  REFERENCES departments);
CREATE TABLE Manages (  SSN  CHAR(11) NOT NULL,  dno INTEGER NOT NULL,  PRIMARY KEY (dno),  FOREIGN KEY (SSN)  REFERENCES employees ,  FOREIGN KEY (dno)  REFERENCES departments);   
CREATE TABLE children ( SSN CHAR(11) NOT NULL, name text NOT NULL,  PRIMARY KEY (SSN, name),  FOREIGN KEY (SSN)  REFERENCES employees ON DELETE CASCADE);
