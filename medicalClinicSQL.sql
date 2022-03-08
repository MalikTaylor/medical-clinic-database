USE medicalclinic;

DROP TABLE clinic_employee;
CREATE TABLE clinic_employee(
	employee_id INT PRIMARY KEY UNIQUE,
    f_name VARCHAR(20),
    l_name VARCHAR(20),
    birth_date DATE,
    race VARCHAR(20),
    ethnicity VARCHAR(20),
    sex VARCHAR(1),
    email VARCHAR(30),
    phone_number VARCHAR(15),
    address VARCHAR(30),
    city VARCHAR(10),
    state VARCHAR(10),
    zipcode VARCHAR(10)
);

DROP TABLE patient;

CREATE TABLE patient(
    f_name VARCHAR(20),
    l_name VARCHAR(20),
    birth_date DATE,
    race VARCHAR(20),
    ethnicity VARCHAR(20),
    sex VARCHAR(10),
    email VARCHAR(30),
    phone_number VARCHAR(15),
    address VARCHAR(30),
    city VARCHAR(10),
    state VARCHAR(10),
    zipcode VARCHAR(10)
);

DROP TABLE department;
CREATE TABLE department{
    department_id VARCHAR(10) PRIMARY KEY UNIQUE,
    department_name VARCHAR(30) NOT NULL,
    employee_id CHAR(10) NOT NULL,
    staff_count INT,
    office_id CHAR(10) NOT NULL,
    PRIMARY KEY(employee_id),
    FOREIGN KEY(employee_id) REFERENCES clinic_employee(employee_id),
    PRIMARY KEY(office_id,)
    FOREIGN KEY(office_id) REFERENCES office(office_id),
};

DROP TABLE nurse;
CREATE TABLE nurse{
    employee_id CHAR(10) NOT NULL,
    f_name VARCHAR(20) NOT NULL,
    l_name VARCHAR(20) NOT NULL,
    birth_date DATE,
    sex VARCHAR(10),
    phone_number VARCHAR(15),
    position VARCHAR(20),
    hired DATETIME NOT NULL,
    department_id VARCHAR(10),
    PRIMARY KEY(employee_id),
    FOREIGN KEY(employee_id) REFERENCES clinic_employee(employee_id),
    PRIMARY KEY(office_id,)
    FOREIGN KEY office_id) REFERENCES office(office_id),
}

DROP TABLE med_staff;
CREATE TABLE med_staff{
    employee_id CHAR(10) NOT NULL,
    f_name VARCHAR(20) NOT NULL,
    l_name VARCHAR(20) NOT NULL,
    birth_date DATE,
    sex VARCHAR(10),
    phone_number VARCHAR(15),
    position VARCHAR(20),
    hired DATETIME NOT NULL,
    department_id VARCHAR(10),
    PRIMARY KEY(employee_id),
    FOREIGN KEY(employee_id) REFERENCES clinic_employee(employee_id),
    PRIMARY KEY(office_id,)
    FOREIGN KEY office_id) REFERENCES office(office_id),
}

INSERT INTO patient VALUE ("Malik", "Taylor");
SELECT * FROM patient
