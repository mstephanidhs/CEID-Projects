DELIMITER $

CREATE TRIGGER employee_insert
AFTER INSERT ON employee
FOR EACH ROW
BEGIN
  DECLARE user VARCHAR(50);
  DECLARE uid TINYINT;
  
  SELECT MAX(ID) INTO uid FROM tempuser;
  SELECT username INTO user FROM tempuser WHERE ID = uid;

  INSERT INTO log(action_name, action_time, result, action, table_name) VALUES
  (user, NOW(), 'success', 'insert', 'employee');
END$

CREATE TRIGGER employee_update
AFTER UPDATE ON employee
FOR EACH ROW
BEGIN
  DECLARE user VARCHAR(50);
  DECLARE uid TINYINT;

  SELECT MAX(ID) INTO uid FROM tempuser;
  SELECT username INTO user FROM tempuser WHERE ID = uid;

  INSERT INTO log(action_name, action_time, result, action, table_name) VALUES
  (user, NOW(), 'success', 'update', 'employee');
END$

CREATE TRIGGER employee_delete
AFTER UPDATE ON employee
FOR EACH ROW
BEGIN
  DECLARE user VARCHAR(50);
  DECLARE uid TINYINT;

  SELECT MAX(ID) INTO uid FROM tempuser;
  SELECT username INTO user FROM tempuser WHERE ID = uid;

  INSERT INTO log(action_name, action_time, result, action, table_name) VALUES
  (user, NOW(), 'success', 'delete', 'employee');
END$



DELIMITER ;