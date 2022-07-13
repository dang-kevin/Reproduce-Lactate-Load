# Reproduction template

The goal of this template is to guide documentation of a reproduction of a study in an electronic health record database. Reproductions are assumed to be retrospective observational studies.

This template is based on material from the OSF, as well as from Brandt et al., 2013.

## Title of the study

Increased normalized lactate load is associated with higher mortality in both sepsis and non-sepsis patients: an analysis of the MIMIC-IV database

DOI: https://doi.org/10.1186/s12871-022-01617-5

## Dataset(s) used

- MIMIC-IV, version 1.0
- DOI (or link if no DOI available): https://doi.org/10.13026/s6n6-xd98
- Citation: Johnson, A., Bulgarelli, L., Pollard, T., Horng, S., Celi, L. A., & Mark, R. (2021). MIMIC-IV (version 1.0). PhysioNet. https://doi.org/10.13026/s6n6-xd98.
- Other relevant information (link to dataset documentation, etc): https://mimic.mit.edu/docs/iv/

## Data extraction

### Inclusion/Exclusion criteria

The exclusion criteria were: 1) age < 18 years; 2) not first ICU admission; 3) only one lactate measurement was obtained during the first 24 h; 4) length of ICU stay < 24 h. Patients were divided into the sepsis or non-sepsis group according to the sepsis-3.0 criteria. 

Column names for proposed cohort table:
1. `exclusion_non_adult`
    - exclude patients under 18 years of age
    - mimic_derived.`age`
    - missing values will be assumed to include the patient
2. `exclusion_readmission`
    - exclude if not first ICU admission
    - mimic_core.`admissions`
    - missing values will be assumed to include the patient
3. `exclusion_one_lactate_measurement`
    - exclude if only one lactate measurement was obtained during the first 24 hours
    - mimic_hosp.`labevents`
    - missing values will be assumed to include the patient
4. `exclusion_short_icu_stay`
    - exclude if length of ICU stay less than 24 hours
    - mimic_icu.`icustays`
    - missing values will be assumed to include the patient
5. `sepsis_flag`
    - create a variable to separate the patients into sepsis or non-sepsis group according to sepsis-3.0 criteria
    - mimic_derived.`sepsis3`
    - missing values will be assumed to include the patient


### Variables

List out the planned source for all covariates and exposures extracted for the study, e.g. admission source.
If describing a time-varying covariate, be specific regarding the aggregation and the time window (e.g. "lowest mean arterial pressure during the first 24 hours of the ICU stay.").

age, gender, weight, comorbidities, the survival
time, length of hospital stay, and length of ICU stay,
sequential organ failure assessment (SOFA) score, simplified
acute physiology score-II (SAPS-II), vital signs, firstday
laboratory results, daily fluid input, fluid balance,
and urine output. Besides, the time and value of lactate
measurement in the first 24 h of ICU admission were also
extracted to calculate the lactate-related parameters.

Variable name | Description | Timing | Aggregation | Source | Notes
--- | --- | --- | --- | --- | ---
`age` | Patient age in years | Admission | Initial | `age` | 
`gender` | Patient gender | Admission | N/A | `patients` | 
`weight` | Patient weight in kg | Admission | Initial | `weight_durations` or `first_day_weight`
`sofa_score` | Sequential organ failure assessment score | Any time during the ICU stay | Initial |  `chartevents` or `sofa` or `first_day_sofa`
`sapsii_score` | Simplified acute physiology score-II | Any time during the ICU stay | Initial | `sapsii`
`length_of_hospital_stay` | Length of hospital stay in days | Days from admission to discharge | N/A | `admissions`
`length_of_icu_stay` | Length of ICU stay in days | Days from ICU admission to discharge | N/A | `icustays`
`daily_fluid_intake` | 24-hour fluid intake in mL | First 24 hours | Initial | unknown |  
`daily_urine_output` | 24-hour urine output in mL | First 24 hours | Initial | `first_day_urine_output` or `urine_output_rate`
`congestive_heart_failure` | Whether a patient is diagnosed with congestive heart failure | Any time during hospital stay | N/A | `d_icd_diagnoses` and `diagnoses_icd` 
`myocardial_infarction` | Whether a patient is diagnosed with myocardial infarction | Any time during hospital stay | N/A | `d_icd_diagnoses` and `diagnoses_icd`
`cerebrovascular_disease` | Whether a patient is diagnosed with cerebrovascular disease | Any time during hospital stay | N/A | `d_icd_diagnoses` and `diagnoses_icd`
`chronic_pulmonary_disease` | Whether a patient is diagnosed with chronic pulmonary disease | Any time during hospital stay | N/A | `d_icd_diagnoses` and `diagnoses_icd`
`mild_liver_disease` | Whether a patient is diagnosed with mild liver disease | Any time during hospital stay | N/A | `d_icd_diagnoses` and `diagnoses_icd` | Need to manually classify mild vs severe
`severe_liver_disease` | Whether a patient is diagnosed with severe liver disease | Any time during hospital stay | N/A | `d_icd_diagnoses` and `diagnoses_icd` | Need to manually classify mild vs severe
`diabetes_without_complication` | Whether a patient is diagnosed with diabetes without complication | Any time during hospital stay | N/A | `d_icd_diagnoses` and `diagnoses_icd` | Need to be extremely specific with string matching
`diabetes_with_complication` | Whether a patient is diagnosed with diabetes with complication | Any time during hospital stay | N/A | `d_icd_diagnoses` and `diagnoses_icd` | Need to be extremely specific with string matching
`renal_disease` | Whether a patient is diagnosed with renal disease | Any time during hospital stay | N/A | `d_icd_diagnoses` and `diagnoses_icd`
`malignant_cancer` | Whether a patient is diagnosed with a malignant form of cancer | Any time during hospital stay | N/A | unknown
`aids` | Whether a patient is diagnosed with AIDS | Any time during hospital stay | N/A | unknown
Maximum anion gap (mmol/L) 	
Minimum albumin (g/dL) 	
Maximum bilirubin (mg/L) 	
Maximum creatinine (mg/dL) 
Maximum glucose (mg/dL) 	
Minimum hemoglobin (g/dL) 	
Minimum platelet (K/uL) 	
Maximum potassium (mmol/L) 	
Maximum APTT (sec) 	
Maximum INR 
Maximum PT (sec) 	
Maximum sodium (mmol/L) 	
Minimum sodium (mmol/L) 	
Maximum blood urea nitrogen (mg/dL) 
Maximum white blood cell count (K/μL) 
Mean heart rate (bpm)
Minimum systolic blood pressure (mmHg) 
Minimum diastolic blood pressure (mmHg) 
Minimum mean arterial blood pressure (mmHg)
Maximum respiratory rate (bpm) 
Minimum pulse O2 saturation (%) 
Maximum lactate (mmol/L) 
Mean lactate (mmol/L) 
Lactate load (mmol·hr./L) 
Normalized lactate load (mmol/L) 

If unsure about the source, write all possibilities, and justify them in the notes.
Also include in the notes whether outliers were processed (and how), as well as the approach for missing data.

### Outcome(s)

Variable name | Description | Timing | Aggregation | Source | Notes
--- | --- | --- | --- | --- | ---
28-day mortality | Whether or not the patient dies after 28 days | 28 days after admission | N/A | `admissions` | create new variable based on `admittime` and `deathtime`: set to 1 if `deathtime` exists and `deathtime` - `admittime` <= 28 days, else 0.
