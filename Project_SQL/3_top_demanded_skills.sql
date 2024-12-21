--Q: What are the most in-demand skills for data analysts?



SELECT * 
FROM job_postings_fact jpf
INNER JOIN skills_job_dim s ON jpf.job_id = s.job_id
INNER JOIN skills_dim d ON s.skill_id = d.skill_id
LIMIT 5