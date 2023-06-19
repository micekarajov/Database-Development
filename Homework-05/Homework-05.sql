--Create new procedure called CreateGrade
	--• Procedure should create only Grade header info (not Grade Details)
	--• Procedure should return the total number of grades in the system for the Student on input (from the CreateGrade)
	--• Procedure should return second resultset with the MAX Grade of all grades for the Student	
	  --and Teacher on input (regardless the Course)

	  SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE CreateGrade
	-- Add the parameters for the stored procedure here
	@StudentID int,
	@CourseID int,
	@TeacherID int,
	@Grade int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Insert few grades in the system
	INSERT INTO Grade
	VALUES (@StudentID, @CourseID, @TeacherID, @Grade, null, null)


    --Procedure should return the total number of grades in the system for the Student on input (from the CreateGrade)
	SELECT COUNT(*) AS TotalNumberOfGrades
	FROM Grade
	WHERE StudentID = @StudentID

	--Procedure should return second result set with the MAX Grade of all grades for the Student and Teacher on input (regardless the Course)
	SELECT MAX(Grade)
	FROM Grade
	WHERE TeacherID = @TeacherID AND StudentID = @StudentID

END
GO

EXEC CreateGrade @StudentID = 12, @CourseID = 12, @TeacherID = 15, @Grade = 111

--Create new procedure called CreateGradeDetail
	--• Procedure should add details for specific Grade (new record for new AchievementTypeID,
	  --Points, MaxPoints, Date for specific Grade)
	--• Output from this procedure should be resultset with SUM of GradePoints calculated with
	  --formula AchievementPoints/AchievementMaxPoints*ParticipationRate for specific Grade

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE CreateGradeDetail
	-- Add the parameters for the stored procedure here
	@GradeID int,
	@AchievementTypeID int ,
	@AchievementPoints int ,
	@AchievementMaxPoints int ,
	@AchievementDate date 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--• Procedure should add details for specific Grade (new record for new AchievementTypeID,
	  --Points, MaxPoints, Date for specific Grade)
	INSERT INTO GradeDetails(GradeID, AchievementTypeID,AchievementPoints, AchievementMaxPoints,AchievementDate)
	VALUES (@GradeID, @AchievementTypeID, @AchievementPoints, @AchievementMaxPoints, @AchievementDate)

	--• Output from this procedure should be resultset with SUM of GradePoints calculated with
	  --formula AchievementPoints/AchievementMaxPoints*ParticipationRate for specific Grade
    SELECT SUM(gd.AchievementPoints / gd.AchievementMaxPoints * a.ParticipationRate) AS TotalGradePoints
	FROM GradeDetails gd
		INNER JOIN AchievementType a
		ON a.ID = gd.AchievementTypeID
	WHERE gd.AchievementTypeID = @AchievementTypeID


END
GO

EXEC CreateGradeDetail @GradeID = 1, @AchievementTypeID = 1, @AchievementPoints = 1, @AchievementMaxPoints = 1,	@AchievementDate = '1999-02-02'





