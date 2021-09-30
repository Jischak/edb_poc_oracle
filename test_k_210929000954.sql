/*
########################################################################################
## EDB Migration Project Summary
##
## Project Name   : test_k
## Source Database: Oracle 18c
## Target Database: EDB Postgres Advanced Server 12
## Schema Name(s) : LEARNINGSQL
## Date           : Wed Sep 29 00:09:54 UTC 2021
########################################################################################

########################################################################################
## Note:
##     The majority of your schema may migrate with little or no developer support. 
##     However, variations between an Oracle schema and an EDB Advanced Server schema might 
##     need manual adjustments. For example, in some cases, an object gets created; 
##     but, the object may not work as expected due to incompatible function(s) or package(s) 
##     references. Also, you can fix these objects manually in the target database. 
##     Please contact EDB if you need assistance.
########################################################################################

########################################################################################
## Schema Object Definition Starts : 
########################################################################################
*/

CREATE SCHEMA LEARNINGSQL;

set search_path=LEARNINGSQL;

-- Migration Portal applied following repair actions
-- ERH-2020 replaced [CREATE SEQUENCE syntax] with [syntax compatible with target DB]
-- ERH-2019 replaced [out of range value] with [ +/-9223372036854775807 ]

CREATE SEQUENCE  LEARNINGSQL.HIBERNATE_SEQUENCE  MINVALUE 1 MAXVALUE 9223372036854775807  INCREMENT BY 1 START WITH 61 CACHE 20  NO CYCLE;

-- SEQUENCE HIBERNATE_SEQUENCE is compatible with EDB Postgres Advanced Server


-- Migration Portal applied following repair actions
-- ERH-2005 deleted [USING INDEX <CREATE INDEX CLAUSE> ENABLE]
-- ERH-2008 deleted [CHAR/BYTE IN SIZE]
-- ERH-2009 deleted [ENABLE]
-- ERH-2010 replaced [FLOAT precision] with [ 53 ]

CREATE TABLE LEARNINGSQL.ACCOUNT
   (	ACCOUNT_ID NUMBER(10,0) NOT NULL , 
	AVAIL_BALANCE  FLOAT( 53 ) ,
	CLOSE_DATE DATE,
	LAST_ACTIVITY_DATE DATE,
	OPEN_DATE DATE NOT NULL , 
	PENDING_BALANCE  FLOAT( 53 ) ,
	STATUS VARCHAR2(10 ),
	CUST_ID NUMBER(10,0),
	OPEN_BRANCH_ID NUMBER(10,0) NOT NULL , 
	OPEN_EMP_ID NUMBER(10,0) NOT NULL , 
	PRODUCT_CD VARCHAR2(10 ) NOT NULL , 
	 PRIMARY KEY (ACCOUNT_ID) );

-- TABLE ACCOUNT is compatible with EDB Postgres Advanced Server


-- Migration Portal applied following repair actions
-- ERH-2005 deleted [USING INDEX <CREATE INDEX CLAUSE> ENABLE]
-- ERH-2008 deleted [CHAR/BYTE IN SIZE]
-- ERH-2009 deleted [ENABLE]
-- ERH-2010 replaced [FLOAT precision] with [ 53 ]

CREATE TABLE LEARNINGSQL.ACC_TRANSACTION
   (	TXN_ID NUMBER(19,0) NOT NULL , 
	AMOUNT  FLOAT( 53 )  NOT NULL , 
	FUNDS_AVAIL_DATE TIMESTAMP (6) NOT NULL , 
	TXN_DATE TIMESTAMP (6) NOT NULL , 
	TXN_TYPE_CD VARCHAR2(10 ),
	ACCOUNT_ID NUMBER(10,0),
	EXECUTION_BRANCH_ID NUMBER(10,0),
	TELLER_EMP_ID NUMBER(10,0),
	 PRIMARY KEY (TXN_ID) );

-- TABLE ACC_TRANSACTION is compatible with EDB Postgres Advanced Server


-- Migration Portal applied following repair actions
-- ERH-2005 deleted [USING INDEX <CREATE INDEX CLAUSE> ENABLE]
-- ERH-2008 deleted [CHAR/BYTE IN SIZE]
-- ERH-2009 deleted [ENABLE]

CREATE TABLE LEARNINGSQL.BRANCH
   (	BRANCH_ID NUMBER(10,0) NOT NULL , 
	ADDRESS VARCHAR2(30 ),
	CITY VARCHAR2(20 ),
	"name" VARCHAR2(20 ) NOT NULL , 
	STATE VARCHAR2(10 ),
	ZIP_CODE VARCHAR2(12 ),
	 PRIMARY KEY (BRANCH_ID) );

-- TABLE BRANCH is compatible with EDB Postgres Advanced Server


-- Migration Portal applied following repair actions
-- ERH-2005 deleted [USING INDEX <CREATE INDEX CLAUSE> ENABLE]
-- ERH-2008 deleted [CHAR/BYTE IN SIZE]
-- ERH-2009 deleted [ENABLE]

CREATE TABLE LEARNINGSQL.BUSINESS
   (	INCORP_DATE DATE,
	"name" VARCHAR2(255 ) NOT NULL , 
	STATE_ID VARCHAR2(10 ) NOT NULL , 
	CUST_ID NUMBER(10,0) NOT NULL , 
	 PRIMARY KEY (CUST_ID) );

-- TABLE BUSINESS is compatible with EDB Postgres Advanced Server


-- Migration Portal applied following repair actions
-- ERH-2005 deleted [USING INDEX <CREATE INDEX CLAUSE> ENABLE]
-- ERH-2008 deleted [CHAR/BYTE IN SIZE]
-- ERH-2009 deleted [ENABLE]

CREATE TABLE LEARNINGSQL.CUSTOMER
   (	CUST_ID NUMBER(10,0) NOT NULL , 
	ADDRESS VARCHAR2(30 ),
	CITY VARCHAR2(20 ),
	CUST_TYPE_CD VARCHAR2(1 ) NOT NULL , 
	FED_ID VARCHAR2(12 ) NOT NULL , 
	POSTAL_CODE VARCHAR2(10 ),
	STATE VARCHAR2(20 ),
	 PRIMARY KEY (CUST_ID) );

-- TABLE CUSTOMER is compatible with EDB Postgres Advanced Server


-- Migration Portal applied following repair actions
-- ERH-2005 deleted [USING INDEX <CREATE INDEX CLAUSE> ENABLE]
-- ERH-2008 deleted [CHAR/BYTE IN SIZE]
-- ERH-2009 deleted [ENABLE]

CREATE TABLE LEARNINGSQL.DEPARTMENT
   (	DEPT_ID NUMBER(10,0) NOT NULL , 
	"name" VARCHAR2(20 ) NOT NULL , 
	 PRIMARY KEY (DEPT_ID) );

-- TABLE DEPARTMENT is compatible with EDB Postgres Advanced Server


-- Migration Portal applied following repair actions
-- ERH-2005 deleted [USING INDEX <CREATE INDEX CLAUSE> ENABLE]
-- ERH-2008 deleted [CHAR/BYTE IN SIZE]
-- ERH-2009 deleted [ENABLE]

CREATE TABLE LEARNINGSQL.EMPLOYEE
   (	EMP_ID NUMBER(10,0) NOT NULL , 
	END_DATE DATE,
	FIRST_NAME VARCHAR2(20 ) NOT NULL , 
	LAST_NAME VARCHAR2(20 ) NOT NULL , 
	START_DATE DATE NOT NULL , 
	TITLE VARCHAR2(20 ),
	ASSIGNED_BRANCH_ID NUMBER(10,0),
	DEPT_ID NUMBER(10,0),
	SUPERIOR_EMP_ID NUMBER(10,0),
	 PRIMARY KEY (EMP_ID) );

-- TABLE EMPLOYEE is compatible with EDB Postgres Advanced Server


-- Migration Portal applied following repair actions
-- ERH-2005 deleted [USING INDEX <CREATE INDEX CLAUSE> ENABLE]
-- ERH-2008 deleted [CHAR/BYTE IN SIZE]
-- ERH-2009 deleted [ENABLE]

CREATE TABLE LEARNINGSQL.INDIVIDUAL
   (	BIRTH_DATE DATE,
	FIRST_NAME VARCHAR2(30 ) NOT NULL , 
	LAST_NAME VARCHAR2(30 ) NOT NULL , 
	CUST_ID NUMBER(10,0) NOT NULL , 
	 PRIMARY KEY (CUST_ID) );

-- TABLE INDIVIDUAL is compatible with EDB Postgres Advanced Server


-- Migration Portal applied following repair actions
-- ERH-2005 deleted [USING INDEX <CREATE INDEX CLAUSE> ENABLE]
-- ERH-2008 deleted [CHAR/BYTE IN SIZE]
-- ERH-2009 deleted [ENABLE]

CREATE TABLE LEARNINGSQL.OFFICER
   (	OFFICER_ID NUMBER(10,0) NOT NULL , 
	END_DATE DATE,
	FIRST_NAME VARCHAR2(30 ) NOT NULL , 
	LAST_NAME VARCHAR2(30 ) NOT NULL , 
	START_DATE DATE NOT NULL , 
	TITLE VARCHAR2(20 ),
	CUST_ID NUMBER(10,0),
	 PRIMARY KEY (OFFICER_ID) );

-- TABLE OFFICER is compatible with EDB Postgres Advanced Server


-- Migration Portal applied following repair actions
-- ERH-2005 deleted [USING INDEX <CREATE INDEX CLAUSE> ENABLE]
-- ERH-2008 deleted [CHAR/BYTE IN SIZE]
-- ERH-2009 deleted [ENABLE]

CREATE TABLE LEARNINGSQL.PRODUCT
   (	PRODUCT_CD VARCHAR2(10 ) NOT NULL , 
	DATE_OFFERED DATE,
	DATE_RETIRED DATE,
	"name" VARCHAR2(50 ) NOT NULL , 
	PRODUCT_TYPE_CD VARCHAR2(255 ),
	 PRIMARY KEY (PRODUCT_CD) );

-- TABLE PRODUCT is compatible with EDB Postgres Advanced Server


-- Migration Portal applied following repair actions
-- ERH-2005 deleted [USING INDEX <CREATE INDEX CLAUSE> ENABLE]
-- ERH-2008 deleted [CHAR/BYTE IN SIZE]
-- ERH-2009 deleted [ENABLE]

CREATE TABLE LEARNINGSQL.PRODUCT_TYPE
   (	PRODUCT_TYPE_CD VARCHAR2(255 ) NOT NULL , 
	"name" VARCHAR2(50 ),
	 PRIMARY KEY (PRODUCT_TYPE_CD) );

-- TABLE PRODUCT_TYPE is compatible with EDB Postgres Advanced Server


-- Migration Portal applied following repair actions
-- ERH-2009 deleted [ENABLE]

ALTER TABLE LEARNINGSQL.ACCOUNT ADD CONSTRAINT ACCOUNT_BRANCH_FK FOREIGN KEY (OPEN_BRANCH_ID)
	  REFERENCES LEARNINGSQL.BRANCH (BRANCH_ID);

-- CONSTRAINT ACCOUNT_BRANCH_FK is compatible with EDB Postgres Advanced Server


-- Migration Portal applied following repair actions
-- ERH-2009 deleted [ENABLE]

ALTER TABLE LEARNINGSQL.ACCOUNT ADD CONSTRAINT ACCOUNT_CUSTOMER_FK FOREIGN KEY (CUST_ID)
	  REFERENCES LEARNINGSQL.CUSTOMER (CUST_ID);

-- CONSTRAINT ACCOUNT_CUSTOMER_FK is compatible with EDB Postgres Advanced Server


-- Migration Portal applied following repair actions
-- ERH-2009 deleted [ENABLE]

ALTER TABLE LEARNINGSQL.ACCOUNT ADD CONSTRAINT ACCOUNT_EMPLOYEE_FK FOREIGN KEY (OPEN_EMP_ID)
	  REFERENCES LEARNINGSQL.EMPLOYEE (EMP_ID);

-- CONSTRAINT ACCOUNT_EMPLOYEE_FK is compatible with EDB Postgres Advanced Server


-- Migration Portal applied following repair actions
-- ERH-2009 deleted [ENABLE]

ALTER TABLE LEARNINGSQL.ACCOUNT ADD CONSTRAINT ACCOUNT_PRODUCT_FK FOREIGN KEY (PRODUCT_CD)
	  REFERENCES LEARNINGSQL.PRODUCT (PRODUCT_CD);

-- CONSTRAINT ACCOUNT_PRODUCT_FK is compatible with EDB Postgres Advanced Server


-- Migration Portal applied following repair actions
-- ERH-2009 deleted [ENABLE]

ALTER TABLE LEARNINGSQL.ACC_TRANSACTION ADD CONSTRAINT ACC_TRANSACTION_ACCOUNT_FK FOREIGN KEY (ACCOUNT_ID)
	  REFERENCES LEARNINGSQL.ACCOUNT (ACCOUNT_ID);

-- CONSTRAINT ACC_TRANSACTION_ACCOUNT_FK is compatible with EDB Postgres Advanced Server


-- Migration Portal applied following repair actions
-- ERH-2009 deleted [ENABLE]

ALTER TABLE LEARNINGSQL.ACC_TRANSACTION ADD CONSTRAINT ACC_TRANSACTION_BRANCH_FK FOREIGN KEY (EXECUTION_BRANCH_ID)
	  REFERENCES LEARNINGSQL.BRANCH (BRANCH_ID);

-- CONSTRAINT ACC_TRANSACTION_BRANCH_FK is compatible with EDB Postgres Advanced Server


-- Migration Portal applied following repair actions
-- ERH-2009 deleted [ENABLE]

ALTER TABLE LEARNINGSQL.ACC_TRANSACTION ADD CONSTRAINT ACC_TRANSACTION_EMPLOYEE_FK FOREIGN KEY (TELLER_EMP_ID)
	  REFERENCES LEARNINGSQL.EMPLOYEE (EMP_ID);

-- CONSTRAINT ACC_TRANSACTION_EMPLOYEE_FK is compatible with EDB Postgres Advanced Server


-- Migration Portal applied following repair actions
-- ERH-2009 deleted [ENABLE]

ALTER TABLE LEARNINGSQL.BUSINESS ADD CONSTRAINT BUSINESS_EMPLOYEE_FK FOREIGN KEY (CUST_ID)
	  REFERENCES LEARNINGSQL.CUSTOMER (CUST_ID);

-- CONSTRAINT BUSINESS_EMPLOYEE_FK is compatible with EDB Postgres Advanced Server


-- Migration Portal applied following repair actions
-- ERH-2009 deleted [ENABLE]

ALTER TABLE LEARNINGSQL.EMPLOYEE ADD CONSTRAINT EMPLOYEE_BRANCH_FK FOREIGN KEY (ASSIGNED_BRANCH_ID)
	  REFERENCES LEARNINGSQL.BRANCH (BRANCH_ID);

-- CONSTRAINT EMPLOYEE_BRANCH_FK is compatible with EDB Postgres Advanced Server


-- Migration Portal applied following repair actions
-- ERH-2009 deleted [ENABLE]

ALTER TABLE LEARNINGSQL.EMPLOYEE ADD CONSTRAINT EMPLOYEE_DEPARTMENT_FK FOREIGN KEY (DEPT_ID)
	  REFERENCES LEARNINGSQL.DEPARTMENT (DEPT_ID);

-- CONSTRAINT EMPLOYEE_DEPARTMENT_FK is compatible with EDB Postgres Advanced Server


-- Migration Portal applied following repair actions
-- ERH-2009 deleted [ENABLE]

ALTER TABLE LEARNINGSQL.EMPLOYEE ADD CONSTRAINT EMPLOYEE_EMPLOYEE_FK FOREIGN KEY (SUPERIOR_EMP_ID)
	  REFERENCES LEARNINGSQL.EMPLOYEE (EMP_ID);

-- CONSTRAINT EMPLOYEE_EMPLOYEE_FK is compatible with EDB Postgres Advanced Server


-- Migration Portal applied following repair actions
-- ERH-2009 deleted [ENABLE]

ALTER TABLE LEARNINGSQL.INDIVIDUAL ADD CONSTRAINT INDIVIDUAL_CUSTOMER_FK FOREIGN KEY (CUST_ID)
	  REFERENCES LEARNINGSQL.CUSTOMER (CUST_ID);

-- CONSTRAINT INDIVIDUAL_CUSTOMER_FK is compatible with EDB Postgres Advanced Server


-- Migration Portal applied following repair actions
-- ERH-2009 deleted [ENABLE]

ALTER TABLE LEARNINGSQL.OFFICER ADD CONSTRAINT OFFICER_CUSTOMER_FK FOREIGN KEY (CUST_ID)
	  REFERENCES LEARNINGSQL.CUSTOMER (CUST_ID);

-- CONSTRAINT OFFICER_CUSTOMER_FK is compatible with EDB Postgres Advanced Server


-- Migration Portal applied following repair actions
-- ERH-2009 deleted [ENABLE]

ALTER TABLE LEARNINGSQL.PRODUCT ADD CONSTRAINT PRODUCT_PRODUCT_TYPE_FK FOREIGN KEY (PRODUCT_TYPE_CD)
	  REFERENCES LEARNINGSQL.PRODUCT_TYPE (PRODUCT_TYPE_CD);

-- CONSTRAINT PRODUCT_PRODUCT_TYPE_FK is compatible with EDB Postgres Advanced Server

--EOF Created by Migration Portal on Wed Sep 29 00:09:54 UTC 2021