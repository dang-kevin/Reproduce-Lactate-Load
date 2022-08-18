# Increased normalized lactate load is associated with higher mortality in both sepsis and non-sepsis patients: an analysis of the MIMIC-IV database

[![DOI](https://zenodo.org/badge/505971146.svg)](https://zenodo.org/badge/latestdoi/505971146)

This repository contains a reproduction of Chen, H., Gong, SR. & Yu, RG. Increased normalized lactate load is associated with higher mortality in both sepsis and non-sepsis patients: an analysis of the MIMIC-IV database. BMC Anesthesiol 22, 79 (2022). https://doi.org/10.1186/s12871-022-01617-5

\
Steps to rerun the analysis:
1) Obtain access to `physionet-data` on Google BigQuery.
2) Run the SQL scripts from the `acquire` directory in BigQuery to extract data.
3) Download query results with `.csv` extensions, and store in the `data` folder. If the file is too large, export to Google Drive before downloading.
4) Run the Jupyter notebooks (`exploratory_analysis.ipynb` and `primary_analysis.ipynb`) in `analyze` folder,

Note: The extracted csv files are not included in the `data` folder, as MIMIC data is protected under a Data Use Agreement. Additionally, the rationale for downloading csv files rather than establishing a direct connection to BigQuery is the limited window of access to Google BigQuery on a free trial.