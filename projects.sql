--Table projects
projects=# SELECT * FROM projects;
 id |      title      |                   description                    | max_grade 
id |      title      |                   description                    | max_grade 
----+-----------------+--------------------------------------------------+-----------
  5 | Recipe Storage  | An app to let users keep track of family recipes |       150
  1 | Snake Game      | An interactive puzzle game                       |        50
  2 | News Aggregator | Custom news filter with auto-tagging system      |        10

--Table grades
projects=# SELECT * FROM grades

 id | student_github |  project_title  | grade 
----+----------------+-----------------+-------
  1 | jhacks         | News Aggregator |    10
  4 | sdevelops      | News Aggregator |    50
  2 | jhacks         | Snake Game      |     2
  3 | sdevelops      | Snake Game      |   100
  5 | tcodes         | Snake Game      |   100
  6 | tcodes         | Snake Game      |   100
  7 | alearns        | Snake Game      |     0
  8 | rpractices     | Snake Game      |   100
  9 | banalyzes      | Snake Game      |     0
 10 | ctypes         | Snake Game      |    97
 11 | wcodes         | Snake Game      |    96
 12 | lgifs          | Snake Game      |    50
 13 | casks          | Snake Game      |    64

--Table students
projects=# SELECT * FROM students;
 id | first_name | last_name |  github   
----+------------+-----------+-----------
  1 | Jane       | Hacker    | jhacks
  2 | Sarah      | Developer | sdevelops

--Problem 1
SELECT AVG(grade) FROM grades WHERE project_title = 'News Aggregator';
-- Result: 30.0000000000000000

--Problem 2
SELECT SUM(grade) FROM grades WHERE project_title = 'Recipe Storage';
 sum 
-----
--Problem 3 
SELECT COUNT(projects) FROM projects;
 count 
--Result: 3

--Problem 4
SELECT MAX(grade) FROM grades WHERE project_title = 'News Aggregator';
 max 
--Result: 50

--Problem 5
SELECT MIN(project_title) FROM grades; 
       min       
--Result: News Aggregator

-------JOINS-------
--Problem 1
SELECT students.first_name, last_name, grades.project_title, grades.grade FROM grades FULL OUTER JOIN students ON students.github = grades.student_github;

--Results:
first_name | last_name |  project_title  | grade 
------------+-----------+-----------------+-------
 Jane       | Hacker    | News Aggregator |    10
 Sarah      | Developer | News Aggregator |    50
 Jane       | Hacker    | Snake Game      |     2
 Sarah      | Developer | Snake Game      |   100
            |           | Snake Game      |   100
            |           | Snake Game      |   100
            |           | Snake Game      |     0
            |           | Snake Game      |   100
            |           | Snake Game      |     0
            |           | Snake Game      |    97
            |           | Snake Game      |    96
            |           | Snake Game      |    50
            |           | Snake Game      |    64

 --Problem 2
 SELECT projects.title, projects.id, grades.grade FROM grades INNER JOIN projects ON projects.title = grades.project_title;
--Result : 
title            | id | grade 
-----------------+----+-------
 News Aggregator |  2 |    10
 News Aggregator |  2 |    50
 Snake Game      |  1 |     2
 Snake Game      |  1 |   100
 Snake Game      |  1 |   100
 Snake Game      |  1 |   100
 Snake Game      |  1 |     0
 Snake Game      |  1 |   100
 Snake Game      |  1 |     0
 Snake Game      |  1 |    97
 Snake Game      |  1 |    96
 Snake Game      |  1 |    50
 Snake Game      |  1 |    64













