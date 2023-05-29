--CREATE DATABASE SEDCACADEMYDB

USE SEDCACADEMYDB

CREATE TABLE [Student]
(
[ID] int IDENTITY(1,1) NOT NULL PRIMARY KEY, 
[FirstName] nvarchar(50) NOT NULL,
[LastName] nvarchar(50) NOT NULL,
[DateOfBirth] date NOT NULL, 
[EnrolledDate] date NULL,
[Gender] nchar(1) NULL,
[NationalIDNumber] nvarchar(20) NOT NULL,
[StudentCardNumber] nvarchar(20) NOT NULL,
)

CREATE TABLE [Teacher]
(
[ID] int IDENTITY(1,1) NOT NULL PRIMARY KEY, 
[FirstName] nvarchar(50) NOT NULL,
[LastName] nvarchar(50) NOT NULL,
[DateOfBirth] date NOT NULL, 
[AcademicRank] nvarchar(50) NULL,
[HireDate] date NULL,
)

CREATE TABLE [Grade] 
(
[ID] int IDENTITY(1,1) NOT NULL PRIMARY KEY, 
[StudentID] int NOT NULL,
[CourseID] int NOT NULL,
[TeacherID] int NOT NULL,
[Grade] int NOT NULL,
[Comment] nvarchar(MAX) NULL,
[CreatedDate] datetime NULL
)

CREATE TABLE [Course]
(
[ID] int IDENTITY(1,1) NOT NULL PRIMARY KEY, 
[Name] nvarchar(50) NULL,
[Credit] nvarchar(50) NULL,
[AcademicYear] int NULL,
[Semester] int NULL,
)

CREATE TABLE [GradeDetails]
(
[ID] int NOT NULL PRIMARY KEY,
[GradeID] int NOT NULL,
[AchievementTypeID] int NULL,
[AchievementPoints] int NULL,
[AchievementMaxPoints] int NULL,
[AchievementDate] date NULL,
)

CREATE TABLE [AchievementType] 
(
[ID] int NOT NULL PRIMARY KEY,
[Name] nvarchar(50) NOT NULL,
[Description] nvarchar(1000) NULL,
[ParticipationRate] nvarchar(50) NULL
)