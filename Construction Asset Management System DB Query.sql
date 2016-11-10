CREATE DATABASE WEB_ASSET_DB
GO
USE WEB_ASSET_DB
GO

CREATE TABLE LABORTYPE
(
LABORTYPEID INT IDENTITY(1,1) NOT NULL,
LABORTYPENAME VARCHAR (200),
CONSTRAINT PK_LABORTYPEID PRIMARY KEY(LABORTYPEID),
IsDeleted BIT,
)

CREATE TABLE WORKER
(
WORKERID INT IDENTITY (1,1)NOT NULL,
WORKERFNAME VARCHAR (200),
WORKERLNAME VARCHAR (200),
WORKERMIDNAME VARCHAR (200),
WORKERGEN VARCHAR (50),
WORKERDOB DATE,
WORKERADDR VARCHAR (200),
WORKERCITY VARCHAR (200),
WORKERPROV VARCHAR (200),
WORKEREMAIL VARCHAR (200),
WORKERTEL VARCHAR (50),
WORKERCELL VARCHAR (50),
BADGEID INT,
WORKERSTARTDATE DATE,
WORKERENDDATE DATE,
WORKERSTATUS VARCHAR (200),
WORKEREMPLOYTYPE VARCHAR(200),
WORKERIMAGE VARCHAR (300),
ASSWORKER BIT,
LABORTYPEID INT,
CONSTRAINT PK_WORKERID PRIMARY KEY(WORKERID),
CONSTRAINT FK_LABORTYPEID_LABORTYPE FOREIGN KEY (LABORTYPEID)REFERENCES LABORTYPE(LABORTYPEID),
IsDeleted BIT,
)

CREATE TABLE CLIENT
(
CLIENTID INT IDENTITY(1,1) NOT NULL,
CLIENTNAME VARCHAR(200),
--CLIENTBRANCH VARCHAR(200),
CLIENTADDR VARCHAR(200),
CLIENTCITY VARCHAR (200),
CLIENTPROV VARCHAR (200),
CLIENTTEL VARCHAR (50),
CLIENTCELL VARCHAR (50),
CLIENTEMAIL VARCHAR (100),
CONSTRAINT PK_CLIENTID PRIMARY KEY (CLIENTID),
IsDeleted BIT,
)

CREATE TABLE CLIENTSTAFF
(
CLIENTSTAFFID INT IDENTITY(1,1) NOT NULL,
CLIENTSTAFFFNAME VARCHAR(200),
CLIENTSTAFFLNAME VARCHAR(200),
CLIENTSTAFFTEL VARCHAR(50),
CLIENTSTAFFCELL VARCHAR(50),
CLIENTSTAFFEMAIL VARCHAR(200),
CLIENTSTAFFPOSITION VARCHAR(200),
CLIENTSTAFFSTATUS VARCHAR(200),
CLIENTID INT,
CONSTRAINT PK_CLIENTSTAFFID PRIMARY KEY (CLIENTSTAFFID),
CONSTRAINT FK_CLIENTID_CLIENTSTAFF FOREIGN KEY (CLIENTID) REFERENCES CLIENT(CLIENTID),
IsDeleted BIT,
)

CREATE TABLE MATERIALCTGRY
(
MATERIALCTGRYID INT IDENTITY(1,1) NOT NULL,
MATERIALCTGRYNAME VARCHAR (200),
MATERIALCTGRYDESC VARCHAR (200),
CONSTRAINT PK_MATERIALCTGRYID PRIMARY KEY (MATERIALCTGRYID),
IsDeleted BIT,
)

CREATE TABLE MATERIAL
(
MATERIALID INT IDENTITY(1,1) NOT NULL,
MATERIALNAME VARCHAR (200),
MATERIALDESC VARCHAR (200),
MATERIALIMG VARCHAR (300),
MATERIALCTGRYID INT,
CONSTRAINT PK_MATERIALID PRIMARY KEY (MATERIALID),
CONSTRAINT FK_MATERIALCTGRYID_MATERIAL FOREIGN KEY (MATERIALCTGRYID)REFERENCES MATERIALCTGRY(MATERIALCTGRYID),
IsDeleted BIT,
)


CREATE TABLE BADGE
(
BADGEID INT IDENTITY (1,1) NOT NULL,
BADGECODE VARCHAR (200),
BADGESTAT VARCHAR (200),
BADGEFROM DATE,
BADGETO DATE,
BADGEPICCODE VARCHAR (300),
WORKERID INT,
CONSTRAINT PK_BADGEID PRIMARY KEY (BADGEID),
CONSTRAINT FK_WORKERID_BADGE FOREIGN KEY (WORKERID) REFERENCES WORKER (WORKERID),
IsDeleted BIT,
)

CREATE TABLE TRADE
(
TRADEID INT IDENTITY (1,1)NOT NULL,
TRADENAME VARCHAR(200),
LABORTYPEID INT,
CONSTRAINT PK_TRADEID PRIMARY KEY (TRADEID),
CONSTRAINT FK_TRADEID_TRADE FOREIGN KEY (LABORTYPEID) REFERENCES LABORTYPE (LABORTYPEID),
IsDeleted BIT,
)
CREATE TABLE WORKERTRADE
(
WORKERTRADEID INT IDENTITY (1,1) NOT NULL,
WORKERID INT,
TRADEID INT,
CONSTRAINT PK_WORKERTRADEID PRIMARY KEY (WORKERTRADEID),
CONSTRAINT FK_TRADEID_WORKERTRADE FOREIGN KEY (TRADEID) REFERENCES TRADE(TRADEID),
CONSTRAINT FK_WORKERID_WORKERTRADE FOREIGN KEY (WORKERID) REFERENCES WORKER (WORKERID),
IsDeleted BIT,
)

CREATE TABLE SHIFT
(
SHIFTID INT IDENTITY (1,1) NOT NULL,
SHIFTNAME VARCHAR (200),
SHIFTSTART DATETIME ,
SHIFTEND DATETIME ,
SHIFTTOTAL VARCHAR (200),
SHIFTCOLOR VARCHAR (200),
CONSTRAINT PK_SHIFTID PRIMARY KEY (SHIFTID),
IsDeleted BIT,
)

CREATE TABLE COMPANYSTAFF
(
COMSTAFFID INT IDENTITY (1,1) NOT NULL,
COMSTAFFFRSTNAME VARCHAR (200) NOT NULL,
COMSTAFFLASTNAME VARCHAR (200) NOT NULL,
COMSTAFFPOSITION VARCHAR (200) NOT NULL,
CONSTRAINT PK_COMSTAFFID PRIMARY KEY (COMSTAFFID),
IsDeleted BIT,
)

CREATE TABLE PROJECT
(
PROJID INT IDENTITY (1,1)NOT NULL,
PROJNAME VARCHAR(200),
PROJSITE VARCHAR(300),
PROJSUBJ VARCHAR(200),
PROJDESC VARCHAR(500),
PROJATTACH VARCHAR(300),
PROJPMINO VARCHAR (200),
DATETODAY DATE,
PROJPROP DATE,
PROJAPPR DATE,
PROJRECEI DATE,
PROJFROM DATE,
PROJTO DATE,
STARTDATE DATE,
ENDDATE DATE,
PROGRESS VARCHAR(100),
CLIENTID INT,
CLNTPROJCONTID INT,
--CLNTPROJMANAID INT,
CLNTPROJPREPID INT,
CLNTPROJAPPID INT,
CNTRCTRPROJRECEIID INT,
CNTRCTRPROJAPPID INT,
SHIFTID INT,
--CNTRCTRPROJENCODE INT,
CONSTRAINT PK_PROJID PRIMARY KEY (PROJID),
CONSTRAINT FK_SHIFTID_PROJECT FOREIGN KEY (SHIFTID) REFERENCES SHIFT (SHIFTID),
CONSTRAINT FK_CLIENTID_PROJECT FOREIGN KEY (CLIENTID) REFERENCES CLIENT (CLIENTID),
CONSTRAINT FK_CLNTPROJCONTID_PROJECT FOREIGN KEY (CLNTPROJCONTID) REFERENCES CLIENTSTAFF (CLIENTSTAFFID),
--CONSTRAINT FK_CLNTPROJMANAID_PROJECT FOREIGN KEY (CLNTPROJMANAID) REFERENCES CLIENTSTAFF (CLIENTSTAFFID),
CONSTRAINT FK_CLNTPROJPREPID_PROJECT FOREIGN KEY (CLNTPROJPREPID) REFERENCES CLIENTSTAFF (CLIENTSTAFFID),
CONSTRAINT FK_CLNTPROJAPPID_PROJECT FOREIGN KEY (CLNTPROJAPPID) REFERENCES CLIENTSTAFF (CLIENTSTAFFID),
CONSTRAINT FK_CNTRCTRPROJRECEIID_PROJECT FOREIGN KEY (CNTRCTRPROJRECEIID) REFERENCES COMPANYSTAFF (COMSTAFFID),
CONSTRAINT FK_CNTRCTRPROJAPPID_PROJECT FOREIGN KEY (CNTRCTRPROJAPPID) REFERENCES COMPANYSTAFF (COMSTAFFID),
IsDeleted BIT,
)
CREATE TABLE EQUIPCTGRY
(
EQUIPCTGRYID INT IDENTITY(1,1) NOT NULL,
EQUIPCTGRYNAME VARCHAR (200),
EQUIPCTGRYDESC VARCHAR (200),
CONSTRAINT PK_EQUIPCTGRYID PRIMARY KEY (EQUIPCTGRYID),
IsDeleted BIT,
)

CREATE TABLE EQUIPMENT
(
EQUIPMENTID INT IDENTITY(1,1) NOT NULL,
EQUIPMENTNAME VARCHAR (200),
EQUIPMENTDESC VARCHAR (200),
EQUIPMENTIMG VARCHAR (300),
EQUIPCTGRYID INT,
QUANTITY VARCHAR (50),
INUSE VARCHAR (50),
STOCK VARCHAR (50),
CONSTRAINT PK_EQUIPMENTID PRIMARY KEY (EQUIPMENTID),
CONSTRAINT FK_EQUIPCTGRYID_EQUIPMENT FOREIGN KEY (EQUIPCTGRYID)REFERENCES EQUIPCTGRY(EQUIPCTGRYID),
IsDeleted BIT,
)

CREATE TABLE PROJREQTRADE
(
PROJREQTRADEID INT IDENTITY (1,1) NOT NULL,
PROJID INT,
TRADEID INT,
TRADEQUANTITY VARCHAR (50),
CONSTRAINT PK_PROJREQTRADEID PRIMARY KEY (PROJREQTRADEID),
CONSTRAINT FK_TRADEID_PROJREQTRADE FOREIGN KEY (TRADEID) REFERENCES TRADE(TRADEID),
CONSTRAINT FK_PROJECTID_PROJREQTRADE FOREIGN KEY (PROJID) REFERENCES PROJECT (PROJID),
IsDeleted BIT,
)

CREATE TABLE PROJREQEQUIP
(
PROJREQEQUIPID INT IDENTITY (1,1) NOT NULL,
PROJID INT,
EQUIPMENTID INT,
EQUIPQUANTITY VARCHAR (50),
CONSTRAINT PK_PROJREQEQUIPID PRIMARY KEY (PROJREQEQUIPID),
CONSTRAINT FK_EQUIPMENTID_PROJREQEQUIP FOREIGN KEY (EQUIPMENTID) REFERENCES EQUIPMENT(EQUIPMENTID),
CONSTRAINT FK_PROJECTID_PROJREQEQUIP FOREIGN KEY (PROJID) REFERENCES PROJECT (PROJID),
IsDeleted BIT,
)

CREATE TABLE ASSIGNEDEQUIP
(
ASSIGNEDEQUIPID INT IDENTITY (1,1) NOT NULL,
PROJID INT,
EQUIPMENTID INT,
ASSEQUIPQUANT VARCHAR (50),
CONSTRAINT PK_ASSIGNEDEQUIPID PRIMARY KEY (ASSIGNEDEQUIPID),
CONSTRAINT FK_PROJID_ASSIGNEDEQUIP FOREIGN KEY (PROJID) REFERENCES PROJECT (PROJID),
CONSTRAINT FK_EQUIPMENTID_ASSIGNEDEQUIP FOREIGN KEY (EQUIPMENTID) REFERENCES EQUIPMENT (EQUIPMENTID),
IsDeleted BIT,
)

CREATE TABLE ASSIGNEDWORKER
(
ASSIGNEDWORKERID INT IDENTITY (1,1) NOT NULL,
PROJID INT,
WORKERID INT,
INTHISPROJ BIT,
CONSTRAINT PK_ASSIGNEDWORKERID PRIMARY KEY (ASSIGNEDWORKERID),
CONSTRAINT FK_PROJID_ASSIGNEDWORKER FOREIGN KEY (PROJID)REFERENCES PROJECT (PROJID),
CONSTRAINT FK_WORKERID_ASSIGNEDWORKER FOREIGN KEY (WORKERID) REFERENCES WORKER (WORKERID),
IsDeleted BIT,
)

CREATE TABLE DAILYATTEND
(
DAILYATTENDID INT IDENTITY (1,1)NOT NULL,
ATTENDDDATE DATE,
WORKERID INT,
PROJID INT NOT NULL,
ATTENDTIMEIN DATETIME ,
ATTENDTIMEOUT DATETIME,
--BREAKSTART DATETIME,
--BREAKEND DATETIME,
--OTSTART DATETIME,
--OTEND DATETIME ,
TOTALHRS VARCHAR(20),
ATTENDSTATUS VARCHAR (30),
CONSTRAINT PK_DAILYATTENDID PRIMARY KEY (DAILYATTENDID),
CONSTRAINT FK_PROJECTID_DAILYATTEND FOREIGN KEY (PROJID)REFERENCES PROJECT (PROJID),
IsDeleted BIT,
)

--CREATE TABLE PROJECTATTEND
--(
--PROJECTATTENDID INT IDENTITY (1,1)NOT NULL,
--DAILYATTENDID INT,
--PROJID INT,
--CONSTRAINT PK_PROJECTATTENDID PRIMARY KEY (PROJECTATTENDID),
--CONSTRAINT FK_PROJID_PROJECTATTEND FOREIGN KEY (PROJID)REFERENCES PROJECT (PROJID),
--CONSTRAINT FK_DAILYATTENDID_PROJECTATTEND FOREIGN KEY (DAILYATTENDID) REFERENCES DAILYATTEND (DAILYATTENDID),
--IsDeleted BIT,
--)

--INSERT
INSERT INTO LABORTYPE (LABORTYPENAME) VALUES ('Professional')
INSERT INTO LABORTYPE (LABORTYPENAME) VALUES ('Skilled/Tradesman')
INSERT INTO LABORTYPE (LABORTYPENAME) VALUES ('Unskilled/Laborer')
INSERT INTO SHIFT (SHIFTNAME,SHIFTSTART,SHIFTEND,SHIFTTOTAL) VALUES ('Day','7:00 AM','3:00 PM','8')
INSERT INTO SHIFT (SHIFTNAME,SHIFTSTART,SHIFTEND,SHIFTTOTAL) VALUES ('Swing','3:00 PM','11:00 PM','8')
INSERT INTO SHIFT (SHIFTNAME,SHIFTSTART,SHIFTEND,SHIFTTOTAL) VALUES ('Night','11:00 PM','7:00 AM','8')

--UPDATE LABORTYPE SET IsDeleted=NULL where LABORTYPEID = 1
--CREATE TABLE EQUIPSTASH
--(
--EQUIPSTASHID INT IDENTITY (1,1) NOT NULL,
--EQUIPMENTID INT,
--QUANTITY VARCHAR (50),
--INUSE VARCHAR (50),
--STOCK VARCHAR (50),
--CONSTRAINT PK_EQUIPSTASHID PRIMARY KEY (EQUIPSTASHID),
--CONSTRAINT FK_EQUIPMENTID_EQUIPSTASH FOREIGN KEY (EQUIPMENTID) REFERENCES EQUIPMENT(EQUIPMENTID),
--)

