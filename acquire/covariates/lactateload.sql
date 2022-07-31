SELECT icu.subject_id, icu.hadm_id, icu.stay_id
, lab.valuenum AS lactate
, DATE_DIFF(lab.charttime, icu.intime, HOUR) AS time
, ROW_NUMBER() OVER (PARTITION BY icu.stay_id ORDER BY lab.charttime) AS n
FROM `physionet-data.mimic_hosp.labevents` lab 
INNER JOIN `physionet-data.mimic_icu.icustays` icu
    ON lab.hadm_id = icu.hadm_id
WHERE itemid IN (
    SELECT itemid 
    FROM `physionet-data.mimic_hosp.d_labitems` 
    WHERE label = 'Lactate'
  )  
AND DATE_DIFF(lab.charttime, icu.intime, HOUR) > 0 
AND DATE_DIFF(lab.charttime, icu.intime, HOUR) < 24
ORDER BY icu.subject_id, icu.stay_id, icu.hadm_id