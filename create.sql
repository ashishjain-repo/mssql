CREATE DATABASE SchoolManagementSystemV2;
USE SchoolManagementSystemV2;
CREATE TABLE ProgrammeOfStudy
(
    Id INTEGER PRIMARY KEY IDENTITY,
    Name NVARCHAR(150),
    DurationInYear DECIMAL(10,2)
);

CREATE TABLE Lecturer
(
    Id INTEGER PRIMARY KEY IDENTITY NOT NULL,
    FirstName NVARCHAR(20) NOT NULL,
    LastName NVARCHAR(20) DEFAULT NULL,
    DateOfBirth DATE NOT NULL,
    StaffId NVARCHAR(10) UNIQUE NOT NULL
);

CREATE TABLE Course
(
    Id INTEGER PRIMARY KEY IDENTITY NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    Code NVARCHAR(5) NOT NULL,
    Credit INTEGER NOT NULL,
    ProgrammeOfStudyId INTEGER DEFAULT NULL,

    CONSTRAINT FK_Course_ProgrammeOfStudy FOREIGN KEY (ProgrammeOfStudyId)
        REFERENCES ProgrammeOfStudy(Id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Student
(
    Id INTEGER PRIMARY KEY IDENTITY NOT NULL,
    FirstName NVARCHAR(20) NOT NULL,
    LastName NVARCHAR(20),
    DateOfBirth DATE NOT NULL,
    StudentId NVARCHAR(10) UNIQUE,
    ProgrammeOfStudyId INTEGER DEFAULT NULL,

    CONSTRAINT FK_Student_ProgrammeOfStudy FOREIGN KEY (ProgrammeOfStudyId)
            REFERENCES ProgrammeOfStudy(Id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

CREATE TABLE Class
(
    Id INTEGER PRIMARY KEY IDENTITY NOT NULL,
    Time TIME NOT NULL,
    LecturerId INTEGER DEFAULT NULL,
    CourseId INTEGER NOT NULL,

    CONSTRAINT FK_Class_Lecturer FOREIGN KEY (LecturerId)
        REFERENCES Lecturer(Id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    CONSTRAINT FK_Class_Course FOREIGN KEY (CourseId)
        REFERENCES Course(Id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Enrollment
(
    Id INTEGER PRIMARY KEY IDENTITY NOT NULL,
    StudentId INTEGER NOT NULL,
    ClassId INTEGER NOT NULL,
    Grade NVARCHAR(2),

    CONSTRAINT FK_Enrollment_Student FOREIGN KEY (StudentId)
        REFERENCES Student (Id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_Enrollment_Class FOREIGN KEY (ClassId)
        REFERENCES Class (Id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

