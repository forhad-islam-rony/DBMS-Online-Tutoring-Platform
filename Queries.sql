--Create the UserSettings table
create table usersettings (
    userid number,
    notificationenabled varchar2(10) check (notificationenabled in ('yes', 'no')), 
    theme varchar2(50), 
    language varchar2(50), 
    primary key (userid),
    foreign key (userid) references users(userid)
);

--Drop the UserSetting table
Drop table usersettings;

--Adding a new column named DateOfBirth to the Users
alter table users add DateOfBirth DATE;

--rename the column DateOfBirth to BirthDate in the Users table
alter table users rename column dateofbirth to birthdate;

--modify the column BirthDate in the Users table to change its data type to VARCHAR2(50)
alter table users modify BirthDate varchar2(50);

--Drop the column BirthDate from the Users table
alter table users drop column birthdate;

--insert data into the Users table for a new user
insert into users (userid, fullname, email, passwordhash, role) values (1, 'Md. Ali', 'ali@.com', 'Ali', 'student');

--update the password column for the user with UserID 1 in the Users table
update users set password = 'Ali' where userid = 1;

--delete the user with UserID 1 from the Users table
delete from users where userid = 4;

--calculate the total amount paid for each session from the Payments table
with session_payments as (
    select SessionID, sum(Amount) as TotalAmountPaid from payments
    group by SessionID
) select * from session_payments;

--find the total number of sessions in the Sessions table
select count(*) as total_sessions from sessions;

--calculate the average duration of sessions in the Sessions table
select avg(duration) as avg_duration from sessions;

--determine the maximum duration among all sessions in the Sessions table
select max(duration) as max_duration from sessions;

--calculate the total amount paid across all sessions in the Payments table
select sum(amount) as total_amount_paid from payments;

--find the total number of sessions conducted by each tutor in the Sessions table
select tutorid, count(*) as session_count from sessions group by tutorid;

--retrieve the details of all courses that are either taught by a specific tutor or have been attended by a specific student from the TutorCourses and Sessions tables
select * from tutorcourses where tutorid = 4 or courseid in (select courseid from sessions where studentid = 7);

--retrieve all sessions from the Payments table where the paymentstatus column contains the word 'Pending'
select * from payments where paymentstatus like '%Pending%';

--retrieve the details of all tutors along with the courses they teach from the Users and TutorCourses tables
select u.*, tc.courseid from users u inner join tutorcourses tc on u.userid = tc.tutorid;

--declare a PL/SQL variable named total_sessions and assign it the total number of sessions from the Sessions table
set serveroutput on
declare
    total_sessions number;
begin
    select count(*) into total_sessions from sessions;
    dbms_output.put_line('Total Sessions: ' || total_sessions);
end;
/

--insert a new record into the Users table in PL/SQL, setting the default value for the Role column
begin
    insert into users (userid, fullname, email, password, role)
    values (11, 'Forhad Islam', 'islam@.com', 'islam', default);
end;
/

-- declare a cursor named session_cursor to fetch all sessions from the Sessions table and then determine the total number of sessions retrieved using a row count variable in PL/SQL
set serveroutput on
declare
    session_cursor sys_refcursor;
    session_row sessions%rowtype;
    total_sessions number := 0;
begin
    open session_cursor for select * from sessions;
    loop
        fetch session_cursor into session_row;
        exit when session_cursor%notfound;
        total_sessions := total_sessions + 1;
    end loop;
    close session_cursor;
    dbms_output.put_line('Total Sessions: ' || total_sessions);
end;
/

--Use PL/SQL to print the total number of records in the "Reviews" table
set serveroutput on
declare
    total_reviews number;
begin
    select count(*) into total_reviews from reviews;
    dbms_output.put_line('Total Reviews: ' || total_reviews);
end;
/

--retrieves the teachers of users along with their corresponding sessions data using a right join operation
select u.userid, u.fullname as teacher_name, s.sessionid, s.sessiondatetime, s.duration, s.status from users u right join sessions s on u.userid = s.tutorid;

--create a trigger named "update_session_status_trigger" in PL/SQL for an online tutoring platform project, which automatically updates the "Status" column in the "Sessions" table to 'Completed' when the session's duration exceeds a certain threshold
create or replace trigger update_session_status_trigger
before update on sessions
for each row
begin
    if :new.duration > 60 then
        :new.status := 'Completed';
    end if;
end;
/

--create a PL/SQL function named "calculate_session_fee" for an online tutoring platform project, which calculates the session fee based on the duration of the session
create or replace function calculate_session_fee(
    p_duration in number
) return number
is
    v_fee_per_minute number := 10; -- Assume fee per minute is $10
begin
    return p_duration * v_fee_per_minute;
end;
/

--create a PL/SQL block to determine the payment status for a transaction in an online tutoring platform, based on the payment amount
declare
    v_payment_amount number := 50;
    v_payment_status varchar2(20);
begin
    if v_payment_amount >= 100 then
        v_payment_status := 'Completed';
    elsif v_payment_amount >= 50 then
        v_payment_status := 'Pending';
    else
        v_payment_status := 'Failed';
    end if;

    dbms_output.put_line('Payment Status: ' || v_payment_status);
end;
/

--provide a view that will summarize key information about reviewers, including their ID, rating and comment
create view reviewer_summary_view as select reviewid, sessionid, rating, comments from reviews;

-- retrieve all details from the Users table where the role is 'teacher'
select * from Users where Role = 'teacher';

--declare and initialize an array variable to store course names from the "Courses" table in PL/SQL
declare
    type coursenamearray is varray(10) of varchar2(100);
    course_names coursenamearray;
begin
    select coursename bulk collect into course_names from courses;
    
    for i in 1..course_names.count loop
        dbms_output.put_line('Course Name: ' || course_names(i));
    end loop;
end;

--retrieve the total number of sessions conducted by each tutor in an online tutoring platform database
select u.fullname as tutor_name, 
       (select count(*) 
        from sessions s 
        where s.tutorid = u.userid) as total_sessions from users u where u.role = 'teacher';
