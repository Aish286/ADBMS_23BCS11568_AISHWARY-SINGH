CREATE TABLE emp (
    empid INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    dept VARCHAR(50),
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES emp(empid)
);
INSERT INTO emp (empid, name, dept, manager_id) VALUES
(1, 'Alice', 'HR', NULL),         
(2, 'Bob', 'Finance', 1),        
(3, 'Charlie', 'IT', 1),          
(4, 'David', 'IT', 3),        
(5, 'Eva', 'Finance', 2);         
SELECT
    e.name AS empname,
    e.dept AS empdept,
    m.name AS manager_name,
    m.dept AS manager_dept
FROM
    emp as e
LEFT JOIN
    emp as m
ON
    e.manager_id = m.empid;