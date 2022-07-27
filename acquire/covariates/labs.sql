WITH anion AS (
  SELECT itemid 
  FROM `physionet-data.mimic_hosp.d_labitems` 
  WHERE LOWER(label) LIKE '%anion%'
)

, albumin AS (
  SELECT itemid 
  FROM `physionet-data.mimic_hosp.d_labitems` 
  WHERE LOWER(label) LIKE '%albumin%'
)

, bilirubin AS (
  SELECT itemid 
  FROM `physionet-data.mimic_hosp.d_labitems` 
  WHERE LOWER(label) LIKE '%bilirubin%'
)

, creatinine AS (
  SELECT itemid 
  FROM `physionet-data.mimic_hosp.d_labitems` 
  WHERE LOWER(label) LIKE '%creatinine%'
)

, glucose AS (
  SELECT itemid 
  FROM `physionet-data.mimic_hosp.d_labitems` 
  WHERE LOWER(label) LIKE '%glucose%'
)

, hemoglobin AS (
  SELECT itemid 
  FROM `physionet-data.mimic_hosp.d_labitems` 
  WHERE LOWER(label) LIKE '%hemoglobin%'
)

, platelet AS (
  SELECT itemid 
  FROM `physionet-data.mimic_hosp.d_labitems` 
  WHERE LOWER(label) LIKE '%platelet%'
)

, potassium AS (
  SELECT itemid 
  FROM `physionet-data.mimic_hosp.d_labitems` 
  WHERE LOWER(label) LIKE '%potassium%'
)

, labs AS (
  SELECT DISTINCT lab.subject_id, lab.hadm_id
  , CASE WHEN itemid IN (SELECT itemid FROM anion) THEN valuenum ELSE NULL END AS anion_gap
  , CASE WHEN itemid IN (SELECT itemid FROM albumin) THEN valuenum ELSE NULL END AS albumin
  , CASE WHEN itemid IN (SELECT itemid FROM bilirubin) THEN valuenum ELSE NULL END AS bilirubin
  , CASE WHEN itemid IN (SELECT itemid FROM creatinine) THEN valuenum ELSE NULL END AS creatinine
  , CASE WHEN itemid IN (SELECT itemid FROM glucose) THEN valuenum ELSE NULL END AS glucose
  , CASE WHEN itemid IN (SELECT itemid FROM hemoglobin) THEN valuenum ELSE NULL END AS hemoglobin
  , CASE WHEN itemid IN (SELECT itemid FROM platelet) THEN valuenum ELSE NULL END AS platelet
  , CASE WHEN itemid IN (SELECT itemid FROM potassium) THEN valuenum ELSE NULL END AS potassium
  FROM `physionet-data.mimic_hosp.labevents` AS lab
  INNER JOIN `physionet-data.mimic_icu.icustays` AS icu
      ON lab.hadm_id = icu.hadm_id
  WHERE DATE_DIFF(lab.charttime, icu.intime, HOUR) < 24
)

SELECT subject_id, hadm_id 
, MAX(anion_gap) AS max_anion_gap
, MIN(albumin) AS min_albumin
, MAX(bilirubin) AS max_bilirubin
, MAX(creatinine) AS max_creatinine
, MAX(glucose) AS max_glucose
, MIN(hemoglobin) AS min_hemoglobin
, MIN(platelet) AS min_platelet
, MAX(potassium) AS potassium
FROM labs
GROUP BY subject_id, hadm_id
ORDER BY subject_id, hadm_id