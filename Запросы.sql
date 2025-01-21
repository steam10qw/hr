-- 1. ������ �������� ����������
DECLARE @EmployeeID INT = 1; -- �������� �� ������ ID
SELECT * FROM Employees WHERE EmployeeID = @EmployeeID;

-- 2. ������ ���� ����������� ��� ������� �����������
SELECT * FROM Employees WHERE EducationLevel NOT LIKE '%Bachelor%';

-- 3. ������ ����������� � ��������������� ����������� � ���������
SELECT E.*
FROM Employees E
JOIN Positions P ON E.PositionID = P.PositionID
WHERE E.EducationLevel != P.RequiredEducation;

-- 4. ��� ������� � ������������ ��� ��������� ����������
DECLARE @EmployeeIDForHistory INT = 1; -- �������� �� ������ ID
SELECT * FROM EmploymentHistory WHERE EmployeeID = @EmployeeIDForHistory;

-- 5. ���������� ���������� ����� � ���� �����������
SELECT E.EmployeeID,
       E.LastName + ', '+ E.FirstName AS FullName,
       COUNT(C.ChildID) AS NumberOfChildren
FROM Employees E
LEFT JOIN Children C ON E.EmployeeID = C.EmployeeID
GROUP BY E.EmployeeID, E.LastName, E.FirstName;

-- 6. ������ ������ ���� ����� �����������
SELECT C.ChildName AS ChildName,
       C.DateOfBirth AS ChildDOB,
       E.LastName + ', '+ E.FirstName AS ParentFullName 
FROM Children C 
JOIN Employees E ON C.EmployeeID = E.EmployeeID;

-- 7. ������ ����������� ��� ������ ���������� ("City" � ������)
SELECT * FROM Employees WHERE Address NOT LIKE '%City%';

-- 8. ������ ����������� ��������� ������
DECLARE @DepartmentName VARCHAR(50) = 'IT Department'; -- �������� �� ������ �������� ������
SELECT E.*
FROM Employees E 
JOIN Departments D ON D.ManagerID = E.EmployeeID 
WHERE D.DepartmentName = @DepartmentName;

-- 9. ������ ����������� �� ���������� ��� ������� �� ��������� ������ �������:
DECLARE @StartDate DATE = '2023-01-01'; -- �������� �� ������ ���� ������
DECLARE @EndDate DATE = '2023-12-31'; -- �������� �� ������ ���� ���������

SELECT DISTINCT E.*
FROM Employees E 
LEFT JOIN SickLeaves SL ON SL.EmployeeID = E.EmployeeID 
LEFT JOIN Vacations V ON V.EmployeeID = E.EmployeeID 
WHERE (SL.StartDate BETWEEN @StartDate AND @EndDate OR SL.EndDate BETWEEN @StartDate AND @EndDate)
   OR (V.StartDate BETWEEN @StartDate AND @EndDate OR V.EndDate BETWEEN @StartDate AND @EndDate);