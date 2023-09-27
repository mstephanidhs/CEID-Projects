DELIMITER $

CREATE TRIGGER eval_insert
AFTER INSERT ON request_evaluation
FOR EACH ROW
BEGIN
  DECLARE user VARCHAR(50);
  DECLARE uid TINYINT;

    SELECT MAX(ID) INTO uid FROM tempuser;
    SELECT username INTO user FROM tempuser WHERE ID = uid;

  INSERT INTO log(action_name, action_time, result, action, table_name) VALUES
  (user, NOW(), 'success', 'insert', 'request_evaluation');
END$

CREATE TRIGGER eval_update
AFTER UPDATE ON request_evaluation
FOR EACH ROW
BEGIN
  DECLARE user VARCHAR(50);
  DECLARE uid TINYINT;

    SELECT MAX(ID) INTO uid FROM tempuser;
    SELECT username INTO user FROM tempuser WHERE ID = uid;

  INSERT INTO log(action_name, action_time, result, action, table_name) VALUES
  (user, NOW(), 'success', 'update', 'request_evaluation');
END$

CREATE TRIGGER eval_delete
AFTER DELETE ON request_evaluation
FOR EACH ROW
BEGIN
  DECLARE user VARCHAR(50);
  DECLARE uid TINYINT;

    SELECT MAX(ID) INTO uid FROM tempuser;
    SELECT username INTO user FROM tempuser WHERE ID = uid;

  INSERT INTO log(action_name, action_time, result, action, table_name) VALUES
  (user, NOW(), 'success', 'delete', 'request_evaluation');
END$

DELIMITER ;