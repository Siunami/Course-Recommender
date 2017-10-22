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

% course(number, section, name, instructor, date, time, building, room)

% Core courses
prop(110, course, 110).
prop(110, name, "Computation, Programs and Programming").
prop(110, section, 101).
prop(110, instructor, "Gregor Kiczales").
prop(110, day, tt).
prop(110, startTime, 12:30).
prop(110, endTime, 14:00).
prop(110, building, cirs).
prop(110, room, 1250).
prop(110, prereq, none).

prop(121, course, 121).
prop(121, name, "Models of Computation").
prop(121, section, 101).
prop(121, instructor, "Georgios Tsikins").
prop(121, day, tt).
prop(121, startTime, 11:00).
prop(121, endTime, 12:30).
prop(121, building, dmp).
prop(121, room, 110).
prop(121, prereq, none).

prop(210, course, 210).
prop(210, name, "Software Construction").
prop(210, section, 101).
prop(210, instructor, "Ryan Vogt").
prop(210, day, mwf).
prop(210, startTime, 12:00).
prop(210, endTime, 13:00).
prop(210, building, dmp).
prop(210, room, 310).
prop(210, prereq, 110).

prop(213, course, 213).
prop(213, name, "Introduction to Computer Systems").
prop(213, section, 101).
prop(213, instructor, "Anthony Estey").
prop(213, day, tt).
prop(213, startTime, 12:30).
prop(213, endTime, 14:00).
prop(213, building, dmp).
prop(213, room, 110).
prop(213, prereq, 121, 210).

prop(221, course, 221).
prop(221, name, "Basic Algorithms and Data Structures").
prop(221, section, 101).
prop(221, instructor, "Geoffrey Tien").
prop(221, day, tt).
prop(221, startTime, 14:00).
prop(221, endTime, 15:30).
prop(221, building, wmss).
prop(221, room, 221).
prop(221, prereq, 121, 210).

prop(310, course, 310).
prop(310, name, "Introduction to Software Engineering").
prop(310, section, 101).
prop(310, instructor, "Elisa Baniassad").
prop(310, day, tt).
prop(310, startTime, 12:30).
prop(310, endTime, 14:00).
prop(310, building, dmp).
prop(310, room, 310).
prop(310, prereq, 210).

prop(313, course, 313).
prop(313, name, "Computer Hardware and Operating Systems").
prop(313, section, 101).
prop(313, instructor, "Donald Acton").
prop(313, day, tt).
prop(313, startTime, 11:00).
prop(313, endTime, 12:00).
prop(313, building, dmp).
prop(313, room, 310).
prop(313, prereq, 213, 221).

prop(320, course, 320).
prop(320, name, "Intermediate Algorithm Design and Analysis").
prop(320, section, 101).
prop(320, instructor, "Cinda Heeren").
prop(320, day, mwf).
prop(320, startTime, 14:00).
prop(320, endTime, 15:00).
prop(320, building, dmp).
prop(320, room, 110).
prop(320, prereq, 221).

% AI courses
prop(302, course, 302).
prop(302, name, "Numerical Computation for Algebraic Problems").
prop(302, section, 101).
prop(302, instructor, "Jessica Bosch").
prop(302, day, mwf).
prop(302, startTime, 13:00).
prop(302, endTime, 14:00).
prop(302, building, dmp).
prop(302, room, 301).
prop(302, prereq, 110).

% Included in SE as well
prop(304, course, 304).
prop(304, name, "Introduction to Relational Databases").
prop(304, section, 101).
prop(304, instructor, "Edwin Max Knorr").
prop(304, day, tt).
prop(304, startTime, 9:30).
prop(304, endTime, 11:00).
prop(304, building, fsc).
prop(304, room, 1005).
prop(304, prereq, 221, 210).

prop(312, course, 312).
prop(312, name, "Functional and Logic Programming").
prop(312, section, 101).
prop(312, instructor, "David Pool").
prop(312, day, mwf).
prop(312, startTime, 12:00).
prop(312, endTime, 13:00).
prop(312, building, dmp).
prop(312, room, 110).
prop(312, prereq, 210).

prop(322, course, 322).
prop(322, name, "Introduction to Artificial Intelligence").
prop(322, section, 101).
prop(322, instructor, "Cristina Conati").
prop(322, day, tt).
prop(322, startTime, 17:00).
prop(322, endTime, 18:30).
prop(322, building, mm).
prop(322, room, 166).
prop(322, prereq, 221,210).

prop(340, course, 340).
prop(340, name, "Machine Learning and Data Mining").
prop(340, section, 101).
prop(340, instructor, "Mark Schmidth").
prop(340, day, mwf).
prop(340, startTime, 16:00).
prop(340, endTime, 17:00).
prop(340, building, fsc).
prop(340, room, 1005).
prop(340, prereq, 221,210).

prop(422, course, 422).
prop(422, name, "Intelligent Systems").
prop(422, section, 101).
prop(422, instructor, "Giuseppe Carenini").
prop(422, day, mwf).
prop(422, startTime, 12:00).
prop(422, endTime, 14:00).
prop(422, building, ml).
prop(422, room, 202).
prop(422, prereq, 322).

% SE courses
prop(311, course, 311).
prop(311, name, "Definition of Programming Languages").
prop(311, section, 101).
prop(311, instructor, "Steven Wolfman").
prop(311, day, mwf).
prop(311, startTime, 10:00).
prop(311, endTime, 11:00).
prop(311, building, dmp).
prop(311, room, 310).
prop(311, prereq, 210).

prop(317, course, 317).
prop(317, name, "Internet Computing").
prop(317, section, 101).
prop(317, instructor, "Jonathan Schroeder").
prop(317, day, mwf).
prop(317, startTime, 11:00).
prop(317, endTime, 12:00).
prop(317, building, dmp).
prop(317, room, 110).
prop(317, prereq, 213,221).

prop(319, course, 319).
prop(319, name, "Software Engineering Project").
prop(319, section, 101).
prop(319, instructor, "Jerry Jim").
prop(319, day, tt).
prop(319, startTime, 12:30).
prop(319, endTime, 14:00).
prop(319, building, dmp).
prop(319, room, 110).
prop(319, prereq, 310).

prop(344, course, 344).
prop(344, name, "Introduction to Human Computer Interaction Methods").
prop(344, section, 101).
prop(344, instructor, "Paul Bucci and Juliette Link").
prop(344, day, w).
prop(344, startTime, 16:00).
prop(344, endTime, 19:00).
prop(344, building, dmp).
prop(344, room, 110).
prop(344, prereq, 210).

prop(411, course, 411).
prop(411, name, "Introduction to Compiler Construction").
prop(411, section, 101).
prop(411, instructor, "Norman Hutchinson").
prop(411, day, tt).
prop(411, startTime, 14:00).
prop(411, endTime, 15:30).
prop(411, building, dmp).
prop(411, room, 301).
prop(411, prereq, 213,221,311).

prop(416, course, 416).
prop(416, name, "Distributed Systems").
prop(416, section, 101).
prop(416, instructor, "Ivan Beschastnikh").
prop(416, day, mwf).
prop(416, startTime, 15:00).
prop(416, endTime, 16:00).
prop(416, building, dmp).
prop(416, room, 110).
prop(416, prereq, 313,317).

prop(444, course, 444).
prop(444, name, "Advanced Methods for Human Computer Interaction").
prop(444, section, 101).
prop(444, instructor, "Joanna Mcgrenere").
prop(444, day, t).
prop(444, startTime, 15:30).
prop(444, endTime, 17:30).
prop(444, building, dmp).
prop(444, room, 110).
prop(444, prereq, 310,344).
