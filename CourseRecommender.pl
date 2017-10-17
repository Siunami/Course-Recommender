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

courseName("Computation, Programs, and Programming").

courseNumber(110).

courseDate(tt, 101, 110).

courseInstructor("Gregor Kiczales", 101, 110).

courseTime(12:30, 14:00, 101, 110).

courseSection(101, 110).

building(dmp).
building(cirs).

room(cirs, 1250).

