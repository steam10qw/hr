USE EmployeeManagementSystem;
GO

-- Таблица Должности
CREATE TABLE Positions (
    PositionID INT PRIMARY KEY IDENTITY(1,1),
    PositionTitle VARCHAR(50),
    RequiredEducation VARCHAR(50)
);

-- Таблица Сотрудники
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    LastName VARCHAR(50),
    FirstName VARCHAR(50),
    MiddleInitial CHAR(1),
    Gender CHAR(1),
    DateOfBirth DATE,
    PhoneNumber VARCHAR(15),
    Address VARCHAR(100),
    EducationLevel VARCHAR(50),
    PositionID INT,
    FOREIGN KEY (PositionID) REFERENCES Positions(PositionID)
);

-- Таблица Отделы
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName VARCHAR(50),
    ManagerID INT,
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
);

-- Таблица История трудовой деятельности
CREATE TABLE EmploymentHistory (
    HistoryID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT,
    PreviousCompanyName VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Таблица Больничные
CREATE TABLE SickLeaves (
    SickLeaveID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT,
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Таблица Отпуска
CREATE TABLE Vacations (
    VacationID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT,
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
-- Таблица Дети сотрудников
CREATE TABLE Children (
    ChildID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT,
    ChildName VARCHAR(50),
    DateOfBirth DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
-- Вставка данных в таблицу Должности
INSERT INTO Positions (PositionTitle, RequiredEducation) VALUES 
('Software Engineer', 'Bachelor''s Degree'),
('HR Manager', 'Master''s Degree'),
('Data Analyst', 'Bachelor''s Degree'),
('Project Manager', 'Bachelor''s Degree');

-- Вставка данных в таблицу Сотрудники
INSERT INTO Employees (LastName, FirstName, MiddleInitial, Gender, DateOfBirth, PhoneNumber, Address, EducationLevel, PositionID) VALUES 
('Smith', 'John', 'A', 'M', '1985-06-15', '123-456-7890', '123 Elm St, Cityville', 'High School Diploma', 1),  -- Несоответствие образования
('Doe', 'Jane', 'B', 'F', '1990-09-20', '098-765-4321', '456 Oak St, Townsville', 'Master''s Degree', 2),
('Johnson', 'Emily', 'C', 'F', '1988-12-30', '234-567-8901', '789 Pine St, Villageburg', 'Bachelor''s Degree', 3),
('Brown', 'Michael', 'D', 'M', '1982-03-25', '345-678-9012', '321 Maple St, Suburbia', 'Bachelor''s Degree', 4);

-- Вставка данных в таблицу Отделы
INSERT INTO Departments (DepartmentName, ManagerID) VALUES 
('IT Department', 1), 
('HR Department', 2);

-- Вставка данных в таблицу История трудовой деятельности
INSERT INTO EmploymentHistory (EmployeeID, PreviousCompanyName, StartDate, EndDate) VALUES 
(1, 'Tech Solutions Inc.', '2010-01-01', '2015-12-31'),
(2, 'People First LLC.', '2016-01-01', '2020-05-31'),
(3, 'Data Insights Corp.', '2015-06-01', '2019-11-30'),
(4, 'Project Management Co.', '2014-07-01', NULL);

-- Вставка данных в таблицу Больничные
INSERT INTO SickLeaves (EmployeeID, StartDate, EndDate) VALUES 
(1, '2023-01-10', '2023-01-15'),
(2, '2023-02-20', '2023-02-25');

-- Вставка данных в таблицу Отпуска
INSERT INTO Vacations (EmployeeID, StartDate, EndDate) VALUES 
(3, '2023-06-01', '2023-06-10'),
(4, '2023-07-15', '2023-07-20');
-- Вставка данных в таблицу Дети сотрудников
INSERT INTO Children (EmployeeID, ChildName, DateOfBirth) VALUES 
(1, 'Anna Smith', '2010-05-10'),
(2, 'Tom Doe', '2015-08-25'),
(2, 'Lucy Doe', '2018-03-14'),
(4, 'James Brown', '2012-11-20');