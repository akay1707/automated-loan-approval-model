SELECT 
    applicant_id,
    CASE
        WHEN (0.4 * ((credit_score - 300) / 600) +
              0.3 * (1 - dti_ratio) +
              0.2 * (1 - ltv_ratio) +
              0.1 * CASE WHEN previous_defaults = 0 THEN 1 ELSE 0 END) >= 0.65 THEN 'Approve'
        WHEN (0.4 * ((credit_score - 300) / 600) +
              0.3 * (1 - dti_ratio) +
              0.2 * (1 - ltv_ratio) +
              0.1 * CASE WHEN previous_defaults = 0 THEN 1 ELSE 0 END) BETWEEN 0.55 AND 0.6499 THEN 'Review'
        ELSE 'Reject'
    END AS approval_status
FROM loan_applications;
