WITH lactate AS (  
  SELECT icu.stay_id
  , COUNT(*) AS lactate_measurement_count
  FROM `physionet-data.mimic_hosp.labevents` AS lab
  INNER JOIN `physionet-data.mimic_icu.icustays` AS icu
    ON lab.hadm_id = icu.hadm_id
  WHERE itemid IN (
    SELECT itemid 
    FROM `physionet-data.mimic_hosp.d_labitems` 
    WHERE label = 'Lactate'
  )  
    AND DATE_DIFF(lab.charttime, icu.intime, HOUR) BETWEEN 0 AND 24
  GROUP BY icu.stay_id
)


SELECT icu.subject_id, icu.hadm_id, icu.stay_id
, CASE WHEN age.anchor_age < 18 THEN 1 ELSE 0 END AS exclusion_non_adult
, CASE WHEN ROW_NUMBER() OVER (PARTITION BY icu.subject_id ORDER BY icu.intime) > 1 THEN 1 ELSE 0 END AS exclusion_readmission
, CASE WHEN lac.lactate_measurement_count = 1 THEN 1 ELSE 0 END AS exclusion_one_lactate_measurement
, CASE WHEN DATE_DIFF(outtime, intime, HOUR) <= 4 THEN 1 ELSE 0 END AS exclusion_short_icu_stay
, CASE WHEN sep.sepsis3 = TRUE THEN 1 ELSE 0 END AS sepsis_flag 
FROM `physionet-data.mimic_icu.icustays` AS icu
INNER JOIN `physionet-data.mimic_derived.age` AS age
  ON icu.hadm_id = age.hadm_id
INNER JOIN lactate AS lac
  ON icu.stay_id = lac.stay_id
INNER JOIN `physionet-data.mimic_derived.sepsis3` AS sep
  ON icu.stay_id = sep.stay_id