CREATE TABLE company
(
  AFM CHAR(9) NOT NULL,
  DOY VARCHAR(50) NOT NULL,
  telephone INT(10),
  street VARCHAR(100),
  numb TINYINT,
  city VARCHAR(50),
  country VARCHAR(50),
  PRIMARY KEY (AFM)
)engine=InnoDB;

CREATE TABLE user
(
  email VARCHAR(30) NOT NULL,
  password VARCHAR(20) NOT NULL,
  username VARCHAR(50) NOT NULL,
  register_date DATE,
  PRIMARY KEY (username)
)engine=InnoDB;

CREATE TABLE admin
(
  admin_user VARCHAR(50) NOT NULL,
  ID_admin TINYINT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY(ID_admin),
  FOREIGN KEY (admin_user) REFERENCES user(username)
  ON DELETE CASCADE ON UPDATE CASCADE
)engine=InnoDB;

CREATE TABLE employee
(
  bio TEXT,
  excellence TEXT,
  work_experience TINYINT,
  AM INT(10) NOT NULL,
  certificate TEXT,
  username VARCHAR(50) NOT NULL,
  comp_AFM CHAR(9) NOT NULL,
  PRIMARY KEY (username, AM),
  FOREIGN KEY (username) REFERENCES user(username)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (comp_AFM) REFERENCES company(AFM)
  ON DELETE CASCADE ON UPDATE CASCADE
)engine=InnoDB;

CREATE TABLE language
(
  lang VARCHAR(25) NOT NULL,
  employee_usr VARCHAR(50) NOT NULL,
  PRIMARY KEY (lang, employee_usr),
  FOREIGN KEY (employee_usr) REFERENCES employee(username)
  ON DELETE CASCADE ON UPDATE CASCADE
)engine=InnoDB;


CREATE TABLE manager
(
  exp_years TINYINT,
  managerUsername VARCHAR(50) NOT NULL,
  AFM_firm CHAR(9) NOT NULL,
  IDmanager INT NOT NULL,
  PRIMARY KEY (managerUsername, IDmanager),
  FOREIGN KEY (managerUsername) REFERENCES user(username)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (AFM_firm) REFERENCES company(AFM)
  ON DELETE CASCADE ON UPDATE CASCADE
)engine=InnoDB;


CREATE TABLE degree
(
  degr_grade TINYINT NOT NULL,
  grad_date DATE NOT NULL,
  title VARCHAR(50) NOT NULL,
  academe VARCHAR(100) NOT NULL,
  PRIMARY KEY (title, academe)
)engine=InnoDB;

CREATE TABLE has_degree
(
  emplUser VARCHAR(50) NOT NULL,
  degreeTitle VARCHAR(50) NOT NULL,
  degreeAcademe VARCHAR(100) NOT NULL,
  PRIMARY KEY (emplUser, degreeTitle, degreeAcademe),
  FOREIGN KEY (emplUser) REFERENCES employee(username)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (degreeTitle, degreeAcademe) REFERENCES degree(title, academe)
  ON DELETE CASCADE ON UPDATE CASCADE
)engine=InnoDB;

CREATE TABLE project
(
  url VARCHAR(100),
  descr TEXT,
  proj_ID TINYINT NOT NULL AUTO_INCREMENT,
  empl VARCHAR(50) NOT NULL,
  PRIMARY KEY (proj_ID),
  FOREIGN KEY (empl) REFERENCES employee(username)
  ON DELETE CASCADE ON UPDATE CASCADE
)engine=InnoDB;

CREATE TABLE evaluator
(
  IDeval INT NOT NULL,
  eval_usr VARCHAR(50) NOT NULL,
  AFM CHAR(9) NOT NULL,
  PRIMARY KEY (IDeval, eval_usr),
  FOREIGN KEY (eval_usr) REFERENCES user(username)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (AFM) REFERENCES company(AFM)
  ON DELETE CASCADE ON UPDATE CASCADE
)engine=InnoDB;


CREATE TABLE job
(
  salary FLOAT(6,1) NOT NULL,
  edra VARCHAR(100) NOT NULL,
  pos_title VARCHAR(40) NOT NULL,
  jobID TINYINT NOT NULL AUTO_INCREMENT,
  announce_date DATE NOT NULL,
  submission_date DATE NOT NULL,
  IDeval INT NOT NULL,
  comp_AFM CHAR(9) NOT NULL,
  PRIMARY KEY (jobID),
  FOREIGN KEY (IDeval) REFERENCES evaluator(IDeval)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (comp_AFM) REFERENCES company(AFM)
  ON DELETE CASCADE ON UPDATE CASCADE
)engine=InnoDB;

CREATE TABLE request_evaluation
(
  employee_usr VARCHAR(50) NOT NULL,
  job_ID TINYINT NOT NULL,
  AFM CHAR(9) NOT NULL,
  PRIMARY KEY (employee_usr, job_ID),
  FOREIGN KEY (employee_usr) REFERENCES employee(username)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (job_ID) REFERENCES job(jobID)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY(AFM) REFERENCES company(AFM)
  ON DELETE CASCADE ON UPDATE CASCADE
)engine=InnoDB;


CREATE TABLE evaluation_grades
(
  phase1 TINYINT,
  phase2 TINYINT,
  phase3 TINYINT,
  IDeval INT NOT NULL,
  IDmanager INT NOT NULL,
  report_manager TEXT,
  job_ID TINYINT NOT NULL,
  employee_usr VARCHAR(50) NOT NULL,
  AFM CHAR(9) NOT NULL,
  PRIMARY KEY (IDeval, IDmanager, job_ID, employee_usr),
  FOREIGN KEY (job_ID) REFERENCES job(jobID)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (IDeval) REFERENCES evaluator(IDeval)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY(employee_usr) REFERENCES employee(username)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (AFM) REFERENCES company(AFM)
  ON DELETE CASCADE ON UPDATE CASCADE
)engine=InnoDB;

CREATE TABLE evaluation_result
(
  grade TINYINT NOT NULL,
  comments TEXT,
  username VARCHAR(50) NOT NULL,
  IDeval INT NOT NULL,
  jobID TINYINT NOT NULL,
  AFM CHAR(9) NOT NULL,
  PRIMARY KEY (username, IDeval, jobID),
  FOREIGN KEY (username) REFERENCES employee(username)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (IDeval) REFERENCES evaluator(IDeval)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (jobID) REFERENCES job(jobID)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (AFM) REFERENCES company(AFM)
  ON DELETE CASCADE ON UPDATE CASCADE
)engine=InnoDB;

CREATE TABLE antik
(
  descr TINYTEXT,
  title VARCHAR(80) NOT NULL,
  belongs_to VARCHAR(80),
  PRIMARY KEY (title),
  FOREIGN KEY (belongs_to) REFERENCES antik(title)
  ON DELETE CASCADE ON UPDATE CASCADE
)engine=InnoDB;

CREATE TABLE needs
(
  jobID TINYINT NOT NULL,
  title VARCHAR(80) NOT NULL,
  PRIMARY KEY (jobID, title),
  FOREIGN KEY (jobID) REFERENCES job(jobID)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (title) REFERENCES antik(title)
  ON DELETE CASCADE ON UPDATE CASCADE
)engine=InnoDB;

CREATE TABLE log_table
(
  username VARCHAR(50) NOT NULL,
  action_ID INT NOT NULL AUTO_INCREMENT,
  action_time TIMESTAMP NOT NULL,
  result ENUM('success', 'failure'),
  action VARCHAR(30) NOT NULL,
  table_name VARCHAR(10) NOT NULL,
  PRIMARY KEY(action_ID)
)engine=InnoDB;

CREATE TABLE tempuser 
(
  username VARCHAR(50) NOT NULL,
  ID TINYINT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY(ID)
)engine=InnoDB;