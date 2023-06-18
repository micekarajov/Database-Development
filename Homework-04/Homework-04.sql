--Declare scalar variable for storing FirstName values
	--• Assign value ‘Antonio’ to the FirstName variable
	--• Find all Students having FirstName same as the variable

DECLARE @FirstName NVARCHAR(100)
SET @FirstName = 'Antonio'

SELECT * FROM Student
WHERE FirstName = @FirstName


--Declare table variable that will contain StudentId, StudentName and DateOfBirth
	--• Fill the table variable with all Female students

DECLARE @StundentsList TABLE
(StudentId int, StudentName nvarchar(100), DateOfBirth date)

INSERT INTO @StundentsList
SELECT Id, FirstName + ' ' + LastName, DateOfBirth from dbo.Student


--Declare temp table that will contain LastName and EnrolledDate columns
	--• Fill the temp table with all Male students having First Name starting with ‘A’
	--• Retrieve the students from the table which last name is with 7 characters

CREATE TABLE #StudentsListTemp
(LastName nvarchar(100), EnrolledDate date)

INSERT INTO #StudentsListTemp
SELECT LastName, EnrolledDate from Student
WHERE Gender = 'M' AND FirstName LIKE 'A%'

SELECT * FROM #StudentsListTemp 
WHERE LEN(LastName) = 7

--Find all teachers whose FirstName length is less than 5 and
	--• the first 3 characters of their FirstName and LastName are the same

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION TeachersCountFirstName
(
	
)
RETURNS NVARCHAR(100)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result NVARCHAR(100)

	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = FirstName
	FROM Teacher
	WHERE LEN(FirstName) < 5 AND LEFT(FirstName, 3) = LEFT(LastName, 3)

	-- Return the result of the function
	RETURN @Result

END
GO

SELECT dbo.TeachersCountFirstName()
GO