--DROP TABLE IF EXISTS Professor; DROP TABLE IF EXISTS Project; DROP TABLE IF EXISTS Dept; DROP TABLE IF EXISTS Graduate;
--DROP TABLE IF EXISTS work_dept;DROP TABLE IF EXISTS advise;DROP TABLE IF EXISTS work_in;DROP TABLE IF EXISTS supervise;
--DROP TABLE IF EXISTS Musicians;DROP TABLE IF EXISTS Album;DROP TABLE IF EXISTS Instrument;DROP TABLE IF EXISTS Songs;
--DROP TABLE IF EXISTS Plays;DROP TABLE IF EXISTS Perform;DROP TABLE IF EXISTS Place;DROP TABLE IF EXISTS Telephone;DROP TABLE IF EXISTS Lives;

CREATE TABLE Professor ( pSSN  CHAR(11) NOT NULL,  name CHAR(30), age INTEGER, rank text, specialty text,  PRIMARY KEY (pSSN) ); 
CREATE TABLE Project( pno INTEGER NOT NULL, pSSN CHAR(11),  budget  float,  sponsor  CHAR(30), start_date DATE, end_date DATE,  PRIMARY KEY (pno), FOREIGN KEY (pSSN) REFERENCES Professor); --manage included
CREATE TABLE Dept( dno  INTEGER NOT NULL,  pSSN CHAR(11) , dname CHAR(30), office CHAR(30),  PRIMARY KEY (dno), FOREIGN KEY (pSSN) REFERENCES Professor);
CREATE TABLE Graduate(  gSSN  CHAR(11) NOT NULL, dno INTEGER,  name  CHAR(30), age INTEGER, deg_pg  CHAR(30), PRIMARY KEY (gSSN)  ,  FOREIGN KEY (dno) REFERENCES Dept); --includes major

CREATE TABLE work_dept ( dno INTEGER,  pSSN CHAR(11), time_pc INTEGER, PRIMARY KEY (dno, pSSN), FOREIGN KEY (pSSN ) REFERENCES Professor, FOREIGN KEY (dno) REFERENCES Dept );
CREATE TABLE advise ( seniorSSN CHAR(11), gradSSN CHAR(11), PRIMARY KEY (seniorSSN, gradSSN), FOREIGN KEY (seniorSSN) REFERENCES Graduate, FOREIGN KEY (gSSN) REFERENCES Graduate );
CREATE TABLE work_in ( pno INTEGER, pSSN CHAR(11), PRIMARY KEY (pno, pSSN), FOREIGN KEY (pSSN) REFERENCES Professor, FOREIGN KEY (pno) REFERENCES Project );
CREATE TABLE supervise ( pSSN CHAR(11), gSSN CHAR(11), pno INTEGER, PRIMARY KEY (pSSN, gSSN, pno), FOREIGN KEY (pSSN) REFERENCES Professor, FOREIGN KEY (gSSN) REFERENCES Graduate, FOREIGN KEY (pno) REFERENCES Project );

--notes: I am not sure how to code that it is mandatory to have projects be worked on by at least one professor 
--and that it is mandatory for departments to have a professor that runs it.

CREATE TABLE Musicians( SSN  CHAR(11) NOT NULL,  name text, PRIMARY KEY (SSN) ); 
CREATE TABLE Album( albumidentifier INTEGER NOT NULL, SSN  CHAR(11), title text, copyrightDate DATE, speed float, PRIMARY KEY (albumidentifier  ) ,FOREIGN KEY (SSN) REFERENCES Musicians);
CREATE TABLE Instrument( instrID INTEGER NOT NULL,  key text,  dname text, PRIMARY KEY (instrID ) );
CREATE TABLE Songs( songID INTEGER NOT NULL,albumidentifier INTEGER, title text, author CHAR(30),  PRIMARY KEY (songID),  FOREIGN KEY (albumidentifier) REFERENCES Album);

CREATE TABLE Plays( SSN  CHAR(11), instrID INTEGER , PRIMARY KEY (SSN, instrID), FOREIGN KEY (SSN) REFERENCES Musicians, FOREIGN KEY (instrID ) REFERENCES Instrument);
CREATE TABLE Perform (SSN  CHAR(11), songID INTEGER , PRIMARY KEY (SSN, songID ), FOREIGN KEY (SSN) REFERENCES Musicians, FOREIGN KEY (songID) REFERENCES Songs);

CREATE TABLE Place(  address text NOT NULL,  PRIMARY KEY (address )  );
CREATE TABLE Telephone(phone_no CHAR(11), address text, FOREIGN KEY (address ) REFERENCES Place);
CREATE TABLE Lives ( SSN CHAR(11), phone_no CHAR(11), address text, PRIMARY KEY (SSN, address), FOREIGN KEY (phone_no,address) REFERENCES Telephone, FOREIGN KEY (SSN ) REFERENCES Musicians );

