# 1.Query the existence of 1 course
select * from course where id = 1;

# 2.Query the presence of both 1 and 2 courses
 select * from student where id in (select studentId from student_course where courseId = 1) 
 and id in (select studentId from student_course where courseId = 2) ;
# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
    select id, name, AVG(score) from student,student_course where student.id = student_course.studentId
GROUP BY id ,name HAVING AVG(score) >= 60 ;

# 4.Query the SQL statement of student information that does not have grades in the student_course table
 select * from student where id not in (select studentId from student_course);
 
# 5.Query all SQL with grades
select * from student where id  in (select studentId from student_course);

# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
 select * from student where id  in (select studentId from student_course where courseId = 1) 
 and id in (select studentId from student_course where courseId = 2) ;
 
# 7.Retrieve 1 student score with less than 60 scores in descending order
select id, name, score from student, student_course where student.id = student_course.studentId and 
student_course.courseId = 1 and student_course.score < 60 order by score desc;

# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
	select courseId , avg(score) from student_course group by courseId order by avg(score) desc, courseId asc ;

# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60

select name , score from student, score where student.id = student_course.studentId and score < 60 and student_course.courseId in (select id from course where name = 'Math');
