WITH lactate AS (
SELECT icu.subject_id, icu.hadm_id, icu.stay_id, valuenum
FROM `physionet-data.mimic_hosp.labevents` AS lab
INNER JOIN `physionet-data.mimic_icu.icustays` AS icu
      ON lab.hadm_id = icu.hadm_id
WHERE itemid IN (
  SELECT itemid 
  FROM `physionet-data.mimic_hosp.d_labitems` 
  WHERE label = 'Lactate'
) 
  AND DATE_DIFF(lab.charttime, icu.intime, HOUR) > 0
  AND DATE_DIFF(lab.charttime, icu.intime, HOUR) < 24
)

SELECT subject_id, hadm_id, stay_id
, MAX(valuenum) AS max_lactate
, AVG(valuenum) AS mean_lactate
FROM lactate
GROUP BY subject_id, hadm_id, stay_id
ORDER BY subject_id, hadm_id, stay_id