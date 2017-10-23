% Prolog Program that acts as a Natural Language Interface to finding an
% appropriate restaurant given some criteria.
%
% CS 312 Project by Leslie Liang, Ruofei Du, and Bryan Jiang
%
% Used nl_interface.pl and nl_interface_direct.pl from lecture notes as
% reference.
% ======================================================================

% ======================================================================
% NATURAL LANGUAGE PROCESSING
% ======================================================================

% question(L0, L2, Subj, T0, T2) is true if:
%     L0 is an ordered list of words constructing a question.
%     L2 is an ending of L0.
%     Subj is the Subject of the question.
%     T0 is a list of predicates/terms that provide the constraints on
%     the Subj to answer the question.
%     T2 is an ending of T0.
question([what, is|L0], L2, Subj, T0, T2) :-
	noun_phrase(L0, L1, Subj, T0, T1),
	modifying_phrase(L1, L2, Subj, T1, T2).
question([what|L0], L2, Subj, T0, T2) :-
	noun_phrase(L0, L1, Subj, T0, T1),
	modifying_phrase(L1, L2, Subj, T1, T2).
question([which|L0], L2, Subj, T0, T2) :-
	noun_phrase(L0, L1, Subj, T0, T1),
	modifying_phrase(L1, L2, Subj, T1, T2).


% noun_phrase(L0, L3, Subj, T0, T3) is true if:
%     The difference list of L0, L2 is an ordered list of words
%     constructing a noun phrase.
%     The difference list of T0, T3 is a list of predicates/terms that
%     provide the constraints on Subj implied by the noun phrase.
noun_phrase(L0, L3, Subj, T0, T3) :-
	determiner(L0, L1, Subj, T0, T1),
	adjectives(L1, L2, Subj, T1, T2),
	noun(L2, L3, Subj, T2, T3).

% determiner(L1, L2, _, _, _) is true if:
%      The first element of L1 is a determiner (either 'the' or 'a' or
%      none).
%      L2 is the tail of L1 or the same as L1 in the case that
%      there is no determiner.
%      The remaining variables are essentially place holders to pass
%      data since no constraints are provided by determiners.
determiner([the|L], L, _, T, T).
determiner([a|L], L, _, T, T).
determiner(L, L, _, T, T).

% adjectives(L0, L2, Subj, T0, T2) is true if:
%      The difference list of L0, L2 is a list of adjectives or an empty
%      list.
%      Subj is the Subject that the adjectives describe. The
%      difference list of T0, T2 is a list of predicates/terms providing
%      the constraints on the Subj implied by the adjectives.
adjectives(L0, L2, Subj, T0, T2) :-
	adjective(L0, L1, Subj, T0, T1),
	adjectives(L1, L2, Subj, T1, T2).
adjectives(L, L, _, T, T).

% modifying_phrase(L0, L2 , Subj, T0, T2) is true if:
%    The difference list of L0, L2 is an ordered list of words
%    constructing a modifying phrase, or an empty list.
%    Subj is the Subject of the modifying phrase.
%    The difference list of T1, T2 is a list of predicates/terms
%    providing the constraints on the Subj implied by the modifying
%    phrase.
modifying_phrase([is|L0], L2, Subj, T0, T2) :-
	adjective(L0, L1, Subj, T0, T1),
	adjectives(L1, L2, Subj, T1, T2).
modifying_phrase([that, is|L0], L2, Subj, T0, T2) :-
	adjective(L0, L1, Subj, T0, T1),
	adjectives(L1, L2, Subj, T1, T2).
modifying_phrase([that, is|L0], L2, Subj, T0, T2) :-
	reln(L0, L1, Subj, Subj2, T0, T1),
	noun_phrase(L1, L2, Subj2, T1, T2).
modifying_phrase(L0, L3, Subj, T0, T3) :-
	reln(L0, L1, Subj, Subj2, T0, T1),
	noun_phrase(L1, L2, Subj2, T1, T2),
	modifying_phrase(L2, L3, Subj, T2, T3).
modifying_phrase(L0, L2, Subj, T0, T2) :-
	reln(L0, L1, Subj, Subj2, T0, T1),
	noun_phrase(L1, L2, Subj2, T1, T2).
modifying_phrase(L, L, _, T, T).


% ======================================================================
% VOCABULARY
% ======================================================================

% Nouns
% noun([noun|L0], L0, Subj, [restaurant(Subj)|T0], T0)

noun([restaurant|L0],L0, Subj, [restaurant(Subj)|T0],T0).
noun([location|L0],L0, Subj, [location(Subj)|T0],T0).
noun([Subj | L],L,Subj,T,T) :- restaurant(Subj).
noun([Subj | L],L,Subj,T,T) :- location(Subj).


% Adjectives
% adjective([adjective|L0], L0, Subj, [adjective(Subj)|T0], T0)
adjective([cheap|L0],L0,Subj, [cheap(Subj)|T0],T0).
adjective([expensive|L0],L0,Subj, [expensive(Subj)|T0],T0).

adjective([canadian|L0],L0,Subj, [canadian(Subj)|T0],T0).
adjective([western|L0],L0,Subj, [western(Subj)|T0],T0).
adjective([chinese|L0],L0,Subj, [chinese(Subj)|T0],T0).
adjective([american|L0],L0,Subj, [american(Subj)|T0],T0).
adjective([japanese|L0],L0,Subj, [japanese(Subj)|T0],T0).

adjective([good|L0],L0,Subj, [good(Subj)|T0],T0).
adjective([ok|L0],L0,Subj, [ok(Subj)|T0],T0).
adjective([excellent|L0],L0,Subj, [excellent(Subj)|T0],T0).

%extra ranking system
adjective([best|L0],L0,Subj, [best(Subj)|T0],T0).

% Relations
% reln( [relation|L], L, Subj1, Subj2, [relation(Subj1, Subj2), T],
% T)
reln([in|L],L,Subj1,Subj2,[in(Subj1, Subj2)|T], T).


% ======================================================================
% INTERFACE
% ======================================================================

% prove(C) is true if all clauses in list C can be proven
prove([]).
prove([H|T]) :-
	H,
	prove(T).

% ask(Ans)
ask(Ans) :-
	write("Ask: "),
	readln(L),
	question(L, End, Ans, C, []),
	member(End,[[],['?']]),
	prove(C).

% ======================================================================
% DATABASE
% ======================================================================

% restaurant(id, name, cuisine, area, groups, price, rating)
restaurant(oakwood).
restaurant(fable).
restaurant(annalena).
restaurant(kfc).
restaurant(subway).
restaurant(tasty_wok).
restaurant(chef_hungs).
restaurant(biercraft).
restaurant(sushi_go).
restaurant(sea_harbour).

canadian(oakwood).
canadian(fable).
canadian(annalena).
american(kfc).
american(subway).
american(biercraft).
chinese(tasty_wok).
chinese(chef_hungs).
chinese(sea_harbour).
japanese(sushi_go).

location(kitsilano).
location(oakridge).
location(ubc).
location(richmond).

in(oakwood, kitsilano).
in(fable, kitsilano).
in(annalena, kitsilano).
in(kfc, oakridge).
in(subway, oakridge).
in(tasty_wok, oakridge).
in(chef_hungs, ubc).
in(biercraft, ubc).
in(sushi_go, ubc).
in(sea_harbour, richmond).

rating(oakwood, 8).
rating(fable, 9).
rating(annalena, 7).
rating(kfc, 5).
rating(subway, 7).
rating(tasty_wok, 4).
rating(chef_hungs, 7).
rating(biercraft, 8).
rating(sushi_go, 6).
rating(sea_harbour, 6).

groups(oakwood).
groups(fable).
groups(annalena).

expensive(oakwood).
expensive(fable).
expensive(annalena).
cheap(sushi_go).
cheap(kfc).
cheap(subway).

% Ratings that we need to define
% good>=6,ok>=4,excellent>=8
good(N) :- rating(N, R), R >= 6.
ok(N) :- rating(N, R), R >= 4.
excellent(N) :- rating(N, R), R >= 8.
%ranking best restaruanrts
best(N) :- rating(N,R), R >9;
	rating(N,R), R >8;
	rating(N,R), R >7;
	rating(N,R), R >6;
	rating(N,R), R >5;
	rating(N,R), R >4;
	rating(N,R), R >3;
	rating(N,R), R >2.


% ======================================================================
% TESTING
% ======================================================================

% CASE 1: Test processing of question into predicates/terms to query

% test_question(L, Subj, T) is true if
% L is an ordered list of words forming a question
% T is the corresponding list of predicates after the question has been
% processed
test_question(L, Subj, T) :-
	question(L,_, Subj, T, []).

% assert_false_question(L) is true if
% L is a list of words that do not form a valid question
assert_false_question(L) :-
	\+ question(L, _, _, _, _).

% 1a SINGLE PREDICATE QUERIES

% Test adjective

test1a_1 :- test_question(
		[what, is, a, cheap, restaurant],
		Subj,
		[ cheap(Subj), restaurant(Subj)]).

% Test relation
test1a_2 :- test_question(
		[what, is, a, restaurant, in, kitsilano],
		Subj,
		[restaurant(Subj), in(Subj, kitsilano)]).
test1a_3 :- test_question(
		[what, is, a, restaurant, that, is, good],
		Subj,
		[restaurant(Subj), good(Subj)]).

test1a :- test1a_1, test1a_2, test1a_3.

% 1b MULTIPLE PREDICATE QUERIES

test1b :- test_question(
	     [what, is, a, cheap, chinese, restaurant, in, oakridge],
	     Subj,
	     [cheap(Subj), chinese(Subj), restaurant(Subj), in(Subj,oakridge)]).

% 1c COMPOUND MODIFYING PHRASES
test1c_1 :- test_question(
	     [which, japanese, restaurant, in, ubc, is, good],
	     Subj,
	     [japanese(Subj), restaurant(Subj), in(Subj, ubc), good(Subj)]).
test1c_2 :- test_question(
		[what, is, a, restaurant, that, is, in, kitsilano],
		Subj,
		[restaurant(Subj), in(Subj, kitsilano)]).
test1c :- test1c_1, test1c_2.


% 1d IMPROPER SYNTAX
test1d_1 :- assert_false_question(
		[what, is, a, restaurant, that, is]).
test1d_2 :- assert_false_question(
		[what, is, a, restaurant, that, is, in]).
test1d :- test1d_1, test1d_2.


% run all tests
all_test :- test1a, test1b, test1c.
all_test.
