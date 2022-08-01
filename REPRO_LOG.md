# Conclusion for reproduction

## Title

Increased normalized lactate load is associated with higher mortality in both sepsis and non-sepsis patients: an analysis of the MIMIC-IV database

DOI: https://doi.org/10.1186/s12871-022-01617-5

## Known differences

Specify changes to the data processing and/or methodology which are known to you. For each difference, describe: (1) the original study approach, (2) the reproduction approach, (3) the justification for the change. If possible, classify the differences as major (could impact the result of the study) or minor (unlikely to change the result of the study).

* (minor) 24-hour fluid intake, malignant cancer, AIDS,  APTT, INR are not included in the reproduction as I was unable to find these variables in the MIMIC-IV database.
* (minor) Unable to obtain confidence intervals for the AUC. The authors reported AUC with confidence intervals using Stata, and there was difficulty obtaining them in the Python reproduction so the AUCs are reported alone.

## Unknown differences

Specify changes to the data processing and/or methodology which *may* have occurred, but you are unable to confirm due to ambiguity in the original material studied. For each difference, describe (1) the most specific reference to the approach in the original study, if possible, and (2) the approach taken in the reproduction.

* (major) Exclusion criteria is ambiguous given the scope of the MIMIC-IV database so it is up to the reader to interpret - leading to a different cohort size.
* (major) The original study does not mention which machine learning model they used to construct the ROC curves. Logistic regression was used in this reproduction as it is the simplest binary prediction algorithm.
* (minor) No mention of how to deal with outliers and missing values. In this reproduction, extreme outliers were set to null values, while missing values were not imputed nor removed.    
* (minor) Unclear if 28-day mortality uses date of hospital admission or ICU admission as the baseline. The reproduction used hospital admission.

## Comparison of population

A table comparing the population measures between the original and the reproduction.

Population measure | Original Study | Reproduction
--- | --- | ---
Age (year) | 65.1 ± 16 | 64.0 ± 15.9
Female (%) | 8528 (40) | 6865 (39.4)
Weight (kg) | 83 ± 23.8 | 83.7 ± 23.7
SOFA score | 5.9 ± 3.7 | 7.2 ± 4.0
Length of hospital stay (day) | 8 (5.1, 13.5) | 9.0 (5.0,15.0) 
Length of ICU stay (day) | 	2.7 (1.4, 5.2) | 3.0 (2.0, 6.0)
Die in 28 days | 3569 (16.7) | 2484 (14.3)
Congestive heart failure | 6849 (32.1) | 4736 (27.2) 
Maximum anion gap (mmol/L) | 16.7 ± 5.7 | 15.9 ± 5.2
Mean heart rate (bpm) | 87.6 ± 16 | 87.3 ± 15.9
Maximum lactate (mmol/L) | 2.6 (1.8, 3.9) | 2.6 (1.8, 3.8)
Mean lactate (mmol/L) | 2.1 (1.5, 2.9) | (2.0 (1.5, 2.9)
Lactate load (mmol·hr./L) | 46.2 (33.8, 65.1) | 46.0 (34.0,64.2)
Normalized lactate load (mmol/L) | 1.9 (1.4, 2.7) | 1.9 (1.4, 2.7)

Data are presented as mean ± standard deviation or median (interquartile range) for continuous variables and counts (percentages) for categorical variables.

## Comparison of results

A table of the evaluation measures comparing the results in the original study and the reproduction. Also include the final size of the cohort, proportion of individuals excluded, and other important summary measures for the study.

Evaluation measure | Original Study | Reproduction
--- | --- | ---
Cohort | 21333 | 17426
% Excluded | 59.8% | 56.0%
AUC of All Patients: Normalized lactate load | 0.706 | 0.661
AUC of All Patients: Maximum lactate | 0.68 | 0.633
AUC of All Patients: Mean lactate | 0.694 | 0.649
AUC of Sepsis Patients: Normalized lactate load | 0.707 | 0.663
AUC of Sepsis Patients: Maximum lactate | 0.687 | 0.638
AUC of Sepsis Patients: Mean lactate | 0.697 | 0.653
AUC of Non-sepsis Patients Normalized lactate load | 0.684 | 0.653
AUC of Non-sepsis Patients: Maximum lactate | 0.661 | 0.625
AUC of Non-sepsis Patients: Mean lactate | 0.673 | 0.64

## Conclusion(s) regarding reproducibility

Overall, a very difficult paper to reproduce. There is a high level of ambiguity with exclusion criteria, the outcome variable, missing values, and outliers. With the scope of the MIMIC-IV database, and 46 variables in this study to extract there is a lot of room for error without more specific instructions. 