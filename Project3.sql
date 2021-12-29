CREATE DATABASE Assignment3331;
USE Assignment3331;

create table school (
	school_ID int(20) primary key,
    school_name varchar(50) not null,
    school_street varchar(30) not null,
    school_city varchar(30) not null,
    school_zip char(5) not null,
    school_state char(2) not null,
    school_borough varchar(20) not null,
    school_disctrict varchar(20));
    
create table if not exists students(
	student_ID int(20) primary key,
    school_ID int(20) not null,
    student_first varchar(30) not null,
    student_last varchar(30) not null,
    student_street varchar(30) not null,
    student_city varchar(30) not null,
    student_zip char(5) not null,
    student_state char(2) not null,
    foreign key(school_ID) references school(school_ID));
    
        
create table guardian (
	guard_ID int(20) primary key,
    guard_first varchar(30) not null,
    guard_last varchar(30) not null,
    guard_phone char(10) not null,
    guard_email varchar(50) not null,
    student_ID int(20) not null,
    foreign key(student_ID) references students(student_ID));
        
create table staff (
	staff_ID int(20) primary key,
    staff_first varchar(30) not null,
    staff_last varchar(30) not null,
    staff_street varchar(30) not null,
    staff_city varchar(30) not null,
    staff_zip char(5) not null,
    staff_state char(2) not null,
    staff_title varchar(20) not null);

create table staff_school (
	school_ID int(20) not null,
    staff_ID int(20) not null,
    start_date date not null,
    end_date date,
    foreign key(school_ID) references school(school_ID),
    foreign key(staff_ID) references staff(staff_ID));
    
create table vaccine (
	staff_ID int(20),
    student_ID int(20),
    vaccine_status char(20),
    vaccine_name varchar(30),
    vaccine_brand varchar(30),
    first_dose date,
    second_dose date,
    foreign key(staff_ID) references staff(staff_ID),
    foreign key(student_ID) references students(student_ID));
    
create table consent (
	consent_num int(20) primary key,
    school_ID int(20) not null,
    student_ID int(20) not null,
	consent_status char(5) not null,
    enrollment_date date,
    revoked_date date,
    foreign key(school_ID) references school(school_ID),
    foreign key(student_ID) references students(student_ID));

create table staff_role (
staff_ID int(20) primary key not null,
staff_role varchar(30) not null,
is_active char(4),
foreign key(staff_ID) references staff(staff_ID));

insert into students (student_ID,school_ID,student_first,student_last,student_street,student_city,student_zip,student_state)
values (64553,31414,'Sally','Smith','654 Northern St','Jacknonville',65332,'FL'),
	(45313,43442,'Bo','Li','567 5th Ave','New York',11101,'NY'),
    (64742,42546,'Yan','Ju','54352 Forest BLVD','Charlotte',98424,'NC'),
	(76542,63463,'Juan','Perez','2324 Marine Ave','Akron','42321','OH'),
	(45235,634636,'Jessica','Perez','2423 Diversity BLVD','Cleaveland','45223','OH'),
	(99901,7458657,'Sujie','Yang','5654 5th Ave','New York','11101','NY'),
	(52435,655363,'Corinna','Mendez','7522 Second Ave','Elizabeth','11931','NJ'),
	(452323,63563,'Bri','Lin','2487Johns St','New York','12101','NY'),
    (13131,906976,'Helen','Young','3121 Harsh Ave','Rosevelt Ave','11212','NY'),
    (41431,364652, 'Henry'	,'Wang'	,'1414 Main Street'	,'Flushing'	,'11367'	,'NY');

insert into school(school_ID,school_name,school_street,school_city,school_zip,school_state,school_borough,school_disctrict)
values (31414,	'PS 120'	,'1414 Main Street'	,'Flushing'	,'11367'	,'NY'	,'Queens',	'New York'),
(43442,'IS 120',	'567 5th Ave',	'New York'	,'11101'	,'NY'	,'Manhattan'	,'New York'),
(42546	,'Queens High School'	,'654 Northern St'	,'Jacknonville'	,'65332'	,'FL'	,'Jacksonville'	,'Florida'),
(63463	,'PS 990'	,'54352 Forest BLVD'	,'Charlotte'	,98424	,'NC'	,'Charlotte'	,'North Carolina'),
(634636,'IS 1212',	'2324 Marine Ave',	'Akron',	'42321',	'OH',	'Akron',	'Ohio'),
(7458657,'John Elementary School'	,'3411 Northen BLVD',	'Elmhurst'	,'11354'	,'NY'	,'Queens'	,'New York'),
(655363,'PS 1543'	,'2423 Diversity BLVD'	,'Cleaveland'	,'45223'	,'OH'	,'Cleavs'	,'Ohio'),
(63563,'Yuan Xin High School','5654 5th Ave',	'New York'	,'11101'	,'NY'	,'Manhattan',	'New York'),
(906976,'IS 65',	'7522 Second Ave',	'Elizabeth',	'11931',	'NJ',	'Elizabeth',	'New Jersey'),
(364652,'PS 901',	'2487 Johns St',	'New York',	'12101',	'NY',	'Manhattan',	'New York');

insert into staff (staff_ID,staff_first,staff_last,staff_street,staff_city,staff_zip,staff_state,staff_title)
values( 6352431,'Smith',	'Sally',	'1414 Main Street',	'Flushing',	'11367',	'NY',	'Principle'),
(7456747,	'LI',	'Bo',	'567 5th Ave',	'New York',	'11101',	'NY',	'Janitor'),
(563563, 'Mam',	'Jason',	'654 Northern St',	'Jacknonville',	'65332',	'FL',	'Teacher'),
(36252363,'Best',	'Charlie',	'54352 Forest BLVD',	'Charlotte',	'98424',	'NC',	'Teacher'),
(734563754,'Young','Tony',	'2324 Marine Ave',	'Akron',	'42321',	'OH',	'Teacher'),
(354786,'Andy',	'Conor',	'3411 Northen BLVD',	'Elmhurst',	'11354',	'NY',	'Teacher'),
(8653645,'Don',	'Donald',	'2423 Diversity BLVD',	'Cleaveland',	'45223',	'OH', 'Assistant Principle'),
(534767,'Fernandez',	'Amanda',	'5654 5th Ave',	'New York',	'11101',	'NY',	'Staff'),
(78763,'Corda',	'Summer',	'7522 Second Ave',	'Elizabeth',	'11931',	'NJ',	'Staff'),
(8764532,'Suzie',	'Chalsea',	'2487 Johns St',	'New York',	'12101',	'NY',	'Teacher');

insert into guardian (guard_ID,guard_first,guard_last,guard_phone,guard_email,student_ID)
values (7847647,'Sally',	'Smith',	'231343143',	'abc@gmail.com',	'41431'),
(876453,	'Bo' ,'LI', '875643211',	'def@gmail.com',	'41431'),
(746532,'Jason'	,'Mam',	'876453211',	'fgi@gmail.com',	'64553'),
(87745564,'Charlie','Best',	'928765432',	'htu@yahoo.com',	'64742'),
(987653,'Tony',	'Young',	'986754322',	'zhy@aol.com',	'76542'),
(9867543,'Conor',	'Andy',	'986754321',	'yfsg@yahoo.com',	'64553'),
(7645342,	'Donald','Don',	'124565657',	'jfa@gmail.com',	'45235'),
(6345623,'Amanda','Fernandez',	'763572452',	'fhhd@yahoo.com',	'99901'),
(7376563,'Summer',	'Corda',	'676456322',	'sgsf@gmail.com',	'52435'),
(74642312,'Chalsea',	'Suzie',	'567335252',	'gdg@aol.com',	'41431');

insert into staff_school (school_ID,staff_ID,start_date,end_date)
values (31414,'6352431',	'2012/12/12',	Null),
(43442,'7456747',	'2008/5/19',	Null),
(31414,'563563',	'2019/5/19',	'2019/02/19'),
(63463,'36252363',	'8/5/19',	Null),
(634636,'734563754',	'2019/03/09',	'2019/04/19'),
(364652,'8653645',	'8/5/19',	Null),
(63563,'734563754',	'9/11/19',	Null),
(364652,'6352431',	'8/12/03',	Null);

insert into vaccine (staff_ID,student_ID,vaccine_status,vaccine_name,vaccine_brand,first_dose,second_dose)
values (6352431,Null,'Vaccinated',	'Covid-19',	'Moderna',	'2020/09/23','2020/10/23'),
(Null,'45313',	'Unvaccinated',	Null,	Null,	Null,Null)	,
(7456747,Null,'Vaccinated',	'Covid-19',	'jNJ', '2020/09/23','2020/10/23')	,
(563563,Null,'Vaccinated',	'Covid-19',	'Moderna', '2020/09/23','2020/10/23'),
(Null,'76542','Unvaccinated',	Null,	Null, Null,Null)		,
(36252363,Null,'Vaccinated',	'Covid-19',	'Moderna', '2020/09/23','2020/10/23')	,	
(Null,45235,'Vaccinated',	'Covid-19',	'JNJ', '2020/09/23','2020/10/23')	,
(734563754,Null,'Unvaccinated',	Null,Null,Null,Null)		,
(354786,Null,'Unvaccinated', Null,	Null,	Null,Null)	,
(8653645,452323,'Vaccinated',	'Covid-19',	'JNJ',	'2020/09/23','2020/10/23')	,
(534767,Null,'Vaccinated',	'Covid-19',	'JNJ',		'2020/09/23','2020/10/23'),
(Null,64553,'Vaccinated',	'Covid-19',	'Moderna',	'2020/09/23','2020/10/23')	,
(78763,Null,'Vaccinated',	'Covid-19',	'Moderna',	'2020/09/23','2020/10/23'),
(8764532,Null,'Vaccinated',	'Covid-19',	'Pfizer',	'2020/09/23','2020/10/23')	;

insert into consent ( consent_num,school_ID	,student_ID	,consent_status	,enrollment_date,revoked_date)
values (52452,31414,13131,'Yes', '2020/08/21', Null),
(24251,42546,41431,'Yes', '2020/08/21', '2021/09/29'),
(25425,43442,45235,'No','2021/12/13', Null),
(46626,63463,45313,'No', Null, Null),
(2673663,63563,52435,'Yes', '2020/08/24', Null),
(6773,364652,64553,'Yes' ,'2020/02/21', Null),
(62462,634636,64742,'Yes','2020/08/21', '2021/01/01' ),
(666,655363,76542,'No',Null, Null),
(26362,906976,99901,'Yes', '2020/08/04', Null),
(6626,7458657,452323,'Yes','2020/09/25', Null);

insert into staff_role(staff_ID, staff_role, is_active)
values(78763, 'Non-teaching', 'yes'),
(354786, 'Teaching', 'yes'),
(534767, 'Non-teaching', 'yes'),
(563563, 'Teaching', 'yes'),
(6352431, 'Teaching', 'yes'),
(7456747, 'Non-teaching', 'yes'),
(8653645, 'Teaching', 'yes'),
(8764532, 'Teaching', 'yes'),
(36252363, 'Teaching', 'yes'),
(734563754, 'Teaching','yes');

-- Question 1: Identify consent status of students enrolled on December 13th in IS 120. Display the student 
-- name and consent status. Order the output by student last name and first name.

select student_first as 'First Name', student_last as 'Last Name', consent_status as 'Consent Status'
from students, consent
where students.student_ID = consent.student_ID 
AND consent.student_ID in ( select student_ID
						from consent
                        where enrollment_date = '2021/12/13' AND
                        school_ID in (select school_ID
                        from school
                        where school_name = 'IS 120'))
order by student_first, student_last;

-- Question 2: Identify student consent status by schools in Queens. Display 5 columns: borough, school, 
-- total students enrolled in the school, number of students with consent and percent of students with 
-- consent. Display the school with the highest percent first.

select school_borough as 'Borough', school_name as 'Name',
count(student_ID) as 'Total students enrolled',
count(consent.student_ID) as 'Student that given consent',
concat(((count(student_ID))/(count(consent.student_ID))*100), '%') as 'percent of students given consent'
from school, consent
where school.school_borough = 'Queens' AND 
consent_status = 'yes' AND 
school.school_ID = consent.school_ID
group by school_name
order by ((count(student_ID))/(count(consent.student_ID))*100) desc;

-- Question 3: Identify Staff vaccine status by schools in 1 Zip codes. Display 5 columns: borough, school, 
-- total staff assigned to the school, number of staff who received the vaccine and percent of staff who 
-- received the vaccine. Display the school with the highest percent vaccine first.

select school_borough as 'Borough', school_name as 'Name',
count(case vaccine_status when 'Vaccinated' then 1 else null end) as 'Number of staff vaccinated',
count(staff_school.staff_ID) as 'Total Staff',
concat((count(case vaccine_status when 'Vaccinated' then 1 else null end)/ (count(vaccine_status) *1) *100), '%') as 'Percent of staff vaccinated'
From school
Join staff_school ON staff_school.school_ID = school.school_ID
join vaccine on vaccine.staff_ID = staff_school.staff_ID
where school_zip = '11367'
group by school_borough, school_name
order by 'Percent of staff vaccinated' desc;

-- Question 4: Identify Student Vaccine Status By School.Display 5 Columns:borough, school, total students 
-- assigned to the school, number of students who received the vaccine and percent of students who received 
-- the vaccine. Display the school with the highest percent vaccine first.

select school_borough as 'Borough', school_name as 'Name',
count(case vaccine_status when 'Vaccinated' then 1 else null end) as 'Number of students vaccinated',
count(students.student_ID) as 'Total students',
concat((count(case vaccine_status when 'Vaccinated' then 1 else null end)/(count(vaccine_status)*1) *100),'%') as 'percent of student vaccinated'
FROM school
join students ON students.school_ID = school.school_ID
join vaccine on vaccine.student_ID = students.student_ID
group by school_borough, school_name
order by 'percent of student vaccinated' desc;

-- Question 5: Identify students who have not returned the consent form from Queens High School to receive 
-- COVID-19 weekly testing. Display the school and student name. Order the output by school and student. 
-- Use a nested select to answer this question.

select school_name as 'School Name', student_first as 'First name', student_last as 'Last name'
from school, students
where school.school_ID = students.school_ID and 
school.school_ID in ( select school_ID 
					from school
                    where school_name = 'Queens High School' AND 
                    student_ID in (select student_ID
										from consent
                                        where consent_returned = 'No'))
group by school_name, student_first, student_last
order by school_name, student_first, student_last;
				
-- Question 6:  Identify students from Queens schools without an assigned guardian. Display the school and 
-- student name. Order the output by school and student. Use a nested select to answer this question.

select school_name as 'School', student_first as 'First name', student_last as 'Last Name'
FROM school, students 
where school.school_ID = students.school_ID AND 
school.school_ID in ( select school_ID
					from school
                    where school_borough = 'Queens' AND
                    students.student_ID not in ( select student_ID
											from guardian))
order by school_name, student_first, student_last;

-- Question 7: Identify Staff Who Have not Received a Vaccine. Display The Assigned school, staff name and 
-- address. Order the output of the school and staff name. Use a nested select to answer this question.

SELECT school_ID as 'School', staff_first as 'First Name', staff_last as 'Last Name', staff_street as 'Staff Address'
FROM staff_school, staff
where staff_school.staff_ID = staff.staff_ID AND
staff.staff_ID in ( select staff_ID 
					from vaccine 
                    where vaccine_status = 'Unvaccinated')
order by school_ID, staff_first, staff_last;
                    
-- Question 8: Identify students with more than 1 guardian. Display the student name and number of guardians. 
-- Only display the students with more than 1 guardian.

select student_first as 'First Name', student_last as 'Last Name',
count(guard_ID) as 'Number of Guardians'
from students, guardian
where students.student_ID = guardian.student_ID AND 
students.student_ID IN (select student_ID 
							from guardian 
                            GROUP BY guardian.student_ID
                            having count(*) > 1)
group by student_first, student_last;
                            
-- Question 9: Except for 1 Principal, all staff assigned to PS 120 received the COVID vaccine. Identify the 
-- SQL to implement.

select staff_first as 'First Name', staff_last as 'Last Name', staff_title as 'Title', vaccine_status as 'Vaccine status'
From staff, vaccine
where staff.staff_ID = vaccine.staff_ID AND 
vaccine.staff_ID in ( select staff_ID
							from vaccine 
                            where vaccine_status = 'Unvaccinated' AND 
                            staff_ID in ( select staff_ID 
												FROM staff
                                                where staff_title = 'Principle' AND 
                                                staff_ID in (select staff_ID 
																from school
																where school_name = 'PS 120')));
                                                                
-- Question 10: Janitor Li Bo was reassigned from IS 120 to PS 990. Identify the SQL to implement.

update staff_school
set end_date = '2021-12-13'
where staff_ID = '7456747' AND school_ID = '43442';
insert into staff_school (school_ID, staff_ID, start_date, end_date)
values(63463, 7456747, '2021-12-13', Null);

-- The update statement basically adds the end date for the staff Li Bo, because that is his last day at his 
-- previous school. And we need to add a new column because Li Bo is starting his career at a different 
-- school. Which is the job of the insert statement.

-- Question 11: Student Helen Young is no longer a student at any school in the NYC Department of Education. 
-- Identify the SQL to implement.

-- For this question I believe the best thing to do would be to change Helen Young’s active status. Because 
-- she is longer a student in NYC DOE, we can change her active status from yes to no. We can also completely
-- erase her information from the database, but that won’t be wise, because if she comes back to NYC, and 
-- we try to access his information, we won’t be able access it anymore, because we erased her information.
-- That’s why I will just change her active status instead. 

update students
set is_active = 'No'
where student_ID = '13131';

-- Question 12: Identify the number of active students currently enrolled at all schools. Display the number.

SELECT count(student_ID) as 'Number of active students'
from students
where is_active = 'yes';

-- Question 13: Identify the number of active non-teaching administrative staff assigned to schools. 
-- Display the number.

select count(staff_ID) as 'Number of Active Administrative Staff'
from staff_role
where staff_role.staff_ID in ( select staff_ID from 
                    staff_role
                    where staff_role = 'Non-teaching' AND
                    is_active = 'yes');
