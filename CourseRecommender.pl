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
2building(dmp).
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
courseSection(101, 213).
courseInstructor("Anthony Estey", 101, 213).
courseDate(tt, 101, 213).
courseTime(12:30, 14:00, 101, 213).
preReq(121,210).

courseName("Basic Algorithms and Data Structures").
courseNumber(221).
courseSection(101, 221).
courseInstructor("Geoffrey Tien", 101, 221).
courseDate(tt, 101, 221).
courseTime(14:00, 15:30, 101, 221).
building(wmss).
room(wmss, 221).
preReq(121,210).

courseName("Introduction to Software Engineering").
courseNumber(310).
courseSection(101, 310).
courseInstructor("Elisa Baniassad", 101, 310).
courseDate(tt, 101, 310).
courseTime(12:30, 14:00, 101, 310).
room(dmp, 310).
preReq(210).

courseName("Computer Hardware and Operating Systems").
courseNumber(313).
courseSection(101, 313).
courseInstructor("Donald Acton", 101, 313).
courseDate(mwf, 101, 313).
courseTime(11:00, 12:00, 101, 313).
room(dmp, 310).
preReq(213,221).

courseName("Intermediate Algorithm Design and Analysis").
courseNumber(320).
courseSection(101, 320).
courseInstructor("Cinda Heeren", 101, 320).
courseDate(mwf, 101, 320).
courseTime(14:00, 15:00, 101, 320).
room(dmp, 110).
preReq(221).

% ai courses
courseName("Numerical Computation for Algebraic Problems").
courseNumber(302).
courseSection(101, 302).
courseInstructor("Jessica Bosch", 101, 302).
courseDate(mwf, 101, 302).
courseTime(13:00, 14:00, 101, 302).
room(dmp, 301).
preReq(110).

% also software engineering
courseName("Introduction to Relational Databases").
courseNumber(304).
courseSection(101, 304).
courseInstructor("Edwin Max Knorr", 101, 304).
courseDate(tt, 101, 304).
courseTime(9:30, 11:00, 101, 304).
building(fsc).
room(fsc, 1005).
preReq(221, 210).

courseName("Functional and Logic Programming").
courseNumber(312).
courseSection(101, 312).
courseInstructor("David Pool", 101, 312).
courseDate(mwf, 101, 312).
courseTime(12:00, 12:00, 101, 312).
room(dmp, 110).
preReq(210).

courseName("Introduction to Artificial Intelligence").
courseNumber(322).
courseSection(101, 322).
courseInstructor("Cristina Conati", 101, 322).
courseDate(tt, 101, 322).
courseTime(17:00, 18:30, 101, 322).
building(mm).
room(mm, 166).
preReq(221,210).

courseName("Machine Learning and Data Mining").
courseNumber(340).
courseSection(101, 340).
courseInstructor("Mark Schmidth", 101, 340).
courseDate(mwf, 101, 340).
courseTime(16:00, 17:00, 101, 340).
building(fsc).
room(fsc, 1005).
preReq(221,210).

courseName("Intelligent Systems").
courseNumber(422).
courseSection(101, 422).
courseInstructor("Giuseppe Carenini", 101, 422).
courseDate(mwf, 101, 422).
courseTime(12:00, 14:00, 101, 422).
building(ml).
room(ml, 202).
preReq(322).


% software engineering

courseName("Definition of Programming Languages").
courseNumber(311).
courseSection(101, 311).
courseInstructor("Steven Wolfman", 101, 311).
courseDate(mwf, 101, 311).
courseTime(10:00, 11:00, 101, 311).
room(dmp, 310).
preReq(210).

courseName("Internet Computing").
courseNumber(317).
courseSection(101, 317).
courseInstructor("Jonathan Schroeder", 101, 317).
courseDate(mwf, 101, 317).
courseTime(11:00, 12:00, 101, 317).
room(dmp, 110).
preReq(213,221).

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


