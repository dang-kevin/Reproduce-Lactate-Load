WITH con_hf AS (
  SELECT icd_code 
  FROM `physionet-data.mimic_hosp.d_icd_diagnoses` 
  WHERE LOWER(long_title) LIKE '%congestive%'
    AND LOWER(long_title) LIKE '%heart failure%'
)

, myo_inf AS (
  SELECT icd_code 
  FROM `physionet-data.mimic_hosp.d_icd_diagnoses` 
  WHERE LOWER(long_title) LIKE '%myocardial infarction%'
)

, cerebro AS (
  SELECT icd_code 
  FROM `physionet-data.mimic_hosp.d_icd_diagnoses` 
  WHERE LOWER(long_title) LIKE '%cerebrovascular disease%'
)

, chron_pulm AS (
  SELECT icd_code 
  FROM `physionet-data.mimic_hosp.d_icd_diagnoses` 
  WHERE LOWER(long_title) LIKE '%chronic pulmonary%'
)

, liver AS (
  SELECT icd_code 
  FROM `physionet-data.mimic_hosp.d_icd_diagnoses` 
  WHERE LOWER(long_title) LIKE '%liver disease%'
)

, diab_wo_comp AS (
  SELECT icd_code 
  FROM `physionet-data.mimic_hosp.d_icd_diagnoses` 
  WHERE LOWER(long_title) LIKE '%diabetes%'
    AND LOWER(long_title) LIKE '%without%'
    AND LOWER(long_title) LIKE '%complication%' 
)
, diab_w_comp AS (
  SELECT icd_code 
  FROM `physionet-data.mimic_hosp.d_icd_diagnoses` 
  WHERE LOWER(long_title) LIKE '%diabetes%'
    AND LOWER(long_title) LIKE '%with %' -- space necessary, otherwise it will include 'without' 
    AND LOWER(long_title) LIKE '%complication%' 
)

, renal AS (
  SELECT icd_code 
  FROM `physionet-data.mimic_hosp.d_icd_diagnoses` 
  WHERE LOWER(long_title) LIKE '%renal disease%' 
)


SELECT subject_id, hadm_id
, MAX(CASE WHEN icd_code IN (SELECT icd_code FROM con_hf) THEN 1 ELSE 0 END) AS congestive_heart_failure
, MAX(CASE WHEN icd_code IN (SELECT icd_code FROM myo_inf) THEN 1 ELSE 0 END) AS myocardial_infarction
, MAX(CASE WHEN icd_code IN (SELECT icd_code FROM cerebro) THEN 1 ELSE 0 END) AS cerebrovascular_disease 
, MAX(CASE WHEN icd_code IN (SELECT icd_code FROM chron_pulm) THEN 1 ELSE 0 END) AS chronic_pulmonary_disease
, MAX(CASE WHEN icd_code IN (SELECT icd_code FROM liver) THEN 1 ELSE 0 END) AS liver_disease  
, MAX(CASE WHEN icd_code IN (SELECT icd_code FROM diab_wo_comp) THEN 1 ELSE 0 END) AS diabetes_without_complication
, MAX(CASE WHEN icd_code IN (SELECT icd_code FROM diab_w_comp) THEN 1 ELSE 0 END) AS diabetes_with_complication
, MAX(CASE WHEN icd_code IN (SELECT icd_code FROM renal) THEN 1 ELSE 0 END) AS renal_disease  
FROM `physionet-data.mimic_hosp.diagnoses_icd`
GROUP BY subject_id, hadm_id
ORDER BY subject_id, hadm_id