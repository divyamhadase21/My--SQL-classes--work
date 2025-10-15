-- Create database Hospital
CREATE DATABASE Hospital;

-- use Hospital
 USE Hospital;

CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Gender VARCHAR(10),
    DateOfBirth DATE,
    ContactNumber VARCHAR(15),
    Address VARCHAR(200)
);

INSERT INTO Patients VALUES
(1, 'Aarav Mehta', 'Male', '1990-03-15', '9876543210', 'Mumbai'),
(2, 'Riya Sharma', 'Female', '1985-08-22', '8765432109', 'Delhi'),
(3, 'Karan Patel', 'Male', '1992-06-12', '7654321098', 'Ahmedabad'),
(4, 'Neha Verma', 'Female', '1988-12-05', '6543210987', 'Pune'),
(5, 'Rahul Sen', 'Male', '1979-01-30', '5432109876', 'Bangalore'),
(6, 'Simran Kaur', 'Female', '1995-10-19', '4321098765', 'Chandigarh'),
(7, 'Kabir Das', 'Male', '2000-02-25', '3210987654', 'Lucknow'),
(8, 'Pooja Nair', 'Female', '1983-09-14', '2109876543', 'Kochi'),
(9, 'Anil Rathi', 'Male', '1975-07-08', '1098765432', 'Jaipur'),
(10, 'Sanya Gupta', 'Female', '1998-11-03', '9988776655', 'Hyderabad');

-- Select all patients
SELECT * FROM Patients;


CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Specialty VARCHAR(50),
    ContactNumber VARCHAR(15),
    Department VARCHAR(50)
);

INSERT INTO Doctors VALUES
(1, 'Dr. Arjun Reddy', 'Cardiology', '9812345670', 'Cardiology'),
(2, 'Dr. Kavita Jain', 'Dermatology', '9823456781', 'Dermatology'),
(3, 'Dr. Sameer Khan', 'Orthopedics', '9834567892', 'Orthopedics'),
(4, 'Dr. Meera Das', 'Gynecology', '9845678903', 'Gynecology'),
(5, 'Dr. Vikram Singh', 'Neurology', '9856789014', 'Neurology'),
(6, 'Dr. Ananya Roy', 'ENT', '9867890125', 'ENT'),
(7, 'Dr. Raj Malhotra', 'Pediatrics', '9878901236', 'Pediatrics'),
(8, 'Dr. Isha Sharma', 'Ophthalmology', '9889012347', 'Ophthalmology'),
(9, 'Dr. Rohan Das', 'Psychiatry', '9890123458', 'Psychiatry'),
(10, 'Dr. Tara Joshi', 'Oncology', '9901234569', 'Oncology');

-- Select all doctors
SELECT * FROM Doctors;


CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    Purpose VARCHAR(100),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

INSERT INTO Appointments VALUES
(1, 1, 1, '2025-07-01', 'Heart Checkup'),
(2, 2, 2, '2025-07-02', 'Skin Allergy'),
(3, 3, 3, '2025-07-03', 'Knee Pain'),
(4, 4, 4, '2025-07-04', 'Routine Check'),
(5, 5, 5, '2025-07-05', 'Headache'),
(6, 6, 6, '2025-07-06', 'Ear Pain'),
(7, 7, 7, '2025-07-07', 'Child Fever'),
(8, 8, 8, '2025-07-08', 'Eye Irritation'),
(9, 9, 9, '2025-07-09', 'Stress Issues'),
(10, 10, 10, '2025-07-10', 'Cancer Screening');

-- Select all appointments
SELECT * FROM Appointments;


CREATE TABLE Medications (
    MedicationID INT PRIMARY KEY,
    PatientID INT,
    MedicineName VARCHAR(100),
    Dosage VARCHAR(50),
    Duration VARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

INSERT INTO Medications VALUES
(1, 1, 'Atorvastatin', '10mg', '30 days'),
(2, 2, 'Cetirizine', '5mg', '7 days'),
(3, 3, 'Diclofenac', '50mg', '10 days'),
(4, 4, 'Paracetamol', '500mg', '5 days'),
(5, 5, 'Aspirin', '75mg', '15 days'),
(6, 6, 'Amoxicillin', '250mg', '7 days'),
(7, 7, 'Ibuprofen', '200mg', '3 days'),
(8, 8, 'Lubricant Eye Drops', '2 drops', '10 days'),
(9, 9, 'Sertraline', '50mg', '60 days'),
(10, 10, 'Letrozole', '2.5mg', '90 days');


-- Select all medications
SELECT * FROM Medications;


CREATE TABLE Bills (
    BillID INT PRIMARY KEY,
    PatientID INT,
    BillDate DATE,
    Amount DECIMAL(10,2),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

INSERT INTO Bills VALUES
(1, 1, '2025-07-01', 1500.00, 'Cash'),
(2, 2, '2025-07-02', 800.00, 'Credit Card'),
(3, 3, '2025-07-03', 1200.00, 'UPI'),
(4, 4, '2025-07-04', 600.00, 'Cash'),
(5, 5, '2025-07-05', 950.00, 'Debit Card'),
(6, 6, '2025-07-06', 1100.00, 'Net Banking'),
(7, 7, '2025-07-07', 700.00, 'Cash'),
(8, 8, '2025-07-08', 1300.00, 'UPI'),
(9, 9, '2025-07-09', 500.00, 'Credit Card'),
(10, 10, '2025-07-10', 2000.00, 'Cash');

-- Select all bills
SELECT * FROM Bills;
