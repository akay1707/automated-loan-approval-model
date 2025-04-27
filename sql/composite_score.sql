SELECT 
    applicant_id,
    (0.4 * ((credit_score - 300) / 600) +
     0.3 * (1 - dti_ratio) +
     0.2 * (1 - ltv_ratio) +
     0.1 * CASE WHEN previous_defaults = 0 THEN 1 ELSE 0 END) AS composite_score
FROM loan_applications;
