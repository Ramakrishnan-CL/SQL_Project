-- 1.	Display the names and ages of patients older than 60 years
select Name, Age from healthcare_dataset where Age > 60;

-- 2.	Find the average billing amount for each admission type
select Admission_Type, avg(Billing_Amount) as AvgBillingAmt from healthcare_dataset
group by Admission_Type order by AvgBillingAmt desc;

-- 3.	Display the details of patients discharged on a particular date, say 05-08-2022
select * from healthcare_dataset where Discharge_Date = "2022-08-05";

-- 4.	Display the name and age of the oldest patient 
select Name, Age from healthcare_dataset order by Age desc limit 1;

-- 5.	Retrieve the total billing amount for each medical condition

-- 6.	Display the highest billing amount.
select max(Billing_Amount) from healthcare_dataset;

-- 7.	Find the number of patients for each medical condition
select Medical_Condition, count(*) as PatientsCount from healthcare_dataset 
group by Medical_Condition 
order by PatientsCount desc;

-- 8.	Display the details of patients in room number 334 with blood type O+
select * from healthcare_dataset where Room_Number = "334" and Blood_Type = "O+";

-- 9.	Display the top 5 hospitals with highest total billing amount.
select Hospital, sum(Billing_Amount) as TotalBillingAmt from healthcare_dataset 
group by Hospital
order by TotalBillingAmt desc limit 5;

-- 10.	Find patients with duplicate names
select Name, count(*) as DuplicateCount from healthcare_dataset 
group by Name having count(*) > 1;

-- 11.	Find Patients who stayed in hospitals longer than average.
select * from healthcare_dataset
where datediff(Discharge_Date, Date_of_Admission) >
(select avg(datediff(Discharge_Date, Date_of_Admission)) from healthcare_dataset);

-- 12.	Analyse medication usage based on gender.
select Medication, Gender, count(*) as Count from healthcare_dataset 
group by Gender, Medication
order by Count desc;

-- 13.	Find the most common medical condition among patients below 30 years old.
select Medical_Condition, count(*) as Count from healthcare_dataset
where age < 30
group by Medical_Condition
order by Count desc
limit 1;

-- 14.	Find the doctor with most number of patients.
select Doctor, count(*) PatientCount from healthcare_dataset
group by Doctor
order by PatientCount desc
limit 1;

-- 15.	Identify patients with same blood type and medical condition.
select Blood_Type, Medical_Condition, count(*) as PatientCount from healthcare_dataset
group by Blood_Type, Medical_Condition
order by PatientCount desc;
