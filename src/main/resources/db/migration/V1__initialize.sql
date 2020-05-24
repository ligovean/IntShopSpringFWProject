SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS roles;

CREATE TABLE roles (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(50) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO roles (name)
VALUES
('ROLE_EMPLOYEE'),('ROLE_MANAGER'),('ROLE_ADMIN');

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id int(11) NOT NULL AUTO_INCREMENT,
  username varchar(50) NOT NULL,
  password char(80) NOT NULL,
  first_name varchar(50) NOT NULL,
  last_name varchar(50) NOT NULL,
  email varchar(50) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO users (username,password,first_name,last_name,email)
VALUES
('alex','$2a$10$CGamJWPYokRss2FX6WcBJOgFIDKyUoCYnrGtepfVQyDSTdngSxrzK','Alex','GeekBrains','alex@gb.com');

DROP TABLE IF EXISTS users_roles;

CREATE TABLE users_roles (
  user_id int(11) NOT NULL,
  role_id int(11) NOT NULL,

  PRIMARY KEY (user_id, role_id),

  KEY FK_ROLE_idx (role_id),

  CONSTRAINT FK_USER_05 FOREIGN KEY (user_id)
  REFERENCES users (id)
  ON DELETE NO ACTION ON UPDATE NO ACTION,

  CONSTRAINT FK_ROLE FOREIGN KEY (role_id)
  REFERENCES roles (id)
  ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO users_roles (user_id, role_id)
VALUES
(1, 1),
(1, 2),
(1, 3);

DROP TABLE IF EXISTS students;

CREATE TABLE students (
	id int(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) DEFAULT NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB CHARSET=utf8;

DROP TABLE IF EXISTS courses;

CREATE TABLE courses (
	id int(11) NOT NULL AUTO_INCREMENT,
    title VARCHAR(100) DEFAULT NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB CHARSET=utf8;

DROP TABLE IF EXISTS students_courses;

CREATE TABLE students_courses (
	student_id int(11) NOT NULL,
    course_id int(11) NOT NULL,

    PRIMARY KEY (student_id, course_id),

    CONSTRAINT FK_STUDENT FOREIGN KEY (student_id)
    REFERENCES students (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION,

    CONSTRAINT FK_COURSE FOREIGN KEY (course_id)
    REFERENCES courses (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB CHARSET=utf8;

/* Task 02 */
DROP TABLE IF EXISTS products;

CREATE TABLE products (
    id int(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(200) DEFAULT NULL,
    description VARCHAR(700) DEFAULT NULL,
    price double DEFAULT NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB CHARSET=utf8;

INSERT INTO products (name,description,price)
VALUES
('FENDER ERIC CLAPTON SIGNATURE STRATOCASTER MN BLACK (CUSTOM SHOP)','электрогитара в кейсе, цвет черный, корпус - ольха, гриф - клён, пофиль Soft `V`, накладка грифа - клён, радиус накладки 9,5`',412000.0)
,('GIBSON 2019 LES PAUL MODERN GRAPHITE TOP','электрогитара, цвет черный, материал корпуса - махагони, верхняя часть - клён, гриф - махагони, накладка грифа - эбони',241000.00)
,('IBANEZ AZ2402-BKF','электрогитара',138000.00);

SET FOREIGN_KEY_CHECKS = 1;