LOAD DATA INFILE 'C:\Users\hp\Desktop\Projects\loan-approval-model\Dataset'
INTO TABLE loan_applications
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(applicant_id, credit_score, dti_ratio, ltv_ratio, previous_defaults, income, loan_amount, property_value);
