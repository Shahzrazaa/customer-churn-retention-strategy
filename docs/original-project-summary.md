# Original Project Summary

## Objective

The original project focused on **reducing customer churn**. The team aimed to predict which customers were likely to leave a bank and then evaluate policies that could retain those customers through targeted offers and incentives.

## Data

- 10,000 customer records
- Public Kaggle bank-churn dataset
- Customer features included credit score, geography, gender, age, tenure, balance, number of products, card ownership, activity status, estimated salary, and exit/churn status.

## Modeling Process

The report describes the following process:

1. Randomly divide the 10,000 records into 4,907 training observations and 5,093 testing observations.
2. Remove row number, customer ID, and surname because they are customer-specific identifiers.
3. Use the remaining variables in R to calculate churn probabilities.
4. Produce churn / non-churn classifications for training and testing data.
5. Estimate customer value and revenue implications.
6. Model four possible retention policies.

## Reported Predictive Performance

- Churn rate: **21%**
- Accuracy: **79%**
- Recall: **47%**
- Precision: **49%**

## Retention Economics

The team used assumptions about deposits, interest/deposit rates, offer acceptance, and customer retention cost to estimate the economics of four interventions.

### Scenario 1 — Discount / service offer
- Offer cost: approximately $40–45
- Customer lifetime value: $238
- Conversion assumption: 50%
- Revenue: $988,239.11
- Improvement: 1.42%

### Scenario 2 — Lower withholding tax
- Reduction modeled: 0.3%
- Offer cost: approximately $7 per customer
- Customer lifetime value: $239
- Conversion assumption: 50%
- Revenue: $1,025,548.46
- Improvement: 5.25%

### Scenario 3 — Lower fees and service charges
- Offer cost: approximately $11 per customer
- Conversion assumption: 50%
- Revenue: $1,020,965.54
- Improvement: 4.78%

### Scenario 4 — Share value from retained deposits
- Offer cost: approximately $72 per customer
- Customer lifetime value: roughly $1,448
- Revenue: approximately $6,191,794.41
- Improvement: 4.70%

## Original Limitations

The report notes that important context was missing, including the exact bank, dataset year, and actual internal costs of the offers. Because of this, several revenue and profitability calculations relied on external research and assumptions.

## Why It Matters

The strength of the project is not only churn prediction. It connects model output to a practical business decision:

**Who should we try to retain, what should we offer them, and is the intervention economically worthwhile?**
