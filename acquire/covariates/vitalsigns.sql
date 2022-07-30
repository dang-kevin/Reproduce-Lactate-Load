WITH heart AS (
  SELECT itemid 
  FROM `physionet-data.mimic_icu.d_items`
  WHERE label = 'Heart Rate'
)

, systolic AS (
  SELECT itemid 
  FROM `physionet-data.mimic_icu.d_items`
  WHERE label LIKE '%Systolic%'
)

, diastolic AS (
  SELECT itemid 
  FROM `physionet-data.mimic_icu.d_items`
  WHERE label LIKE '%Diastolic%'
)

, arterial AS (
  SELECT itemid 
  FROM `physionet-data.mimic_icu.d_items`
  WHERE label = 'Arterial Blood Pressure mean'
)

, respiratory AS (
  SELECT itemid 
  FROM `physionet-data.mimic_icu.d_items`
  WHERE label LIKE '%Respiratory Rate%'
)

, saturation AS (
  SELECT itemid 
  FROM `physionet-data.mimic_icu.d_items`
  WHERE label LIKE '%Respiratory Rate%'
)

, vitalsigns AS (
  SELECT ce.subject_id, ce.hadm_id, ce.stay_id 
  , CASE WHEN itemid IN (SELECT itemid FROM heart) THEN valuenum ELSE NULL END AS heart_rate
  , CASE WHEN itemid IN (SELECT itemid FROM systolic) THEN valuenum ELSE NULL END AS systolic_bp
  , CASE WHEN itemid IN (SELECT itemid FROM diastolic) THEN valuenum ELSE NULL END AS diastolic_bp
  , CASE WHEN itemid IN (SELECT itemid FROM arterial) THEN valuenum ELSE NULL END AS mean_arterial_bp
  , CASE WHEN itemid IN (SELECT itemid FROM respiratory) THEN valuenum ELSE NULL END AS respiratory_rate
  , CASE WHEN itemid IN (SELECT itemid FROM saturation) THEN valuenum ELSE NULL END AS pulse_saturation
  FROM `physionet-data.mimic_icu.chartevents` ce
  INNER JOIN `physionet-data.mimic_icu.icustays` AS icu
        ON ce.stay_id = icu.stay_id
  WHERE DATE_DIFF(ce.charttime, icu.intime, HOUR) > 0
    AND DATE_DIFF(ce.charttime, icu.intime, HOUR) < 24
)

SELECT subject_id, hadm_id, stay_id
, AVG(heart_rate) AS mean_heart_rate
, MIN(systolic_bp) AS min_systolic_bp
, MIN(diastolic_bp) AS min_diastolic_bp
, MIN(mean_arterial_bp) AS min_mean_arterial_bp
, MAX(respiratory_rate) AS max_respiratory_rate
, MIN(pulse_saturation) AS min_pulse_saturation
FROM vitalsigns
GROUP BY subject_id, hadm_id, stay_id
ORDER BY subject_id, hadm_id, stay_id