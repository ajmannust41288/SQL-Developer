--------------------------------------------------------
--  File created - Monday-September-12-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table PERSONAL
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."PERSONAL" 
   (	"ID" NUMBER, 
	"NAME" VARCHAR2(10 BYTE), 
	"ADDRESS" VARCHAR2(15 BYTE), 
	"CONTACT" NUMBER, 
	"AGE" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into SYSTEM.PERSONAL
SET DEFINE OFF;
Insert into SYSTEM.PERSONAL (ID,NAME,ADDRESS,CONTACT,AGE) values (10,'ankit','kapali',2845236589,18);
Insert into SYSTEM.PERSONAL (ID,NAME,ADDRESS,CONTACT,AGE) values (20,'ankush','kapali',2845236589,18);
Insert into SYSTEM.PERSONAL (ID,NAME,ADDRESS,CONTACT,AGE) values (30,'akhilesh','mango',2845236591,18);
Insert into SYSTEM.PERSONAL (ID,NAME,ADDRESS,CONTACT,AGE) values (40,'altaf','sakchi',4567467490,18);
Insert into SYSTEM.PERSONAL (ID,NAME,ADDRESS,CONTACT,AGE) values (50,'waqar','bannu',3324118288,10);
Insert into SYSTEM.PERSONAL (ID,NAME,ADDRESS,CONTACT,AGE) values (60,'qaqar','zannu',3325118288,20);
Insert into SYSTEM.PERSONAL (ID,NAME,ADDRESS,CONTACT,AGE) values (60,'eaqar','pannu',3324118288,30);
