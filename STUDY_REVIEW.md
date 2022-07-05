# Study Review

## Study information

### Title

Increased normalized lactate load is associated with higher mortality in both sepsis and non-sepsis patients: an analysis of the MIMIC-IV database

DOI: https://doi.org/10.1186/s12871-022-01617-5

### Objective(s) of the study

- Evaluate the association between normalized lactate load, an index that incorporates the magnitude of change and the time interval of such evolution of lactate, and 28-day mortality in sepsis and non-sepsis patients. 

- Compare the accuracy of normalized lactate load in predicting mortality between these two populations.

### Dataset(s) used

- MIMIC-IV, version 1.0
- DOI (or link if no DOI available): https://doi.org/10.13026/s6n6-xd98
- Citation: Johnson, A., Bulgarelli, L., Pollard, T., Horng, S., Celi, L. A., & Mark, R. (2021). MIMIC-IV (version 1.0). PhysioNet. https://doi.org/10.13026/s6n6-xd98.
- Other relevant information (link to dataset documentation, etc): https://mimic.mit.edu/docs/iv/

## Summarize the paper

The paper aims to investigate the relation between lactate load and 28-day mortality in sepsis and non-sepsis patients. It also seeks to compare the accuracy in mortality prediction between these two groups of patients. What they found was that normalized lactate load is the strongest predictor of mortality rate (compared to maximum lactate and mean lactate load) in both sepsis and non-sepsis patients. Additionally, the accuracy of this predictor is better in sepsis patients compared to non-sepsis patients. 

### Strength(s) of the work

- Thoroughness 
    - Variables properly listed, definition of lactate load clearly explained, study design and methods are well laid out.
    - Limitations of study are acknowledged
- Clear Figures 
    - The lactate load definition, cohort flow diagram, and boxplots were very easy to understand.  
- Sensitivity analysis
    - The authors test whether taking more lactate measurements can improve the accuracy of normalized lactate load in predicting mortality. This is good practice as they are checking whether their results are robust to changes in the study design.

### Weakness(es) of the work

Highlight 3 weaknesses of the work.

- Grammatical errors
    - Introduction, Paragraph 2: "We **hypothesis** that the performance of normalized lactate load in predicting mortality is different between the sepsis and the non-sepsis patients."
- Scientific jargon
    - In the introduction, a lot of scientific terms were introduced and as a reader without a scientific background I found it difficult to understand the definition of lactate. 
- Statistical software 
    - The authors used STATA for their analysis, which is quite expensive to purchase as it is not open source. 

### Anticipated reproducibility challenges

In the data extraction section, there is a list of variables that were used. However, there is no mention of which tables they were extracted from, which requires us to do a deeper search. Additionally, the computational calculation of lactate load may not be as straightforward as Figure 1 suggests, as there are no step-by-step instructions.

## Data extraction

### Variables

- Covariates: age, gender, weight, comorbidities, the survival time, length of hospital stay, and length of ICU stay, sequential organ failure assessment (SOFA) score, simplified acute physiology score-II (SAPS-II), vital signs, first-day laboratory results, daily fluid input, fluid balance, urine output. 

- Additional: time and value of lactate measurement in the first 24 h of ICU admission to calculate the lactate-related parameters

### Outcome(s)

28-day mortality.

### Inclusion/Exclusion criteria

The exclusion criteria were: 1) age < 18 years; 2) not first ICU admission; 3) only one lactate measurement was obtained during the first 24 h; 4) length of ICU stay < 24 h. Patients were divided into the sepsis or non-sepsis group according to the sepsis-3.0 criteria. 

### Outlier handling

There is no mention of outliers in this study.

### Missing data handling

There is no mention of missing data in the study.

## Results

### Population summary

Provide information about the original study's population: sample size, average mortality, etc. Typically the data is presented in the first table (i.e. Table 1). Select a parsimonious set of descriptors which you will compare your reproduction against. At the very least include the sample size and a summary measure of the outcome(s).

### Analysis method

Explain the analysis method of the study in detail.

### Power calculations (if present)

There is no power calculation present.

### Evaluation measures

The study used p-value and area under the receiver operator characteristic curve as the two main evaluation measures.

### Sensitivity Analyses

The authors test whether taking more lactate measurements can improve the accuracy of normalized lactate load in predicting mortality. The sensitivity analysis found that this is true for non-sepsis patients, but not for sepsis patients.
