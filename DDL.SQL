create table employee(
    EMP_ID INT,
    EMP_CODE VARCHAR(10),
    FIRST_NAME VARCHAR(32),
    LAST_NAME VARCHAR(32),
    GENDER VARCHAR(1)
);

create table department(
     DEPT_ID int,
    DEPT_CODE varchar(10),
    DEPT_NAME varchar(32)

);

create table emp_login(
    EMP_ID int,
    USERNAME varchar(32),
    PASSWORD varchar(32)

);

create table roles (
       EMP_ID int,
       role varchar(32)
); 

create table emp_dept(
    EMP_DEPT_ID int,
    EMP_CODE varchar(32),
    DEPT_CODE varchar(32)

);

create table claims(
    CLAIM_ID int,
    CLAIM_CODE varchar(10),
    CLAIM_CATEGORY_CODE varchar(10),
    CLAIM_AMOUNT int,
    CLAIM_TITLE varchar(32),
    CLAIM_DESC varchar(32),
    CLAIM_SUB_DATE date,
    CLAIM_APR_DATE date,
    CLAIM_STATUS varchar(10)

);

create table payment(
    PAYMENT_ID int,
    PAYMENT_CODE varchar(10),
    TRANSACTION_ID int,
    PAYMENT_DATE date,
    PAYMENT_AMOUNT int,
    PAYMENT_METHOD varchar(32),
    CLAIM_CODE varchar(10)

);

create table eligibilty(
    EMP_CODE varchar(10),
    ELG_CODE varchar(10),
    CLAIM_CATEGORY_CODE varchar(10),
    MAX_AMOUNT int


);

INSERT INTO employee (EMP_ID, EMP_CODE, FIRST_NAME, LAST_NAME, GENDER) VALUES
(1, 'EMP001', 'Alice', 'Smith', 'F'),
(2, 'EMP002', 'Bob', 'Johnson', 'M'),
(3, 'EMP003', 'Charlie', 'Brown', 'M'),
(4, 'EMP004', 'Diana', 'Prince', 'F'),
(5, 'EMP005', 'Evan', 'Wright', 'M'),
(6, 'EMP006', 'Fiona', 'Gallagher', 'F'),
(7, 'EMP007', 'George', 'Clark', 'M'),
(8, 'EMP008', 'Hannah', 'Abbott', 'F'),
(9, 'EMP009', 'Ian', 'Malcolm', 'M'),
(10, 'EMP010', 'Julia', 'Roberts', 'F'),
(11, 'EMP011', 'Kevin', 'Malone', 'M'),
(12, 'EMP012', 'Laura', 'Croft', 'F'),
(13, 'EMP013', 'Michael', 'Scott', 'M'),
(14, 'EMP014', 'Pam', 'Beesly', 'F'),
(15, 'EMP015', 'Jim', 'Halpert', 'M'),
(16, 'EMP016', 'Dwight', 'Schrute', 'M'),
(17, 'EMP017', 'Angela', 'Martin', 'F'),
(18, 'EMP018', 'Stanley', 'Hudson', 'M'),
(19, 'EMP019', 'Phyllis', 'Vance', 'F'),
(20, 'EMP020', 'Ryan', 'Howard', 'M'),
(21, 'EMP021', 'Kelly', 'Kapoor', 'F'),
(22, 'EMP022', 'Toby', 'Flenderson', 'M'),
(23, 'EMP023', 'Creed', 'Bratton', 'M'),
(24, 'EMP024', 'Oscar', 'Martinez', 'M'),
(25, 'EMP025', 'Meredith', 'Palmer', 'F'),
(26, 'EMP026', 'Andy', 'Bernard', 'M'),
(27, 'EMP027', 'Darryl', 'Philbin', 'M'),
(28, 'EMP028', 'Erin', 'Hannon', 'F'),
(29, 'EMP029', 'Jan', 'Levinson', 'F'),
(30, 'EMP030', 'Roy', 'Anderson', 'M'),
(31, 'EMP031', 'David', 'Wallace', 'M'),
(32, 'EMP032', 'Holly', 'Flax', 'F'),
(33, 'EMP033', 'Charles', 'Miner', 'M'),
(34, 'EMP034', 'Nellie', 'Bertram', 'F'),
(35, 'EMP035', 'Robert', 'California', 'M'),
(36, 'EMP036', 'Clark', 'Green', 'M'),
(37, 'EMP037', 'Pete', 'Miller', 'M'),
(38, 'EMP038', 'Jo', 'Bennett', 'F'),
(39, 'EMP039', 'Deangelo', 'Vickers', 'M'),
(40, 'EMP040', 'Gabe', 'Lewis', 'M'),
(41, 'EMP041', 'Val', 'Johnson', 'F'),
(42, 'EMP042', 'Cathy', 'Simms', 'F'),
(43, 'EMP043', 'Brian', 'Gartner', 'M'),
(44, 'EMP044', 'Nate', 'Nickerson', 'M'),
(45, 'EMP045', 'Astrid', 'Levinson', 'F'),
(46, 'EMP046', 'Vikram', 'Patel', 'M'),
(47, 'EMP047', ' Helene', 'Beesly', 'F'),
(48, 'EMP048', 'Mose', 'Schrute', 'M'),
(49, 'EMP049', 'Esther', 'Bruegger', 'F'),
(50, 'EMP050', 'Roland', 'Schrute', 'M');


INSERT INTO department (DEPT_ID, DEPT_CODE, DEPT_NAME) VALUES
(1, 'DEPT_IT', 'Information Technology'),
(2, 'DEPT_HR', 'Human Resources'),
(3, 'DEPT_FIN', 'Finance'),
(4, 'DEPT_MKT', 'Marketing'),
(5, 'DEPT_OPS', 'Operations');

INSERT INTO claims (CLAIM_ID, CLAIM_CODE, CLAIM_CATEGORY_CODE, CLAIM_AMOUNT, CLAIM_TITLE, CLAIM_DESC, CLAIM_SUB_DATE, CLAIM_APR_DATE, CLAIM_STATUS) VALUES
(1, 'CLM001', 'MOBILE', 45, 'Mobile Bill Jan', 'Postpaid mobile plan', '2026-01-05', '2026-01-07', 'Approved'),
(2, 'CLM002', 'MEAL', 25, 'Team Lunch', 'Client meeting lunch', '2026-01-06', '2026-01-08', 'Approved'),
(3, 'CLM003', 'BROADBAND', 80, 'Home Internet Jan', 'Monthly broadband fee', '2026-01-08', NULL, 'Pending'),
(4, 'CLM004', 'MOBILE', 50, 'Mobile Bill Jan', 'Postpaid mobile plan', '2026-01-10', '2026-01-11', 'Approved'),
(5, 'CLM005', 'MEAL', 35, 'Overtime Dinner', 'Late night work meal', '2026-01-12', '2026-01-13', 'Approved'),
(6, 'CLM006', 'BROADBAND', 75, 'Home Internet Jan', 'Monthly broadband fee', '2026-01-14', '2026-01-15', 'Approved'),
(7, 'CLM007', 'MOBILE', 60, 'Mobile Bill Jan', 'Postpaid mobile plan', '2026-01-15', '2026-01-16', 'Approved'),
(8, 'CLM008', 'MEAL', 20, 'Working Lunch', 'Internal team meal', '2026-01-16', '2026-01-18', 'Approved'),
(9, 'CLM009', 'BROADBAND', 90, 'Home Internet Jan', 'Monthly broadband fee', '2026-01-18', '2026-01-20', 'Approved'),
(10, 'CLM010', 'MOBILE', 40, 'Mobile Bill Jan', 'Postpaid mobile plan', '2026-01-20', '2026-01-21', 'Approved'),
(11, 'CLM011', 'MEAL', 45, 'Client Dinner', 'Business development', '2026-01-21', NULL, 'Pending'),
(12, 'CLM012', 'BROADBAND', 70, 'Home Internet Jan', 'Monthly broadband fee', '2026-01-22', '2026-01-24', 'Approved'),
(13, 'CLM013', 'MOBILE', 55, 'Mobile Bill Feb', 'Postpaid mobile plan', '2026-02-01', '2026-02-03', 'Approved'),
(14, 'CLM014', 'MEAL', 30, 'Team Lunch', 'Monthly wrap-up', '2026-02-02', '2026-02-04', 'Approved'),
(15, 'CLM015', 'BROADBAND', 95, 'Home Internet Feb', 'Monthly broadband fee', '2026-02-04', '2026-02-06', 'Approved'),
(16, 'CLM016', 'MOBILE', 48, 'Mobile Bill Feb', 'Postpaid mobile plan', '2026-02-05', '2026-02-07', 'Approved'),
(17, 'CLM017', 'MEAL', 32, 'Working Dinner', 'Project deadline meal', '2026-02-08', '2026-02-10', 'Approved'),
(18, 'CLM018', 'BROADBAND', 85, 'Home Internet Feb', 'Monthly broadband fee', '2026-02-10', '2026-02-12', 'Approved'),
(19, 'CLM019', 'MOBILE', 62, 'Mobile Bill Feb', 'Postpaid mobile plan', '2026-02-12', '2026-02-14', 'Approved'),
(20, 'CLM020', 'MEAL', 22, 'Quick Lunch', 'Field visit meal', '2026-02-15', '2026-02-16', 'Approved'),
(21, 'CLM021', 'BROADBAND', 78, 'Home Internet Feb', 'Monthly broadband fee', '2026-02-16', NULL, 'Pending'),
(22, 'CLM022', 'MOBILE', 41, 'Mobile Bill Feb', 'Postpaid mobile plan', '2026-02-18', '2026-02-19', 'Approved'),
(23, 'CLM023', 'MEAL', 38, 'Client Lunch', 'Vendor sync', '2026-02-20', '2026-02-22', 'Approved'),
(24, 'CLM024', 'BROADBAND', 69, 'Home Internet Feb', 'Monthly broadband fee', '2026-02-22', '2026-02-24', 'Approved'),
(25, 'CLM025', 'MOBILE', 52, 'Mobile Bill Mar', 'Postpaid mobile plan', '2026-03-01', '2026-03-03', 'Approved'),
(26, 'CLM026', 'MEAL', 19, 'Office Lunch', 'Working through lunch', '2026-03-02', '2026-03-04', 'Approved'),
(27, 'CLM027', 'BROADBAND', 90, 'Home Internet Mar', 'Monthly broadband fee', '2026-03-04', '2026-03-06', 'Approved'),
(28, 'CLM028', 'MOBILE', 47, 'Mobile Bill Mar', 'Postpaid mobile plan', '2026-03-06', '2026-03-08', 'Rejected'),
(29, 'CLM029', 'MEAL', 28, 'Dinner Meeting', 'Strategy session', '2026-03-08', '2026-03-10', 'Approved'),
(30, 'CLM030', 'BROADBAND', 77, 'Home Internet Mar', 'Monthly broadband fee', '2026-03-10', '2026-03-12', 'Approved'),
(31, 'CLM031', 'MOBILE', 51, 'Mobile Bill Mar', 'Postpaid mobile plan', '2026-03-12', '2026-03-14', 'Approved'),
(32, 'CLM032', 'MEAL', 33, 'Team Lunch', 'Quarterly kick-off', '2026-03-14', '2026-03-16', 'Pending'),
(33, 'CLM033', 'BROADBAND', 85, 'Home Internet Mar', 'Monthly broadband fee', '2026-03-15', '2026-03-18', 'Approved'),
(34, 'CLM034', 'MOBILE', 44, 'Mobile Bill Mar', 'Postpaid mobile plan', '2026-03-16', '2026-03-18', 'Approved'),
(35, 'CLM035', 'MEAL', 27, 'Working Dinner', 'Late shift', '2026-03-18', '2026-03-20', 'Approved'),
(36, 'CLM036', 'BROADBAND', 73, 'Home Internet Mar', 'Monthly broadband fee', '2026-03-20', '2026-03-22', 'Approved'),
(37, 'CLM037', 'MOBILE', 58, 'Mobile Bill Mar', 'Postpaid mobile plan', '2026-03-21', '2026-03-23', 'Approved'),
(38, 'CLM038', 'MEAL', 39, 'Client Lunch', 'Partnership review', '2026-03-22', '2026-03-24', 'Approved'),
(39, 'CLM039', 'BROADBAND', 99, 'Home Internet Mar', 'Monthly broadband fee', '2026-03-24', NULL, 'Pending'),
(40, 'CLM040', 'MOBILE', 46, 'Mobile Bill Mar', 'Postpaid mobile plan', '2026-03-25', '2026-03-27', 'Approved'),
(41, 'CLM041', 'MEAL', 25, 'Team Lunch', 'Weekly sync', '2026-03-26', '2026-03-28', 'Approved'),
(42, 'CLM042', 'BROADBAND', 64, 'Home Internet Mar', 'Monthly broadband fee', '2026-03-27', '2026-03-29', 'Approved'),
(43, 'CLM043', 'MOBILE', 53, 'Mobile Bill Mar', 'Postpaid mobile plan', '2026-03-28', '2026-03-30', 'Rejected'),
(44, 'CLM044', 'MEAL', 30, 'Dinner', 'Client entertainment', '2026-03-29', '2026-03-31', 'Approved'),
(45, 'CLM045', 'BROADBAND', 88, 'Home Internet Mar', 'Monthly broadband fee', '2026-03-30', '2026-03-31', 'Approved'),
(46, 'CLM046', 'MOBILE', 49, 'Mobile Bill Mar', 'Postpaid mobile plan', '2026-03-31', '2026-04-02', 'Approved'),
(47, 'CLM047', 'MEAL', 21, 'Lunch', 'Individual field meal', '2026-03-31', '2026-04-02', 'Approved'),
(48, 'CLM048', 'BROADBAND', 79, 'Home Internet Mar', 'Monthly broadband fee', '2026-03-31', '2026-04-02', 'Approved'),
(49, 'CLM049', 'MOBILE', 41, 'Mobile Bill Mar', 'Postpaid mobile plan', '2026-03-31', '2026-04-02', 'Approved'),
(50, 'CLM050', 'MEAL', 36, 'Dinner', 'Project closing', '2026-03-31', '2026-04-02', 'Approved');


CREATE TABLE manager (
    M_ID INT PRIMARY KEY,MANAGER_EMP_CODE VARCHAR(10),EMP_CODE VARCHAR(10));

INSERT INTO manager (M_ID, MANAGER_EMP_CODE, EMP_CODE) VALUES
(1, 'EMP004', 'EMP001'), 
(2, 'EMP004', 'EMP002'),
(3, 'EMP013', 'EMP015'),
(4, 'EMP013', 'EMP016'), (5, 'EMP013', 'EMP014');