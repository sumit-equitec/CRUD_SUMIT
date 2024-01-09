USE [master]
GO
/****** Object:  Database [DapperDB]    Script Date: 09-01-2024 14:03:08 ******/
CREATE DATABASE [DapperDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DapperDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DapperDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DapperDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DapperDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DapperDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DapperDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DapperDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DapperDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DapperDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DapperDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DapperDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DapperDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DapperDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DapperDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DapperDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DapperDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DapperDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DapperDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DapperDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DapperDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DapperDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DapperDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DapperDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DapperDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DapperDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DapperDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DapperDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DapperDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DapperDB] SET RECOVERY FULL 
GO
ALTER DATABASE [DapperDB] SET  MULTI_USER 
GO
ALTER DATABASE [DapperDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DapperDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DapperDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DapperDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DapperDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DapperDB', N'ON'
GO
ALTER DATABASE [DapperDB] SET QUERY_STORE = OFF
GO
USE [DapperDB]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 09-01-2024 14:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmpID] [int] IDENTITY(1,1) NOT NULL,
	[EName] [varchar](50) NULL,
	[DeptName] [varchar](50) NULL,
	[Age] [int] NULL,
	[Salary] [int] NULL,
	[IsDeleted] [bit] NULL,
	[Skills] [varchar](max) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (10, N'Sagar', N'IT', 24, 200000, 0, N'HTML CSS ')
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (11, N'Sumit', N'CS', 21, 150000, 0, NULL)
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (12, N'Vipin', N'IT', 21, 4500000, 0, NULL)
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (13, N'Ashish', N'CS', 23, 520000, 0, NULL)
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (14, N'Vipin', N'Mechanical', 21, 252521, 0, NULL)
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (15, N'Yash', N'Mechanical', 20, 45000, 0, NULL)
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (16, N'Xyz', N'CS', 24, 400000, 0, NULL)
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (17, N'ABC', N'NA', 23, 50000, 0, NULL)
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (18, N'Pratik', N'CS', 23, 45000, 0, NULL)
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (19, N'ABCD', N'NA', 18, 15000, 0, NULL)
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (20, N'Nilesh', N'CS', 24, 200000, 0, NULL)
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (21, N'Shubham', N'Civil', 25, 100000, 0, NULL)
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (22, N'Sam', N'CS', 31, 540000, 0, NULL)
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (23, N'Aniket', N'CS', 12, 55852555, 0, NULL)
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (24, N'Raj', N'CS', 55, 75274237, 0, NULL)
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (25, N'Omkar', N'CS', 12, 25400, 0, NULL)
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (26, N'Nikhil', N'CS', 24, 85855, 0, NULL)
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (27, N'Abhi', N'EXTC', 24, 350000, 0, NULL)
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (28, N'Pranav', N'AIML', 23, 150000, 0, NULL)
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (29, N'Nitin', N'CS', 50, 454554, 0, NULL)
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (30, N'Shyam', N'IT', 20, 450000, 0, NULL)
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (31, N'Ritik', N'Civil', 24, 45655, 0, NULL)
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (32, N'Rahul', N'Civil', 25, 560000, 0, NULL)
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (33, N'Eaa', N'CS', 22, 450000, 0, NULL)
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (34, N'esdfs', N'CS', 25, 50, 0, NULL)
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (35, N'wfchdfg', N'NA', 25, 25, 0, NULL)
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (36, N'er', N'CS', 25, 532, 0, NULL)
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (37, N'vjhj m', N'CS', 42, 725, 0, NULL)
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (38, N'erg', N'CS', 42, 532, 0, NULL)
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (39, N'wsf', N'sdfg', 25, 532, 0, NULL)
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (40, N'hdfc', N'CS', 25, 52582, 0, N'')
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (41, N'sgvfsd', N'CS', 22, 2, 0, N'HTML CSS ')
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (42, N'asd', N'CS', 25, 532, 0, N'HTML CSS JavaScript ')
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (43, N'sdfg', N'CS', 25, 25, 0, N'HTML JavaScript ')
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (44, N'dac', N'safc', 53, 1, 0, N'CSS JavaScript ')
INSERT [dbo].[Employee] ([EmpID], [EName], [DeptName], [Age], [Salary], [IsDeleted], [Skills]) VALUES (45, N'fg', N'CS', 20, 354, 0, N'HTML JavaScript ')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
ALTER TABLE [dbo].[Employee] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  StoredProcedure [dbo].[DeletedRecords]    Script Date: 09-01-2024 14:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeletedRecords]
AS
BEGIN
SET NOCOUNT ON;
    SELECT *
    FROM Employee
    WHERE IsDeleted = 1;
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployee]    Script Date: 09-01-2024 14:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteEmployee]
    @EmpID INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Employee
    WHERE EmpID = @EmpID;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllEmployees]    Script Date: 09-01-2024 14:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllEmployees]
AS
BEGIN
    SET NOCOUNT ON;
    SELECT * FROM Employee where IsDeleted=0;
END
GO
/****** Object:  StoredProcedure [dbo].[GetBackDeletedRecord]    Script Date: 09-01-2024 14:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CReate PROCEDURE [dbo].[GetBackDeletedRecord]
 @EmpID INT
	
AS
BEGIN
SET NOCOUNT ON;
    UPDATE Employee
    SET IsDeleted = 0
    WHERE EmpID = @EmpID;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetDeletedRecords]    Script Date: 09-01-2024 14:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDeletedRecords]
AS
BEGIN
    SELECT *
    FROM Employee
    WHERE IsDeleted = 1;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetEmployeeBy]    Script Date: 09-01-2024 14:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEmployeeBy]
    @EmpID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT EmpID, EName, DeptName, Age, Salary
    FROM Employee
    WHERE EmpID = @EmpID;
END
GO
/****** Object:  StoredProcedure [dbo].[GetEmployeeById]    Script Date: 09-01-2024 14:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEmployeeById]
@EmpId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT * FROM Employee WHERE EmpId = @EmpId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetPagedCount]    Script Date: 09-01-2024 14:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPagedCount]
   
AS
BEGIN
    SET NOCOUNT ON;

    SELECT COUNT(*) FROM Employee;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetPagedEmp]    Script Date: 09-01-2024 14:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPagedEmp]
    @Offset INT,
    @PageSize INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT  EmpID,
        EName,
        DeptName,
        Age,
        Salary,
        Skills
    FROM Employee
    WHERE IsDeleted = 0
    ORDER BY EmpID
    OFFSET @Offset ROWS
    FETCH NEXT @PageSize ROWS ONLY;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetPagedEmployee]    Script Date: 09-01-2024 14:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPagedEmployee]
    @Offset INT,
    @PageSize INT,
    @IsDeleted BIT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM Employee
    WHERE IsDeleted = @IsDeleted
    ORDER BY EmpID
    OFFSET @Offset ROWS
    FETCH NEXT @PageSize ROWS ONLY;
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertEmployee]    Script Date: 09-01-2024 14:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertEmployee]
    @EName VARCHAR(50),
    @DeptName VARCHAR(50),
	@Age int,
	@Salary int,
	@Skills VARCHAR(MAX)
	
	
AS
BEGIN
    INSERT INTO Employee (EName, DeptName,Age,Salary,Skills)
    VALUES (@EName, @DeptName, @Age, @Salary,@Skills);
END
GO
/****** Object:  StoredProcedure [dbo].[SoftDeleteRecord]    Script Date: 09-01-2024 14:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SoftDeleteRecord]
    @EmpID INT
	
AS
BEGIN
SET NOCOUNT ON;
    UPDATE Employee
    SET IsDeleted = 1
    WHERE EmpID = @EmpID;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateEmp]    Script Date: 09-01-2024 14:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateEmp]
    @EmpID int,
    @EName VARCHAR(50),
    @DeptName VARCHAR(50),
	@Age int,
	@Salary int,
	@Skills VARCHAR(MAX)
AS
BEGIN
     SET NOCOUNT ON;
   UPDATE Employee
    SET 
	    EName = @EName,
        DeptName = @DeptName,
        Age = @Age,
        Salary = @Salary,
		Skills=@Skills
    WHERE EmpID = @EmpID;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateEmployee]    Script Date: 09-01-2024 14:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateEmployee]
    @EName VARCHAR(50),
    @DeptName VARCHAR(50),
	@Age int,
	@Salary int
AS
BEGIN
     SET NOCOUNT ON;
    UPDATE Employee
    SET EName = @EName, DeptName = @DeptName, Age = @Age, Salary = @Salary
    WHERE EName = @EName;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateEmployeee]    Script Date: 09-01-2024 14:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateEmployeee]
    @EmpID int,
    @EName VARCHAR(50),
    @DeptName VARCHAR(50),
	@Age int,
	@Salary int
AS
BEGIN
     SET NOCOUNT ON;
   UPDATE Employee
    SET EName = @EName,
        DeptName = @DeptName,
        Age = @Age,
        Salary = @Salary
    WHERE EmpID = @EmpID;
END
GO
USE [master]
GO
ALTER DATABASE [DapperDB] SET  READ_WRITE 
GO
