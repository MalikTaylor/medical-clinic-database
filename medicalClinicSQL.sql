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
    employee_id VARCHAR(10) PRIMARY KEY,
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
    FOREIGN KEY (employee_id) REFERENCES clinic_employee(employee_id) ON UPDATE CASCADE ON DELETE CASCADE -- Not sure these last two lines are right but can be fixed later - XG
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
    FOREIGN KEY (employee_id) REFERENCES admin_employee(employee_id) ON UPDATE CASCADE ON DELETE CASCADE -- Not sure these last two lines are right but can be fixed later - XG
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
    department_id VARCHAR(10) PRIMARY KEY,
    department_name VARCHAR(30) NOT NULL,
    employee_id CHAR(10) NOT NULL,
    staff_count INT,
    office_id CHAR(10) NOT NULL,
    FOREIGN KEY(employee_id) REFERENCES clinic_employee(employee_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(office_id) REFERENCES office(office_id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE nurse(
    employee_id VARCHAR(10) NOT NULL,
    f_name VARCHAR(20) NOT NULL,
    l_name VARCHAR(20) NOT NULL,
    birth_date DATE,
    sex VARCHAR(10),
    phone_number VARCHAR(15),
    position VARCHAR(20),
    hired DATE NOT NULL,
    department_id VARCHAR(10),
    PRIMARY KEY(employee_id),
    FOREIGN KEY(employee_id) REFERENCES clinic_employee(employee_id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE med_staff(
    employee_id CHAR(10) NOT NULL,
    f_name VARCHAR(20) NOT NULL,
    l_name VARCHAR(20) NOT NULL,
    birth_date DATE,
    sex VARCHAR(10),
    phone_number VARCHAR(15),
    position VARCHAR(20),
    hired DATE NOT NULL,
    department_id VARCHAR(10),
    PRIMARY KEY(employee_id),
    FOREIGN KEY(employee_id) REFERENCES clinic_employee(employee_id) ON UPDATE CASCADE ON DELETE CASCADE
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
    hired DATE NOT NULL,
    PRIMARY KEY (employee_id),
    FOREIGN KEY (employee_id) REFERENCES clinic_employee(employee_id)  ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE specialty(
	specialty_id SMALLINT NOT NULL PRIMARY KEY,
	specialty_name VARCHAR(20) NOT NULL
);

CREATE TABLE doctor_specialty(
	specialty_id SMALLINT NOT NULL,
	employee_id VARCHAR(10) NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES doctor(employee_id),
	FOREIGN KEY (specialty_id) REFERENCES specialty(specialty_id)  ON UPDATE CASCADE ON DELETE CASCADE
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
	unavailable BOOLEAN,
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
    FOREIGN KEY(patient_id) REFERENCES patient(patient_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(nurse_id) REFERENCES clinic_employee(employee_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(doctor_id) REFERENCES clinic_employee(employee_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(office_id) REFERENCES office(office_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(room_num) REFERENCES room(room_num) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE InsuranceComp(
    company_id INT PRIMARY KEY,
    name VARCHAR(50),
    phone_num VARCHAR(15)
);

 CREATE TABLE pat_insurance(
	patient_id CHAR(10) NOT NULL,
    company_id INT,
    insurance_name VARCHAR(50),
    PRIMARY KEY(patient_id),
    FOREIGN KEY(patient_id) REFERENCES patient(patient_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(company_id) REFERENCES insurancecomp(company_id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE emergency(
    patient_id CHAR(10) NOT NULL,
    relation VARCHAR(20),
    phonenumb1 VARCHAR(15),
    phonenumb2 VARCHAR(15),
    FOREIGN KEY(patient_id) REFERENCES patient(patient_id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Note: We nee to seperate these two, as patient allergens and allergens are not to be combined. We need to have a database of all the allergens there are and then use the table patient allergens to keep track of what patients 
-- have that allergy. In the scenario that there has been a new allergen that has been added or discovered this table would not work. We can't add the allergy without there being a patient in our specific hospital with it. This
-- is not right. Think of this like our meds and patmeds. Hope this makes sense :) 

CREATE TABLE allergens(
    allergy_id INT PRIMARY KEY NOT NULL,
    allergy_name VARCHAR(20) NOT NULL,
    description VARCHAR(100)
);

CREATE TABLE patallergens(
    allergy_id INT NOT NULL,
    patient_id CHAR(10) NOT NULL,
    FOREIGN KEY(allergy_id) REFERENCES allergens(allergy_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(patient_id) REFERENCES patient(patient_id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE meds(
    meds_id CHAR(10) PRIMARY KEY NOT NULL,
    meds_name VARCHAR(30),
    description VARCHAR(100),
    dosage VARCHAR(10)
);

CREATE TABLE patmeds(
    meds_id CHAR(10) NOT NULL,
    appoint_id CHAR(10) NOT NULL,
    patient_id CHAR(10) NOT NULL,
    FOREIGN KEY(meds_id) REFERENCES meds(meds_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(patient_id) REFERENCES patient(patient_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(appoint_id) REFERENCES appointment(appt_id) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE approval(
	specialty_id SMALLINT NOT NULL,
	patient_id CHAR(10) NOT NULL,
	FOREIGN KEY(specialty_id) REFERENCES specialty(specialty_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(patient_id) REFERENCES patient(patient_id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE work_schedule(
	shift_number SMALLINT AUTO_INCREMENT,
	clinic_id VARCHAR(10),
	workdate DATE,
    employee_id VARCHAR(10) NOT NULL,
    start_time TIME,
    end_time TIME,
    PRIMARY KEY(shift_number),
    FOREIGN KEY(employee_id) REFERENCES clinic_employee(employee_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(clinic_id) REFERENCES office(office_id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TRIGGER before_appointment
BEFORE INSERT ON appointment


DELIMITER //

CREATE TRIGGER need_approve
BEFORE INSERT ON appointment

	FOR EACH ROW
		IF (SELECT COUNT(*) FROM approval WHERE patient_id = NEW.patient_id) = 0 and (SELECT COUNT(*) FROM doctor_specialty WHERE employee_id = NEW.doctor_id) <> 0 then
            SET NEW.start = NULL;
            SET NEW.end = NULL;
		ELSEIF (SELECT COUNT(*) FROM approval as a inner join doctor_specialty as d ON a.specialty_id = d.specialty_id WHERE patient_id = NEW.patient_id and d.employee_id = NEW.doctor_id) = 0  and (SELECT COUNT(*) FROM doctor_specialty WHERE employee_id = NEW.doctor_id) <> 0 THEN
            SET NEW.start = NULL;
            SET NEW.end = NULL;
		END IF;   //
				       
DELIMITER ;
				       
DELIMITER //
		       
CREATE TRIGGER room_busy
BEFORE INSERT ON appointment

	FOR EACH ROW
		IF (SELECT COUNT(*) FROM appointment as a WHERE NEW.start > a.start and NEW.start < a.end and a.room_num = NEW.room_num) <> 0 then
            SET NEW.room_num = NULL;

		ELSEIF  (SELECT COUNT(*) FROM appointment as a WHERE NEW.end < a.end and NEW.end > a.start and a.room_num = NEW.room_num) <> 0 then
            SET NEW.room_num = NULL;

		END IF;   //
				       
DELIMITER ;
