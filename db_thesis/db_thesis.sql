CREATE TABLE university (
  id int(11) unsigned NOT NULL AUTO_INCREMENT,
  universityName varchar(100) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE institute (
  id int(11) unsigned NOT NULL AUTO_INCREMENT,
  university_id int(11) unsigned DEFAULT NULL,
  instituteName varchar(100) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY institute_key_1 (university_id),
  CONSTRAINT institute_key_1 FOREIGN KEY (university_id) REFERENCES university (id) ON UPDATE CASCADE
);



CREATE TABLE keyword (
  id int(11) unsigned NOT NULL AUTO_INCREMENT,
  keywordName varchar(100) DEFAULT NULL,
  PRIMARY KEY (id)
);



CREATE TABLE language (
  id int(11) unsigned NOT NULL AUTO_INCREMENT,
  languageName varchar(25) DEFAULT NULL,
  PRIMARY KEY (id)
);



CREATE TABLE person (
  id int(11) unsigned NOT NULL AUTO_INCREMENT,
  personName varchar(100) DEFAULT NULL,
  personSurname varchar(100) DEFAULT NULL,
  PRIMARY KEY (id)
);



CREATE TABLE subject (
  id int(11) unsigned NOT NULL AUTO_INCREMENT,
  subjectName varchar(100) DEFAULT NULL,
  PRIMARY KEY (id)
);



CREATE TABLE thesis (
  thesis_no int(7) unsigned NOT NULL AUTO_INCREMENT, 
  author_id int(11) unsigned NOT NULL,
  supervisor_id int(11) unsigned NOT NULL,
  institute_id int(11) unsigned NOT NULL,
  subject_id int(11) unsigned NOT NULL,
  language_id int(11) unsigned NOT NULL,
  type enum('Master','Doctorate','Specilization in Medicine','Proficiency in Art') NOT NULL,
  title varchar(500) DEFAULT NULL,
  abstract varchar(5000) DEFAULT NULL,
  year int(4) DEFAULT NULL,
  numberOfPages int(4) DEFAULT NULL,
  submissionDate date DEFAULT NULL,
  PRIMARY KEY (thesis_no),
  KEY thesis_key_1 (author_id),
  KEY thesis_key_2 (supervisor_id),
  KEY thesis_key_3 (institute_id),
  KEY thesis_key_4 (subject_id),
  KEY thesis_key_5 (language_id),
  CONSTRAINT thesis_key_1 FOREIGN KEY (author_id) REFERENCES person (id) ON UPDATE CASCADE,
  CONSTRAINT thesis_key_2 FOREIGN KEY (supervisor_id) REFERENCES person (id) ON UPDATE CASCADE,
  CONSTRAINT thesis_key_3 FOREIGN KEY (institute_id) REFERENCES institute (id) ON UPDATE CASCADE,
  CONSTRAINT thesis_key_4 FOREIGN KEY (subject_id) REFERENCES subject (id) ON UPDATE CASCADE,
  CONSTRAINT thesis_key_5 FOREIGN KEY (language_id) REFERENCES language (id) ON UPDATE CASCADE
);



CREATE TABLE thesis_cosupervisor (
  thesis_id int(10) unsigned NOT NULL,
  cosupervisor_id int(10) unsigned NOT NULL,
  PRIMARY KEY (thesis_id,cosupervisor_id),
  KEY thesis_cosupervisor_key_2 (cosupervisor_id),
  CONSTRAINT thesis_cosupervisor_key_1 FOREIGN KEY (thesis_id) REFERENCES thesis (thesis_no) ON UPDATE CASCADE,
  CONSTRAINT thesis_cosupervisor_key_2 FOREIGN KEY (cosupervisor_id) REFERENCES person (id) ON UPDATE CASCADE
);



CREATE TABLE thesis_keyword (
  thesis_id int(10) unsigned NOT NULL,
  keyword_id int(10) unsigned NOT NULL,
  PRIMARY KEY (thesis_id,keyword_id),
  KEY thesis_keyword_key_2 (keyword_id),
  CONSTRAINT thesis_keyword_key_1 FOREIGN KEY (thesis_id) REFERENCES thesis (thesis_no) ON UPDATE CASCADE,
  CONSTRAINT thesis_keyword_key_2 FOREIGN KEY (keyword_id) REFERENCES keyword (id) ON UPDATE CASCADE
);



CREATE TABLE thesis_subject (
  thesis_id int(10) unsigned NOT NULL,
  subject_id int(10) unsigned NOT NULL,
  PRIMARY KEY (thesis_id,subject_id),
  KEY thesis_subject_key_2 (subject_id),
  CONSTRAINT thesis_subject_key_1 FOREIGN KEY (thesis_id) REFERENCES thesis (thesis_no) ON UPDATE CASCADE,
  CONSTRAINT thesis_subject_key_2 FOREIGN KEY (subject_id) REFERENCES subject (id) ON UPDATE CASCADE
);


