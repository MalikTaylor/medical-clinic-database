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

DROP TABLE admin_employee;

CREATE TABLE admin_employee(
    employee_id CHAR(10) NOT NULL,
    f_name VARCHAR(20) NOT NULL,
    l_name VARCHAR(20) NOT NULL,
    birth_date DATE,
    race VARCHAR(20),
    ethnicity VARCHAR(20),
    sex VARCHAR(1),
    email VARCHAR(30),
    phone_number VARCHAR(15),
    address VARCHAR(30),
    city VARCHAR(10),
    state VARCHAR(10),
    zipcode VARCHAR(10),
    PRIMARY KEY (employee_id)
    FOREIGN KEY (employee_id) REFERENCES clinic_employee(employee_id) -- Not sure these last two lines are right but can be fixed later - XG
);

DROP TABLE receptionist;

CREATE TABLE receptionist(
    employee_id CHAR(10) NOT NULL,
    f_name VARCHAR(20) NOT NULL,
    l_name VARCHAR(20) NOT NULL,
    birth_date DATE,
    race VARCHAR(20),
    ethnicity VARCHAR(20),
    sex VARCHAR(1),
    email VARCHAR(30),
    phone_number VARCHAR(15),
    address VARCHAR(30),
    city VARCHAR(10),
    state VARCHAR(10),
    zipcode VARCHAR(10),
    PRIMARY KEY (employee_id),
    FOREIGN KEY (employee_id) REFERENCES admin_employee(employee_id) -- Not sure these last two lines are right but can be fixed later - XG
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
    patient_id CHAR(10) NOT NULL,
    zipcode VARCHAR(10),
    PRIMARY KEY(patient_id)
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
DROP TABLE specialty;

CREATE TABLE specialty(
	specialty_id SMALLINT NOT NULL PRIMARY KEY,
	specialty_name VARCHAR(20) NOT NULL
);
	

DROP TABLE doctor;

CREATE TABLE doctor( 
    f_name VARCHAR(20) NOT NULL,
    l_name VARCHAR(20) NOT NULL,
    employee_id CHAR(10) NOT NULL,
    birth_date DATE,
    race VARCHAR(20),
    ethnicity VARCHAR(20),
    sex VARCHAR(10),
    email VARCHAR(30),
    phone_number VARCHAR(15),
    address VARCHAR(30),
    city VARCHAR(10),
    state VARCHAR(10),
    zipcode VARCHAR(10),
    hired DATETIME NOT NULL,
    specialty_id CHAR(5) NOT NULL,
    PRIMARY KEY (employee_id),
    FOREIGN KEY (employee_id) REFERENCES clinic_employee(employee_id),
    FOREIGN KEY (specialty_id) REFERENCES specialty (specialty_id)     

);

DROP TABLE office;

CREATE TABLE office(
	office_id CHAR(10) NOT NULL,
	office_name VARCHAR(50),
	address VARCHAR(50),
	office_phone CHAR(11),
	PRIMARY KEY(office_id)
);

DROP TABLE room;

CREATE TABLE room(
	room_num SMALLINT,
	unavaliable BOOLEAN
);

DROP TABLE appointment;

CREATE TABLE appointment(
    appt_id CHAR(10) NOT NULL,
    patient_id CHAR(10) NOT NULL,
    nurse_id CHAR(10),
    doctor_id CHAR(10) NOT NULL,
    start DATETIME,
    end DATETIME,
    office_id CHAR(10) NOT NULL,
    room_num SMALLINT,
    reason_appt VARCHAR(100),
    PRIMARY KEY(appt_id),
    FOREIGN KEY(patient_id) REFERENCES patient(patient_id),
    FOREIGN KEY(nurse_id) REFERENCES clinic_employee(employee_id),
    FOREIGN KEY(doctor_id) REFERENCES clinic_employee(employee_id),
    FOREIGN KEY(office_id) REFERENCES office(office_id),
    FOREIGN KEY(room_num) REFERENCES room(room_num),
);

DROP TABLE InsuranceComp;

CREATE TABLE InsuranceComp(
    company_id INT PRIMARY KEY UNIQUE,
    name VARCHAR(50),
    phone_num VARCHAR(15)
);

DROP TABLE emergency;

CREATE TABLE emergency(
    patient_id CHAR(10) NOT NULL,
    relation VARCHAR(20),
    phonenumb1 VARCHAR(15),
    phonenumb2 VARCHAR(15),
    FOREIGN KEY(patient_id) REFERENCES patient(patient_id)
);

DROP TABLE patallergens; -- I decided to combine patient allergens and allergens as they seemed redundant in the schema

CREATE TABLE patallergens(
    allergy_id INT PRIMARY KEY UNIQUE NOT NULL,
    allergy_name VARCHAR(20) NOT NULL,
    description VARCHAR(100),
    patient_id CHAR(10) NOT NULL,
    FOREIGN KEY(patient_id) REFERENCES patient(patient_id)
);

DROP TABLE meds; 

CREATE TABLE meds(
    meds_id CHAR(10) PRIMARY KEY UNIQUE NOT NULL,
    meds_name VARCHAR(30),
    description VARCHAR(100),
    dosage VARCHAR(10)
);

DROP TABLE patmeds; 

CREATE TABLE patmeds(
    meds_id CHAR(10) NOT NULL,
    appoint_id CHAR(10) NOT NULL,
    patient_id CHAR(10) NOT NULL,
    FOREIGN KEY(meds_id) REFERENCES meds(meds_id),
    FOREIGN KEY(patient_id) REFERENCES patient(patient_id),
    FOREIGN KEY(appoint_id) REFERENCES appointment(appt_id)
);



INSERT INTO patient VALUE ("Malik", "Taylor");
SELECT * FROM patient
