USE [SEDCACADEMYDB]

-- Calculate the count of all grades per Teacher in the system
SELECT g.TeacherId as Id, t.FirstName, t.LastName, COUNT(g.Grade) as CountGrades
FROM dbo.Grade g
LEFT JOIN Teacher t ON t.ID = g.TeacherID
GROUP BY g.TeacherId, t.FirstName, t.LastName
ORDER BY g.TeacherId


-- Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
SELECT g.TeacherId as Id, t.FirstName, t.LastName, COUNT(g.Grade) as CountGrades
FROM dbo.Grade g
LEFT JOIN Teacher t ON t.ID = g.TeacherID
WHERE g.StudentID < 100
GROUP BY g.TeacherId, t.FirstName, t.LastName
ORDER BY g.TeacherId


--Find the Maximal Grade, and the Average Grade per Student on all grades in the system
SELECT g.StudentId as Id, s.FirstName, s.LastName, MAX(g.Grade) as MaximalGrade, AVG(g.grade) as AverageGrade
FROM dbo.Grade g
LEFT JOIN Student s ON s.ID = g.StudentID
GROUP BY g.StudentId, s.FirstName, s.LastName
ORDER BY g.StudentId


-- Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200
SELECT g.TeacherId as Id, COUNT(g.Grade) as CountGrades
FROM dbo.Grade g
GROUP BY g.TeacherID
HAVING COUNT(g.Grade) > 200
ORDER BY g.TeacherID


-- Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the
--system. Filter only records where Maximal Grade is equal to Average Grade
SELECT g.StudentId as Id, s.FirstName, s.LastName, COUNT(g.Grade) as CountGrades, MAX(g.Grade) as MaximalGrades, AVG(g.grade) as AverageGrades
FROM dbo.Grade g
LEFT JOIN Student s ON s.ID = g.StudentID
GROUP BY g.StudentId, s.FirstName, s.LastName
HAVING MAX(g.Grade) = AVG(g.Grade)
ORDER BY g.StudentId


-- List Student First Name and Last Name next to the other details from previous query
-- note: I already did to the previous query


-- Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student
GO
CREATE VIEW [vv_StudentGrades]
AS
SELECT StudentID, COUNT(Grade) as StudentGrades
FROM dbo.Grade
GROUP BY StudentID 
GO

-- Change the view to show Student First and Last Names instead of StudentID
GO
ALTER VIEW [vv_StudentGrades]
AS
SELECT g.StudentID, s.FirstName, s.LastName, COUNT(Grade) as StudentGrades
FROM dbo.Grade g
LEFT JOIN Student s ON s.ID = g.StudentID
GROUP BY g.StudentID, s.FirstName, s.LastName
GO


-- List all rows from view ordered by biggest Grade Count
SELECT * FROM [vv_StudentGrades] ORDER BY StudentGrades DESC
