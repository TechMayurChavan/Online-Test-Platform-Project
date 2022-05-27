create database TestPlatform;
use TestPlatform

--1
create table UserRole(RoleID int Identity(1,1) primary key,
Discription varchar(50))
insert into UserRole values('User')
insert into UserRole values('Admin')
select *from UserRole

--2
create table UserInfo(UserID int identity(1,1) Primary key,
EmailID varchar(50), UserPassword varchar(50), RoleID int references UserRole(RoleID))

insert into UserInfo values('Suyog45@gmail.com','Suyog@123',1)
insert into UserInfo values('chavanmayur305@gmail.com','Mayur@123',2)
ALTER TABLE UserInfo ADD UserName Varchar(100);
select *from UserInfo

--3
Create table TestCatagory(TestCatagoryID int identity(1,1) primary key,
TestType varchar(50), TestDuration varchar(50))

insert into TestCatagory values('Aptitude','20 Minutes')
insert into TestCatagory values('Reasoning','20 Minutes')
insert into TestCatagory values('verbal','20 Minutes')
select *From TestCatagory

--4	
create table Questions(QuestionID int identity(1,1) primary key,TestCatagoryID int references TestCatagory(TestCatagoryID),
Question varchar(200), 
Option1 varchar(100), Option2 varchar(100),Option3 varchar(100),
Option4 varchar(100),CorrectAnswer varchar(100))

select *from Questions
insert into Questions values(1,'Which one of the following is not a prime number?',31,61,71,91,91)
insert into Questions values(1,'(112x54)=?',67000,70000,76500,77200,70000)
insert into Questions values(1,'What least number must be added to 1056, so that the sum is completely divisible by 23?'
                                  ,2,3,18,21,2)
insert into Questions values(1,'1397 x 1397 = ?',1951609,1981709,18362619,2031719,1951609)
insert into Questions values(1,'Which one of the following is not a prime number?',31,61,71,91,91)
insert into Questions values(1,'Which one of the following is not a prime number?',31,61,71,91,91)
insert into Questions values(1,' What is the average of first five multiples of 12?',36,38,40,42,36)
insert into Questions values(1,' What is the difference in the place value of 5 in the numeral 754853?
',49500,49950,45000,49940,49950)
insert into Questions values(1,'What is the compound interest on Rs. 2500 for 2 years at rate of interest 4% per annum?
',180,204,210,220,204)
insert into Questions values(1,' 40 % of 280 =?
',112,116,115,120,112)

insert into Questions values(2,' Look at this series: 7, 10, 8, 11, 9, 12, ... What number should come next?',
                                7,10,12,13,10)
insert into Questions values(2,'Look at this series: 36, 34, 30, 28, 24, ... What number should come next?',
                                20,22,23,26,22)
insert into Questions values(2,'Which number should come next in the series, 48, 24, 12, ......?',
                                8,6,4,2,6)
insert into Questions values(2,' RQP, ONM, _, IHG, FED, find the missing letters.',
                                'CDE','LKI','LKJ','BAC','LKJ')
insert into Questions values(2,'Which word does not belong to others?',
                                'Inch','Kilogram','Centimeter','Yard','Kilogram')
insert into Questions values(2,'Pointing to a photograph, a man said, I have no brother, and that man father is my father son. Whose photograph was it?',
                                'His son','His own','His father','His nephew','His son')
insert into Questions values(2,' An animal always has....?',
                                'Skin','Heart','Lungs','life','Ears')
insert into Questions values(2,' If in a certain language, NOIDA is coded as OPJEB, how is DELHI coded in that language?',
                                'CDKGH','EFMIJ','FGNJK','IHLED','EFMIJ')
insert into Questions values(2,' PETAL: FLOWER',
                                'Pen:Paper','Engine:Car','Cat:Dog','Ball:Game','Engine:Car')
insert into Questions values(2,'Look at this series: 12, 11, 13, 12, 14, 13, … What number should come next?',
                                10,16,13,15,15)

insert into Questions values(3,'Opposite of ENORMOUS','Soft','Average','Tiny','Weak','Tiny')
insert into Questions values(3,'Opposite of COMMISSIONED','Started','Closed','Finished','Terminated','Terminated')
insert into Questions values(3,' Synonyms CORPULENT','Lean','Gaunt','Emaciated','Obese','Obese')
insert into Questions values(3,' Synonyms BRIEF','Limited','Small','Little','Short','Short')
insert into Questions values(3,' Synonyms EMBEZZLE','Misappropriate','Balance','Remunerate','Clear','Misappropriate')
insert into Questions values(3,' Synonyms VENT','Opening','Stodge','End','	Past tense of go','Opening')
insert into Questions values(3,' Synonyms AUGUST','Common','Ridiculous','Dignified','Petty','Dignified')
insert into Questions values(3,' Synonyms CANNY','Obstinate','Handsome','Clever','Stout','Clever')
insert into Questions values(3,' Synonyms ALERT','Energetic','Observant','Intelligent','Watchful','Watchful')
insert into Questions values(3,' Synonyms WARRIOR','Soldier','Sailor','Pirate','Spy','Soldier')


--5
Create table TestReport(TestID int identity(1,1) Primary key,UserID int references UserInfo(UserID),
TestCatagoryID int references TestCatagory(TestCatagoryID),
Marks int,TestDate Date)
select *from TestReport

--ALTER TABLE TestReport ALTER COLUMN TestDate varchar(100);
--ALTER TABLE TestReport ADD TotalMarks int;


--6
create table UserAnswers(AnswerID int identity(1,1) primary key,QuestionID int references Questions(QuestionID),
UserID int references UserInfo(UserID), TestCatagoryID int references TestCatagory(TestCatagoryID),
UserAnswer varchar(200),Marks int)
select *from UserAnswers

--ALTER TABLE UserAnswers ADD TestDate Varchar(100);


exec sp_updatestats