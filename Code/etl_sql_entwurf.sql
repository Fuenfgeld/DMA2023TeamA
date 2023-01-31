-- SQL statements to create tables of DWH

-- option 1: table "F_encounter_costs"
CREATE TABLE IF NOT EXISTS F_encounter_costs
             (
                Id                      VARCHAR PRIMARY KEY,
                ENC_START               DATETIME,
                ENC_STOP                DATETIME,
                PATIENT                 VARCHAR,
                ENC_PAYER               VARCHAR,
                ENC_BASE_COST           FLOAT,
                ENC_TOTAL_CLAIM_COST    FLOAT,
                ENC_PAYER_COVERAGE      FLOAT,
                ENC_REASON              INTEGER,
                PRO_DATE                DATETIME,
                PRO_CODE                INTEGER,
                PRO_BASE_COST           FLOAT,
                PRO_REASON              VARCHAR,
                MED_START               DATETIME,
                MED_STOP                DATETIME,
                MED_CODE                INTEGER,
                MED_BASE_COST           FLOAT,
                MED_DISPENSES           INTEGER,
                MED_TOTAL_COST          FLOAT,
                MED_PAYER_COVERAGE      FLOAT,
                MED_PAYER               VARCHAR,
                MED_REASON              VARCHAR,
                CON_START               DATETIME,
                CON_STOP                DATETIME,
                CON_CODE                INTEGER,
                FOREIGN KEY (PATIENT)   
                    REFERENCES D_patients (Id),
                FOREIGN KEY (ENC_PAYER)     
                    REFERENCES D_payers (Id),
                FOREIGN KEY (MED_PAYER) 
                    REFERENCES D_payers (Id),
                FOREIGN KEY (ENC_REASON)
                    REFERENCES D_snomedct (Code),
                FOREIGN KEY (PRO_CODE)
                    REFERENCES D_snomedct (Code),
                FOREIGN KEY (PRO_REASON)
                    REFERENCES D_snomedct (Code),
                FOREIGN KEY (MED_REASON)
                    REFERENCES D_snomedct (Code),
                FOREIGN KEY (CON_CODE)
                    REFERENCES D_snomedct (Code),
                FOREIGN KEY (MED_CODE)
                    REFERENCES D_rxnorm (Code)
             )

-- option 2: table "F_encounter_costs"
CREATE TABLE IF NOT EXISTS F_encounter_costs
             (
                Id                      VARCHAR PRIMARY KEY,
                ENC_START               DATETIME,
                ENC_STOP                DATETIME,
                PATIENT                 VARCHAR,
                ENC_PAYER               VARCHAR,
                ENC_BASE_COST           FLOAT,
                ENC_TOTAL_CLAIM_COST    FLOAT,
                ENC_PAYER_COVERAGE      FLOAT,
                ENC_REASON              INTEGER,
                PRO_DATE                DATETIME,
                PRO_CODE                INTEGER,
                PRO_BASE_COST           FLOAT,
                PRO_REASON              VARCHAR,
                MED_START               DATETIME,
                MED_STOP                DATETIME,
                MED_CODE                INTEGER,
                MED_BASE_COST           FLOAT,
                MED_DISPENSES           INTEGER,
                MED_TOTAL_COST          FLOAT,
                MED_PAYER_COVERAGE      FLOAT,
                MED_PAYER               VARCHAR,
                MED_REASON              VARCHAR,
                FOREIGN KEY (PATIENT)   
                    REFERENCES D_patients (Id),
                FOREIGN KEY (ENC_PAYER)     
                    REFERENCES D_payers (Id),
                FOREIGN KEY (MED_PAYER) 
                    REFERENCES D_payers (Id),
                FOREIGN KEY (ENC_REASON)
                    REFERENCES D_snomedct (Code),
                FOREIGN KEY (PRO_CODE)
                    REFERENCES D_snomedct (Code),
                FOREIGN KEY (PRO_REASON)
                    REFERENCES D_snomedct (Code),
                FOREIGN KEY (MED_REASON)
                    REFERENCES D_snomedct (Code),
                FOREIGN KEY (MED_CODE)
                    REFERENCES D_rxnorm (Code)
             )

-- option 2: table "F_encounter_diagnoses"
CREATE TABLE IF NOT EXISTS F_encounter_diagnoses
             (
                Id                      VARCHAR PRIMARY KEY,
                ENC_START               DATETIME,
                ENC_STOP                DATETIME,
                PATIENT                 VARCHAR,
                ENC_REASON              INTEGER,
                CON_START               DATETIME,
                CON_STOP                DATETIME,
                CON_CODE                INTEGER,
                FOREIGN KEY (PATIENT)   
                    REFERENCES D_patients (Id),
                FOREIGN KEY (ENC_REASON)
                    REFERENCES D_snomedct (Code),
                FOREIGN KEY (CON_CODE)
                    REFERENCES D_snomedct (Code)
             )

-- table D_patients
CREATE TABLE IF NOT EXISTS D_patients
             (
                Id                  VARCHAR PRIMARY KEY,
                BIRTHDATE           DATE,
                DEATHDATE           DATE,
                FIRST               VARCHAR,
                LAST                VARCHAR,
                RACE                VARCHAR,
                ETHNICITY           VARCHAR,
                GENDER              CHAR(1),
                HEALTHCARE_EXPENSES FLOAT,
                HEALTHCARE_COVERAGE FLOAT
            ) 

-- table D_payers
CREATE TABLE IF NOT EXISTS D_payers
             (
                Id                  VARCHAR PRIMARY KEY,
                NAME                VARCHAR
            ) 

-- table D_snomedct
CREATE TABLE IF NOT EXISTS D_snomedct
             (
                CODE                VARCHAR PRIMARY KEY,
                TERM                VARCHAR
            ) 

-- table D_rxnorm
CREATE TABLE IF NOT EXISTS D_rxnorm
             (
                CODE                VARCHAR PRIMARY KEY,
                NAME                VARCHAR
            ) 

-- stepwise development of SQL statements to fill DWH DB

-- option 1 and 2: table "F_encounter_costs"
-- select required columns from encounters
SELECT enc.id                  AS Id,
       enc.start               AS ENC_START,
       enc.stop                AS ENC_STOP,
       enc.patient             AS PATIENT,
       enc.payer               AS ENC_PAYER,
       enc.base_encounter_cost AS ENC_BASE_COST,
       enc.total_claim_cost    AS ENC_TOTAL_CLAIM_COST,
       enc.payer_coverage      AS ENC_PAYER_COVERAGE,
       enc.reasoncode          AS ENC_REASON
FROM   encounters AS enc
ORDER  BY enc.id 

-- join with procedures (left join on encounter id to preserve all encounters, even without procedures), selecting required columns
SELECT enc.id                  AS Id,
       enc.start               AS ENC_START,
       enc.stop                AS ENC_STOP,
       enc.patient             AS PATIENT,
       enc.payer               AS ENC_PAYER,
       enc.base_encounter_cost AS ENC_BASE_COST,
       enc.total_claim_cost    AS ENC_TOTAL_CLAIM_COST,
       enc.payer_coverage      AS ENC_PAYER_COVERAGE,
       enc.reasoncode          AS ENC_REASON,
       pro.date                AS PRO_DATE,
       pro.code                AS PRO_CODE,
       pro.base_cost           AS PRO_BASE_COST,
       pro.reasoncode          AS PRO_REASON
FROM   encounters AS enc
       LEFT JOIN procedures AS pro
              ON enc.id = pro.encounter 
ORDER  BY enc.id 

-- next join with medications (left join on encounter id to preserve all encounters, even without medications), selecting required columns
SELECT enc.id                  AS Id,
       enc.start               AS ENC_START,
       enc.stop                AS ENC_STOP,
       enc.patient             AS PATIENT,
       enc.payer               AS ENC_PAYER,
       enc.base_encounter_cost AS ENC_BASE_COST,
       enc.total_claim_cost    AS ENC_TOTAL_CLAIM_COST,
       enc.payer_coverage      AS ENC_PAYER_COVERAGE,
       enc.reasoncode          AS ENC_REASON,
       pro.date                AS PRO_DATE,
       pro.code                AS PRO_CODE,
       pro.base_cost           AS PRO_BASE_COST,
       pro.reasoncode          AS PRO_REASON,
       med.start               AS MED_START,
       med.stop                AS MED_STOP,
       med.code                AS MED_CODE,
       med.base_cost           AS MED_BASE_COST,
       med.dispenses           AS MED_DISPENSES,
       med.total_cost          AS MED_TOTAL_COST,
       med.payer_coverage      AS MED_PAYER_COVERAGE,
       med.payer               AS MED_PAYER,
       med.reasoncode          AS MED_REASON
FROM   encounters AS enc
       LEFT JOIN procedures AS pro
              ON enc.id = pro.encounter
       LEFT JOIN medications AS med
              ON enc.id = med.encounter 
ORDER  BY enc.id 

-- for option 1: next join with conditions (left join on encounter id to preserve all encounters, even without conditions), selecting required columns
SELECT enc.id                  AS Id,
       enc.start               AS ENC_START,
       enc.stop                AS ENC_STOP,
       enc.patient             AS PATIENT,
       enc.payer               AS ENC_PAYER,
       enc.base_encounter_cost AS ENC_BASE_COST,
       enc.total_claim_cost    AS ENC_TOTAL_CLAIM_COST,
       enc.payer_coverage      AS ENC_PAYER_COVERAGE,
       enc.reasoncode          AS ENC_REASON,
       pro.date                AS PRO_DATE,
       pro.code                AS PRO_CODE,
       pro.base_cost           AS PRO_BASE_COST,
       pro.reasoncode          AS PRO_REASON,
       med.start               AS MED_START,
       med.stop                AS MED_STOP,
       med.code                AS MED_CODE,
       med.base_cost           AS MED_BASE_COST,
       med.dispenses           AS MED_DISPENSES,
       med.total_cost          AS MED_TOTAL_COST,
       med.payer_coverage      AS MED_PAYER_COVERAGE,
       med.payer               AS MED_PAYER,
       med.reasoncode          AS MED_REASON,
       con.start               AS CON_START,
       con.stop                AS CON_STOP,
       con.code                AS CON_CODE
FROM   encounters AS enc
       LEFT JOIN procedures AS pro
              ON enc.id = pro.encounter
       LEFT JOIN medications AS med
              ON enc.id = med.encounter
       LEFT JOIN conditions AS con
              ON enc.id = con.encounter
ORDER  BY enc.id 

-- option 2: table "F_encounter_diagnoses"
-- join encounters with conditions (inner join), selecting required columns
SELECT enc.id         AS Id,
       enc.start      AS ENC_START,
       enc.stop       AS ENC_STOP,
       enc.patient    AS PATIENT,
       enc.reasoncode AS ENC_REASON,
       con.start      AS CON_START,
       con.stop       AS CON_STOP,
       con.patient    AS CON_PATIENT,
       con.code       AS CON_CODE
FROM   encounters AS enc
       JOIN conditions AS con
         ON enc.id = con.encounter
ORDER  BY enc.id 

-- table "D_patients"
SELECT id,
       birthdate,
       deathdate,
       first,
       last,
       race,
       ethnicity,
       gender,
       healthcare_expenses,
       healthcare_coverage
FROM   patients 

-- table "D_payers"
SELECT id,
       name
FROM   payers 

-- table "D_snomedct"
SELECT pro.code        AS CODE,
       pro.description AS TERM
FROM   procedures AS pro
UNION
SELECT pro.reasoncode        AS CODE,
       pro.reasondescription AS TERM
FROM   procedures AS pro
UNION
SELECT enc.reasoncode        AS CODE,
       enc.reasondescription AS TERM
FROM   encounters AS enc
UNION
SELECT med.reasoncode        AS CODE,
       med.reasondescription AS TERM
FROM   medications AS med
UNION
SELECT con.code        AS CODE,
       con.description AS TERM
FROM   conditions AS con
ORDER  BY code 

-- table "D_rxnorm"
SELECT DISTINCT( med.code )    AS CODE,
               med.description AS NAME
FROM   medications AS med
ORDER  BY code 