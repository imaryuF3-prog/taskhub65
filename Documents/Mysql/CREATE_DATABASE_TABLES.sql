CREATE DATABASE task_db DEFAULT CHARACTER SET utf8mb4;
SHOW DATABASES;
USE task_db;

CREATE TABLE m_user (
user_id VARCHAR(24) NOT NULL,
password VARCHAR(32) NOT NULL,
user_name VARCHAR(20) NOT NULL,
update_datetime TIMESTAMP NOT NULL
    DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,
    
PRIMARY KEY(user_id),
UNIQUE KEY(user_name)
);
SHOW VARIABLES LIKE 'datadir';

CREATE TABLE m_category(
category_id INT NOT NULL
    AUTO_INCREMENT,
category_name VARCHAR(20) NOT NULL,
update_datetime TIMESTAMP NOT NULL
    DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY(category_id),
UNIQUE KEY(category_name)
);

CREATE TABLE m_status(
status_code CHAR(2) NOT NULL,
status_name VARCHAR(20) NOT NULL,
update_datetime TIMESTAMP NOT NULL
    DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY(status_code),
UNIQUE KEY(status_name)
);

CREATE TABLE t_task(
task_id INT NOT NULL
    AUTO_INCREMENT,
task_name VARCHAR(50) NOT NULL,
category_id INT NOT NULL,
limit_date DATE,
user_id VARCHAR(24) NOT NULL,
status_code CHAR(2) NOT NULL,
memo VARCHAR(100),
create_datetime TIMESTAMP NOT NULL
    DEFAULT CURRENT_TIMESTAMP,
update_datetime TIMESTAMP NOT NULL
    DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (task_id),
FOREIGN KEY (category_id)
    REFERENCES m_category(category_id),
FOREIGN KEY (user_id)
    REFERENCES m_user (user_id),
FOREIGN KEY (status_code)
    REFERENCES m_status(status_code) 
);


