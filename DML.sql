-- Inserting 10 rows into the users table
insert into users (userid, fullname, email, role) values (1, 'Md. Ali', 'ali@.com', 'student');
insert into users (userid, fullname, email, role) values (2, 'Md. Rahim', 'rahim@.com', 'teacher');
insert into users (userid, fullname, email, role) values (3, 'Mostafa Khan', 'mostafa@.com', 'student');
insert into users (userid, fullname, email, role) values (4, 'Md. Karim', 'karim@.com', 'student');
insert into users (userid, fullname, email, role) values (5, 'Md. Abdul', 'abdul@.com', 'teacher');
insert into users (userid, fullname, email, role) values (6, 'Md. Jamal', 'jamal@.com', 'student');
insert into users (userid, fullname, email, role) values (7, 'Md. Hasan', 'hasan@.com', 'teacher');
insert into users (userid, fullname, email, role) values (8, 'Md. Mizan', 'mizan@.com', 'student');
insert into users (userid, fullname, email, role) values (9, 'Md. Monwar', 'monwar@.com', 'student');
insert into users (userid, fullname, email, role) values (10, 'Md. Karim', 'karim2@.com', 'teacher');

select * from users;

-- Inserting 10 rows into the courses table
insert into courses (courseid, coursename, description) values (1, 'Mathematics', 'Basic learning of Mathematics');
insert into courses (courseid, coursename, description) values (2, 'Bangla', 'Basic learning of Bengali language');
insert into courses (courseid, coursename, description) values (3, 'English', 'Basic learning of English language');
insert into courses (courseid, coursename, description) values (4, 'Physics', 'Basic learning of Physics');
insert into courses (courseid, coursename, description) values (5, 'Social Science', 'Basic learning of Social Science');
insert into courses (courseid, coursename, description) values (6, 'General Science', 'Basic learning of General Science');
insert into courses (courseid, coursename, description) values (7, 'Islamic Education', 'Basic learning of Islamic Education');
insert into courses (courseid, coursename, description) values (8, 'Culture', 'Basic learning of Culture');
insert into courses (courseid, coursename, description) values (9, 'Computer Science', 'Basic learning of Computer Science');
insert into courses (courseid, coursename, description) values (10, 'Medicine', 'Basic learning of Medicine');

select * from courses;

-- Inserting 10 rows into the tutorcourses table
insert into tutorcourses (tutorid, courseid, experienceyears) values (2, 1, 5);
insert into tutorcourses (tutorid, courseid, experienceyears) values (5, 3, 8);
insert into tutorcourses (tutorid, courseid, experienceyears) values (7, 2, 6);
insert into tutorcourses (tutorid, courseid, experienceyears) values (10, 5, 7);
insert into tutorcourses (tutorid, courseid, experienceyears) values (3, 7, 4);
insert into tutorcourses (tutorid, courseid, experienceyears) values (8, 9, 3);
insert into tutorcourses (tutorid, courseid, experienceyears) values (4, 4, 6);
insert into tutorcourses (tutorid, courseid, experienceyears) values (1, 8, 5);
insert into tutorcourses (tutorid, courseid, experienceyears) values (9, 10, 2);
insert into tutorcourses (tutorid, courseid, experienceyears) values (6, 6, 4);

select * from tutorcourses;

-- Inserting 10 rows into the sessions table
insert into sessions (sessionid, tutorid, studentid, courseid, sessiondatetime, duration, status) values (1, 2, 1, 1, current_timestamp, 50, 'Scheduled');
insert into sessions (sessionid, tutorid, studentid, courseid, sessiondatetime, duration, status) values (2, 5, 3, 3, current_timestamp, 60, 'Completed');
insert into sessions (sessionid, tutorid, studentid, courseid, sessiondatetime, duration, status) values (3, 7, 2, 2, current_timestamp, 45, 'Scheduled');
insert into sessions (sessionid, tutorid, studentid, courseid, sessiondatetime, duration, status) values (4, 10, 5, 5, current_timestamp, 60, 'Scheduled');
insert into sessions (sessionid, tutorid, studentid, courseid, sessiondatetime, duration, status) values (5, 3, 7, 7, current_timestamp, 60, 'Scheduled');
insert into sessions (sessionid, tutorid, studentid, courseid, sessiondatetime, duration, status) values (6, 8, 8, 9, current_timestamp, 70, 'Completed');
insert into sessions (sessionid, tutorid, studentid, courseid, sessiondatetime, duration, status) values (7, 4, 4, 4, current_timestamp, 40, 'Scheduled');
insert into sessions (sessionid, tutorid, studentid, courseid, sessiondatetime, duration, status) values (8, 1, 9, 8, current_timestamp, 60, 'Scheduled');
insert into sessions (sessionid, tutorid, studentid, courseid, sessiondatetime, duration, status) values (9, 9, 6, 10, current_timestamp, 90, 'Completed');
insert into sessions (sessionid, tutorid, studentid, courseid, sessiondatetime, duration, status) values (10, 6, 10, 6, current_timestamp, 120, 'Scheduled');

select * from sessions;

-- Inserting 10 rows into the reviews table
insert into reviews (reviewid, sessionid, rating, comments) values (1, 1, 5, 'Great session!');
insert into reviews (reviewid, sessionid, rating, comments) values (2, 2, 4, 'Good tutor!');
insert into reviews (reviewid, sessionid, rating, comments) values (3, 3, 3, 'Average session.');
insert into reviews (reviewid, sessionid, rating, comments) values (4, 4, 5, 'Excellent!');
insert into reviews (reviewid, sessionid, rating, comments) values (5, 5, 4, 'Enjoyed the class.');
insert into reviews (reviewid, sessionid, rating, comments) values (6, 6, 5, 'Very informative.');
insert into reviews (reviewid, sessionid, rating, comments) values (7, 7, 4, 'Helpful tutor.');
insert into reviews (reviewid, sessionid, rating, comments) values (8, 8, 3, 'Could be better.');
insert into reviews (reviewid, sessionid, rating, comments) values (9, 9, 4, 'Satisfactory.');
insert into reviews (reviewid, sessionid, rating, comments) values (10, 10, 5, 'Highly recommended!');

select * from reviews;

-- Inserting 10 rows into the payments table
insert into payments (paymentid, sessionid, amount, paymentdatetime, paymentstatus) values (1, 1, 50, current_timestamp, 'Completed');
insert into payments (paymentid, sessionid, amount, paymentdatetime, paymentstatus) values (2, 2, 50, current_timestamp, 'Pending');
insert into payments (paymentid, sessionid, amount, paymentdatetime, paymentstatus) values (3, 3, 50, current_timestamp, 'Completed');
insert into payments (paymentid, sessionid, amount, paymentdatetime, paymentstatus) values (4, 4, 50, current_timestamp, 'Pending');
insert into payments (paymentid, sessionid, amount, paymentdatetime, paymentstatus) values (5, 5, 50, current_timestamp, 'Completed');
insert into payments (paymentid, sessionid, amount, paymentdatetime, paymentstatus) values (6, 6, 50, current_timestamp, 'Completed');
insert into payments (paymentid, sessionid, amount, paymentdatetime, paymentstatus) values (7, 7, 50, current_timestamp, 'Completed');
insert into payments (paymentid, sessionid, amount, paymentdatetime, paymentstatus) values (8, 8, 50, current_timestamp, 'Pending');
insert into payments (paymentid, sessionid, amount, paymentdatetime, paymentstatus) values (9, 9, 50, current_timestamp, 'Completed');
insert into payments (paymentid, sessionid, amount, paymentdatetime, paymentstatus) values (10, 10, 50, current_timestamp, 'Completed');

select * from payments;
