DELIMITER $
CREATE PROCEDURE evaluationComplete(IN jobnumber INT, IN evalnumber INT)
BEGIN
  
  DECLARE grade1 INT;
  DECLARE grade2 INT;
  DECLARE grade3 INT;
  DECLARE not_found INT;
  DECLARE name VARCHAR(50);
  DECLARE name1 VARCHAR(50);
  DECLARE sum INT;
  DECLARE evalname VARCHAR(50);
  DECLARE comm VARCHAR(50);
  DECLARE report TEXT;
  DECLARE af CHAR(9);
  

  DECLARE bcursor CURSOR FOR
  SELECT employee_usr FROM evaluation_grades WHERE jobnumber=job_ID AND evalnumber=IDeval;

  DECLARE CONTINUE HANDLER FOR NOT FOUND
  SET not_found=1;

  SET not_found=0;
  

  OPEN bcursor;

  REPEAT
    FETCH bcursor INTO name;
    IF(not_found=0)
    THEN
      SELECT phase1 INTO grade1 FROM evaluation_grades WHERE jobnumber=job_ID AND evalnumber=IDeval AND name LIKE employee_usr;
      SELECT phase2 INTO grade2 FROM evaluation_grades WHERE jobnumber=job_ID AND evalnumber=IDeval AND name LIKE employee_usr;
      SELECT phase3 INTO grade3 FROM evaluation_grades WHERE jobnumber=job_ID AND evalnumber=IDeval AND name LIKE employee_usr;
      SELECT report_manager INTO report FROM evaluation_grades WHERE jobnumber=job_ID AND evalnumber=IDeval AND name LIKE employee_usr;
      SELECT AFM INTO af FROM evaluation_grades WHERE jobnumber=job_ID AND evalnumber=IDeval AND name LIKE employee_usr;

      SELECT username INTO name1 FROM evaluation_result WHERE jobnumber=jobID AND username LIKE name;

      IF(grade1 IS NOT NULL AND grade2 IS NOT NULL AND grade3 IS NOT NULL AND name1 IS NULL AND report IS NOT NULL)
      THEN
        SET sum=grade1+grade2+grade3; 
        INSERT INTO evaluation_result VALUES
        (sum, comm, name, evalnumber, jobnumber);
        SELECT * FROM evaluation_result;
        DELETE FROM evaluation_grades WHERE job_ID = jobnumber AND IDeval = evalnumber AND employee_usr LIKE name;
       ELSE
        SELECT "The evaluation has been already completed.";
      END IF;
    END IF;
  UNTIL (not_found=1)
  END REPEAT;
  CLOSE bcursor;
END$

DELIMITER ;

CALL evaluationComplete(2, 1067455);

