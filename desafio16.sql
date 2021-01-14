USE hr;
DROP FUNCTION IF EXISTS buscar_quantidade_de_empregos_por_funcionario;

DELIMITER $$
CREATE FUNCTION buscar_quantidade_de_empregos_por_funcionario(email VARCHAR(300))
RETURNS INT READS SQL DATA
BEGIN
  DECLARE qty_jobs INT;
  SELECT COUNT(t_hist.JOB_ID)
  FROM hr.employees AS t_emp
  INNER JOIN hr.job_history AS t_hist ON t_hist.EMPLOYEE_ID = t_emp.EMPLOYEE_ID
  WHERE t_emp.EMAIL = email
  INTO qty_jobs;
  RETURN qty_jobs;
END $$
DELIMITER ;

-- SELECT buscar_quantidade_de_empregos_por_funcionario('NKOCHHAR');
