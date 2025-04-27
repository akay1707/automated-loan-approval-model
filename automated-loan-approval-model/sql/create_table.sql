CREATE TABLE loan_applications (
    applicant_id INT PRIMARY KEY,
    credit_score INT,
    dti_ratio FLOAT,
    ltv_ratio FLOAT,
    previous_defaults INT,
    income FLOAT,
    loan_amount FLOAT,
    property_value FLOAT
);
