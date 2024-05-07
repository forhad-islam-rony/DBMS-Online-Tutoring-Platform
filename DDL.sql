--Create Table

-- users Table​
Create table users (​
    userID number,​
    fullName varchar2(25),​
    email varchar2(25) unique,​
    password varchar2(25),​
    role varchar2(20) check (role in ('student', 'teacher')), ​
    primary key(userID)​
);​

-- courses Table​
Create table courses (​
    courseID number,​
    courseName varchar2(25),​
    description varchar2(500),​
    primary key(courseID)​
);

-- tutorCourses Table​
Create table tutorCourses (​
    tutorID number,​
    courseID number,​
    experienceYears number,​
    Primary key (tutorID, courseID),​
    Foreign key (tutorID) references users(userID),​
    Foreign key (courseID) references courses(courseID)​
);​

-- sessions Table​
Create table sessions (​
    sessionID number,​
    tutorID number,​
    studentID number,​
    courseID number,​
    sessionDateTime timestamp,​
    duration number,​
    status varchar2(255) check (status in ('Scheduled', 'Completed', 'Cancelled')),​
    Primary key (sessionID),​
    Foreign key (tutorID) references users(userID), ​
    Foreign key (studentID) references users(userID), ​
    Foreign key (courseID) references courses(courseID)​
);

-- reviews Table​
create table reviews (​
    reviewID number,​
    sessionID number,​
    rating number,​
    comments varchar2(25),​
    Primary key(reviewID),​
    Foreign key (sessionID) references sessions(sessionID)​
);​

-- payments Table​
Create table payments (​
    paymentID number,​
    sessionID number,​
    amount number,​
    paymentDateTime timestamp,​
    paymentStatus varchar2(25) check (paymentStatus in ('Completed', 'Pending', 'Failed')), ​
    Primary key (paymentID),​
    Foreing key (sessionID) references sessions(sessionID)​
);

--Drop Table
drop table users;
drop table courses;
drop table tutorCourses;
drop table sessions;
drop table reviews;
drop table payments;
