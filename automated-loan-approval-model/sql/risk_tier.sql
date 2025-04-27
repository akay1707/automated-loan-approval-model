SELECT 
    applicant_id,
    CASE 
        WHEN (credit_score >= 750 AND dti_ratio <= 0.35 AND ltv_ratio <= 0.80) THEN 'Low Risk'
        WHEN (credit_score BETWEEN 650 AND 749 AND dti_ratio BETWEEN 0.36 AND 0.50) THEN 'Medium Risk'
        ELSE 'High Risk'
    END AS risk_tier
FROM loan_applications;
