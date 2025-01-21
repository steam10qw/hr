-- 1. Личная карточка сотрудника
DECLARE @EmployeeID INT = 1; -- Замените на нужный ID
SELECT * FROM Employees WHERE EmployeeID = @EmployeeID;

-- 2. Список всех сотрудников без высшего образования
SELECT * FROM Employees WHERE EducationLevel NOT LIKE '%Bachelor%';

-- 3. Список сотрудников с несоответствием образования и должности
SELECT E.*
FROM Employees E
JOIN Positions P ON E.PositionID = P.PositionID
WHERE E.EducationLevel != P.RequiredEducation;

-- 4. Все приказы и распоряжения для заданного сотрудника
DECLARE @EmployeeIDForHistory INT = 1; -- Замените на нужный ID
SELECT * FROM EmploymentHistory WHERE EmployeeID = @EmployeeIDForHistory;

-- 5. Рассчитать количество детей у всех сотрудников
SELECT E.EmployeeID,
       E.LastName + ', '+ E.FirstName AS FullName,
       COUNT(C.ChildID) AS NumberOfChildren
FROM Employees E
LEFT JOIN Children C ON E.EmployeeID = C.EmployeeID
GROUP BY E.EmployeeID, E.LastName, E.FirstName;

-- 6. Выдать список всех детей сотрудников
SELECT C.ChildName AS ChildName,
       C.DateOfBirth AS ChildDOB,
       E.LastName + ', '+ E.FirstName AS ParentFullName 
FROM Children C 
JOIN Employees E ON C.EmployeeID = E.EmployeeID;

-- 7. Список сотрудников вне города проживания ("City" в адресе)
SELECT * FROM Employees WHERE Address NOT LIKE '%City%';

-- 8. Список сотрудников заданного отдела
DECLARE @DepartmentName VARCHAR(50) = 'IT Department'; -- Замените на нужное название отдела
SELECT E.*
FROM Employees E 
JOIN Departments D ON D.ManagerID = E.EmployeeID 
WHERE D.DepartmentName = @DepartmentName;

-- 9. Список сотрудников на больничном или отпуске за указанный период времени:
DECLARE @StartDate DATE = '2023-01-01'; -- Замените на нужную дату начала
DECLARE @EndDate DATE = '2023-12-31'; -- Замените на нужную дату окончания

SELECT DISTINCT E.*
FROM Employees E 
LEFT JOIN SickLeaves SL ON SL.EmployeeID = E.EmployeeID 
LEFT JOIN Vacations V ON V.EmployeeID = E.EmployeeID 
WHERE (SL.StartDate BETWEEN @StartDate AND @EndDate OR SL.EndDate BETWEEN @StartDate AND @EndDate)
   OR (V.StartDate BETWEEN @StartDate AND @EndDate OR V.EndDate BETWEEN @StartDate AND @EndDate);