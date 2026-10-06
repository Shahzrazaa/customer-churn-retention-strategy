# Data

The original report used a public Kaggle dataset commonly distributed as **Churn_Modelling.csv**.

The surviving project report points to the Kaggle bank customer churn modeling dataset and documents 10,000 records.

## Expected Columns

Typical columns used by the project:

- RowNumber
- CustomerId
- Surname
- CreditScore
- Geography
- Gender
- Age
- Tenure
- Balance
- NumOfProducts
- HasCrCard
- IsActiveMember
- EstimatedSalary
- Exited

## Why the CSV is not committed

The dataset is not included in this repository so that:

- the repository stays lightweight,
- data provenance remains clear,
- and the analysis can be run against a fresh copy of the public source.

Place a copy at:

`data/Churn_Modelling.csv`

Then run:

`Rscript analysis/reproduction.R`

## Reproducibility Note

The exact original random seed and model specification were not preserved in the course report. The reproduction script therefore demonstrates the documented workflow rather than claiming to reproduce the historical metrics exactly.
