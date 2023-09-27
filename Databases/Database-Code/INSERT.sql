INSERT INTO company VALUES
('24228', 'DOY A PATRWN', 2610555777, 'Karaiskaki', 20, 'Patra', 'Ellada' ),
('23558', 'DOY B PATRWN', 2610222444, 'Gounari', 8, 'Patra', 'Ellada'),
('28956', 'DOY Z ATHINWN', 2610666321, 'Omonoias', 144, 'Athina', 'Ellada');

INSERT INTO user VALUES
('xristo@gmail.com', 'idontknow', 'Xristopoulos Panagioths', '2020-12-20'),
('papadop@gmail.com', 'mynameis', 'Papadopoulou Niki', '2020-04-03'),
('kostopoulos@hotmail.com', 'iamfine', 'Kostopoulos Stavros', '2020-02-20'),
('zaxariou@yahoo.com', 'whoisthis', 'Zaxariou Iwanna', '2020-09-25'),
('neofytos@hotmail.com', 'iamaplant', 'Neofytos Kwstas', '2021-01-01'),
('anagnos@gmail.com', 'iamawesome', 'Anagnostopoulos Xristos', '2021-01-03'),
('dimitr@gmail.com', 'lolomgand', 'Dimitriou Vasiliki', '2019-08-23'),
('mpapa@gmail.com', 'ihaveplant', 'Papa Mairh', '2016-03-30'),
('stefanidis@gmail.com', 'youknowwho', 'Stefanidis Marios', '2015-04-12'),
('papadatos@gmail.com', 'yesitis', 'Papadatos Kostas', '2021-01-17');

INSERT INTO admin(admin_user) VALUES
('Papadatos Kostas');

INSERT INTO manager VALUES
(10, 'Xristopoulos Panagioths', '24228', 1072333),
(4, 'Papadopoulou Niki', '23558', 1011420);

INSERT INTO evaluator VALUES
(1067455, 'Kostopoulos Stavros', '24228'),
(1069360, 'Zaxariou Iwanna', '23558'),
(1067460, 'Stefanidis Marios', '24228');

INSERT INTO job(salary, edra, pos_title, announce_date, submission_date, IDeval, comp_AFM) VALUES
(1500, 'DOY A PATRWN', 'Personnel Director', '2021-01-01', '2021-02-15', 1067455, '24228'),
(2000, 'DOY B PATRWN', 'Marketing Director', '2021-01-01', '2021-02-28', 1069360, '23558'),
(1250, 'DOY A PATRWN', 'Assistant Manager', '2021-03-01', '2021-03-30', 1067460, '24228');

INSERT INTO degree VALUES
(8, '2011-06-20', 'Degree in Finance', 'University of Patras'),
(8, '2010-02-24', 'Degree in Marketing', 'University of Patras'),
(9, '2012-10-15', 'Degree in Computer Science', 'University of Thessalonikis');

INSERT INTO employee VALUES
('5 years of experience in the field', 'good in teamwork', 2, 1110, 'degree in computer sciene', 'Neofytos Kwstas', '24228'),
('worked in a big firm for 2.5 years', 'good in organising', 4, 1112, 'degree in Finance', 'Anagnostopoulos Xristos', '24228'),
('first of his class', 'good in PR', 1, 1113, 'good in marketing', 'Dimitriou Vasiliki', '23558'),
('while a student, worked as an intern for a big brand', 'hardworking and a try-hard', 7, 1114, 'degree in computer sciene', 'Papa Mairh', '23558');

INSERT INTO language VALUES
('Enlgish', 'Anagnostopoulos Xristos'),
('English', 'Neofytos Kwstas'),
('French', 'Neofytos Kwstas'),
('German', 'Dimitriou Vasiliki'),
('Chinese', 'Dimitriou Vasiliki');

INSERT INTO project(url, descr, empl) VALUES
('www.project1.com', 'Database for a hospital', 'Neofytos Kwstas'),
('www.project2.com', 'Create an operating system', 'Papa Mairh');

INSERT INTO has_degree VALUES
('Neofytos Kwstas', 'Degree in Computer Science', 'University of Thessalonikis'),
('Papa Mairh', 'Degree in Computer Science', 'University of Thessalonikis');

INSERT INTO request_evaluation VALUES
('Anagnostopoulos Xristos', 1, '24228'),
('Neofytos Kwstas', 3, '24228');

INSERT INTO evaluation_grades VALUES
(2, 2, 1, 1069360, 1011420, 'very anxious but managed it in the end', 2, 'Dimitriou Vasiliki', '23558'),
(2, 1, 0, 1069360, 1072333, 'very insufficient', 2, 'Papa Mairh', '23558');

INSERT INTO evaluation_result VALUES
(3, 'didnt seem very enthousiastic', 'Anagnostopoulos Xristos', 1067460, 3, '24228'),
(8, 'very kind', 'Neofytos Kwstas', 1067455, 1, '24228');



