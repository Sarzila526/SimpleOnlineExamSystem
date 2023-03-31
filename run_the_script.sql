CREATE TABLE address(
    adrs_id NUMBER(10),
    city VARCHAR2(20),
    country VARCHAR2(20) NOT NULL
);

ALTER TABLE address ADD CONSTRAINT adrs_pk PRIMARY KEY(adrs_id);

INSERT INTO address VALUES(100, 'Dhaka', 'Bangladesh');
INSERT INTO address VALUES(101, 'Chittagong', 'Bangladesh');
INSERT INTO address VALUES(102, 'Khulna', 'Bangladesh');


CREATE TABLE result(
    r_id NUMBER(10),
    gpa DECIMAL(3, 2) DEFAULT 0.00 NOT NULL,
    cgpa DECIMAL(3, 2) DEFAULT 0.00 NOT NULL
);

ALTER TABLE result ADD CONSTRAINT res_pk PRIMARY KEY(r_id);

ALTER TABLE result ADD CONSTRAINT result_gpa_chk CHECK (gpa BETWEEN 0.00 AND 4.00);
ALTER TABLE result ADD CONSTRAINT result_cgpa_chk CHECK (cgpa BETWEEN 0.00 AND 4.00);

INSERT INTO result VALUES(100, 3.88, 3.94);
INSERT INTO result VALUES(102, 3.75, 3.56);
INSERT INTO result VALUES(104, 3.70, 3.62);
INSERT INTO result VALUES(106, 3.22, 3.33);




CREATE TABLE subject(
    sub_id NUMBER(10),
    sub_name VARCHAR2(50) NOT NULL
);

ALTER TABLE subject ADD CONSTRAINT sub_pk PRIMARY KEY(sub_id);

INSERT INTO subject VALUES(10, 'Database');
INSERT INTO subject VALUES(20, 'Physics');
INSERT INTO subject VALUES(30, 'Chemistry');
INSERT INTO subject VALUES(40, 'Math');




CREATE TABLE teacher(
    t_id NUMBER(10),
    t_name VARCHAR2(50) NOT NULL,
    t_sal DECIMAL(8, 2) NOT NULL,
    adrs_id NUMBER(10),
    sub_id NUMBER(10)
);


CREATE TABLE tchr_email(
    t_id NUMBER(10),
    t_email VARCHAR2(50) NOT NULL
);

ALTER TABLE teacher ADD CONSTRAINT tchr_pk PRIMARY KEY(t_id);
ALTER TABLE tchr_email ADD CONSTRAINT tchr_email_pk PRIMARY KEY(t_id);

ALTER TABLE teacher ADD CONSTRAINT tchr_adrs_fk  FOREIGN KEY(adrs_id) REFERENCES address(adrs_id);
ALTER TABLE teacher ADD CONSTRAINT tchr_res_fk  FOREIGN KEY(sub_id) REFERENCES subject(sub_id);

CREATE SEQUENCE teacher_sq START WITH 2000 INCREMENT BY 10 MAXVALUE 2999 NOCYCLE NOCACHE;

INSERT INTO teacher VALUES(teacher_sq.NEXTVAL, 'Ratan Kumar Saha', 50000.00, 102, 20);
INSERT INTO tchr_email VALUES(teacher_sq.CURRVAL, 'rksaha@gmail.com');

INSERT INTO teacher VALUES(teacher_sq.NEXTVAL, 'Fahmida Alam', 15000.00, 100, 40);
INSERT INTO tchr_email VALUES(teacher_sq.CURRVAL, 'fahmida@aiub.edu');

INSERT INTO teacher VALUES(teacher_sq.NEXTVAL, 'Sifat Rahman Ahona', 45000.00, 102, 30);
INSERT INTO tchr_email VALUES(teacher_sq.CURRVAL, 'ahona@aiub.edu');

INSERT INTO teacher VALUES(teacher_sq.NEXTVAL, 'Rifat Tasnim Anannaya', 35000.00, 101, 10);
INSERT INTO tchr_email VALUES(teacher_sq.CURRVAL, 'rifat.tasnim@aiub.edu');

INSERT INTO teacher VALUES(teacher_sq.NEXTVAL, 'Anika Hossain', 40000.00, 102, 20);
INSERT INTO tchr_email VALUES(teacher_sq.CURRVAL, 'ahanika@gmail.com');



CREATE TABLE student(
    s_id NUMBER(10),
    s_name VARCHAR2(50) NOT NULL,
    adrs_id NUMBER(10),
    r_id NUMBER(10)
);

CREATE TABLE std_email(
    s_id NUMBER(10),
    s_email VARCHAR2(50) NOT NULL
);

CREATE TABLE std_tchr(
    s_id NUMBER(10) NOT NULL,
    t_id NUMBER(10) NOT NULL
);

CREATE TABLE std_sub(
    s_id NUMBER(10) NOT NULL,
    sub_id NUMBER(10) NOT NULL
);

ALTER TABLE student ADD CONSTRAINT std_pk PRIMARY KEY(s_id);
ALTER TABLE std_email ADD CONSTRAINT std_email_pk PRIMARY KEY(s_id);

ALTER TABLE std_tchr ADD CONSTRAINT std_tchr_ck PRIMARY KEY(s_id, t_id);
ALTER TABLE std_sub ADD CONSTRAINT std_sub_ck PRIMARY KEY(s_id, sub_id);

ALTER TABLE student ADD CONSTRAINT std_adrs_fk  FOREIGN KEY(adrs_id) REFERENCES address(adrs_id);
ALTER TABLE student ADD CONSTRAINT std_res_fk  FOREIGN KEY(r_id) REFERENCES result(r_id);

CREATE SEQUENCE student_sq START WITH 1000 INCREMENT BY 10 MAXVALUE 1999 NOCYCLE NOCACHE;

INSERT INTO student VALUES(student_sq.NEXTVAL, 'Md. Tanvir Alam Niloy', 100, 106);
INSERT INTO std_email VALUES(student_sq.CURRVAL, 'tnioly0@gmail.com');
INSERT INTO std_tchr VALUES(student_sq.CURRVAL, 2010);
INSERT INTO std_sub VALUES(student_sq.CURRVAL, 40);

INSERT INTO student VALUES(student_sq.NEXTVAL, 'Maliha Rahman Riza', 101, 104);
INSERT INTO std_email VALUES(student_sq.CURRVAL, 'maliha2002@gmail.com');
INSERT INTO std_tchr VALUES(student_sq.CURRVAL, 2010);
INSERT INTO std_sub VALUES(student_sq.CURRVAL, 40);

INSERT INTO student VALUES(student_sq.NEXTVAL, 'Mehedi Hasan Opi', 102, 106);
INSERT INTO std_email VALUES(student_sq.CURRVAL, 'osthiropi@gmail.com');
INSERT INTO std_tchr VALUES(student_sq.CURRVAL, 2040);
INSERT INTO std_sub VALUES(student_sq.CURRVAL, 20);

INSERT INTO student VALUES(student_sq.NEXTVAL, 'Md. Shahriar Arif', 100, 104);
INSERT INTO std_email VALUES(student_sq.CURRVAL, 'atomarif343@gmail.com');
INSERT INTO std_tchr VALUES(student_sq.CURRVAL, 2040);
INSERT INTO std_sub VALUES(student_sq.CURRVAL, 20);

INSERT INTO student VALUES(student_sq.NEXTVAL, 'Nobir Hossain Samuel', 101, 104);
INSERT INTO std_email VALUES(student_sq.CURRVAL, 'nobirfreelencer@gmail.com');
INSERT INTO std_tchr VALUES(student_sq.CURRVAL, 2030);
INSERT INTO std_sub VALUES(student_sq.CURRVAL, 10);

INSERT INTO student VALUES(student_sq.NEXTVAL, 'Md. Mohibor Rahman Rahat', 102, 102);
INSERT INTO std_email VALUES(student_sq.CURRVAL, 'mohibor.rahat@gmail.com');
INSERT INTO std_tchr VALUES(student_sq.CURRVAL, 2030);
INSERT INTO std_sub VALUES(student_sq.CURRVAL, 10);

INSERT INTO student VALUES(student_sq.NEXTVAL, 'Khuko Moni', 100, 106);
INSERT INTO std_email VALUES(student_sq.CURRVAL, 'khukomoni163@gmail.com');
INSERT INTO std_tchr VALUES(student_sq.CURRVAL, 2020);
INSERT INTO std_sub VALUES(student_sq.CURRVAL, 30);

INSERT INTO student VALUES(student_sq.NEXTVAL, 'Sarzila Sahrin Jisha', 102, 100);
INSERT INTO std_email VALUES(student_sq.CURRVAL, '20-42526-1@student.aiub.edu');
INSERT INTO std_tchr VALUES(student_sq.CURRVAL, 2020);
INSERT INTO std_sub VALUES(student_sq.CURRVAL, 30);



CREATE TABLE question(
    q_id NUMBER(10),
    q_value VARCHAR2(255) NOT NULL,
    q_ans VARCHAR2(255) NOT NULL,
    sub_id NUMBER(10)
);

ALTER TABLE question ADD CONSTRAINT ques_pk PRIMARY KEY(q_id);

ALTER TABLE question ADD CONSTRAINT question_fk  FOREIGN KEY(sub_id) REFERENCES subject(sub_id);

CREATE SEQUENCE ques_sq START WITH 3000 INCREMENT BY 1 MAXVALUE 3999 NOCYCLE NOCACHE;

INSERT INTO question VALUES(ques_sq.NEXTVAL, 'What''s the full form of DBMS?', 'Database Management System', 10);
INSERT INTO question VALUES(ques_sq.NEXTVAL, 'What''s the full form of RDBMS?', 'Relational Database Management System', 10);
INSERT INTO question VALUES(ques_sq.NEXTVAL, 'What are the types of normalization in database?', '1NF, 2NF, 3NF', 10);
INSERT INTO question VALUES(ques_sq.NEXTVAL, 'What''s the full form of DDL?', 'Data Definition Language', 10);
INSERT INTO question VALUES(ques_sq.NEXTVAL, 'What''s the full form of DML?', 'Data Manipulation Language', 10);
INSERT INTO question VALUES(ques_sq.NEXTVAL, 'The correct relation between the radius of curvature R and focal length f of a spherical mirror is - ?', 'R = 2f', 20);
INSERT INTO question VALUES(ques_sq.NEXTVAL, 'The instrument used for detecting the presence of electric current in a circuit is - ?', 'Galvanometer', 20);
INSERT INTO question VALUES(ques_sq.NEXTVAL, 'Which one of the following was the first mineral acid discovered?', 'Sulphuric acid', 20);
INSERT INTO question VALUES(ques_sq.NEXTVAL, 'What types of radiations has the smallest wavelength?', 'X-rays', 20);
INSERT INTO question VALUES(ques_sq.NEXTVAL, 'In an incandescent electric bulb, the filament of the bulb is made up of which metal?', 'Tungsten', 20);
INSERT INTO question VALUES(ques_sq.NEXTVAL, 'The chemical used as a fixer in photography is - ?', 'sodium thiosulphate', 30);
INSERT INTO question VALUES(ques_sq.NEXTVAL, 'For which one of the following is the density maximum?', 'Water', 30);
INSERT INTO question VALUES(ques_sq.NEXTVAL, 'The alcohol used in power alcohol is - ?', 'ethyl alcohol', 30);
INSERT INTO question VALUES(ques_sq.NEXTVAL, 'The reaction between methane and chlorine in diffused sunlight is - ?', 'substitution', 30);
INSERT INTO question VALUES(ques_sq.NEXTVAL, 'The alloy of aluminium used for making magnet is - ?', 'alnico', 30);
INSERT INTO question VALUES(ques_sq.NEXTVAL, 'What is the sum of 130+125+191 = ?', '446', 40);
INSERT INTO question VALUES(ques_sq.NEXTVAL, 'If we minus 712 from 1500, how much do we get?', '788', 40);
INSERT INTO question VALUES(ques_sq.NEXTVAL, '50 times of 8 is equal to = ?', '400', 40);
INSERT INTO question VALUES(ques_sq.NEXTVAL, '110 divided by 10 is = ?', '11', 40);
INSERT INTO question VALUES(ques_sq.NEXTVAL, 'Find the missing terms in multiple of 3: 3, 6, 9, __, 15', '12', 40);
