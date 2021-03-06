% Base Project:
% Database of courses
% Recommendation based on interests/questions (1)
% What courses are prerequisites of X course? (2)
% Who teaches X course? (3)
% What courses are about Y topic? (4)
% What day is X course offered? (5)
% possibly: What time is X course, Z section? (6)
% NLP querying interface

% Extension Ideas:
% Student profile who has taken some courses already
% Additional questions:
% What is the difficulty of X course?
% autocorrect
% create possible timetables

% ======================================================================
% User Accounts
% ======================================================================

prop("Matt", "Pass", [110, 121, 210]).
prop("Mat", "Pass", [110, 121, 210,221, 304]).
prop(_,_, "false").


login(User, Pass, L) :-
  prop(User, Pass, L).



% ======================================================================
% Query Processing
% ======================================================================

% Break query into its parts of speech a
% create keywords for different questions a user can ask
% ex: teaches implies Q3, day implies Q5
% parse out

ask() :-
  write('Hi my name is Mazi.'),
	write('\nI am a personal assistant bot.'),
	write('\nSelect a question number'),
  write('\n1. Who teaches a course?'),
  write('\n2. What day is a course offered'),
  write('\n3. What are the prerequisites of a course?'),
  write('\n4. Schedule my courses'),
	nl,
  read(Input),
	query(Input).

% Question 1

query(Input) :-
  Input = 1,
  write('What class?'),
  nl,
  read(Class),
  teachesCourse(Class, X).

% Question 2
query(Input) :-
	Input = 2,
	write('What class?'),
	nl,
	read(Class),
	dayCourseOffered(Class, X).

% Question 3
query(Input) :-
	Input = 3,
	write('What class?'),
	nl,
	read(Class),
	getPreReqs(Class, X).


% Question 4 -> requires User Login
query(Input) :-
  Input = 4,
  write('I can help you schedule this terms courses depending on your interests.'),
  write('\nLogin first'),
  write('\nUsername: '),
  nl,
  read(User),
  authenticate(User).

authenticate(User) :-
  write('\nPassword: '),
  nl,
  read(Pass),
  login(User,Pass, L),
  selectInterest(User,Pass,L).

selectInterest(User,Pass,L) :-
  L = "false",
  write("Sorry that is an incorrect username and password combo.\n"),
  query(4).

selectInterest(User,Pass,L) :-
  not(L = "false"),
  write("Hi "),
  write(User),
  write("."),
  write('\nWhat do you want to focus on? Select a number'),
  write('\n1. Software Engineering'),
  write('\n2. Artificial Intelligence'),
  nl,
  read(Interest),
  findCourse(Interest, L).

listAllCourses([]).
listAllCourses([Y|H]) :-
  write('\n'),
  write("CPSC "),
  write(Y),
  listAllCourses(H).

findCourse(Interest, L) :-
  Interest = 1,
  write('Looking for courses related to '),
  write('Software Engineering.'),
  write('\nYou have already taken '),
  listAllCourses(L),
  write('\nPlease wait...'),
  scheduleTimetable(se, L).

findCourse(Interest, L) :-
  Interest = 2,
  write('Looking for courses related to '),
  write('Artificial Intelligence.'),
  write('\nYou have already taken '),
  listAllCourses(L),
  write('\nPlease wait...'),
  scheduleTimetable(ai, L).

%compareAllCourses(Course, [ACourse|Taken], Check) :-
%  Course = ACourse,
%  compareAllCourses(Course, Taken, "true").
%compareAllCourses(Course, [ACourse|Taken], Check) :-
%  not(Course = ACourse),
%  compareAllCourses(Course, Taken, Check).

%hasTaken([], Taken, Suggested).
%hasTaken([Course|CourseList], Taken, Suggested) :-
  %compareAllCourses(Course, Taken, Check),
%  member(Course, Taken),
%  write("taken"),
%  hasTaken(CourseList,Taken,Suggested)).
%hasTaken([Course|CourseList], Taken, Suggested) :-
%  %compareAllCourses(Course, Taken, Check),
%  not(member(Course, Taken)),
%  write("not taken"),
%  hasTaken(CourseList,Taken,Suggested)).

sub(List,[],List).
sub(List,[X|Sub],Rem) :- select(X,List,Rem0), sub(Rem0,Sub,Rem).

notcommon(L1, L2, Result) :-
  intersection(L1, L2, Intersec),
  subtract(L1, ["false"], Z),
  subtract(Z, Intersec, Result).

list_empty([], true).
list_empty([_|_], false).

checkRemove(true,[H|X], [H|X]).
checkRemove(false,[H|X], X).


fulfilledPrereqs([],L2, X, X).
fulfilledPrereqs([H|L1],L2, [T|X], P) :-
  findall(S1, prop(H, prereq, S1), G),
  subtract(G, ["false"], K),
  %write("\nCourse\n"),
  %write(H),
  %write("\n"),
  %write(K),
  subtract(K,L2,J),
  %write("\n"),
  %write(J),
  list_empty(J,Ans),
  checkRemove(Ans, [T|X], U),
  fulfilledPrereqs(L1, L2,U,P).

schedule([], Times, Classes, Times, Classes).
schedule([H|P], Times, Classes, I, O) :-
  prop(H, startTime, V),
  prop(H, day, D),
  schedule(P, [[V]|Times], [H|Classes], I, O).





% Checks what courses in stream have been taken already
% Takes remaining courses and checks if prerequisites are satisfied
% Attempts to schedule remaining courses up to 3.
scheduleTimetable(Stream, L) :-
  findall(S1, prop(Stream, course, S1), Z),
  write("Courses"),
  write(Z),
%  hasTaken(Z,L, NotFulfilledCourses),
%  sub(Z,L,NotFulfilledCourses),
  notcommon(Z,L,NotFulfilledCourses),
  fulfilledPrereqs(NotFulfilledCourses,L, NotFulfilledCourses, P),
  schedule(P,[],[], I, O),
  write("\nSuggested courses:\n"),
  %write(I),
  write(O),
  write("\n"),
  write("\n"),
  ask().




% ======================================================================
% QUESTION TYPES
% ======================================================================
% List of questions
% which instructor teaches X course
% which Y course is a prereq of X course
% which X courses are AI courses
% which X courses are SE courses
% which X courses are taught by Y instructor
% which days is X course offered
% which building is X course in

removeFalse([I|Y], Y).


% Q(2)
% X is course wanting to take
% Y is preReq course
getPreReqs(X, Z) :-
	findall(Y, prop(X, prereq, Y), Z),
  removeFalse(Z, L),
  write(L),
  write("\n"),
  write("\n"),
  ask().

% Q(3)
% X is course as a XXX
% Y is instructor name as string
teachesCourse(X,Y) :-
	findall(I, prop(X, instructor, I), Y),
  removeFalse(Y, U),
  write(U),
  write("\n"),
  write("\n"),
  ask().

% Q(6)
% get all course times for a course
% create functions to narrow to semester
% X is course number XXX
% Z is new variable for all startTimes, ex: B
% P is new variable for all endTimes, ex: C
getCourseTimes(X, Z, P) :-
	findall(S1,prop(X, startTime, S1), Z),
	findall(S2,prop(X, endTime, S2), P).

% Q(5)
% X is course number as XXX
% Y is a new variable of days course is offered
dayCourseOffered(X, Y) :-
	findall(D, prop(X, day, D), Y),
  removeFalse(Y,U),
  write(U),
  write("\n"),
  write("\n"),
  ask().



% ======================================================================
% DATABASE
% ======================================================================

% course(number, name, section, instructor, date, time, building, room, prereq)

prop(ai, course, 302).
prop(ai, course, 304).
prop(ai, course, 312).
prop(ai, course, 322).
prop(ai, course, 340).
prop(ai, course, 422).

prop(se, course, 304).
prop(se, course, 311).
prop(se, course, 317).
prop(se, course, 319).
prop(se, course, 344).
prop(se, course, 411).
prop(se, course, 416).
prop(se, course, 444).

% Core courses
prop(110, course, 110).
prop(110, name, "Computation, Programs and Programming").
prop(110, section, 101).
prop(110, instructor, "Gregor Kiczales").
prop(110, day, tt).
prop(110, startTime, "12:30").
prop(110, endTime, "14:00").
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
prop(210, startTime, "12:00").
prop(210, endTime, "13:00").
prop(210, building, dmp).
prop(210, room, 310).
prop(210, prereq, 110).

prop(213, course, 213).
prop(213, name, "Introduction to Computer Systems").
prop(213, section, 101).
prop(213, instructor, "Anthony Estey").
prop(213, day, tt).
prop(213, startTime, "12:30").
prop(213, endTime, "14:00").
prop(213, building, dmp).
prop(213, room, 110).
prop(213, prereq, 121, 210).

prop(221, course, 221).
prop(221, name, "Basic Algorithms and Data Structures").
prop(221, section, 101).
prop(221, instructor, "Geoffrey Tien").
prop(221, day, tt).
prop(221, startTime, "14:00").
prop(221, endTime, "15:30").
prop(221, building, wmss).
prop(221, room, 221).
prop(221, prereq, 121).
prop(221, prereq, 210).

prop(310, course, 310).
prop(310, name, "Introduction to Software Engineering").
prop(310, section, 101).
prop(310, instructor, "Elisa Baniassad").
prop(310, day, tt).
prop(310, startTime, "12:30").
prop(310, endTime, "14:00").
prop(310, building, dmp).
prop(310, room, 310).
prop(310, prereq, 210).

prop(313, course, 313).
prop(313, name, "Computer Hardware and Operating Systems").
prop(313, section, 101).
prop(313, instructor, "Donald Acton").
prop(313, day, tt).
prop(313, startTime, "11:00").
prop(313, endTime, "12:00").
prop(313, building, dmp).
prop(313, room, 310).
prop(313, prereq, 213).
prop(313, prereq, 221).

prop(320, course, 320).
prop(320, name, "Intermediate Algorithm Design and Analysis").
prop(320, section, 101).
prop(320, instructor, "Cinda Heeren").
prop(320, day, mwf).
prop(320, startTime, "14:00").
prop(320, endTime, "15:00").
prop(320, building, dmp).
prop(320, room, 110).
prop(320, prereq, 221).

% AI courses
prop(302, course, 302).
prop(302, name, "Numerical Computation for Algebraic Problems").
prop(302, section, 101).
prop(302, instructor, "Jessica Bosch").
prop(302, day, mwf).
prop(302, startTime, "13:00").
prop(302, endTime, "14:00").
prop(302, building, dmp).
prop(302, room, 301).
prop(302, prereq, 110).

% Included in SE as well
prop(304, course, 304).
prop(304, name, "Introduction to Relational Databases").
prop(304, section, 101).
prop(304, instructor, "Edwin Max Knorr").
prop(304, day, tt).
prop(304, startTime, "9:30").
prop(304, endTime, "11:00").
prop(304, building, fsc).
prop(304, room, 1005).
prop(304, prereq, 221).
prop(304, prereq, 210).

prop(312, course, 312).
prop(312, name, "Functional and Logic Programming").
prop(312, section, 101).
prop(312, instructor, "David Pool").
prop(312, day, mwf).
prop(312, startTime, "12:00").
prop(312, endTime, "13:00").
prop(312, building, dmp).
prop(312, room, 110).
prop(312, prereq, 210).

prop(322, course, 322).
prop(322, name, "Introduction to Artificial Intelligence").
prop(322, section, 101).
prop(322, instructor, "Cristina Conati").
prop(322, day, tt).
prop(322, startTime, "17:00").
prop(322, endTime, "18:30").
prop(322, building, mm).
prop(322, room, 166).
prop(322, prereq, 221).
prop(322, prereq, 210).

prop(340, course, 340).
prop(340, name, "Machine Learning and Data Mining").
prop(340, section, 101).
prop(340, instructor, "Mark Schmidth").
prop(340, day, mwf).
prop(340, startTime, "16:00").
prop(340, endTime, "17:00").
prop(340, building, fsc).
prop(340, room, 1005).
prop(340, prereq, 221).
prop(340, prereq, 210).

prop(422, course, 422).
prop(422, name, "Intelligent Systems").
prop(422, section, 101).
prop(422, instructor, "Giuseppe Carenini").
prop(422, day, mwf).
prop(422, startTime, "12:00").
prop(422, endTime, "14:00").
prop(422, building, ml).
prop(422, room, 202).
prop(422, prereq, 322).

% SE courses
prop(311, course, 311).
prop(311, name, "Definition of Programming Languages").
prop(311, section, 101).
prop(311, instructor, "Steven Wolfman").
prop(311, day, mwf).
prop(311, startTime, "10:00").
prop(311, endTime, "11:00").
prop(311, building, dmp).
prop(311, room, 310).
prop(311, prereq, 210).

prop(317, course, 317).
prop(317, name, "Internet Computing").
prop(317, section, 101).
prop(317, instructor, "Jonathan Schroeder").
prop(317, day, mwf).
prop(317, startTime, "11:00").
prop(317, endTime, "12:00").
prop(317, building, dmp).
prop(317, room, 110).
prop(317, prereq, 213).
prop(317, prereq, 221).

prop(319, course, 319).
prop(319, name, "Software Engineering Project").
prop(319, section, 101).
prop(319, instructor, "Jerry Jim").
prop(319, day, tt).
prop(319, startTime, "12:30").
prop(319, endTime, "14:00").
prop(319, building, dmp).
prop(319, room, 110).
prop(319, prereq, 310).

prop(344, course, 344).
prop(344, name, "Introduction to Human Computer Interaction Methods").
prop(344, section, 101).
prop(344, instructor, "Paul Bucci and Juliette Link").
prop(344, day, w).
prop(344, startTime, "16:00").
prop(344, endTime, "19:00").
prop(344, building, dmp).
prop(344, room, 110).
prop(344, prereq, 210).

prop(411, course, 411).
prop(411, name, "Introduction to Compiler Construction").
prop(411, section, 101).
prop(411, instructor, "Norman Hutchinson").
prop(411, day, tt).
prop(411, startTime, "14:00").
prop(411, endTime, "15:30").
prop(411, building, dmp).
prop(411, room, 301).
prop(411, prereq, 213).
prop(411, prereq, 221).
prop(411, prereq, 311).

prop(416, course, 416).
prop(416, name, "Distributed Systems").
prop(416, section, 101).
prop(416, instructor, "Ivan Beschastnikh").
prop(416, day, mwf).
prop(416, startTime, "15:00").
prop(416, endTime, "16:00").
prop(416, building, dmp).
prop(416, room, 110).
prop(416, prereq, 313).
prop(416, prereq, 317).

prop(444, course, 444).
prop(444, name, "Advanced Methods for Human Computer Interaction").
prop(444, section, 101).
prop(444, instructor, "Joanna Mcgrenere").
prop(444, day, t).
prop(444, startTime, "15:30").
prop(444, endTime, "17:30").
prop(444, building, dmp).
prop(444, room, 110).
prop(444, prereq, 310).
prop(444, prereq, 344).
