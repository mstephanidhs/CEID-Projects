DELIMITER $

CREATE TRIGGER job_insert
AFTER INSERT ON job
FOR EACH ROW
BEGIN
  DECLARE user VARCHAR(50);
  DECLARE uid TINYINT;

    SELECT MAX(ID) INTO uid FROM tempuser;
    SELECT username INTO user FROM tempuser WHERE ID = uid;

  INSERT INTO log(action_name, action_time, result, action, table_name) VALUES
  (user, NOW(), 'success', 'insert', 'job');
END$

CREATE TRIGGER job_update
AFTER UPDATE ON job
FOR EACH ROW
BEGIN
  DECLARE user VARCHAR(50);
  DECLARE uid TINYINT;

    SELECT MAX(ID) INTO uid FROM tempuser;
    SELECT username INTO user FROM tempuser WHERE ID = uid;

  INSERT INTO log(action_name, action_time, result, action, table_name) VALUES
  (user, NOW(), 'success', 'update', 'job');
END$

CREATE TRIGGER job_delete
AFTER DELETE ON job
FOR EACH ROW
BEGIN
  DECLARE user VARCHAR(50);
  DECLARE uid TINYINT;

    SELECT MAX(ID) INTO uid FROM tempuser;
    SELECT username INTO user FROM tempuser WHERE ID = uid;

  INSERT INTO log(action_name, action_time, result, action, table_name) VALUES
  (user, NOW(), 'success', 'delete', 'job');
END$

DELIMITER ;
