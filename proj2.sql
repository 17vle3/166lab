DROP TABLE CRUISE CASCADE;
DROP TABLE CUSTOMER CASCADE;
DROP TABLE SHIP CASCADE;
DROP TABLE TECHNICIAN CASCADE;
DROP TABLE REPAIRS CASCADE;
DROP TABLE CAPTAIN CASCADE;
DROP TABLE CREW CASCADE;
DROP TABLE REQUEST CASCADE;
DROP TABLE RESERVATION CASCADE;
DROP TABLE HAS CASCADE;
/*DROP TABLE HAS_SCHEDULE CASCADE*/
DROP TABLE WORKS CASCADE;
DROP TABLE USES CASCADE;


CREATE TABLE CRUISE(
	C_num CHAR(10), 
	Cost FLOAT, 
	Num_sold INTEGER, 
	Num_stops INTEGER, 
	Actual_arrive_date DATE, 
	Actual_arrive_time TIME , 
	Actual_depart_date DATE, 
	Actual_depart_time TIME, 
	Source CHAR(32), 
	Destination CHAR(32), 
	PRIMARY KEY(C_num));

CREATE TABLE SCHEDULE(
	Day DATE,
	C_num CHAR(10) NOT NULL, 
	Depart_time TIME, 
	Arrive_time TIME, 
	PRIMARY KEY(C_num), 
	FOREIGN KEY(C_num) REFERENCES CRUISE ON DELETE CASCADE
);

CREATE TABLE Customer(
	First_name CHAR(32), 
	Last_name CHAR(32), 
	Gender CHAR(6), 
	Date_of_birth DATE,  
	Address CHAR(256), 
	Contact_num CHAR(11), 
	ID CHAR(10), 
	ZIP_code CHAR(5), 
	PRIMARY KEY(ID)
);

CREATE TABLE SHIP(
	Model CHAR(32), 
	ID CHAR(10), 
	Make CHAR(32), 
	Age INTEGER, 
	Seats INTEGER, 
	PRIMARY KEY(ID)
);

CREATE TABLE TECHNICIAN(
	ID CHAR(10), 
	PRIMARY KEY(ID)
);

CREATE TABLE REPAIRS( 
	Date DATE, 
	Code CHAR(15),
	SID CHAR(10),
	TID CHAR(10) NOT NULL,
	PRIMARY KEY(Code, SID, TID),
	FOREIGN KEY(SID) REFERENCES SHIP(ID),
	FOREIGN KEY(TID) REFERENCES TECHNICIAN(ID)
);

CREATE TABLE CAPTAIN(
	ID CHAR(10), 
	name CHAR(32), 
	PRIMARY KEY(ID)
);

CREATE TABLE CREW(
	ID CHAR(10), 
	name CHAR(32), 
	PRIMARY KEY(ID)
);

CREATE TABLE REQUEST( 
	ID CHAR(10), 
	CID CHAR(10),
	Code CHAR(15),
	SID CHAR(10)NOT NULL,
	TID CHAR(10)NOT NULL,
	PRIMARY KEY(ID),
	FOREIGN KEY(CID) REFERENCES CAPTAIN(ID),
	FOREIGN KEY(SID) REFERENCES SHIP(ID),
	FOREIGN KEY(TID) REFERENCES TECHNICIAN(ID),
	FOREIGN KEY(code) REFERENCES repair(code)
);

/*Needs ISA coded*/
CREATE TABLE RESERVATION(
	R_num INTEGER, 
	type CHAR(9),
	PRIMARY KEY(R_num)
	type ENUM("Waitlist", "Reserved", "Confirmed") NOT NULL,
);
CREATE TABLE Waitlist(
	R_num INTEGER not null REFERENCES Employee(R_num),
	PRIMARY KEY(R_num)
);
CREATE TABLE Reserved(
	R_num INTEGER not null REFERENCES Employee(R_num),
	PRIMARY KEY(R_num)
);
CREATE TABLE Confirmed(
	R_num INTEGER not null REFERENCES Employee(R_num),
	PRIMARY KEY(R_num)
);
/* Connects CRUISE, CUSTOMER, and RESERVATION*/
CREATE TABLE HAS(
	C_num CHAR(10) NOT NULL, 
	R_num INTEGER, 
	PID CHAR(10), 
	PRIMARY KEY(C_num, R_num, PID), 
	FOREIGN KEY(C_num) REFERENCES CRUISE, 
	FOREIGN KEY(R_num) REFERENCES RESERVATION, 
	FOREIGN KEY(PID) REFERENCES CUSTOMER(ID)
);

/*Connects CRUISE and SCHEDULE
CREATE TABLE has_schedule (
	PRIMARY KEY(C-num), 
	FOREIGN KEY(C-num) REFERENCES SCHEDULE
);*/

/*Connects CRUISE AND CREW*/
CREATE TABLE WORKS(
	C_num CHAR(10), 
	MID CHAR(10), 
	PRIMARY KEY(C_num, MID), 
	FOREIGN KEY(C_num) REFERENCES CRUISE, 
	FOREIGN KEY(MID) REFERENCES CREW(ID)
);

/*Connects CAPTAIN, CRUISE, and SHIP*/
CREATE TABLE USES(
	C_num CHAR(10) NOT NULL, 
	SID CHAR(10), 
	CID CHAR(10) NOT NULL, 
	PRIMARY KEY(C_num), 
	FOREIGN KEY(C_num) REFERENCES CRUISE, 
	FOREIGN KEY(SID) REFERENCES SHIP(ID), 
	FOREIGN KEY(CID) REFERENCES CAPTAIN(ID)
);

