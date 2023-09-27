DELIMITER $

CREATE PROCEDURE showgrades(IN data INT, OUT result INT)
BEGIN 

DECLARE c1 INT;
DECLARE c2 INT;
DECLARE flag INT;
DECLARE jid INT;
DECLARE username VARCHAR(50);
DECLARE grade INT;
DECLARE comments TEXT;

DECLARE bcursor CURSOR FOR
SELECT jobID FROM evaluation_result WHERE data = jobID;
DECLARE CONTINUE HANDLER FOR NOT FOUND
SET flag=1;

SET flag=0;

SET c1=0;
SET c2=0;
SET result=0;


SELECT COUNT(username) INTO c1 FROM evaluation_result WHERE jobID = data;

SELECT COUNT(employee_usr) INTO c2 FROM evaluation_grades WHERE data = job_ID;

IF(c1>0 AND c2=0)
THEN  
  OPEN bcursor;
  REPEAT
    FETCH bcursor INTO jid;
    IF (flag=0)
    THEN
      SELECT username, grade, comments FROM evaluation_result WHERE jobID = jid;
    END IF;
    UNTIL (flag=1)
    END REPEAT;
    CLOSE bcursor;    
END IF;

  IF (c1>0 AND c2>0)
  THEN
      OPEN bcursor;
      REPEAT
      FETCH bcursor INTO jid;
        IF (flag=0)
        THEN
          SELECT username, grade, comments FROM evaluation_result WHERE jobID = jid;
          SELECT c2 INTO result;
          SELECT result;
        END IF;
    UNTIL (flag=1)
    END REPEAT;
    CLOSE bcursor;
  END IF;
 
  IF (c1=0 AND c2>0)
  THEN
    SET username = null;
    SET grade = null;
    SET comments = null;
    SELECT c2 INTO result;
    SELECT username, grade, comments;
    SELECT result;
  END IF; 

END$

DELIMITER ;