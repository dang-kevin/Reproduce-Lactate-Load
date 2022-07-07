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
1. exclude_non_adult
    - exclude patients under 18 years of age
    - mimic_derived.age 
    - missing values will be assumed to include the patient
2. exclude_readmission
    - exclude if not first ICU admission
    - mimic_core.admissions
    - missing values will be assumed to include the patient
3. exclude_one_lactate_measurement
    - exclude if only one lactate measurement was obtained during the first 24 hours
    - mimic_hosp.labevents
    - missing values will be assumed to include the patient
4. exclude_short_icu_stay
    - exclude if length of ICU stay less than 24 hours
    - mimic_icu.icustays
    - missing values will be assumed to include the patient
5. sepsis_flag
    - create a variable to separate the patients into sepsis or non-sepsis group according to sepsis-3.0 criteria
    - mimic_derived.sepsis3
    - missing values will be assumed to include the patient


### Variables

List out the planned source for all covariates and exposures extracted for the study, e.g. admission source.
If describing a time-varying covariate, be specific regarding the aggregation and the time window (e.g. "lowest mean arterial pressure during the first 24 hours of the ICU stay."). The following template is a useful guide.

Variable name | Description | Timing | Aggregation | Source | Notes
--- | --- | --- | --- | --- | ---
Heart Rate Day 1 | Patient heart rate | First 24 hours of ICU stay | Highest | chartevents | 
Sedative use | Midazolam or propofol | Any time during the ICU Stay | Any value | inputevents | 

If unsure about the source, write all possibilities, and justify them in the notes.
Also include in the notes whether outliers were processed (and how), as well as the approach for missing data.

### Outcome(s)

List the outcome(s) used in the study, e.g. 28-day mortality, with similar detail as the above variables.
