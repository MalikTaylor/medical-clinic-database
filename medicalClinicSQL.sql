USE medicalclinic;

-- DROP TABLE clinic_employee;
-- DROP TABLE admin_employee;
-- DROP TABLE receptionist;
-- DROP TABLE patient;
-- DROP TABLE department;
-- DROP TABLE nurse;
-- DROP TABLE med_staff;
-- DROP TABLE specialty;
-- DROP TABLE doctor;
-- DROP TABLE office;
-- DROP TABLE room;
-- DROP TABLE appointment;
-- DROP TABLE InsuranceComp;
-- DROP TABLE emergency;
-- DROP TABLE meds; 
-- DROP TABLE patmeds; 


-- INSERT INTO patient VALUE ("Malik", "Taylor");
-- SELECT * FROM patient;

-- INSERT INTO clinic_employee VALUE (10000, "Malik", "Taylor", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


CREATE TABLE clinic_employee(
    employee_id VARCHAR(10) PRIMARY KEY UNIQUE,
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

CREATE TABLE admin_employee(
    employee_id VARCHAR(10) NOT NULL,
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
    FOREIGN KEY (employee_id) REFERENCES clinic_employee(employee_id) -- Not sure these last two lines are right but can be fixed later - XG
);


CREATE TABLE receptionist(
    employee_id VARCHAR(10) NOT NULL,
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



CREATE TABLE patient(
	patient_id CHAR(10) NOT NULL,
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
    zipcode VARCHAR(10),
    PRIMARY KEY(patient_id)
);

CREATE TABLE department(
    department_id VARCHAR(10) PRIMARY KEY UNIQUE,
    department_name VARCHAR(30) NOT NULL,
    employee_id CHAR(10) NOT NULL,
    staff_count INT,
    office_id CHAR(10) NOT NULL,
    FOREIGN KEY(employee_id) REFERENCES clinic_employee(employee_id),
    FOREIGN KEY(office_id) REFERENCES office(office_id)
);

CREATE TABLE nurse(
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
    FOREIGN KEY(employee_id) REFERENCES clinic_employee(employee_id)
);

CREATE TABLE med_staff(
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
    FOREIGN KEY(employee_id) REFERENCES clinic_employee(employee_id)
);

CREATE TABLE specialty(
	specialty_id SMALLINT NOT NULL PRIMARY KEY,
	specialty_name VARCHAR(20) NOT NULL
);

CREATE TABLE doctor(
    employee_id VARCHAR(10) NOT NULL, 
    f_name VARCHAR(20) NOT NULL,
    l_name VARCHAR(20) NOT NULL,
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
    specialty_id SMALLINT NOT NULL,
    PRIMARY KEY (employee_id),
    FOREIGN KEY (employee_id) REFERENCES clinic_employee(employee_id),
    FOREIGN KEY (specialty_id) REFERENCES specialty(specialty_id)     
);

CREATE TABLE office(
	office_id CHAR(10) NOT NULL,
	office_name VARCHAR(50),
	address VARCHAR(50),
	office_phone CHAR(11),
	PRIMARY KEY(office_id)
);


CREATE TABLE room(
	room_num SMALLINT,
	unavaliable BOOLEAN,
    PRIMARY KEY(room_num)
);

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
    FOREIGN KEY(room_num) REFERENCES room(room_num)
);


CREATE TABLE InsuranceComp(
    company_id INT PRIMARY KEY UNIQUE,
    name VARCHAR(50),
    phone_num VARCHAR(15)
);

CREATE TABLE emergency(
    patient_id CHAR(10) NOT NULL,
    relation VARCHAR(20),
    phonenumb1 VARCHAR(15),
    phonenumb2 VARCHAR(15),
    FOREIGN KEY(patient_id) REFERENCES patient(patient_id)
);

-- Note: We nee to seperate these two, as patient allergens and allergens are not to be combined. We need to have a database of all the allergens there are and then use the table patient allergens to keep track of what patients 
-- have that allergy. In the scenario that there has been a new allergen that has been added or discovered this table would not work. We can't add the allergy without there being a patient in our specific hospital with it. This
-- is not right. Think of this like our meds and patmeds. Hope this makes sense :) 

CREATE TABLE allergens(
    allergy_id INT PRIMARY KEY UNIQUE NOT NULL,
    allergy_name VARCHAR(20) NOT NULL,
    description VARCHAR(100),
);

CREATE TABLE patallergens(
    allergy_id CHAR(10) NOT NULL,
    patient_id CHAR(10) NOT NULL,
    FOREIGN KEY(allergy_id) REFERENCES allergens(allergy_id),
    FOREIGN KEY(patient_id) REFERENCES patient(patient_id)
);

CREATE TABLE meds(
    meds_id CHAR(10) PRIMARY KEY UNIQUE NOT NULL,
    meds_name VARCHAR(30),
    description VARCHAR(100),
    dosage VARCHAR(10)
);

CREATE TABLE patmeds(
    meds_id CHAR(10) NOT NULL,
    appoint_id CHAR(10) NOT NULL,
    patient_id CHAR(10) NOT NULL,
    FOREIGN KEY(meds_id) REFERENCES meds(meds_id),
    FOREIGN KEY(patient_id) REFERENCES patient(patient_id),
    FOREIGN KEY(appoint_id) REFERENCES appointment(appt_id)
);


CREATE TRIGGER ALLERGY_VIOLATION
BEFORE INSERT OR UPDATE OF meds_id, patient_id ON patmeds

FOR EACH ROW
WHEN (NEW.meds_id == (SELECT allergy_id FROM patallergens WHERE NEW.patient_id == patient_id))
INFORM_DOCTOR(patient_id, allergy_id) 
