-- GROUP 32 : A system to manage the electronic equipments provided for use of the employees of an organization

CREATE DATABASE A_System_To_Manage_The_Electronic_Equipments_Of_An_Organization ;
use  A_System_To_Manage_The_Electronic_Equipments_Of_An_Organization ;

show databases;

-- location

Create table LOCATION_DETAILS(
	Location_ID VARCHAR(6) Not Null,
	Room_NO varchar(5) Not Null,
	Building varchar(20) ,
	Province varchar(50) Not Null,
	City varchar(50) Not Null,
	Street varchar(50) ,
	PRIMARY KEY (Location_ID)
);

CREATE TABLE EMPLOYEE_LOCATION(
	Employee_ID varchar (6)Not Null,
	Location_ID VARCHAR(6),
	PRIMARY KEY (Employee_ID)
);

-- employee

CREATE TABLE EMPLOYEE_CONTACTS(
   Employee_ID varchar (6)Not Null,
    Contact_No VARCHAR(10) NOT NULL,
    PRIMARY KEY ( Employee_ID, Contact_No)
);

Create table EMPLOYEE_DETAILS(
	Employee_ID VARCHAR(6) Not Null,  
	First_Name varchar(50) Not Null,
	Last_Name varchar(50) Not Null,
    Email varchar (50) Not Null,
    Designation varchar(50) Not Null,
	Province varchar(50) Not Null,
	City varchar(50) Not Null,
	Street varchar(50) Not Null,
	Birthday date Not Null,
    Age INT,
	PRIMARY KEY (Employee_ID)
);

-- Assignment


Create table DEVICE_ASSIGNMENT(
	Device_ID VARCHAR(6) Not Null, 
    Assignment_ID VARCHAR(6) ,
    Employee_ID VARCHAR(6),
    PRIMARY KEY (Device_ID)
);

Create table ASSIGNMENT_DETAILS(
    Assignment_ID VARCHAR(6) Not Null, 
    Assignment_Date date Not Null,
    Purpose VARCHAR(50),
    PRIMARY KEY (Assignment_ID)
);

Create table ELECTRONIC_DEVICE(
	Device_ID VARCHAR(6) Not Null ,
	Device_Name varchar(50) Not Null,
	Device_Type varchar(50) Not Null,
    Brand varchar (50) Not Null,
    Model varchar(50) Not Null,
    PRIMARY KEY (Device_ID)
);

Create table DEVICE_HISTORY(
    History_ID VARCHAR(6) Not Null, 
    Purchase_Date date Not Null,
    Device_Condition VARCHAR(20),
    PRIMARY KEY (History_ID)
);

Create table MAINTENANCE_RECORD(
    Record_ID VARCHAR(6) Not Null, 
    Device_ID VARCHAR(6),
    Maintenance_Date date Not Null,
    Maintenance VARCHAR(20),
    PRIMARY KEY (Record_ID)
);

Create table MAINTENANCE_DETAILS(
    Record_ID VARCHAR(6) Not Null, 
    Company VARCHAR(30),
    Cost decimal(30),
    PRIMARY KEY (Record_ID)
);

Create table SUPPLIER_DETAILS(
    Supplier_ID VARCHAR(6) Not Null, 
    Supplier_Name VARCHAR(50),
    Device_ID VARCHAR(6),
    PRIMARY KEY (Supplier_ID )
);

Create table SUPPLIER_CONTACT_INFO(
    Supplier_ID VARCHAR(6) Not Null, 
    Contact_No VARCHAR(10) NOT NULL,
    Email varchar (50) Not Null,
    PRIMARY KEY (Supplier_ID )
);

-- foreign keys

ALTER TABLE EMPLOYEE_LOCATION
ADD CONSTRAINT FK_EMPLOYEE_LOCATION_LOCATION_DETAILS FOREIGN KEY (Location_ID) REFERENCES LOCATION_DETAILS(Location_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE EMPLOYEE_LOCATION
ADD CONSTRAINT FK_EMPLOYEE_LOCATION_EMPLOYEE_DETAILS FOREIGN KEY (Employee_ID) REFERENCES EMPLOYEE_DETAILS(Employee_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE DEVICE_ASSIGNMENT 
ADD CONSTRAINT FK_DEVICE_ASSIGNMENT_ELECTRONIC_DEVICE FOREIGN KEY (Device_ID) REFERENCES ELECTRONIC_DEVICE(Device_ID) ON DELETE CASCADE ON UPDATE CASCADE; 

ALTER TABLE DEVICE_ASSIGNMENT 
ADD CONSTRAINT FK_DEVICE_ASSIGNMENT_ASSIGNMENT_DETAILS FOREIGN KEY (Assignment_ID) REFERENCES ASSIGNMENT_DETAILS(Assignment_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE DEVICE_ASSIGNMENT
ADD CONSTRAINT FK_EVICE_ASSIGNMENT_EMPLOYEE_DETAILS FOREIGN KEY (Employee_ID) REFERENCES EMPLOYEE_DETAILS(Employee_ID) ON DELETE CASCADE ON UPDATE CASCADE;

---

ALTER TABLE EMPLOYEE_CONTACTS
ADD CONSTRAINT FK_EMPLOYEE_CONTACTS_EMPLOYEE_DETAILS FOREIGN KEY (Employee_ID) REFERENCES EMPLOYEE_DETAILS(Employee_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE DEVICE_HISTORY 
ADD CONSTRAINT FK_DEVICE_HISTORY_ELECTRONIC_DEVICE FOREIGN KEY (History_ID) REFERENCES ELECTRONIC_DEVICE(Device_ID) ON DELETE CASCADE ON UPDATE CASCADE; 

ALTER TABLE MAINTENANCE_RECORD 
ADD CONSTRAINT FK_MAINTENANCE_RECORD_ELECTRONIC_DEVICE FOREIGN KEY (Device_ID) REFERENCES ELECTRONIC_DEVICE(Device_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE SUPPLIER_DETAILS
ADD CONSTRAINT FK_SUPPLIER_DETAILS_ELECTRONIC_DEVICE FOREIGN KEY (Device_ID) REFERENCES ELECTRONIC_DEVICE(Device_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE SUPPLIER_CONTACT_INFO
ADD CONSTRAINT FK_SUPPLIER_CONTACT_INFO_SUPPLIER_DETAILS FOREIGN KEY (Supplier_ID) REFERENCES SUPPLIER_DETAILS(Supplier_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE MAINTENANCE_DETAILS
ADD CONSTRAINT FK_MAINTENANCE_DETAILS_MAINTENANCE_RECORD FOREIGN KEY (Record_ID) REFERENCES MAINTENANCE_RECORD(Record_ID) ON DELETE CASCADE ON UPDATE CASCADE;


-- ***********************************************************************************

-- insert data

-- LOCATION_DETAILS
INSERT INTO LOCATION_DETAILS (Location_ID, Room_NO, Building, Province, City, Street) VALUES  
       ('LOC001', '101', 'Main Building', 'Province A', 'City A', 'Street A'),
       ('LOC002', '201', 'Annex Building', 'Province B', 'City B', 'Street B'),
       ('LOC003', '301', 'East Wing', 'Province C', 'City C', 'Street C'),
       ('LOC004', '401', 'West Wing', 'Province D', 'City D', 'Street D'),
       ('LOC005', '501', 'North Wing', 'Province E', 'City E', 'Street E'),
       ('LOC006', '601', 'South Wing', 'Province F', 'City F', 'Street F'),
       ('LOC007', '701', 'Central Building', 'Province G', 'City G', 'Street G');
       
-- EMPLOYEE_DETAILS
INSERT INTO EMPLOYEE_DETAILS (Employee_ID, First_Name, Last_Name, Email, Designation, Province, City, Street, Birthday)VALUES 
	   ('EMP001', 'MAYURA', 'JAYATHISSA', 'mayura@example.com', 'Manager', 'Province A', 'City A', 'Street A', '1999-02-13'),
       ('EMP002', 'TACHINDU', 'JAYASUNDARA', 'tachi@example.com', 'Assistant Manager', 'Province B', 'City B', 'Street B', '2000-10-20'),
       ('EMP003', 'DILUTH', 'JAYASIRI', 'diluth@example.com', 'Supervisor', 'Province C', 'City C', 'Street C', '2000-12-25'),
       ('EMP004', 'Emily', 'Brown', 'emily@example.com', 'Team Leader', 'Province D', 'City D', 'Street D', '1992-07-08'),
       ('EMP005', 'David', 'Wilson', 'david@example.com', 'Analyst', 'Province E', 'City E', 'Street E', '1995-03-30'),
       ('EMP006', 'Jennifer', 'Davis', 'jennifer@example.com', 'Associate', 'Province F', 'City F', 'Street F', '1998-09-12'),
       ('EMP007', 'Robert', 'Martinez', 'robert@example.com', 'Intern', 'Province G', 'City G', 'Street G', '2000-01-01'),
       ('EMP008', 'Sarah', 'Miller', 'sarah@example.com', 'Developer', 'Province H', 'City H', 'Street H', '1993-08-18'),
       ('EMP009', 'Christopher', 'Taylor', 'chris@example.com', 'Designer', 'Province I', 'City I', 'Street I', '1990-04-25'),
       ('EMP010', 'Amanda', 'Clark', 'amanda@example.com', 'HR Manager', 'Province J', 'City J', 'Street J', '1987-11-10'),
       ('EMP011', 'Daniel', 'Walker', 'daniel@example.com', 'Marketing Specialist', 'Province K', 'City K', 'Street K', '1994-02-28'),
       ('EMP012', 'Rachel', 'Adams', 'rachel@example.com', 'Financial Analyst', 'Province L', 'City L', 'Street L', '1988-09-03');
       
-- SELECT Employee_ID, First_Name, Last_Name, Birthday, FLOOR(DATEDIFF(CURDATE(), Birthday) / 365.25) AS Age FROM EMPLOYEE_DETAILS;
      
     
-- EMPLOYEE_LOCATION
INSERT INTO EMPLOYEE_LOCATION (Employee_ID, Location_ID) VALUES  
       ('EMP001', 'LOC001'),
       ('EMP002', 'LOC002'),
       ('EMP003', 'LOC003'),
       ('EMP004', 'LOC004'),
       ('EMP005', 'LOC005'),
       ('EMP006', 'LOC006'),
       ('EMP007', 'LOC007'),
       ('EMP008', 'LOC004'),
       ('EMP009', 'LOC005'),
       ('EMP010', 'LOC006'),
       ('EMP011', 'LOC007'),
       ('EMP012', 'LOC007');
       
-- EMPLOYEE_CONTACTS
INSERT INTO EMPLOYEE_CONTACTS (Employee_ID, Contact_No)VALUES  
       ('EMP001', '0710600000'),
       ('EMP002', '9876543210'),
       ('EMP003', '5555555555'),
       ('EMP004', '9998887776'),
       ('EMP005', '1112223334'),
       ('EMP006', '4444444444'),
       ('EMP007', '7777777777'),
       ('EMP008', '3333333333'),
       ('EMP009', '6666666666'),
       ('EMP010', '7777777777'),
       ('EMP011', '8888888888'),
       ('EMP012', '9999999999');

-- ASSIGNMENT_DETAILS
INSERT INTO ASSIGNMENT_DETAILS (Assignment_ID, Assignment_Date, Purpose) VALUES  
       ('ASS001', '2023-01-01', 'General Use'),
       ('ASS002', '2023-02-01', 'Project A'),
       ('ASS003', '2023-03-01', 'Meeting'),
       ('ASS004', '2023-04-01', 'Training'),
       ('ASS005', '2023-05-01', 'Development'),
       ('ASS006', '2023-06-01', 'Testing'),
       ('ASS007', '2023-07-01', 'Research');
       
-- ELECTRONIC_DEVICE
INSERT INTO ELECTRONIC_DEVICE (Device_ID, Device_Name, Device_Type, Brand, Model) VALUES  
       ('DEV001', 'Laptop', 'Laptop', 'Dell', 'Latitude'),
       ('DEV002', 'Desktop', 'Desktop', 'HP', 'Pavilion'),
       ('DEV003', 'Smartphone', 'Mobile Phone', 'Apple', 'iPhone'),
       ('DEV004', 'Tablet', 'Tablet', 'Samsung', 'Galaxy Tab'),
       ('DEV005', 'Monitor', 'Monitor', 'LG', 'UltraWide'),
       ('DEV006', 'Printer', 'Printer', 'Canon', 'PIXMA'),
       ('DEV007', 'Projector', 'Projector', 'Epson', 'PowerLite'),
       ('DEV008', 'Smartwatch', 'Wearable', 'Samsung', 'Galaxy Watch'),
       ('DEV009', 'Router', 'Networking', 'TP-Link', 'Archer C7'),
       ('DEV010', 'Smart Speaker', 'Smart Home', 'Amazon', 'Echo Dot'),
       ('DEV011', 'Camera', 'Camera', 'Canon', 'EOS Rebel T7i'),
       ('DEV012', 'Headphones', 'Audio', 'Sony', 'WH-1000XM4'),
       ('DEV013', 'Tablet', 'Tablet', 'Apple', 'iPad Air'),
       ('DEV014', 'External Hard Drive', 'Storage', 'Seagate', 'Backup Plus'),
       ('DEV015', 'Fitness Tracker', 'Wearable', 'Fitbit', 'Charge 4'),
       ('DEV016', 'Gaming Console', 'Gaming', 'Sony', 'PlayStation 5'),
       ('DEV017', 'Monitor', 'Monitor', 'Dell', 'UltraSharp');
       
-- DEVICE_ASSIGNMENT
INSERT INTO DEVICE_ASSIGNMENT (Device_ID, Assignment_ID, Employee_ID) VALUES  
       ('DEV001', 'ASS001', 'EMP001'),
       ('DEV002', 'ASS002', 'EMP002'),
       ('DEV003', 'ASS003', 'EMP003'),
       ('DEV004', 'ASS004', 'EMP004'),
       ('DEV005', 'ASS005', 'EMP007'),
       ('DEV006', 'ASS006', 'EMP006'),
       ('DEV007', 'ASS007', 'EMP007'),
	   ('DEV009', 'ASS005', 'EMP012'),
       ('DEV010', 'ASS006', 'EMP006'),
       ('DEV014', 'ASS007', 'EMP011');

-- DEVICE_HISTORY
INSERT INTO DEVICE_HISTORY (History_ID, Purchase_Date, Device_Condition) VALUES  
       ('DEV001', '2021-01-01', 'brand new'),
       ('DEV002', '2020-02-01', 'used'),
       ('DEV003', '2022-03-01', 'brand new'),
       ('DEV004', '2020-04-01', 'brand new'),
       ('DEV005', '2020-05-01', 'used'),
       ('DEV006', '2021-06-01', 'brand new'),
	   ('DEV010', '2021-03-01', 'brand new'),
       ('DEV011', '2023-04-01', 'brand new'),
       ('DEV013', '2022-05-01', 'used'),
       ('DEV008', '2020-06-01', 'recondition'),
       ('DEV007', '2020-07-01', 'brand new'); 

-- MAINTENANCE_RECORD
INSERT INTO MAINTENANCE_RECORD (Record_ID, Device_ID, Maintenance_Date, Maintenance) VALUES  
       ('REC001', 'DEV001', '2023-01-15', 'Software Update'),
       ('REC002', 'DEV002', '2023-02-15', 'Hardware Check'),
       ('REC003', 'DEV003', '2023-03-15', 'Battery Replacement'),
       ('REC004', 'DEV004', '2023-04-15', 'Cleaning'),
       ('REC005', 'DEV005', '2023-05-15', 'Calibration'),
       ('REC006', 'DEV006', '2023-06-15', 'Ink Refill'),
	   ('REC007', 'DEV003', '2023-03-15', 'Battery Replacement'),
       ('REC008', 'DEV004', '2023-04-15', 'Cleaning'),
       ('REC009', 'DEV005', '2023-05-15', 'Calibration'),
       ('REC010', 'DEV007', '2023-07-15', 'Lens Cleaning');
       
 -- MAINTENANCE_DETAILS
INSERT INTO MAINTENANCE_DETAILS (Record_ID, Company, Cost) VALUES  
	   ('REC001', 'Tech Solutions', 50),
       ('REC002', 'Hardware Experts', 100),
       ('REC003', 'Mobile Repair', 80),
       ('REC004', 'Cleaning Services', 30),
       ('REC005', 'Calibration Experts', 70),
       ('REC006', 'Printer Supplies', 40),
       ('REC007', 'Projector Care', 60);
       
-- SUPPLIER_DETAILS
INSERT INTO SUPPLIER_DETAILS (Supplier_ID, Supplier_Name, Device_ID) VALUES  
       ('SUP001', 'TechMart', 'DEV001'),
       ('SUP002', 'Electronics Inc.', 'DEV002'),
       ('SUP003', 'MobileWorld', 'DEV003'),
       ('SUP004', 'GadgetZone', 'DEV004'),
       ('SUP005', 'DisplayTech', 'DEV005'),
       ('SUP006', 'PrintWorld', 'DEV006'),
       ('SUP007', 'ProjectionTech', 'DEV007');
       
-- SUPPLIER_CONTACT_INFO
INSERT INTO SUPPLIER_CONTACT_INFO (Supplier_ID, Contact_No, Email) VALUES
	   ('SUP001', '1234567890', 'info@techmart.com'),
       ('SUP002', '9876543210', 'sales@electronicsinc.com'),
       ('SUP003', '5555555555', 'support@mobileworld.com'),
       ('SUP004', '9998887776', 'info@gadgetzone.com'),
       ('SUP005', '1112223334', 'contact@displaytech.com'),
       ('SUP006', '4444444444', 'info@printworld.com'),
       ('SUP007', '7777777777', 'sales@projectiontech.com');
       
       
   -- ****************************************************************************

-- Updating and Deleting Data from Tables

-- Update two rows in the LOCATION_DETAILS table
UPDATE LOCATION_DETAILS
SET Room_NO = '99'
WHERE Location_ID IN ('LOC006', 'LOC005');

-- Delete one row from the LOCATION_DETAILS table
DELETE FROM LOCATION_DETAILS
WHERE  Location_ID = 'LOC004';

-- Update two rows in the EMPLOYEE_DETAILS table
UPDATE EMPLOYEE_DETAILS
SET First_Name  = 'xxxx'
WHERE Employee_ID IN ('EMP010', 'EMP009');

-- Delete one row from the EMPLOYEE_DETAILS table
DELETE FROM EMPLOYEE_DETAILS
WHERE Employee_ID = 'EMP011'; 

-- Update two rows in the EMPLOYEE_LOCATION table
UPDATE EMPLOYEE_LOCATION
SET Location_ID =  'LOC002'
WHERE Employee_ID IN ('EMP005', 'EMP006');

-- Delete one row from the EMPLOYEE_LOCATION table
DELETE FROM EMPLOYEE_LOCATION
WHERE Employee_ID = 'EMP010'; 

-- *************************************************************************

-- --Simple Queries--------

SELECT * FROM LOCATION_DETAILS;

SELECT First_Name , Last_Name  FROM EMPLOYEE_DETAILS;

SELECT First_Name AS F_Name, Last_Name AS L_Name FROM EMPLOYEE_DETAILS;

SELECT * FROM EMPLOYEE_DETAILS WHERE Email LIKE '%example.com%';

SELECT Employee_ID, First_Name, Last_Name, Birthday, FLOOR(DATEDIFF(CURDATE(), Birthday) / 365.25) AS Age FROM EMPLOYEE_DETAILS;

SELECT * FROM LOCATION_DETAILS, EMPLOYEE_DETAILS;



-- --Complex Queries--------

SELECT ED.Employee_ID, ED.First_Name, LD.Room_NO
FROM EMPLOYEE_DETAILS ED
INNER JOIN EMPLOYEE_LOCATION EL ON ED.Employee_ID = EL.Employee_ID
INNER JOIN LOCATION_DETAILS LD ON EL.Location_ID = LD.Location_ID;

SELECT * FROM EMPLOYEE_DETAILS
NATURAL JOIN EMPLOYEE_LOCATION;

SELECT ED.Employee_ID, ED.First_Name, LD.Room_NO
FROM EMPLOYEE_DETAILS ED
LEFT OUTER JOIN EMPLOYEE_LOCATION EL ON ED.Employee_ID = EL.Employee_ID
LEFT OUTER JOIN LOCATION_DETAILS LD ON EL.Location_ID = LD.Location_ID;

SELECT ED.Employee_ID, ED.First_Name, LD.Room_NO
FROM EMPLOYEE_LOCATION EL
RIGHT OUTER JOIN EMPLOYEE_DETAILS ED ON EL.Employee_ID = ED.Employee_ID
RIGHT OUTER JOIN LOCATION_DETAILS LD ON EL.Location_ID = LD.Location_ID;

SELECT * FROM (
    SELECT Employee_ID, First_Name, Last_Name FROM EMPLOYEE_DETAILS
) AS Employees
WHERE Employee_ID IN (
    SELECT Employee_ID FROM EMPLOYEE_LOCATION WHERE Location_ID = 'LOC001'
);

SELECT Employee_ID, First_Name, Last_Name 
FROM EMPLOYEE_DETAILS 
WHERE Employee_ID IN (
    SELECT DA.Employee_ID 
    FROM DEVICE_ASSIGNMENT DA 
    INNER JOIN DEVICE_HISTORY DH ON DA.Device_ID = DH.History_ID 
    WHERE DH.Purchase_Date > '2022-01-01'
);

-- DATABASE TUNING

SELECT ED.Employee_ID, ED.First_Name, ED.Last_Name, COUNT(*) AS Device_Count
FROM EMPLOYEE_DETAILS AS ED
INNER JOIN DEVICE_ASSIGNMENT AS DA ON ED.Employee_ID = DA.Employee_ID
GROUP BY ED.Employee_ID, ED.First_Name, ED.Last_Name;

SELECT Employee_ID, First_Name, Last_Name
FROM EMPLOYEE_DETAILS
WHERE Employee_ID IN (
    SELECT Employee_ID FROM EMPLOYEE_LOCATION
) AND Employee_ID NOT IN (
    SELECT Employee_ID FROM EMPLOYEE_DETAILS
    WHERE Employee_ID NOT IN (
        SELECT Employee_ID FROM EMPLOYEE_LOCATION
    )
);

(SELECT Device_ID, Device_Name FROM ELECTRONIC_DEVICE)
UNION ALL
(SELECT Supplier_ID, Supplier_Name FROM SUPPLIER_DETAILS);

SELECT ED1.Employee_ID, ED1.First_Name, ED1.Last_Name, COUNT(*) AS Subordinates_Count
FROM EMPLOYEE_DETAILS AS ED1
INNER JOIN EMPLOYEE_DETAILS AS ED2 ON ED1.Employee_ID = ED2.Employee_ID
GROUP BY ED1.Employee_ID, ED1.First_Name, ED1.Last_Name;

SELECT ED.Employee_ID, ED.First_Name, ED.Last_Name, MD.Company, MD.Cost
FROM EMPLOYEE_DETAILS AS ED
RIGHT OUTER JOIN MAINTENANCE_RECORD AS MR ON ED.Employee_ID = MR.Device_ID
LEFT JOIN MAINTENANCE_DETAILS AS MD ON MR.Record_ID = MD.Record_ID
WHERE MD.Company IS NOT NULL;

SELECT Device_ID, Device_Name, Brand
FROM ELECTRONIC_DEVICE
WHERE Device_Type = 'Laptop'

UNION

SELECT Device_ID, Device_Name, Brand
FROM ELECTRONIC_DEVICE
WHERE Device_Type = 'Desktop';




