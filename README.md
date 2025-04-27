# Loan Application Credit Risk Analysis (SQL Project)

This project is a simulation of a real-world loan application and credit risk analysis pipeline, designed to evaluate borrowers based on multiple financial and risk factors. The goal is to automate applicant segmentation (Approve, Review, Reject) and uncover portfolio insights using SQL, preparing the solution for deployment in financial institutions.

## Dataset Overview
The dataset consists of loan applications including fields like:
- Applicant ID
- Credit Score
- Debt-to-Income (DTI) Ratio
- Loan-to-Value (LTV) Ratio
- Previous Defaults
- Income
- Loan Amount
- Property Value

(No composite score or approval decision is initially present; they are computed during the analysis.)

## SQL Structure

### 1. Table Creation
The primary table `loan_applications` is created with the following columns:
- applicant_id (Primary Key)
- credit_score
- dti_ratio
- ltv_ratio
- previous_defaults
- income
- loan_amount
- property_value

### 2. Data Loading
The data is imported into SQL from a CSV file using the `LOAD DATA INFILE` command.

### 3. Composite Score Calculation
A composite score is calculated dynamically using the following weighted formula:

```sql
0.4 * ((credit_score - 300) / 600) +
0.3 * (1 - dti_ratio) +
0.2 * (1 - ltv_ratio) +
0.1 * CASE WHEN previous_defaults = 0 THEN 1 ELSE 0 END
```

> **Note:** The credit score is first normalized from its original scale of 300–900 to a 0–1 scale to ensure fair contribution to the composite score.

### 4. Applicant Segmentation
Based on the composite score, applicants are categorized:
- Approve: Composite Score ≥ 0.65
- Review: Composite Score between 0.55 and 0.649
- Reject: Composite Score < 0.55

### 5. Risk Tier Classification
Risk tiers are assigned based on credit score, DTI, and LTV:
- Low Risk
- Medium Risk
- High Risk

### 6. Portfolio Summary
Aggregation queries provide:
- Total applicants per approval segment.
- Distribution of risk ratings across the portfolio.

### 7. Fraud Detection
Special queries are used to detect potential data anomalies:
- Applicants with income = 0
- Loan amount or property value = 0

## Technologies Used
- SQL (MySQL syntax)
- Excel (for initial data inspection)
- GitHub (for project hosting)

## How to Run
1. Create the table using `create_table.sql`
2. Import sample data using `load_data.sql` or manually.
3. Run analysis queries from `loan_analysis_queries.sql`

---

This project showcases SQL skills across financial analysis, risk segmentation, predictive modeling, and portfolio monitoring, preparing the ground for scalable credit decision engines.

