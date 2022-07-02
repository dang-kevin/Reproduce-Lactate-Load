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

Describe areas of the paper which appear to lack sufficient detail.

## Data extraction

### Variables

List out the covariates and exposures extracted for the study, e.g. admission source.

### Outcome(s)

List the outcome(s) used in the study, e.g. 28-day mortality.

### Inclusion/Exclusion criteria

Describe the inclusion criteria for the study. Since inclusion/exclusion criteria are interchangeable, decide on the most clear presentation of the study methodology, e.g. "the study included all adults, and excluded patients admitted to CSRU."

### Outlier handling

If outliers were specially processed, describe the approach here.

### Missing data handling

For any missing data present in the study, explain the approach to handle it.

## Results

### Population summary

Provide information about the original study's population: sample size, average mortality, etc. Typically the data is presented in the first table (i.e. Table 1). Select a parsimonious set of descriptors which you will compare your reproduction against. At the very least include the sample size and a summary measure of the outcome(s).

### Analysis method

Explain the analysis method of the study in detail.

### Power calculations (if present)

If a power calculation is present, describe the approach and the assumptions made.

### Evaluation measures

e.g. p-value, effect sizes, statistical tests, performance measures like area under the receiver operator characteristic curve, etc.

### Sensitivity Analyses

Describe any additional sensitivity analyses performed in the study.

The authors test whether taking more lactate measurements can improve the accuracy of normalized lactate load in predicting mortality. This is the case for non-sepsis patients, but not for sepsis patients.
