DELIMITER $

CREATE TRIGGER change_user
BEFORE UPDATE ON user
FOR EACH ROW
BEGIN

DECLARE u VARCHAR(50);
DECLARE name1 VARCHAR(50);
DECLARE name2 VARCHAR(50);
DECLARE name3 VARCHAR(50);
DECLARE uid TINYINT;

SELECT MAX(ID) INTO uid FROM tempuser;
SELECT username INTO u FROM tempuser WHERE ID = uid;


SELECT username INTO name1 FROM emloyee WHERE username LIKE u;
SELECT admin_user INTO name2 FROM admin WHERE admin_user LIKE u;
SELECT managerUsername INTO name3 FROM manager WHERE managerUsername LIKE u;

IF (name3 IS NOT NULL)
THEN
	SET NEW.username=OLD.username;
	SET NEW.register_date=OLD.register_date;
        INSERT INTO log(action_name, action_time, result, action, table_name) VALUES
        (u, NOW(), 'success', 'update', 'user');
END IF;

IF (name1 IS NOT NULL)
THEN
	SET NEW.username=OLD.username;
	SET NEW.email=OLD.email;
	SET NEW.register_date=OLD.register_date;
	INSERT INTO log(action_name, action_time, result, action, table_name) VALUES
        (u, NOW(), 'success', 'update', 'user');
END IF;

IF (name2 IS NOT NULL)
THEN
	INSERT INTO log(action_name, action_time, result, action, table_name) VALUES
	(u, NOW(), 'success', 'update', 'user');
END IF;

IF (name2 IS NULL AND name1 IS NULL AND name3 IS NULL)
THEN
	INSERT INTO log(action_name, action_time, result, action, table_name) VALUES
	(u, NOW(), 'failure', 'update', 'user');
END IF;



END$

CREATE TRIGGER change_employee
BEFORE UPDATE ON employee 
FOR EACH ROW
BEGIN

  DECLARE c INT;
  DECLARE name1 VARCHAR(50);
  DECLARE name2 VARCHAR(50);
  DECLARE name3 VARCHAR(50);
  DECLARE user VARCHAR(50);
  DECLARE uid TINYINT;

  SELECT MAX(ID) INTO uid FROM tempuser;
  SELECT username INTO user FROM tempuser WHERE ID = uid;

  SELECT admin_user INTO name1 FROM admin WHERE admin_user LIKE user;
  SELECT username INTO name2 FROM employee WHERE username LIKE user;
  SELECT managerUsername INTO name3 FROM manager WHERE managerUsername LIKE user;

  IF (name1 IS NOT NULL)
  THEN
       INSERT INTO log(action_name, action_time, result, action, table_name) VALUES
       (user, NOW(), 'success', 'update', 'employee');
  END IF;

  IF (name2 IS NOT NULL)
  THEN
     SET NEW.username=OLD.username;
     SET NEW.excellence=OLD.excellence;
     SET NEW.work_experience=OLD.work_experience;
     SET NEW.AM=OLD.AM;
     SET NEW.certificate=OLD.certificate;
     SET NEW.comp_AFM=OLD.comp_AFM;
     INSERT INTO log(action_name, action_time, result, action, table_name) VALUES
  (user, NOW(), 'success', 'update', 'employee');
  END IF;

  IF (name3 IS NOT NULL)
  THEN
	SET NEW.username=OLD.username;
	SET NEW.bio=OLD.bio;
	SET NEW.AM=OLD.AM;
        SET NEW.comp_AFM=OLD.comp_AFM;
        INSERT INTO log(action_name, action_time, result, action, table_name) VALUES
  (user, NOW(), 'success', 'update', 'employee');
  END IF;

  IF (name1 IS NULL AND name2 IS NULL AND name3 IS NULL)
  THEN
    SIGNAL SQLSTATE VALUE '45000'
    SET MESSAGE_TEXT = 'Invalid Registration';
    INSERT INTO log(action_name, action_time, result, action, table_name) VALUES
    (user, NOW(), 'failure', 'update', 'employee');
  END IF;

END$


CREATE TRIGGER change_evaluator
BEFORE UPDATE ON evaluator
FOR EACH ROW
BEGIN

  DECLARE c INT;
  DECLARE name1 VARCHAR(50);
  DECLARE name2 VARCHAR(50);
  DECLARE user VARCHAR(50);
  DECLARE uid TINYINT;

  SELECT MAX(ID) INTO uid FROM tempuser;
  SELECT username INTO user FROM tempuser WHERE ID = uid;

  SELECT admin_user INTO name1 FROM admin WHERE admin_user LIKE user;
  SELECT eval_usr INTO name2 FROM evaluator WHERE eval_usr LIKE user;

  IF (name2 IS NOT NULL)
  THEN 
	SET NEW.eval_usr=OLD.eval_usr;
        INSERT INTO log(action_name, action_time, result, action, table_name) VALUES
        (user, NOW(), 'success', 'update', 'evaluator');
  END IF;

  IF (name1 IS NOT NULL)
  THEN
	INSERT INTO log(action_name, action_time, result, action, table_name) VALUES
	(user, NOW(), 'success', 'update', 'evaluator');
  END IF;

  IF (name1 IS NULL AND name2 IS NULL)
  THEN
    SIGNAL SQLSTATE VALUE '45000'
    SET MESSAGE_TEXT = 'Invalid Registration';
    INSERT INTO log(action_name, action_time, result, action, table_name) VALUES
    (user, NOW(), 'failure', 'update', 'evaluator');
  END IF;

  INSERT INTO log(action_name, action_time, result, action, table_name) VALUES
  (user, NOW(), 'success', 'update', 'evaluator');
END$

CREATE TRIGGER change_manager
BEFORE UPDATE ON manager 
FOR EACH ROW
BEGIN

  DECLARE c INT;
  DECLARE name1 VARCHAR(50);
  DECLARE user VARCHAR(50);
  DECLARE uid TINYINT;

  SELECT MAX(ID) INTO uid FROM tempuser;
  SELECT username INTO user FROM tempuser WHERE ID = uid;

  SELECT admin_user INTO name1 FROM admin WHERE admin_user LIKE user;

  IF (name1 IS NULL)
  THEN
    SIGNAL SQLSTATE VALUE '45000'
    SET MESSAGE_TEXT = 'Invalid Registration';
    INSERT INTO log(action_name, action_time, result, action, table_name) VALUES
    (user, NOW(), 'failure', 'update', 'manager');
  END IF;

  INSERT INTO log(action_name, action_time, result, action, table_name) VALUES
  (user, NOW(), 'success', 'update', 'manager');
END$

DELIMITER ;