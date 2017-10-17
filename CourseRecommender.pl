% Base Project: 
% Database of courses
% Recommendation based on interests/questions
% Where course takes place, time, instructor, etc.
% NLP querying interface

% Extension Ideas:
% autocorrect
% create possible timetables

% ======================================================================
% NATURAL LANGUAGE PROCESSING
% ======================================================================



% ======================================================================
% QUESTION TYPES
% ======================================================================

isInstructor(X, Y) :-
	courseInstructor(X, _, Y).

courseTimes()

% ======================================================================
% DATABASE
% ======================================================================

% for each course:
% Course Name, Course Number, Course Section, 
% Course Time, Course Instructor, Course Date, Course Room/Building




% core courses
courseName("Computation, Programs and Programming").
courseNumber(110).
courseSection(101, 110).
courseInstructor("Gregor Kiczales", 101, 110).
courseDate(tt, 101, 110).
courseTime(12:30, 14:00, 101, 110).
building(dmp).
building(cirs).
room(cirs, 1250).

courseName("Models of Computation").
courseNumber(121).
courseSection(101, 121).
courseInstructor("Georgios Tsikins", 101, 121).
courseDate(tt, 101, 121).
courseTime(11:00, 12:30, 101, 121).
building(dmp).
room(dmp, 310).
preReq(121).

courseName("Software Construction").
courseNumber(210).
courseSection(101, 210).
courseInstructor("Ryan Vogt", 101, 210).
courseDate(mwf, 101, 210).
courseTime(12:00, 13:00, 101, 210).
building(dmp).
room(dmp, 310).
preReq(110).

courseName("Introduction to Computer Systems").
courseNumber(213).
courseSection(101, 110).
courseInstructor("Gregor Kiczales", 101, 110).
courseDate(tt, 101, 110).
courseTime(12:30, 14:00, 101, 110).
building(dmp).
building(cirs).
room(cirs, 1250).
preReq(121,210).

courseName("Basic Algorithms and Data Structures").
courseNumber(221).
courseSection(101, 110).
courseInstructor("Gregor Kiczales", 101, 110).
courseDate(tt, 101, 110).
courseTime(12:30, 14:00, 101, 110).
building(dmp).
building(cirs).
room(cirs, 1250).

courseName("Introduction to Software Engineering").
courseNumber(310).
courseSection(101, 110).
courseInstructor("Gregor Kiczales", 101, 110).
courseDate(tt, 101, 110).
courseTime(12:30, 14:00, 101, 110).
building(dmp).
building(cirs).
room(cirs, 1250).

courseName("Computer Hardware and Operating Systems").
courseNumber(313).
courseSection(101, 110).
courseInstructor("Gregor Kiczales", 101, 110).
courseDate(tt, 101, 110).
courseTime(12:30, 14:00, 101, 110).
building(dmp).
building(cirs).
room(cirs, 1250).

courseName("Intermediate Algorithm Design and Analysis").
courseNumber(320).
courseSection(101, 110).
courseInstructor("Gregor Kiczales", 101, 110).
courseDate(tt, 101, 110).
courseTime(12:30, 14:00, 101, 110).
building(dmp).
building(cirs).
room(cirs, 1250).

% ai courses
courseName("Numerical Computation for Algebraic Problems").
courseNumber(302).
courseSection(101, 110).
courseInstructor("Gregor Kiczales", 101, 110).
courseDate(tt, 101, 110).
courseTime(12:30, 14:00, 101, 110).
building(dmp).
building(cirs).
room(cirs, 1250).

% also software engineering
courseName("Introduction to Relational Databases").
courseNumber(304).
courseSection(101, 110).
courseInstructor("Gregor Kiczales", 101, 110).
courseDate(tt, 101, 110).
courseTime(12:30, 14:00, 101, 110).
building(dmp).
building(cirs).
room(cirs, 1250).

courseName("Functional and Logic Programming").
courseNumber(312).
courseSection(101, 110).
courseInstructor("Gregor Kiczales", 101, 110).
courseDate(tt, 101, 110).
courseTime(12:30, 14:00, 101, 110).
building(dmp).
building(cirs).
room(cirs, 1250).

courseName("Introduction to Artificial Intelligence").
courseNumber(322).
courseSection(101, 110).
courseInstructor("Gregor Kiczales", 101, 110).
courseDate(tt, 101, 110).
courseTime(12:30, 14:00, 101, 110).
building(dmp).
building(cirs).
room(cirs, 1250).

courseName("Machine Learning and Data Mining").
courseNumber(340).
courseSection(101, 110).
courseInstructor("Gregor Kiczales", 101, 110).
courseDate(tt, 101, 110).
courseTime(12:30, 14:00, 101, 110).
building(dmp).
building(cirs).
room(cirs, 1250).

courseName("Intelligent Systems").
courseNumber(422).
courseSection(101, 110).
courseInstructor("Gregor Kiczales", 101, 110).
courseDate(tt, 101, 110).
courseTime(12:30, 14:00, 101, 110).
building(dmp).
building(cirs).
room(cirs, 1250).


% software engineering

courseName("Definition of Programming Languages").
courseNumber(311).
courseSection(101, 110).
courseInstructor("Gregor Kiczales", 101, 110).
courseDate(tt, 101, 110).
courseTime(12:30, 14:00, 101, 110).
building(dmp).
building(cirs).
room(cirs, 1250).

courseName("Internet Computing").
courseNumber(317).
courseSection(101, 110).
courseInstructor("Gregor Kiczales", 101, 110).
courseDate(tt, 101, 110).
courseTime(12:30, 14:00, 101, 110).
building(dmp).
building(cirs).
room(cirs, 1250).

courseName("Software Engineering Project").
courseNumber(319).
courseSection(101, 110).
courseInstructor("Gregor Kiczales", 101, 110).
courseDate(tt, 101, 110).
courseTime(12:30, 14:00, 101, 110).
building(dmp).
building(cirs).
room(cirs, 1250).

courseName("Introduction to Human Computer Interaction Methods").
courseNumber(344).
courseSection(101, 110).
courseInstructor("Gregor Kiczales", 101, 110).
courseDate(tt, 101, 110).
courseTime(12:30, 14:00, 101, 110).
building(dmp).
building(cirs).
room(cirs, 1250).

courseName("Advanced Software Engineering").
courseNumber(410).
courseSection(101, 110).
courseInstructor("Gregor Kiczales", 101, 110).
courseDate(tt, 101, 110).
courseTime(12:30, 14:00, 101, 110).
building(dmp).
building(cirs).
room(cirs, 1250).

courseName("Introduction to Compiler Construction").
courseNumber(411).
courseSection(101, 110).
courseInstructor("Gregor Kiczales", 101, 110).
courseDate(tt, 101, 110).
courseTime(12:30, 14:00, 101, 110).
building(dmp).
building(cirs).
room(cirs, 1250).

courseName("Distributed Systems").
courseNumber(416).
courseSection(101, 110).
courseInstructor("Gregor Kiczales", 101, 110).
courseDate(tt, 101, 110).
courseTime(12:30, 14:00, 101, 110).
building(dmp).
building(cirs).
room(cirs, 1250).

courseName("Advanced Methods for Human Computer Interaction").
courseNumber(444).
courseSection(101, 110).
courseInstructor("Gregor Kiczales", 101, 110).
courseDate(tt, 101, 110).
courseTime(12:30, 14:00, 101, 110).
building(dmp).
building(cirs).
room(cirs, 1250).


