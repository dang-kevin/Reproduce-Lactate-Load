SELECT age.subject_id
, age.hadm_id
, wt.stay_id
, age.anchor_age AS age
, pat.gender
, wt.weight_admit AS weight
, sof.SOFA AS sofa_score
, sap.sapsii AS sapsii_score
, DATE_DIFF(adm.dischtime, adm.admittime, DAY) AS length_of_hospital_stay
, DATE_DIFF(outtime, intime, DAY) AS length_of_icu_stay
, uri.urineoutput AS daily_urine_output
FROM `physionet-data.mimic_derived.age` AS age
INNER JOIN `physionet-data.mimic_core.patients` AS pat
  ON age.subject_id = pat.subject_id
INNER JOIN `physionet-data.mimic_derived.first_day_weight` AS wt
  ON age.subject_id = wt.subject_id
INNER JOIN `physionet-data.mimic_derived.first_day_sofa` AS sof
  ON wt.stay_id = sof.stay_id
INNER JOIN `physionet-data.mimic_derived.sapsii` AS sap
  ON wt.stay_id = sap.stay_id
INNER JOIN `physionet-data.mimic_core.admissions` AS adm
  ON age.hadm_id = adm.hadm_id
INNER JOIN `physionet-data.mimic_icu.icustays` AS icu
  ON wt.stay_id = icu.stay_id
INNER JOIN `physionet-data.mimic_derived.first_day_urine_output` AS uri
  ON wt.stay_id = uri.stay_id
ORDER BY subject_id, hadm_id, stay_id