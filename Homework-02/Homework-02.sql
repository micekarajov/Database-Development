USE [SEDCACADEMYDB]

--Find all Students with FirstName = Antonio
SELECT * FROM Student WHERE FirstName = 'Antonio'

--Find all Students with DateOfBirth greater than ‘01.01.1999’
SELECT *
FROM Student
WHERE DateOfBirth > CONVERT(date, '01-01-1999')

--Find all Students with LastName starting With ‘J’ enrolled in January/1998
SELECT *
FROM Student
Where LastName LIKE 'J%' AND MONTH(EnrolledDate) = 1 AND YEAR(EnrolledDate) = 1998;


--List all Students ordered by FirstName
SELECT *
FROM Student
ORDER BY FirstName

--List all Teacher Last Names and Student Last Names in single result set. Remove duplicates
SELECT LastName
FROM Teacher
UNION
SELECT LastName
FROM Student


--Create Foreign key constraints from diagram or with script
ALTER TABLE [dbo].[GradeDetails] WITH CHECK
ADD CONSTRAINT [FK_GradeDetails_AchievementType]
FOREIGN KEY([AchievementTypeID])
REFERENCES [dbo].[AchievementType] ([Id])

ALTER TABLE [dbo].[GradeDetails] WITH CHECK
ADD CONSTRAINT [FK_GradeDetails_Grade]
FOREIGN KEY([GradeID])
REFERENCES [dbo].[Grade] ([Id])

ALTER TABLE [dbo].[Grade] WITH CHECK
ADD CONSTRAINT [FK_Grade_Student]
FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([Id])

ALTER TABLE [dbo].[Grade] WITH CHECK
ADD CONSTRAINT [FK_Grade_Course]
FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([Id])

ALTER TABLE [dbo].[Grade] WITH CHECK
ADD CONSTRAINT [FK_Grade_Teacher]
FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teacher] ([Id])

--List all possible combinations of Courses names and AchievementType names that can be passed by student.
SELECT act.Name AS AchievementType, s.FirstName + ' ' + s.LastName AS StudentName,c.Name AS CourseName, g.Grade FROM GradeDetails gd
LEFT JOIN AchievementType act ON gd.AchievementTypeID = act.ID
LEFT JOIN Grade g ON gd.GradeID = g.ID
LEFT JOIN Student s ON g.StudentID = s.ID
LEFT JOIN Course c ON g.CourseID = c.ID

--List all Teachers without exam Grade
SELECT t.*
FROM Teacher t
LEFT JOIN Grade g ON t.Id = g.TeacherID
WHERE g.Grade IS NULL;

