
CREATE TABLE TBL_FACULTY (
    FACULTY_ID INT PRIMARY KEY,
    FACULTY_NAME VARCHAR(100) NOT NULL
);


CREATE TABLE TBL_SUBJECTS (
    SUBJECT_ID INT PRIMARY KEY,
    SUBJECT_NAME VARCHAR(100) NOT NULL,
    FACULTY_REF INT,
    FOREIGN KEY (FACULTY_REF) REFERENCES TBL_FACULTY(FACULTY_ID)
);


INSERT INTO TBL_FACULTY (FACULTY_ID, FACULTY_NAME) VALUES
(1, 'Engineering'),
(2, 'Mathematics'),
(3, 'Sciences'),
(4, 'Chemical Studies'),
(5, 'Languages');


INSERT INTO TBL_SUBJECTS (SUBJECT_ID, SUBJECT_NAME, FACULTY_REF) VALUES
(201, 'Algorithms', 1),
(202, 'Systems Programming', 1),
(203, 'Databases', 1),
(204, 'Matrix Theory', 2),
(205, 'Differential Calculus', 2),
(206, 'Quantum Physics', 3),
(207, 'Thermal Physics', 3),
(208, 'Organic Compounds', 4),
(209, 'English Classics', 5),
(210, 'Global Literature', 5);

SELECT  
    F.FACULTY_ID,  
    F.FACULTY_NAME, 
    COUNT(S.SUBJECT_ID) AS SUBJECT_COUNT
FROM TBL_FACULTY F
JOIN TBL_SUBJECTS S ON F.FACULTY_ID = S.FACULTY_REF
GROUP BY F.FACULTY_ID, F.FACULTY_NAME
HAVING COUNT(S.SUBJECT_ID) > 2;
