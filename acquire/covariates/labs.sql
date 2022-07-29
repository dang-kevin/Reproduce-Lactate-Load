WITH anion AS (
  SELECT itemid 
  FROM `physionet-data.mimic_hosp.d_labitems` 
  WHERE label LIKE '%Anion%'
)

, albumin AS (
  SELECT itemid 
  FROM `physionet-data.mimic_hosp.d_labitems` 
  WHERE label LIKE '%Albumin%'
)

, bilirubin AS (
  SELECT itemid 
  FROM `physionet-data.mimic_hosp.d_labitems` 
  WHERE label LIKE '%Bilirubin%'
)

, creatinine AS (
  SELECT itemid 
  FROM `physionet-data.mimic_hosp.d_labitems` 
  WHERE label LIKE '%Creatinine%'
)

, glucose AS (
  SELECT itemid 
  FROM `physionet-data.mimic_hosp.d_labitems` 
  WHERE label LIKE '%Glucose%'
)

, hemoglobin AS (
  SELECT itemid 
  FROM `physionet-data.mimic_hosp.d_labitems` 
  WHERE label LIKE '%Hemoglobin%'
)

, platelet AS (
  SELECT itemid 
  FROM `physionet-data.mimic_hosp.d_labitems` 
  WHERE label LIKE '%Platelet%'
)

, potassium AS (
  SELECT itemid 
  FROM `physionet-data.mimic_hosp.d_labitems` 
  WHERE label LIKE '%Potassium%'
)

, pt AS (
  SELECT itemid 
  FROM `physionet-data.mimic_hosp.d_labitems` 
  WHERE label = 'PT'
)

, sodium AS (
  SELECT itemid 
  FROM `physionet-data.mimic_hosp.d_labitems` 
  WHERE label LIKE '%Sodium%'
)

, bur AS (
  SELECT itemid 
  FROM `physionet-data.mimic_hosp.d_labitems` 
  WHERE label = 'Urea Nitrogen'
  AND fluid = 'Blood'
)

, wbc AS (
  SELECT itemid 
  FROM `physionet-data.mimic_hosp.d_labitems` 
  WHERE label = 'White Blood Cells'
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
  , CASE WHEN itemid IN (SELECT itemid FROM pt) THEN valuenum ELSE NULL END AS pt
  , CASE WHEN itemid IN (SELECT itemid FROM sodium) THEN valuenum ELSE NULL END AS sodium
  , CASE WHEN itemid IN (SELECT itemid FROM bur) THEN valuenum ELSE NULL END AS bur
  , CASE WHEN itemid IN (SELECT itemid FROM wbc) THEN valuenum ELSE NULL END AS wbc
  FROM `physionet-data.mimic_hosp.labevents` AS lab
  INNER JOIN `physionet-data.mimic_icu.icustays` AS icu
      ON lab.hadm_id = icu.hadm_id
  WHERE DATE_DIFF(lab.charttime, icu.intime, HOUR) > 0
    AND DATE_DIFF(lab.charttime, icu.intime, HOUR) < 24
)

SELECT subject_id, hadm_id 
, MAX(anion_gap) AS max_anion_gap
, MIN(albumin) AS min_albumin
, MAX(bilirubin) AS max_bilirubin
, MAX(creatinine) AS max_creatinine
, MAX(glucose) AS max_glucose
, MIN(hemoglobin) AS min_hemoglobin
, MIN(platelet) AS min_platelet
, MAX(potassium) AS max_potassium
, MAX(pt) AS max_pt
, MAX(sodium) AS max_sodium
, MIN(sodium) AS min_sodium
, MAX(bur) AS max_blood_urea_nitrogen
, MAX(wbc) AS max_wbc_count
FROM labs
GROUP BY subject_id, hadm_id
ORDER BY subject_id, hadm_id