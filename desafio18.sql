SELECT CONCAT(T_EMP.FIRST_NAME, " ", T_EMP.LAST_NAME) AS 'Nome completo',
DATE_FORMAT(T_HIST.START_DATE, "%d/%m/%Y") AS 'Data de início',
DATE_FORMAT(T_HIST.END_DATE, "%d/%m/%Y") AS 'Data de rescisão',
ROUND(TIMESTAMPDIFF(day, T_HIST.START_DATE, T_HIST.END_DATE)/365, 2) AS 'Anos trabalhados'
FROM hr.job_history AS T_HIST
INNER JOIN hr.employees AS T_EMP
ON T_EMP.EMPLOYEE_ID = T_HIST.EMPLOYEE_ID
INNER JOIN hr.jobs AS T_JOBS
ON T_HIST.JOB_ID = T_JOBS.JOB_ID
ORDER BY CONCAT(T_EMP.FIRST_NAME, " ", T_EMP.LAST_NAME),
ROUND(TIMESTAMPDIFF(day, T_HIST.START_DATE, T_HIST.END_DATE)/365, 2);
