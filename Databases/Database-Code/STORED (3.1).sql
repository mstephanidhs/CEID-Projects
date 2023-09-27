DELIMITER $

CREATE PROCEDURE employee_request(IN user VARCHAR(50))
BEGIN
  DECLARE not_found INT;
  DECLARE c1 INT;
  DECLARE requests INT;
  DECLARE numberl INT;
  DECLARE comm TEXT;
  DECLARE name VARCHAR(50);
  DECLARE name1 VARCHAR(50);
  DECLARE number1 INT;
  DECLARE number2 INT;
  DECLARE number3 INT;

  DECLARE bcursor CURSOR FOR
  SELECT job_ID FROM request_evaluation WHERE employee_usr LIKE user;

  DECLARE bcursor1 CURSOR FOR
  SELECT job_ID FROM evaluation_grades WHERE employee_usr LIKE user;

  DECLARE bcursor2 CURSOR FOR
  SELECT jobID FROM evaluation_result WHERE username LIKE user;


  OPEN bcursor;
  BEGIN
    DECLARE flag INT DEFAULT 0;
    DECLARE requests INT;
    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET flag=1;

    bcursorLoop: LOOP
    FETCH bcursor INTO requests;
    IF (flag) 
    THEN 
      LEAVE bcursorLoop;
    END IF;
    SELECT count(job_ID) INTO c1 FROM request_evaluation WHERE requests = job_ID AND employee_usr = user;
    IF (c1>0)
    THEN 
      SELECT "The job applications of this user that haven't been examined yet are: ";
      SELECT c1;
    END IF;
    END LOOP;
  END;
  CLOSE bcursor;

  OPEN bcursor1;
  BEGIN
    DECLARE flag1 INT DEFAULT 0;
    DECLARE requests1 INT;
    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET flag1=1;

    bcursor1Loop: LOOP
    FETCH bcursor1 INTO requests1;
    IF (flag1)
    THEN
      LEAVE bcursor1Loop;
    END IF;
    SELECT grade INTO numberl FROM evaluation_result WHERE requests=ID AND username LIKE user;
    IF (number1 IS NOT NULL) 
    THEN
        SELECT comments INTO comm FROM evaluation_result WHERE requests=ID AND username LIKE user;
        SELECT eval_usr INTO name1 FROM evaluation_result WHERE requests=ID AND username LIKE user;
        SELECT user, numberl, comm, name1;
    END IF;
    END LOOP;
  END;

  OPEN bcursor2;
  BEGIN
    DECLARE flag2 INT DEFAULT 0;
    DECLARE requests2 INT;
    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET flag2=1;

    bcursor2Loop: LOOP
    FETCH bcursor2 INTO requests2;
    IF (flag2)
    THEN 
      LEAVE bcursor2Loop;
    END IF;
    SELECT employee_usr INTO name1 FROM evaluation_grades WHERE job_ID=requests AND employee_usr LIKE user;
    IF (name1 IS NOT NULL)
     THEN 
          SELECT 'The evaluation is in progress.';
          SELECT phase1 INTO number1 FROM evaluation_grades WHERE requests=ID AND username LIKE user;
          SELECT phase2 INTO number2 FROM evaluation_grades WHERE requests=ID AND username LIKE user;
          SELECT phase3 INTO number3 FROM evaluation_grades WHERE requests=ID AND username LIKE user;
          SELECT user, number1, number2, number3;
     END IF;
    END LOOP;
  END;
END$

DELIMITER ;





