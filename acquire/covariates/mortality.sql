SELECT subject_id, hadm_id
, CASE WHEN deathtime IS NOT NULL AND DATETIME_DIFF(deathtime, admittime, DAY) <= 28 THEN 1 ELSE 0 END AS died_in_28_days 
FROM `physionet-data.mimic_core.admissions`