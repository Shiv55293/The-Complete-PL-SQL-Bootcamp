CREATE TABLE indian_employee ( 
  employee_id NUMBER(5) PRIMARY KEY, 
  first_name VARCHAR2(50), 
  last_name VARCHAR2(50), 
  date_of_birth DATE, 
  gender VARCHAR2(1), 
  designation VARCHAR2(100), 
  department VARCHAR2(50), 
  salary NUMBER(10, 2), 
  joining_date DATE, 
  address VARCHAR2(200) 
);

INSERT INTO indian_employee VALUES (1, 'John', 'Doe', TO_DATE('1990-05-15', 'YYYY-MM-DD'), 'M', 'Manager', 'HR', 60000.00, TO_DATE('2023-01-10', 'YYYY-MM-DD'), '123 Main St, Bangalore');

INSERT INTO indian_employee VALUES (2, 'Jane', 'Smith', TO_DATE('1995-08-20', 'YYYY-MM-DD'), 'F', 'Developer', 'IT', 55000.00, TO_DATE('2022-12-05', 'YYYY-MM-DD'), '456 Elm St, Mumbai');

COMMIT;

BEGIN 
  FOR emp IN (SELECT * FROM indian_employee) LOOP 
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || emp.employee_id); 
    DBMS_OUTPUT.PUT_LINE('Name: ' || emp.first_name || ' ' || emp.last_name); 
    DBMS_OUTPUT.PUT_LINE('Date of Birth: ' || TO_CHAR(emp.date_of_birth, 'DD-MON-YYYY')); 
    DBMS_OUTPUT.PUT_LINE('Gender: ' || emp.gender); 
    DBMS_OUTPUT.PUT_LINE('Designation: ' || emp.designation); 
    DBMS_OUTPUT.PUT_LINE('Department: ' || emp.department); 
    DBMS_OUTPUT.PUT_LINE('Salary: ' || emp.salary); 
    DBMS_OUTPUT.PUT_LINE('Joining Date: ' || TO_CHAR(emp.joining_date, 'DD-MON-YYYY')); 
    DBMS_OUTPUT.PUT_LINE('Address: ' || emp.address); 
    DBMS_OUTPUT.NEW_LINE; 
  END LOOP; 
END; 
/

INSERT INTO indian_employee VALUES (3, 'Amit', 'Sharma', TO_DATE('1992-04-25', 'YYYY-MM-DD'), 'M', 'Sales Executive', 'Sales', 45000.00, TO_DATE('2023-02-15', 'YYYY-MM-DD'), '789 Oak St, Delhi');

INSERT INTO indian_employee VALUES (4, 'Rina', 'Patel', TO_DATE('1991-12-12', 'YYYY-MM-DD'), 'F', 'Accountant', 'Finance', 52000.00, TO_DATE('2023-03-05', 'YYYY-MM-DD'), '101 Pine St, Ahmedabad');

INSERT INTO indian_employee VALUES (5, 'Vijay', 'Kumar', TO_DATE('1987-07-03', 'YYYY-MM-DD'), 'M', 'Marketing Manager', 'Marketing', 62000.00, TO_DATE('2023-04-20', 'YYYY-MM-DD'), '567 Cedar St, Chennai');

INSERT INTO indian_employee VALUES (6, 'Priya', 'Gupta', TO_DATE('1993-06-18', 'YYYY-MM-DD'), 'F', 'Software Engineer', 'IT', 58000.00, TO_DATE('2023-05-10', 'YYYY-MM-DD'), '234 Birch St, Hyderabad');

INSERT INTO indian_employee VALUES (7, 'Rajesh', 'Verma', TO_DATE('1985-03-30', 'YYYY-MM-DD'), 'M', 'Senior Manager', 'Management', 70000.00, TO_DATE('2023-06-15', 'YYYY-MM-DD'), '321 Maple St, Pune');

INSERT INTO indian_employee VALUES (8, 'Sneha', 'Mishra', TO_DATE('1990-09-10', 'YYYY-MM-DD'), 'F', 'Quality Analyst', 'Quality Assurance', 49000.00, TO_DATE('2023-07-02', 'YYYY-MM-DD'), '876 Walnut St, Kolkata');

COMMIT;

DECLARE 
  v_employee_name indian_employee.first_name%TYPE; 
BEGIN 
  SELECT first_name INTO v_employee_name FROM indian_employee WHERE employee_id = 3; 
  DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_employee_name); 
END; 
/

SELECT 
  first_name || ' ' || last_name AS employee_name, 
  salary, 
  CASE 
    WHEN salary < 50000 THEN 'Low Salary' 
    WHEN salary >= 50000 AND salary < 60000 THEN 'Medium Salary' 
    ELSE 'High Salary' 
  END AS salary_category 
FROM indian_employee;

DECLARE 
  v_counter NUMBER := 1; 
BEGIN 
  WHILE v_counter <= 5 LOOP 
    DBMS_OUTPUT.PUT_LINE('Counter: ' || v_counter); 
    v_counter := v_counter + 1; 
  END LOOP; 
END; 
/

BEGIN 
  FOR i IN 1..5 LOOP 
    DBMS_OUTPUT.PUT_LINE('Iteration: ' || i); 
  END LOOP; 
END; 
/

BEGIN 
  FOR i IN 1..5 LOOP 
    FOR j IN 1..5 LOOP 
      DBMS_OUTPUT.PUT(i || ' x ' || j || ' = ' || i * j || '  '); 
    END LOOP; 
    DBMS_OUTPUT.NEW_LINE; 
  END LOOP; 
END; 
/

BEGIN 
  FOR i IN 1..10 LOOP 
    IF MOD(i, 2) = 0 THEN 
      CONTINUE; 
    END IF; 
    DBMS_OUTPUT.PUT_LINE('Odd number: ' || i); 
  END LOOP; 
END; 
/

DECLARE 
  v_counter NUMBER := 1; 
BEGIN 
  <<my_label>> -- Define a label 
  LOOP 
    IF v_counter > 5 THEN 
      EXIT my_label; -- Exit the loop labeled as 'my_label' 
    END IF; 
    DBMS_OUTPUT.PUT_LINE('Counter: ' || v_counter); 
    v_counter := v_counter + 1; 
  END LOOP; 
END; 
/

DECLARE 
  -- Declare a PL/SQL record type 
  TYPE employee_record IS RECORD ( 
    employee_id NUMBER, 
    first_name VARCHAR2(50), 
    last_name VARCHAR2(50) 
  ); 
   
  -- Declare a variable of the record type 
  emp_info employee_record; 
BEGIN 
  -- Initialize the record 
  emp_info := employee_record(1, 'John', 'Doe'); 
   
  -- Access record fields 
  DBMS_OUTPUT.PUT_LINE('Employee ID: ' || emp_info.employee_id); 
  DBMS_OUTPUT.PUT_LINE('Name: ' || emp_info.first_name || ' ' || emp_info.last_name); 
END; 
/

DECLARE 
  -- Declare a PL/SQL record type 
  TYPE employee_record IS RECORD ( 
    employee_id NUMBER, 
    first_name VARCHAR2(50), 
    last_name VARCHAR2(50) 
  ); 
   
  -- Declare a variable of the record type 
  emp_info employee_record; 
BEGIN 
  -- Initialize the record 
  emp_info := employee_record(1, 'John', 'Doe'); 
   
  -- Access record fields 
  DBMS_OUTPUT.PUT_LINE('Employee ID: ' || emp_info.employee_id); 
  DBMS_OUTPUT.PUT_LINE('Name: ' || emp_info.first_name || ' ' || emp_info.last_name); 
END; 
/

DECLARE 
  -- Declare a PL/SQL record type 
  TYPE employee_record IS RECORD ( 
    employee_id NUMBER, 
    first_name VARCHAR2(50), 
    last_name VARCHAR2(50) 
  ); 
   
  -- Declare a variable of the record type 
  emp_info employee_record; 
BEGIN 
  -- Initialize the record 
  emp_info := employee_record(1, 'John', 'Doe'); 
   
  -- Access record fields 
  DBMS_OUTPUT.PUT_LINE('Employee ID: ' || emp_info.employee_id); 
  DBMS_OUTPUT.PUT_LINE('Name: ' || emp_info.first_name || ' ' || emp_info.last_name); 
END; 
/

DECLARE 
  TYPE emp_cursor IS REF CURSOR; 
  emp_info employee_record; 
  emp_cur emp_cursor; 
BEGIN 
  -- Declare a cursor 
  OPEN emp_cur FOR 
    SELECT employee_id, first_name, last_name 
    FROM indian_employee 
    WHERE department = 'IT'; 
   
  -- Fetch data from the cursor into a record 
  FETCH emp_cur INTO emp_info; 
   
  -- Loop to process multiple records 
  WHILE emp_cur%FOUND LOOP 
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || emp_info.employee_id); 
    DBMS_OUTPUT.PUT_LINE('Name: ' || emp_info.first_name || ' ' || emp_info.last_name); 
    FETCH emp_cur INTO emp_info; 
  END LOOP; 
   
  -- Close the cursor 
  CLOSE emp_cur; 
END; 
/

DECLARE 
  -- Declare a PL/SQL record type 
  TYPE employee_record IS RECORD ( 
    employee_id NUMBER, 
    first_name VARCHAR2(50), 
    last_name VARCHAR2(50) 
  ); 
   
  -- Declare a variable of the record type 
  emp_info employee_record; 
BEGIN 
  -- Initialize the record 
  emp_info := employee_record(1, 'John', 'Doe'); 
   
  -- Access record fields 
  DBMS_OUTPUT.PUT_LINE('Employee ID: ' || emp_info.employee_id); 
  DBMS_OUTPUT.PUT_LINE('Name: ' || emp_info.first_name || ' ' || emp_info.last_name); 
END; 
/

DECLARE 
  TYPE emp_cursor IS REF CURSOR; 
  emp_info employee_record; 
  emp_cur emp_cursor; 
BEGIN 
  -- Declare a cursor 
  OPEN emp_cur FOR 
    SELECT employee_id, first_name, last_name 
    FROM indian_employee 
    WHERE department = 'IT'; 
   
  -- Fetch data from the cursor into a record 
  FETCH emp_cur INTO emp_info; 
   
  -- Loop to process multiple records 
  WHILE emp_cur%FOUND LOOP 
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || emp_info.employee_id); 
    DBMS_OUTPUT.PUT_LINE('Name: ' || emp_info.first_name || ' ' || emp_info.last_name); 
    FETCH emp_cur INTO emp_info; 
  END LOOP; 
   
  -- Close the cursor 
  CLOSE emp_cur; 
END; 
/

DECLARE 
  -- Declare a PL/SQL record type 
  TYPE employee_record IS RECORD ( 
    employee_id NUMBER, 
    first_name VARCHAR2(50), 
    last_name VARCHAR2(50) 
  ); 
   
  -- Declare a variable of the record type 
  emp_info employee_record; 
BEGIN 
  -- Initialize the record 
  emp_info := employee_record(1, 'John', 'Doe'); 
   
  -- Access record fields 
  DBMS_OUTPUT.PUT_LINE('Employee ID: ' || emp_info.employee_id); 
  DBMS_OUTPUT.PUT_LINE('Name: ' || emp_info.first_name || ' ' || emp_info.last_name); 
END; 
/

DECLARE 
  TYPE emp_cursor IS REF CURSOR; 
  emp_info employee_record; 
  emp_cur emp_cursor; 
BEGIN 
  -- Declare a cursor 
  OPEN emp_cur FOR 
    SELECT employee_id, first_name, last_name 
    FROM indian_employee 
    WHERE department = 'IT'; 
   
  -- Fetch data from the cursor into a record 
  FETCH emp_cur INTO emp_info; 
   
  -- Loop to process multiple records 
  WHILE emp_cur%FOUND LOOP 
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || emp_info.employee_id); 
    DBMS_OUTPUT.PUT_LINE('Name: ' || emp_info.first_name || ' ' || emp_info.last_name); 
    FETCH emp_cur INTO emp_info; 
  END LOOP; 
   
  -- Close the cursor 
  CLOSE emp_cur; 
END; 
/

CREATE OR REPLACE FUNCTION get_employee_name(emp_id NUMBER) RETURN VARCHAR2 IS 
  emp_name VARCHAR2(100); 
BEGIN 
  SELECT first_name || ' ' || last_name INTO emp_name 
  FROM indian_employee 
  WHERE employee_id = emp_id; 
   
  RETURN emp_name; 
END; 
/

DECLARE 
  TYPE names_varray IS VARRAY(3) OF VARCHAR2(50); 
  -- Declare a variable of the VARRAY type and initialize it 
  names names_varray := names_varray('Alice', 'Bob', 'Charlie'); 
BEGIN 
  -- Access elements in the VARRAY 
  FOR i IN 1..names.COUNT LOOP 
    DBMS_OUTPUT.PUT_LINE('Element ' || i || ': ' || names(i)); 
  END LOOP; 
END; 
/

DECLARE 
  TYPE names_varray IS VARRAY(3) OF VARCHAR2(50); 
  -- Declare a variable of the VARRAY type and initialize it 
  names names_varray := names_varray('Alice', 'Bob', 'Charlie'); 
BEGIN 
  -- Access elements in the VARRAY 
  FOR i IN 1..names.COUNT LOOP 
    DBMS_OUTPUT.PUT_LINE('Element ' || i || ': ' || names(i)); 
  END LOOP; 
END; 
/

DECLARE 
  TYPE names_varray IS VARRAY(3) OF VARCHAR2(50); 
  -- Declare a variable of the VARRAY type and initialize it 
  names names_varray := names_varray('Alice', 'Bob', 'Charlie'); 
BEGIN 
  -- Access elements in the VARRAY 
  FOR i IN 1..names.COUNT LOOP 
    DBMS_OUTPUT.PUT_LINE('Element ' || i || ': ' || names(i)); 
  END LOOP; 
END; 
/

DECLARE 
  TYPE names_varray IS VARRAY(3) OF VARCHAR2(50); 
  -- Declare a variable of the VARRAY type and initialize it 
  names names_varray := names_varray('Alice', 'Bob', 'Charlie'); 
BEGIN 
  -- Access elements in the VARRAY 
  FOR i IN 1..names.COUNT LOOP 
    DBMS_OUTPUT.PUT_LINE('Element ' || i || ': ' || names(i)); 
  END LOOP; 
END; 
/

CREATE OR REPLACE PROCEDURE add_employee_skills( 
  emp_id NUMBER, 
  skills IN names_varray 
) IS 
BEGIN 
  -- Add employee skills to a database table or perform other actions 
  FOR i IN 1..skills.COUNT LOOP 
    INSERT INTO employee_skills(employee_id, skill) VALUES(emp_id, skills(i)); 
  END LOOP; 
END; 
/

DECLARE 
  TYPE employee_skills_varray IS VARRAY(10) OF VARCHAR2(100); 
  emp_skills employee_skills_varray; 
BEGIN 
  -- Retrieve employee skills into a VARRAY 
  SELECT skill BULK COLLECT INTO emp_skills 
  FROM employee_skills 
  WHERE employee_id = 1; 
   
  -- Loop through the skills 
  FOR i IN 1..emp_skills.COUNT LOOP 
    DBMS_OUTPUT.PUT_LINE('Skill ' || i || ': ' || emp_skills(i)); 
  END LOOP; 
END; 
/

DECLARE 
  v_employee_name indian_employee.first_name%TYPE; 
BEGIN 
  -- Implicit cursor to fetch data into a variable 
  SELECT first_name INTO v_employee_name FROM indian_employee WHERE employee_id = 2; 
   
  -- Display the employee name 
  DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_employee_name); 
END; 
/

DECLARE 
  CURSOR emp_cursor IS 
    SELECT employee_id, first_name, last_name 
    FROM indian_employee 
    WHERE department = 'IT'; 
BEGIN 
  -- Explicit cursor using a FOR loop 
  FOR emp_rec IN emp_cursor LOOP 
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || emp_rec.employee_id); 
    DBMS_OUTPUT.PUT_LINE('Name: ' || emp_rec.first_name || ' ' || emp_rec.last_name); 
  END LOOP; 
END; 
/

DECLARE 
  CURSOR emp_cursor (dept_name VARCHAR2) IS 
    SELECT employee_id, first_name, last_name 
    FROM indian_employee 
    WHERE department = dept_name; 
BEGIN 
  -- Cursor with a parameter 
  FOR emp_rec IN emp_cursor('HR') LOOP 
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || emp_rec.employee_id); 
    DBMS_OUTPUT.PUT_LINE('Name: ' || emp_rec.first_name || ' ' || emp_rec.last_name); 
  END LOOP; 
END; 
/

DECLARE 
  v_employee_name indian_employee.first_name%TYPE; 
BEGIN 
  -- Attempt to fetch data for a non-existent employee 
  SELECT first_name INTO v_employee_name FROM indian_employee WHERE employee_id = 100; 
EXCEPTION 
  WHEN NO_DATA_FOUND THEN 
    DBMS_OUTPUT.PUT_LINE('No data found for the specified employee.'); 
END; 
/

DECLARE 
  v_employee_name indian_employee.first_name%TYPE; 
BEGIN 
  -- Attempt to fetch data for multiple employees 
  SELECT first_name INTO v_employee_name FROM indian_employee WHERE department = 'IT'; 
EXCEPTION 
  WHEN TOO_MANY_ROWS THEN 
    DBMS_OUTPUT.PUT_LINE('Multiple employees found; expected only one.'); 
END; 
/

CREATE OR REPLACE FUNCTION get_employee_name(employee_id NUMBER) RETURN VARCHAR2 IS 
  v_emp_name VARCHAR2(100); 
BEGIN 
  SELECT first_name || ' ' || last_name INTO v_emp_name 
  FROM indian_employee 
  WHERE employee_id = get_employee_name.employee_id; 
   
  RETURN v_emp_name; 
END; 
/

CREATE OR REPLACE FUNCTION calculate_avg_salary RETURN NUMBER IS 
  v_avg_salary NUMBER; 
BEGIN 
  SELECT AVG(salary) INTO v_avg_salary 
  FROM indian_employee; 
   
  RETURN v_avg_salary; 
END; 
/

CREATE OR REPLACE PROCEDURE add_new_employee( 
  emp_id NUMBER, 
  first_name VARCHAR2, 
  last_name VARCHAR2, 
  department VARCHAR2, 
  salary NUMBER 
) IS 
BEGIN 
  INSERT INTO indian_employee(employee_id, first_name, last_name, department, salary) 
  VALUES (add_new_employee.emp_id, add_new_employee.first_name, add_new_employee.last_name, add_new_employee.department, add_new_employee.salary); 
  COMMIT; 
END; 
/

CREATE OR REPLACE PROCEDURE get_employee_name( 
  emp_id IN NUMBER, 
  emp_name OUT VARCHAR2 
) IS 
BEGIN 
  SELECT first_name || ' ' || last_name INTO emp_name 
  FROM indian_employee 
  WHERE employee_id = get_employee_name.emp_id; 
END; 
/

CREATE OR REPLACE PROCEDURE avg_salary_in_department( 
  dept_name IN VARCHAR2, 
  avg_sal OUT NUMBER 
) IS 
BEGIN 
  SELECT AVG(salary) INTO avg_sal 
  FROM indian_employee 
  WHERE department = avg_salary_in_department.dept_name; 
END; 
/

DECLARE 
  v_department_name VARCHAR2(50) := 'IT'; 
  v_average_salary NUMBER; 
BEGIN 
  avg_salary_in_department(v_department_name, v_average_salary); 
  DBMS_OUTPUT.PUT_LINE('Average Salary in ' || v_department_name || ': ' || v_average_salary); 
END; 
/

CREATE OR REPLACE PROCEDURE update_employee_salary( 
  emp_id IN NUMBER, 
  new_salary IN NUMBER 
) IS 
BEGIN 
  -- Update the employee's salary 
  UPDATE indian_employee 
  SET salary = new_salary 
  WHERE employee_id = update_employee_salary.emp_id; 
  COMMIT; 
END; 
/

BEGIN 
  -- Update the salary of employee with employee_id 3 to 55000 
  update_employee_salary(3, 55000); 
  -- You can call this procedure with different employee IDs and salary values as needed. 
END; 
/

CREATE OR REPLACE PACKAGE employee_info_pkg AS 
  -- Function to get the employee's full name 
  FUNCTION get_employee_name(emp_id NUMBER) RETURN VARCHAR2; 
   
  -- Function to get the employee's salary 
  FUNCTION get_employee_salary(emp_id NUMBER) RETURN NUMBER; 
END employee_info_pkg; 
/

CREATE OR REPLACE PACKAGE BODY employee_info_pkg AS 
  -- Implementation of get_employee_name function 
  FUNCTION get_employee_name(emp_id NUMBER) RETURN VARCHAR2 IS 
    v_emp_name VARCHAR2(100); 
  BEGIN 
    SELECT first_name || ' ' || last_name INTO v_emp_name 
    FROM indian_employee 
    WHERE employee_id = get_employee_name.emp_id; 
    RETURN v_emp_name; 
  END; 
 
  -- Implementation of get_employee_salary function 
  FUNCTION get_employee_salary(emp_id NUMBER) RETURN NUMBER IS 
    v_emp_salary NUMBER; 
  BEGIN 
    SELECT salary INTO v_emp_salary 
    FROM indian_employee 
    WHERE employee_id = get_employee_salary.emp_id; 
    RETURN v_emp_salary; 
  END; 
END employee_info_pkg; 
/

CREATE TABLE salary_change_log ( 
  change_date DATE, 
  employee_id NUMBER, 
  old_salary NUMBER, 
  new_salary NUMBER 
);

CREATE OR REPLACE TRIGGER log_salary_change 
AFTER UPDATE OF salary ON indian_employee 
FOR EACH ROW 
BEGIN 
  INSERT INTO salary_change_log(change_date, employee_id, old_salary, new_salary) 
  VALUES (SYSDATE, :OLD.employee_id, :OLD.salary, :NEW.salary); 
END; 
/

CREATE OR REPLACE TRIGGER prevent_salary_reduction 
BEFORE UPDATE OF salary ON indian_employee 
FOR EACH ROW 
BEGIN 
  IF :NEW.salary < :OLD.salary THEN 
    RAISE_APPLICATION_ERROR(-20001, 'Salary reduction is not allowed.'); 
  END IF; 
END; 
/

