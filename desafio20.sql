USE hr;
DROP PROCEDURE IF EXISTS exibir_historico_completo_por_funcionario;

DELIMITER $$
CREATE PROCEDURE exibir_historico_completo_por_funcionario(IN email VARCHAR(50))
BEGIN
  SELECT CONCAT(T_EMP.FIRST_NAME, " ", T_EMP.LAST_NAME) AS 'Nome completo',
  T_JOBS.JOB_TITLE AS Cargo,
  T_DP.DEPARTMENT_NAME AS 'Departamento'
  FROM hr.job_history AS T_HIST
  INNER JOIN hr.employees AS T_EMP
  ON T_EMP.EMPLOYEE_ID = T_HIST.EMPLOYEE_ID
  INNER JOIN hr.jobs AS T_JOBS
  ON T_HIST.JOB_ID = T_JOBS.JOB_ID
  INNER JOIN hr.departments AS T_DP
  ON T_HIST.DEPARTMENT_ID = T_DP.DEPARTMENT_ID
  WHERE T_EMP.EMAIL = email
  ORDER BY CONCAT(T_EMP.FIRST_NAME, " ", T_EMP.LAST_NAME) DESC, T_JOBS.JOB_TITLE;
END $$
DELIMITER ;

-- CALL exibir_historico_completo_por_funcionario('NKOCHHAR');
